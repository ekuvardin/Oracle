select a1.*,DBMS_ROWID.ROWID_OBJECT(rowid) "OBJECT",
          DBMS_ROWID.ROWID_RELATIVE_FNO(rowid) "FILE",
          DBMS_ROWID.ROWID_BLOCK_NUMBER(rowid) "BLOCK",
         DBMS_ROWID.ROWID_ROW_NUMBER(rowid) "ROW" from ibs.DIARY6 a1
         where rowid between ibs.convert_to_rowid.start_rowid(p_segname => 'IBS_DIARY6',p_owner => 'AUD',p_type => 'TABLE PARTITION') 
         and ibs.convert_to_rowid.end_rowid (p_segname => 'IBS_DIARY6',p_owner => 'AUD',p_type => 'TABLE PARTITION')
and user_id = 'IBS.mochkar'
order by id desc;