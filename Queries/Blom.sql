select --+ px_join_filter(t2) leading(t1)
           *
     from (select rownum id from dual connect by level <= 10) t1
           join (select id, count(value) cnt from (select rownum id, rownum value from dual connect by level <= 2000000) group by id) t2
           on t1.id = t2.id
