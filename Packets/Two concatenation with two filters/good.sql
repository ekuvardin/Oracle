select
    t1.padding,
    t2.padding
from
    t1, t2
where
    t1.mod1 = 50
and t2.random2 = t1.random1
and t2.mod2 = 50
;