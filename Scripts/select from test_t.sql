select * from TEST_T;

merge into test_t r
using test_t w
on(r.id = w.kid)
when matched then update
    set r.parent = w.id
    where r.parent is null;
    
select * from TEST_T;
