select * from table_privileges where grantee = 'PUBLIC' order by 3;

--select * from user_role_privs;
--select * from user_tab_privs;
--select * from user_sys_privs ;
--select * from z#Scripts;

BEGIN 
Dbms_Scheduler.create_job(
job_name=>'my_job_security',
job_type=>'PLSQL_BLOCK',
job_action=>'select * from user_role_privs;',
start_date=>to_date('15.10.12 11:00', 'dd.mm.yy hh24:mi'),
repeat_interval=>'FREQ=DAILY',
enabled=> true,
comments=>'Просто тест на 12-00');
exception when others then
  dbms_output.put_line(dbms_utility.format_error_stack);
  dbms_output.put_line(dbms_utility.format_call_stack);
End; 
