set linesize 156

set trimspool on

set pagesize 60

 
explain plan for {statement}
select * from table(dbms_xplan.display);


dbms_sql_tune.report_sql_monitor() ;



SELECT /*+ gather_plan_statistics */ COUNT(*)
FROM MSTBS_DLY_MSG_IN
WHERE MEDIA = :B1
AND BRANCH_DATE = GLOBAL.APPLICATION_DATE

and then run

select * from table(dbms_xplan.display_cursor(null,null,'ALLSTATS LAST')) 

select * from table(dbms_xplan.display_cursor(null,null,'OUTLINE')) 
