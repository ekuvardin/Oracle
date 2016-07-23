declare
  x clob;
begin
       dbms_utility.expand_sql_text
       ( input_sql_text => 
         'SELECT sys_context(''OPTIONS'',''LIC'') as a from dual',
         output_sql_text => x );
  dbms_output.put_line(x);
end;