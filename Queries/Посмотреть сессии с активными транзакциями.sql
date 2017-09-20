--Посмотреть сессии с активными транзакциями:
SELECT A.SID, A.USERNAME, B.XIDUSN, B.USED_UREC, B.USED_UBLK  
 FROM V$SESSION A, V$TRANSACTION B WHERE A.SADDR=B.SES_ADDR;

--Найти SQL текст который порождает активные транзакции 
select * from v$sqltext where sql_id in
(SELECT sql_id FROM V$SESSION A, V$TRANSACTION B WHERE A.SADDR=B.SES_ADDR) order by sql_id,piece;

--Найти SQL текст который использует UNDO:
--Может очень пригодиться для слежения за генерируемыми откатами и продолжительностью самых длительных запросов. 
Select * from v$sqltext where sql_id in  
(select maxqueryid from
(select maxqueryid from v$undostat where maxquerylen>0 
/*раскоментарить нужное*/
--order by BEGIN_TIME desc
--order by END_TIME desc
--order by UNDOTSN desc
--order by UNDOBLKS desc
--order by TXNCOUNT desc
order by MAXQUERYLEN desc
--order by MAXQUERYID desc
--order by MAXCONCURRENCY desc
--order by UNXPSTEALCNT desc
--order by UNXPBLKRELCNT desc
--order by UNXPBLKREUCNT desc
--order by EXPSTEALCNT desc
--order by EXPBLKRELCNT desc
--order by EXPBLKREUCNT desc
--order by SSOLDERRCNT desc
--order by NOSPACEERRCNT desc
--order by ACTIVEBLKS desc
--order by UNEXPIREDBLKS desc
--order by EXPIREDBLKS desc
--order by TUNED_UNDORETENTION desc
) where rownum < 11 
) order by sql_id,piece;
