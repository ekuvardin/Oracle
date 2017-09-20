select
    /*+
        leading(t1 t2 t3 t4)
        use_nl(t3)
        use_nl(t4)
        rowid(t3)
        rowid(t4)
    */
    t3.padding,
    t4.padding
from
    t1,
    t2,
    t1 t3,
    t2 t4
where
    t1.mod1 = 50
and t2.random2 = t1.random1
and t2.mod2 = 50
and t3.rowid = t1.rowid
and t2.rowid = t4.rowid
;