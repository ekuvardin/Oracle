select * from test_trigger;

update test_trigger t set t.val = 'new' where id = 5;
commit;

select * from test_trigger;
