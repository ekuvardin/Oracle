declare
  l_arrIds "CONSTANT".NUMBER_TABLE;
  l_arrU   "CONSTANT".REFSTRING_TABLE;
  l_arrRes "CONSTANT".REFSTRING_TABLE;

  l_tempU      TYPE_REFSTRING_TABLE;
  l_tempArrRes TYPE_REFSTRING_TABLE;

  l_cur                 NUMBER;
  l_err                 decimal;
  l_first_unsuccessfull NUMBER := -1;
  thread_id             number;
  thread_count          number;
  l_build               number;

  l_username  varchar2(48);
  l_os_domain varchar2(48);

  l_id_lock pls_integer;
  m number;
  v varchar2(4000);
 
  l_dequeue_options    DBMS_AQ.DEQUEUE_OPTIONS_T;
  l_enqueue_options    DBMS_AQ.ENQUEUE_OPTIONS_T;
  l_message_properties DBMS_AQ.MESSAGE_PROPERTIES_T;
  l_message_handle     RAW(16);
  l_queue_tests queue_tests;
  l_result boolean := false;
  
  c_max_failed integer := 400;
  c_max_sleep integer := 400;
  l_cur_max_failed integer := 0;
  exception_no_message exception;
  PRAGMA EXCEPTION_INIT(exception_no_message, -25228);
  
  procedure ENQUEUE is
    begin
      l_enqueue_options.wait :=  20;
      DBMS_AQ.ENQUEUE(
            queue_name         => 'queue_t',
            ENqueue_options    => l_enqueue_options,
            message_properties => l_message_properties,
            payload            => l_queue_tests,
            msgid              => l_message_handle);          
      commit;
      end;
      
begin
  l_queue_tests := queue_tests(1,0);
 
  ENQUEUE();
  dbms_output.put_line('eject');
commit;
end;
