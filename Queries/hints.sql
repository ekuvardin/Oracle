explain plan
set statement_id = 'sj_hinted'
for
select
    /*+
        qb_name(main)
    */
    *
from
    zero_t t2
where   t2.id<=100
and exists (
        select
            /*+
                qb_name(subq) nl_sj
            */
            null
        from    zero_t t1
        where   t2.id = t1.id
    )
;

select * from table(dbms_xplan.display(null,'sj_hinted','ALL'));

select * from table(dbms_xplan.display(null,'sj_hinted','outline'));
 select * from table(dbms_xplan.display(null,null,'outline'));
