insert into ibs.trigger_test select * from dual;

begin
  sys.dbms_xstream_gg.set_foo_trigger_session_contxt(fire=>false);
  insert into ibs.trigger_test select * from dual;
end;
/

select * from ibs.trigger_test;
