column username format a20
column program format a20
column sql_text format a40 wrap
column object_name format a20

--Для исторических данных распространенная практика определить какой сегмент больше всего изменялся за данный период, каким SQL-оператором он мог изменяться, и какая из сессий за данный период запускала такой оператор
-- что-то такое

--Естественно, если несколько юзеров выполняют одинаковый ресурсоемкий оператор, то в кандидаты они все и попадут
--И даже не только одинаковый оператор, но изменяют один сегмент
--Но дальше уже можно думать
with dhs as (
	select snap_id
	from dba_hist_snapshot
	where begin_interval_time > trunc(sysdate-1/24, 'hh')
),
dhseg as (select object_name, sum(db_block_changes_delta) db_block_changes
	from dba_hist_seg_stat dhss, dba_hist_seg_stat_obj dhso, dhs
	where dhs.snap_id = dhss.snap_id
		and dhss.dataobj# = dhso.dataobj#
		and db_block_changes_delta > 100
	group by object_name
),
dhsess as (select distinct username, program, sql_id
	from dba_hist_active_sess_history dhash, dba_users du, dhs
	where dhash.snap_id = dhs.snap_id
		and dhash.user_id = du.user_id
)
select username, program, dhst.sql_id, sql_text, object_name, db_block_changes
from dba_hist_sqltext dhst, dhseg, dhsess
where upper(sql_text) not like 'SELECT%'
	and upper(sql_text) not like 'WITH%'
	and upper(sql_text) not like 'LOCK%'
	and upper(sql_text) not like 'EXPLAIN%'
	and upper(sql_text) not like 'DECLARE%'
	and upper(sql_text) not like 'BEGIN%'
	and  upper(sql_text) like '%'||object_name||'%'
	and dhst.sql_id = dhsess.sql_id
order by db_block_changes desc, dhst.sql_id
/