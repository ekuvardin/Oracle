select --+rule
       s.*
  from v$lock l, v$session s 
 where 
    l.TYPE='TO'
   and l.SID=s.SID
   and l.id1 in (select o.object_id from dba_objects o 
                  where o.object_name = Upper('PLSQL_PROFILER_UNITS'))
