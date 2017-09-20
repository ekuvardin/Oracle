create table test_trigger(
id number,
val varchar2(100));
/

CREATE GLOBAL TEMPORARY TABLE TEMP_repl
(          
id number,       
val VARCHAR2(100)          
)     ON COMMIT PRESERVE ROWS;
/

create or replace package test_ins_bulk is
procedure put(p_id number, p_val varchar2);
procedure push;
end;
/

create or replace package body test_ins_bulk is

type rec is record (id number, val varchar2(100));
type table_r is table of rec;
t table_r := table_r();

procedure put(p_id number, p_val varchar2) is
begin
  t.extend();
  t(t.count).id := p_id;
  t(t.count).val := p_val;
end;

procedure push is
begin
  forall i in 1..t.count
    insert into TEMP_repl values(t(i).id, t(i).val);
end;

end;
/

insert into test_trigger select level, 'old' from dual connect by level<=5;
/


create or replace trigger test_trigger_all
after delete or insert or update on test_trigger
for each row 
begin
  dbms_lock.sleep(5);
   if inserting then 
     dbms_output.put_line('INSERT');
     dbms_output.put_line('new.id '||:new.id);
     dbms_output.put_line('new.val '||:new.val);     
   elsif deleting then
     dbms_output.put_line('DELETE');
     dbms_output.put_line('old.id '||:old.id);
     dbms_output.put_line('old.val '||:old.val);
   elsif updating then
     dbms_output.put_line('UPDATE');
     dbms_output.put_line('OLD');
     dbms_output.put_line('old.id '||:old.id);
     dbms_output.put_line('old.val '||:old.val);
     dbms_output.put_line('NEW');
     dbms_output.put_line('new.id '||:new.id);
     dbms_output.put_line('new.val '||:new.val);
     test_ins_bulk.put(:new.id, :new.val);
   end if;     
end;
/
