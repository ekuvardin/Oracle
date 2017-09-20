declare
s_lock pls_integer;
begin
    s_lock := executor.lock_open(null, nvl(executor.get_system_id,dbms_session.unique_session_id));
    dbms_output.put_line(substr('Value of s_lock='||s_lock,1,255));    
end;
/

update methods
  set properties = 
    case when length(regexp_substr(properties, '(COMPILER )([^|]+)',1,1,'i',2)) = 18 then 
      regexp_replace(properties, '((COMPILER )([^|]+))','\102')
    else 
      regexp_replace(properties, '((COMPILER )([^|]+))',substr(regexp_substr(properties, '(COMPILER )([^|]+)'),1,27)||'02')
    end,
    status = 'UPDATED'
 where class_id like 'SC\_%' escape '\' or class_id in('SCRIPTS','SCRIPTS_REF');
 
commit;



