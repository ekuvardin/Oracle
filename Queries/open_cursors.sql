SELECT s.osuser, s.username, s.sid, count(*) cnt     
 FROM v$session s, v$open_cursor oc      
 WHERE s.saddr = oc.saddr AND            
 s.username IS NOT NULL      
 GROUP BY s.osuser, s.username, s.sid
 order by 4 desc;  
 
select sum(a.value), b.name       
 from v$sesstat a, v$statname b      
 where a.statistic# = b.statistic#      
 and b.name = 'opened cursors current'      
 group by b.name ;
 
 select a.value, b.name       
 from v$sesstat a, v$statname b      
 where a.statistic# = b.statistic#      
 and b.name = 'opened cursors current' and a.value<>0;
 

select count(*) from sys.v_$open_cursor;
