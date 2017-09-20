create table TEST_W
(
  id NUMBER,
  v  VARCHAR2(2000)
);
/

insert into test_w values(1,'old');
commit;

create or replace type test_obj as object(id number, v varchar2(32000));
create or replace type t_test_obj as table of test_obj;

select * from test_w;

declare
l_old_obj t_test_obj;
l_new_obj t_test_obj;
begin
  update test_w d set id=2, v='new' where id=1 return (select test_obj(id,v) from test_w where id=d.id), test_obj(d.id,d.v) bulk collect into l_old_obj, l_new_obj; 
  
  for i in 1..l_old_obj.count 
    loop
        dbms_output.put_line(' ');
        dbms_output.put_line('OLD VALUES');
        dbms_output.put_line('id = '||l_old_obj(1).id);
        dbms_output.put_line('v = '||l_old_obj(1).v);
    end loop;
    
    for i in 1..l_new_obj.count 
    loop
        dbms_output.put_line(' ');
        dbms_output.put_line('NEW VALUES');
        dbms_output.put_line('id = '||l_new_obj(1).id);
        dbms_output.put_line('v = '||l_new_obj(1).v);
    end loop;
  rollback;
end;
/
