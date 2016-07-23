SELECT n.username,
s.sid,
s.value
FROM v$sesstat s,v$statname t, v$session n
WHERE s.statistic# = t.statistic#
AND n.sid = s.sid and n.sid = (select sid from v$mystat where rownum = 1)
AND t.name='CPU used by this session'
ORDER BY s.value desc;

select (a.value / b.value)*100 "% CPU for parsing"
from V$SYSSTAT a, V$SYSSTAT b
where a.name = 'parse time cpu'
and b.name = 'CPU used by this session';


select (a.value / b.value)*100 "% recursive cpu usage"
from V$SYSSTAT a, V$SYSSTAT b
where a.name = 'recursive cpu usage'
and b.name = 'CPU used by this session';



select s.BEGIN_TIME,
s.END_TIME,
s.METRIC_NAME,
s.MAXVAL,
s.MINVAL,
s.AVERAGE
from v$sysmetric_summary s
where metric_name= 'Host CPU Utilization (%)'; 

select 'CPU_ORA_CONSUMED'                                     CLASS,
                    round(value/100,3)                             AAS
             from v$sysmetric
             where metric_name='CPU Usage Per Sec'
               and group_id=2
          union
            select 'CPU_OS'                                        CLASS ,
                    round((prcnt.busy*parameter.cpu_count)/100,3)    sAAS
            from
              ( select value busy from v$sysmetric
                where metric_name='Host CPU Utilization (%)'
                 and group_id=2 ) prcnt,
             ( select value cpu_count
                 from v$parameter
                where name='cpu_count' )  parameter;
                
                SELECT
   s.username,
   t.sid,
   s.serial#,
   SUM(VALUE/100) as "cpu usage (seconds)"
FROM
   v$session s,
   v$sesstat t,
   v$statname n
WHERE
   t.STATISTIC# = n.STATISTIC#
AND
   NAME like '%CPU used by this session%'
AND
   t.SID = s.SID
AND
   s.status='ACTIVE'
AND
   s.username is not null
GROUP BY username,t.sid,s.serial#;

select metric_name, value, metric_unit from v$sysmetric where metric_name like '%CPU%' and group_id=2;

