create table ibs.ttt as
SELECT * FROM ibs.z#trc
  AS OF TIMESTAMP
   TO_TIMESTAMP('2014-03-18 10:00:00', 'YYYY-MM-DD HH:MI:SS')
   where id = 13895425772;
   
   
   /*SELECT versions_startscn, versions_starttime,
       versions_endscn, versions_endtime,
       versions_xid, versions_operation,
       e.*
  FROM ibs.rtl_locks VERSIONS BETWEEN TIMESTAMP
      TO_TIMESTAMP('2014-01-28 13:07:00', 'YYYY-MM-DD HH24:MI:SS')
  AND TO_TIMESTAMP('2014-01-28 13:11:00', 'YYYY-MM-DD HH24:MI:SS') e;
  
  SELECT versions_startscn, versions_starttime,
       versions_endscn, versions_endtime,
       versions_xid, versions_operation,
       e.*
  FROM ibs.sc_sessions VERSIONS BETWEEN TIMESTAMP
      TO_TIMESTAMP('2014-01-28 13:07:00', 'YYYY-MM-DD HH24:MI:SS')
  AND TO_TIMESTAMP('2014-01-28 13:11:00', 'YYYY-MM-DD HH24:MI:SS') e*/

