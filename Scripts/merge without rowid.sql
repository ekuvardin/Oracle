select * from test_t;

MERGE INTO test_t s
USING (select id, val, rn,cn
         from (SELECT row_number() over(partition BY id order by id) rn,
                      count(*) over(partition BY id) cn,
                      id,
                      val
                 FROM test_t)
        where rn = 1 and cn > 1) m
ON (s.id = m.id and m.rn = 1)
WHEN MATCHED THEN
  UPDATE SET s.val = s.val DELETE WHERE 1=1
WHEN NOT MATCHED THEN
  insert VALUES (m.id, m.val)
  ;

select * from test_t;
rollback;
