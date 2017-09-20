declare
  g_open_session NUMBER;
  v varchar2(4000);
  i number;
begin
  
  g_open_session := open_session('ALEKSEEVA', 'FTC');
  init_session(g_open_session, 'ALEKSEEVA', 'FTC');
  
   select max(id) into i
   from Z#SYSTEM_JOBS a2
   where a2.C_METHOD_CLASS = 'SCRIPTS_RUN' and a2.C_SHORT_NAME = 'ALEKSEEVA';
   
  Z$SYSTEM_JOBS_SYNCRONIZE_JOBS.SYNCRONIZE_JOBS_EXECUTE(THIS => i,PLP$CLASS => 'SYSTEM_JOB',P_ORACLE => true, P_RUNPROC => true, P_SCHEDULER => true, P_ADD => true);
  
  update Z#SYSTEM_JOBS w set w.c_execute = '1' where id = i;
  
  select max(a2.c_job) into i
   from Z#SYSTEM_JOBS a2
   where a2.C_METHOD_CLASS = 'SCRIPTS_RUN' and a2.C_SHORT_NAME = 'ALEKSEEVA'; 
   
   dbms_job.broken(i, TRUE);
   commit;
end;
/
