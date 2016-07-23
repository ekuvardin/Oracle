set heading off
set feed off
set pagesize 0
set termout off
set define off

spool tmp.sql
select
'accept y char for a1 default Y prompt ''Action on ' || username || '?: '''||chr(10)||
'col f new_v file'||chr(10)||
'set termout off'||chr(10)||
'select decode(count(*), 1, ''Action.sql ' || username || ''') as f from dual where upper(''&y'') = ''Y'';'||chr(10)||
'set termout on'||chr(10)||
'@&file'||chr(10)||chr(10)
from all_users;
spool off

set define on
set heading on
set feed on
set termout on

@tmp.sql

exit