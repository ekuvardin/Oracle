declare
l number := rtl.open();
l_xml clob;
l_clobsize number;
l_offset number := 0;
begin
 l := opt_mgr.get_report_interval(trunc(sysdate,'MM'),sysdate,l_xml,true);
 dbms_output.put_line(l);
 l_clobsize := dbms_lob.getlength(l_xml);

  while (l_offset < l_clobsize)
  loop
    zero_autonomous_transaction.log_pipe(dbms_lob.substr(l_xml, 255 , l_offset));
    l_offset := l_offset + least(255, (l_clobsize-l_offset));
  end loop;
end;
