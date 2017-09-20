declare
x clob;
begin
       dbms_utility.expand_sql_text
       ( input_sql_text => 
         'SELECT sys_context(''IBS_OPTIONS'',''CORE.U'') from dual',
         output_sql_text => x );
  insert into ibs.test_awr(c) values(x);
  commit;
    end;
