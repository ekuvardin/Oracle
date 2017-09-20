declare
 p_attach_clob   CLOB := NULL;

   CURSOR c1
   IS
select output from table(DBMS_WORKLOAD_REPOSITORY.AWR_REPORT_HTML (
   l_dbid      => 2381139487,
   l_inst_num   => 1,
   l_bid        => 39322,
   l_eid        => 39323));
   
BEGIN
   FOR rec IN c1
   LOOP
      p_attach_clob := p_attach_clob ||chr(13)||chr(10)|| rec.output;
   END LOOP;
insert into ibs.test_awr values(p_attach_clob);
end;

