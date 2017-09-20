select to_char(block_id, 'fmXXXX') block_id, blocks
  2    from dba_extents
  3   where owner = user
  4     and segment_name = 'T';

BLOCK     BLOCKS
----- ----------
210            8

SQL>
SQL> select id,
  2         get_affected_blocks('select greatest(id1,id2,id3) from t where rowid = ''' ||
  3                             rowidtochar(t.rowid) || '''') affected_blocks
  4    from t;

        ID AFFECTED_BLOCKS
---------- --------------------------------------------------
         1  0x01000213
         2  0x01000214
         3  0x01000214 0x01000215 0x01000216
         4  0x01000216 0x01000217

SQL>
SQL> select id,
  2         get_affected_blocks('select count(id1) from t where rowid = ''' ||
  3                             rowidtochar(t.rowid) || '''') affected_blocks
  4    from t;

        ID AFFECTED_BLOCKS
---------- --------------------------------------------------
         1  0x01000213
         2  0x01000214
         3  0x01000214 0x01000215
         4  0x01000216

SQL>
SQL> select id,
  2         get_affected_blocks('select count(1) from t where rowid = ''' ||
  3                             rowidtochar(t.rowid) || '''') affected_blocks
  4    from t;

        ID AFFECTED_BLOCKS
---------- --------------------------------------------------
         1  0x01000213
         2  0x01000214
         3  0x01000214
         4  0x01000216