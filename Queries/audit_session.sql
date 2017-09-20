SELECT os_username, username, userhost, timestamp, dba_audit_session.sessionid,/*TO_CHAR(timestamp, 'DD-MON-YYYY HH24:MI:SSSSS'),*/ returncode 
FROM dba_audit_session 
WHERE returncode >  0
order by timestamp desc
 
