select t.* from Z#ADE_PART4TST t;

SELECT to_char(TRUNC ( t.C_DATE_CR, 'YEAR' ),'YYYY') C_DATE_CR
, COUNT ( * ) C_CNT
FROM Z#ADE_PART4TST t
GROUP BY TRUNC ( t.C_DATE_CR, 'YEAR' )
ORDER BY 1;

select * from class_partitions t where t.class_id = 'ADE_PART4TST';		-- unpartition table

-------------------------------------------------------------------------------------------
-- 4) Create a Partitioned Interim Table:
-------------------------------------------------------------------------------------------
CREATE TABLE par_table
   (	"ID" NUMBER, 
	"SN" NUMBER, 
	"SU" NUMBER, 
	"KEY" NUMBER,
	"C_DATE_CR" DATE, 
	"C_X" NUMBER, 
	"C_Y" NUMBER, 
	"C_VAL" NUMBER
) 
PARTITION BY RANGE (KEY)
(PARTITION Z#ADE_PART4TST#1 VALUES LESS THAN (1), 
PARTITION Z#ADE_PART4TST#2 VALUES LESS THAN (2), 
PARTITION Z#ADE_PART4TST#0 VALUES LESS THAN (MAXVALUE));

-------------------------------------------------------------------------------------------
-- 5) Start the Redefinition Process:
-------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------
-- a) Check the redefinition is possible using the following command:
-------------------------------------------------------------------------------------------
begin
   DBMS_REDEFINITION.can_redef_table('IBS', 'Z#ADE_PART4TST');
end;
/
-------------------------------------------------------------------------------------------
-- b) If no errors are reported, start the redefintion using the following command:
-------------------------------------------------------------------------------------------
  -- Constants for the options_flag parameter of start_redef_table
  -- cons_use_pk    CONSTANT PLS_INTEGER := 1;
  -- cons_use_rowid CONSTANT PLS_INTEGER := 2;

  -- NAME:     start_redef_table - start the online re-organization
  -- INPUTS:   uname        - schema name
  --           orig_table   - name of table to be re-organized
  --           int_table    - name of interim table
  --           col_mapping  - select list col mapping
  --           options_flag - flag indicating user options to use
  --           orderby_cols - comma separated list of order by columns
  --                          followed by the optional ascending/descending
  --                          keyword
  --           part_name    - name of the partition to be redefined
BEGIN 
DBMS_REDEFINITION.start_redef_table
	( uname			=> 'IBS'
	, orig_table	=> 'Z#ADE_PART4TST'
	, int_table		=> 'PAR_TABLE'
-- Redefines a table by adding new columns and adding partitioning
	, col_mapping  => 'ID ID'
		||', SN SN'
		||', SU SU'
		||', KEY'
		||', C_DATE_CR C_DATE_CR'
		||', C_X C_X'
		||', C_Y C_Y'
		||', C_VAL C_VAL'
 --	, options_flag => --	IN BINARY_INTEGER := 1
--	, orderby_cols => --	IN VARCHAR2 := NULL
--	, part_name    => --	IN VARCHAR2 := NULL
); 
END; 
/
-------------------------------------------------------------------------------------------
-- Note: This operation can take quite some time to complete.
-------------------------------------------------------------------------------------------

-- select t.*, t.rowid from PAR_TABLE t;

SELECT to_char(TRUNC ( t.C_DATE_CR, 'YEAR' ),'YYYY') C_DATE_CR
, COUNT ( * ) C_CNT
FROM PAR_TABLE t
GROUP BY TRUNC ( t.C_DATE_CR, 'YEAR' )
ORDER BY 1;

--	select stdlib.userid from dual;

insert into Z#ADE_PART4TST a1 ( SN,SU, ID, C_X, C_Y, C_VAL, C_DATE_CR ,key)
	values (1,4008160,SEQ_ID.NEXTVAL,11, 1001, dbms_random.random, to_date('02/12/2011','DD/MM/YYYY'), 0);

insert into Z#ADE_PART4TST a1 ( SN,SU, ID, C_X, C_Y, C_VAL, C_DATE_CR ,key)
	values (1,4008160,SEQ_ID.NEXTVAL,11, 1001, dbms_random.random, to_date('28/04/2012','DD/MM/YYYY'), 1);

insert into Z#ADE_PART4TST a1 ( SN,SU, ID, C_X, C_Y, C_VAL, C_DATE_CR ,key)
	values (1,4008160,SEQ_ID.NEXTVAL,11, 1001, dbms_random.random, to_date('21/09/2013','DD/MM/YYYY'),1000);

insert into Z#ADE_PART4TST a1 ( SN,SU, ID, C_X, C_Y, C_VAL, C_DATE_CR ,key)
	values (1,4008160,SEQ_ID.NEXTVAL,11, 1001, dbms_random.random, to_date('10/12/2013','DD/MM/YYYY'),1000);

commit;
-------------------------------------------------------------------------------------------
-- c) Optionally synchronize new table with interim name before index creation:
-------------------------------------------------------------------------------------------
BEGIN 
dbms_redefinition.sync_interim_table( 
uname => 'IBS', 
orig_table => 'Z#ADE_PART4TST', 
int_table => 'PAR_TABLE'); 
END; 
/

SELECT to_char(TRUNC ( t.C_DATE_CR, 'YEAR' ),'YYYY') C_DATE_CR
, COUNT ( * ) C_CNT
FROM PAR_TABLE t
GROUP BY TRUNC ( t.C_DATE_CR, 'YEAR' )
ORDER BY 1;

-------------------------------------------------------------------------------------------
-- d) Create Constraints and Indexes:
-------------------------------------------------------------------------------------------
--	SQL> ALTER TABLE par_table ADD ( CONSTRAINT unpar_table_pk2 PRIMARY KEY (id) ); 
--	ALTER TABLE par_table DROP CONSTRAINT unpar_table_pk2; 

ALTER TABLE par_table ADD ( CONSTRAINT PK_Z#ADE_PART4TST_ID2222 PRIMARY KEY (id, key) ); 

CREATE INDEX IDX_Z#ADE_PART4TST_DATE_CR2222 ON par_table(C_DATE_CR);

/*
DECLARE
  num_errors PLS_INTEGER;
BEGIN
  DBMS_REDEFINITION.COPY_TABLE_DEPENDENTS ('IBS',  'Z#ADE_PART4TST', 'PAR_TABLE',
    DBMS_REDEFINITION.CONS_ORIG_PARAMS, TRUE, TRUE, TRUE, TRUE, num_errors);
dbms_output.put_line(num_errors);
END;
/*/

-------------------------------------------------------------------------------------------
-- e) Gather statistics on the new table:
-------------------------------------------------------------------------------------------
begin
  DBMS_STATS.gather_table_stats('IBS', 'par_table', cascade => TRUE);
end;
/
-------------------------------------------------------------------------------------------
-- f) Complete the Redefintion Process:
-------------------------------------------------------------------------------------------
BEGIN 
dbms_redefinition.finish_redef_table( 
uname => 'IBS', 
orig_table => 'Z#ADE_PART4TST', 
int_table => 'par_table'); 
END; 
/
-- At this point the interim table has become the "real" table and their names have been switched in the name dictionary. 

-- select t.* from Z#ADE_PART4TST t;
-- select t.* from PAR_TABLE t;

select * from user_constraints t where t.table_name in ('Z#ADE_PART4TST', 'PAR_TABLE');

-------------------------------------------------------------------------------------------
-- g) Remove original table which now has the name of the interim table:
-------------------------------------------------------------------------------------------
DROP TABLE par_table; 

-------------------------------------------------------------------------------------------
-- h) Rename all the constraints and indexes to match the original names.
-------------------------------------------------------------------------------------------
ALTER TABLE Z#ADE_PART4TST RENAME CONSTRAINT PK_Z#ADE_PART4TST_ID2222 TO PK_Z#ADE_PART4TST_ID; 
ALTER INDEX IDX_Z#ADE_PART4TST_DATE_CR2222 RENAME TO IDX_Z#ADE_PART4TST_DATE_CR;

-------------------------------------------------------------------------------------------
-- i) Check whether partitioning is successful or not:
-------------------------------------------------------------------------------------------
SELECT partitioned 
FROM user_tables 
WHERE table_name = 'Z#ADE_PART4TST'; 


SELECT partition_name 
FROM user_tab_partitions 
WHERE table_name = 'Z#ADE_PART4TST'; 

-------------------------------------------------------------------------------------------
--
-------------------------------------------------------------------------------------------
SELECT key, to_char(TRUNC ( t.C_DATE_CR, 'YEAR' ),'YYYY') C_DATE_CR
, COUNT ( * ) C_CNT
FROM Z#ADE_PART4TST t
GROUP BY key, TRUNC ( t.C_DATE_CR, 'YEAR' )
ORDER BY 1;

select t.*, t.rowid from Z#ADE_PART4TST t;
select t.*, t.rowid from Z#ADE_PART4TST partition ( Z#ADE_PART4TST#0 ) t;
select t.*, t.rowid from Z#ADE_PART4TST partition ( Z#ADE_PART4TST#1 ) t;
select t.*, t.rowid from Z#ADE_PART4TST partition ( Z#ADE_PART4TST#2 ) t;

-------------------------------------------------------------------------------------------
-- Занесение информации в class_partitions
-------------------------------------------------------------------------------------------
/** /
  delete class_partitions where class_id='ADE_PART4TST' and partition_position is null;
  insert into class_partitions(class_id,condition,partition_key,tablespace_name,idx_tablespace,partition_name,mirror)
       values ('ADE_PART4TST',v_cond,v_id,v_ts,v_its,v_sql,decode(v_sql,null,null,'0'));
  commit;

-- Итоговое обновление информации в class_partitions
  update class_partitions set condition=v_cond where class_id='ADE_PART4TST' and partition_position=cur_pos;
/**/

-- Обновление описания архивных разделов
begin
  dict_mgr.refresh_description('ADE_PART4TST');
end;
/

select * from class_partitions t where t.class_id = 'ADE_PART4TST';

update class_partitions set description = '2011', condition = 'C_DATE_CR < TO_DATE(''01/01/2012'',''DD/MM/YYYY'')' where partition_name = 'Z#ADE_PART4TST#1';
update class_partitions set description = '2012', condition = 'C_DATE_CR < TO_DATE(''01/01/2013'',''DD/MM/YYYY'')' where partition_name = 'Z#ADE_PART4TST#2';
update class_partitions set description = 'Актуальный раздел' where partition_name = 'Z#ADE_PART4TST#0';
commit;

begin
   class_mgr.create_class_interface('ADE_PART4TST');	--	, body_only		=> false	-- boolean default false
end;
/
/** /
SQL> TRUNCATE TABLE Z#ADE_PART4TST;
SQL> DROP TABLE Z#ADE_PART4TST;
SELECT * FROM Z#ADE_PART4TST;

-- Перенос архивных данных в зеркальные таблицы
exec dict_mgr.exchange_partition('ADE_PART4TST', 1);
exec dict_mgr.exchange_partition('ADE_PART4TST', 2);
/**/
