/*BEGIN

DBMS_SCHEDULER.CREATE_PROGRAM(

program_name=>'first',

program_action=>'first_open_session',

program_type=>'STORED_PROCEDURE',

number_of_arguments=>0,

enabled=>TRUE);


DBMS_SCHEDULER.CREATE_PROGRAM(

program_name=>'second',

program_action=>'second_open_session',

program_type=>'STORED_PROCEDURE',

number_of_arguments=>0,

enabled=>TRUE);

END;*/

BEGIN

dbms_scheduler.create_chain(

chain_name => 'MY_CHAIN');

END;

/*
BEGIN

   dbms_scheduler.define_chain_step(

    chain_name => 'FIRST_STEP',

    step_name => 'S1',

    program_name => 'first');

END;

BEGIN

   dbms_scheduler.define_chain_step(

    chain_name => '"DWH"."DWH_CH_TST"',

    step_name => '"S2"',

    program_name => '"DWH"."pr2"');

END;*/

BEGIN

dbms_scheduler.define_chain_rule(

   chain_name => '"DWH"."DWH_CH_TST"',

   condition => 'true',

   rule_name => 'rule1',

   action => 'START "S1","S2"');
   
   dbms_scheduler.create_job(

   job_name => 'MY_JOB',

   job_type => 'CHAIN',

   job_action => 'MY_CHAIN',

   job_class => 'DEFAULT_JOB_CLASS',

   auto_drop => FALSE,

   enabled => TRUE);

END;
