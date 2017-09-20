select
    /*+
        leading(t1 t2 t3)
        use_nl(t3)
        rowid(t3)
    */
    t3.padding,
    t2.padding
from
    t1,
    t2,
    t1  t3
where
    t1.mod1 = 50
and t2.random2 = t1.random1
and t2.mod2 = 50
and t3.rowid = t1.rowid
;