declare
m number;
P_ID1 number;
P_ID2 number;
result number;
begin
  P_ID1 := 14878994;
  P_ID2 := 18137253;
  m := rtl.open();
  sc_mgr.update_sessions('PREPARE_TO_RUN',true,P_ID1,P_ID1);
  result := Z$scripts_Plib.CHECK_TEST(P_ID2);
  dbms_output.put_line(result);
  sc_mgr.update_sessions(null, FALSE, null, null);
end;
/
