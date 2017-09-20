var v_build number

declare
  l_dequeue_options    DBMS_AQ.DEQUEUE_OPTIONS_T;
  l_enqueue_options    DBMS_AQ.ENQUEUE_OPTIONS_T;
  l_message_properties DBMS_AQ.MESSAGE_PROPERTIES_T;
  l_msgid_array_t DBMS_AQ.MSGID_ARRAY_T;
  l_message_handle     RAW(16);
  l_queue_tests queue_tests;
  l_result boolean := false;
  l_t_queue_tests t_queue_tests;
  n pls_integer := 0;
  

l_MESSAGE_PROPERTIES_ARRAY_T DBMS_AQ.MESSAGE_PROPERTIES_ARRAY_T;

begin
  l_enqueue_options.visibility := DBMS_AQ.IMMEDIATE;
 
  l_MESSAGE_PROPERTIES_ARRAY_T :=  DBMS_AQ.MESSAGE_PROPERTIES_ARRAY_T();
  l_msgid_array_t := DBMS_AQ.MSGID_ARRAY_T();
      
  select sb.c_script
    bulk collect into l_t_queue_tests
      from z#sc_build_scripts sb, z#sc_builds b
        where b.c_params#scripts = sb.collection_id and b.id = :v_build;
   
  if(l_t_queue_tests is not null and l_t_queue_tests.count > 0) then      
    for i in 1..l_t_queue_tests.count
      loop
        l_MESSAGE_PROPERTIES_ARRAY_T.extend;
        l_MESSAGE_PROPERTIES_ARRAY_T(l_MESSAGE_PROPERTIES_ARRAY_T.last) := l_message_properties;
      end loop;
   
          
    n := DBMS_AQ.ENQUEUE_ARRAY (
           queue_name                 =>  'queue_t',
           enqueue_options            =>  l_enqueue_options,
           array_size                 =>  l_t_queue_tests.count,
           message_properties_array   =>  l_MESSAGE_PROPERTIES_ARRAY_T,
           payload_array              =>  l_t_queue_tests,
           msgid_array                =>  l_msgid_array_t);
           commit;
  end if;
  
  dbms_output.put_line(n);
end;
/
