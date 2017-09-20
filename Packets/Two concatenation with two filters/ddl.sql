create table t1
as
with generator as (
    select  --+ materialize
        rownum id
    from dual
    connect by
        rownum <= 10000
)
select
    rownum                  id,
    mod(rownum,100)             mod1,
    trunc(dbms_random.value(0,10000))   random1,
    lpad(rownum,10,'0')         small_vc,
    rpad('x',60)                padding
from
    generator   v1,
    generator   v2
where
    rownum <= 100000
;
 
create table t2
as
with generator as (
    select  --+ materialize
        rownum id
    from dual
    connect by
        rownum <= 10000
)
select
    rownum                  id,
    mod(rownum,100)             mod2,
    trunc(dbms_random.value(0,10000))   random2,
    lpad(rownum,10,'0')         small_vc,
    rpad('x',60)                padding
from
    generator   v1,
    generator   v2
where
    rownum <= 100000
;
 
create index t1_i1 on t1(mod1, random1);
create index t2_i1 on t2(mod2, random2);