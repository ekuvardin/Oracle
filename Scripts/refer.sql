select * from user_source u where u.name in(
select name from user_dependencies a where a.REFERENCED_NAME = 'PLIB') and
lower(u.TEXT) like '%plib.parse%'
