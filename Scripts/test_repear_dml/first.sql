select * from test_trigger;

update test_trigger t set t.val = 'new' where t.val = 'old';

begin
  test_ins_bulk.push();
end;
/

select * from test_trigger;
select * from TEMP_repl;
