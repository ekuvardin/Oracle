declare
      l_id type_number_table;
      l_norm type_number_table;
      l_complex type_number_table;
      l_unit type_number_table;
      l_result_fail number := 0;
      l_result_warning number := 0;
      l_epic_fail number := 0;
      l number := 0;
      l_all_tests number := 0;
      l_all_result type_number_table := type_number_table();
      l_all_epic type_number_table := type_number_table();
      
  function temp(p_id number, p_norm number) return number is
        res regeneration.t_changes := regeneration.t_changes();
        l number;
        l_result_fail number := 0;
        l_fail_count number := 0;
      begin    
        l := rtl.open();    
     -- Z$SC_TEST_NORM.NORM_EXECUTE(p_norm,'SCRIPTS'); 
        dbms_output.put_line(1);
        
        
        regeneration.clear_temporary_tables;
        l := regeneration.start_generation(p_id); 
        
        if( l in (-20001,-20002)) then
            commit;
            return 0;
        end if;
        
       --Z$SCRIPTS_GEN_SC.GEN_SC_EXECUTE(p_id,'SCRIPTS',TRUE);
        Z$SCRIPTS_PREPARE_TEST.PREPARE_TEST_EXECUTE(p_id,'SCRIPTS',true, false, true);
     -- Z$SCRIPTS_GEN_SC_OLD.GEN_SC_OLD_EXECUTE (p_id,'SCRIPTS',TRUE);

        res := regeneration.get_changes();
        
        if(res.count = 0) then 
            regeneration.gen_output('No changes have been found');
            l_result_fail := 0;
        else
            regeneration.gen_output('Changes have been found');
            
            for i in 1 .. res.count
              loop                
                if(res(i).src_value <> res(i).new_value) then
                    l_fail_count := l_fail_count + 1;
                    regeneration.gen_output('id := '||res(i).id ||'   '||'src_value := '||res(i).src_value||'   '||'old_value := '||res(i).old_value||'   '||'new_value:= '||res(i).new_value||'   '||'table_name := '||res(i).table_name);
                else
                     regeneration.gen_output('Warning id := '||res(i).id ||'   '||'src_value := '||res(i).src_value||'   '||'old_value := '||res(i).old_value||'   '||'new_value:= '||res(i).new_value||'   '||'table_name := '||res(i).table_name);
 
                end if;
              end loop;
            
            regeneration.gen_output('Found errors '||l_fail_count);
            regeneration.gen_output('Found warnings '||(res.count - l_fail_count));
            
            regeneration.rollback_changes(res);
            
            if(l_fail_count = 0) then
                l_result_fail := 1;
            else
                l_result_fail := 2;
            end if;
                Z$SCRIPTS_GEN_SC.GEN_SC_EXECUTE(p_id,'SCRIPTS',TRUE);
        end if;


        commit;
        return l_result_fail;
      exception  when others
        then
            begin
            Z$SCRIPTS_GEN_SC.GEN_SC_EXECUTE(p_id,'SCRIPTS',TRUE);
                exception when others then rollback;
               dbms_output.put_line(dbms_utility.format_call_stack);
                dbms_output.put_line(dbms_utility.format_error_stack);
                 rollback;
                return -1;
             end;
                  
       -- dbms_output.put_line(dbms_utility.format_call_stack);
       -- dbms_output.put_line(dbms_utility.format_error_stack);
        rollback;
        return -1;
      end temp;      

 select s.id , s.c_rec_test
          bulk collect into l_id, l_norm
          from(
                select s.id , s.c_rec_test, s.c_complex, s.c_units, row_number() over(order by s.id asc) as rn
                      from z#scripts s          
                      where nvl(s.c_no_group_run,0)=0  and 
                      exists (select 1 from Z#sc_Test st join Z#sc_results ss on st.c_res = ss.collection_id 
                                       where st.id = s.c_rec_test )
                      )s
          where rn between 8001 and 8010 ;
        
        l := stdio.put_pipe('all tests '||l_id.count,'DEBUG');
        for i in 1..l_id.count
          loop
            l := stdio.put_pipe('Processing test with id '||l_id(i),'DEBUG');
            l := temp(l_id(i),l_norm(i));
           -- l := replace_id(l_id(i), l_norm(i));
            if(l = 1) then
                l_result_warning := l_result_warning + 1;
            elsif(l = 2) then
                l_result_fail := l_result_fail + 1;
                l_all_result.extend();
                l_all_result(l_result_fail) := l_id(i);
            elsif(l = -1) then                
                l_epic_fail := l_epic_fail + 1;
                l_all_epic.extend();
                l_all_epic(l_epic_fail) := l_id(i);
            end if;
            l := stdio.put_pipe('--------------------------------------','DEBUG');             
           
 
          end loop;
          
           l := case l_all_result.count when 0 then stdio.put_pipe('There is not any failed tests','DEBUG') else stdio.put_pipe('Number of failed tests','DEBUG') end;  
              
           for i in 1..l_all_result.count loop
              l := stdio.put_pipe(l_all_result(i), 'DEBUG');  
           end loop;  
            
           l := case l_all_epic.count when 0 then stdio.put_pipe('There is not any epic failed tests','DEBUG') else stdio.put_pipe('Number of epic failed tests','DEBUG') end;  
              
           for i in 1..l_all_epic.count loop
              l := stdio.put_pipe(l_all_epic(i), 'DEBUG');  
           end loop;
           
           l := stdio.put_pipe('All tests: '||l_id.count, 'DEBUG');     
           l := stdio.put_pipe('Warnings tests: '||l_result_warning, 'DEBUG'); 
           l := stdio.put_pipe('Failed tests: '||l_result_fail, 'DEBUG');  
           l := stdio.put_pipe('Epic failed tests: '||l_epic_fail, 'DEBUG');
end;
