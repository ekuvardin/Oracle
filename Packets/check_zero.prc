create or replace procedure check_zero(p_count number, p_date1 date, p_date2 date, p_build number) is
m number;
P_ID1 number;
P_ID2 number;
result number;
l_main TYPE_NUMBER_TABLE;

type l_tres is table of number index by pls_integer;
l_res l_tres;
begin
  m := rtl.open();
  select s.id
    bulk collect into l_main
   from z#scripts s, z#sc_test t, (select max(tt.id) as id
   from z#scripts ss, z#sc_test tt
  where ss.c_tests = tt.collection_id and tt.c_dt between p_date1 and p_date2 and tt.c_build = p_build
  group by ss.id)e
    where s.c_tests = t.collection_id and t.id = e.id and rownum <=p_count
      order by t.c_dt;

  for i in 1..l_main.count
    loop
      l_res.delete;
      for k in (0)..(6)
        loop
          l_res(k) := 0;
        end loop;

        for j in (i+1)..l_main.count
          loop
            P_ID1 := l_main(i);
            P_ID2 := l_main(j);

            sc_mgr.update_sessions('PREPARE_TO_RUN',true,P_ID1,P_ID1);
            result := Z$scripts_Plib.CHECK_TEST(P_ID2);
            
            l_res(abs(result)) := l_res(abs(result))+1;

            sc_mgr.update_sessions(null, FALSE, null, null);
          end loop;
        m:= stdio.put_pipe(l_res(0)||', '||l_res(1)||', '||l_res(2)||', '||l_res(3)||', '||l_res(4)||', '||l_res(5)||', '||l_res(6),'DEBUG');
    end loop;
    commit;
end;
/
