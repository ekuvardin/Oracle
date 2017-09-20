--spool log\from_id_to_rowid.log

--set echo on

--set serveroutput on

--prompt Начало анализа

declare
 cl_id varchar2(16);
 text varchar2(4000); 
 to_modify number;
 props varchar2(4000);
 
begin 
  
        declare
           n number;
          /* cl_id varchar2(16);
         text varchar2(4000); 
         to_modify number;
         props varchar2(4000);*/
        begin
        dbms_output.put_line('test');
        cl_id := upper('ROWID_TEST_3');  -- CLASS ID TO CHANGE !!!
        if cl_id is null then
          dbms_output.put_line( 'Error: Empty class id.' || chr(10));
        else
        select kernel into n from classes where id = cl_id; 
        if n=1 then
           dbms_output.put_line('Error: Class [' || cl_id || '] is kernel.' || chr(10));
        else
           if not (lib.class_parent(cl_id) is null) then
              dbms_output.put_line('OK: Class [' || cl_id || '] has no parent.' || chr(10));
              to_modify := 1;
           else
               dbms_output.put_line( 'Warning: Class [' || cl_id || '] has a parent => change is impossible.' || chr(10));
              to_modify := 0;
           end if;
           if lib.has_childs(cl_id) then
              dbms_output.put_line( 'Warning: Class [' || cl_id || '] has childs => change is impossible.' || chr(10));
              to_modify := 0;
           else
               dbms_output.put_line( 'OK: Class [' || cl_id || '] has no childs.' || chr(10));
           end if;
           if lib.class_table(cl_id, 1) is null then
              dbms_output.put_line( 'Warning: Class [' || cl_id || '] has no self-table => nothing to change.' || chr(10));
              to_modify := 0;
           else
              dbms_output.put_line('OK: Class [' || cl_id || '] has a table.' || chr(10));
              if to_modify = 1 then
                 select properties into props from classes where id = cl_id;
           if props is null then
              props := '|ROWID 1|';
                 else
              if instr(props, '|ROWID 1|') > 0 then
                  dbms_output.put_line( 'Report: Класс [' || cl_id || '] уже изменён.' || chr(10));
                       to_modify := 0;
              else
                 props := props || 'ROWID 1|';
                    end if;
                 end if;
              end if;
           end if;
        end if;
        end if;
        dbms_output.put_line('dbms-1: '||text);
        exception when no_data_found then
        text := 'Error: Class [' || cl_id || '] is absent.' || chr(10);
        dbms_output.put_line('dbms-2: '||text);
        end;                                                   


--prompt Конец анализа


execute immediate 'ALTER TRIGGER CLASSES_CHANGES DISABLE';


declare
/*to_modify number := 1;
cl_id  varchar2(16) := upper('ROWID_REAL');*/
begin
if to_modify = 1 then
   update classes set properties = props where id = cl_id;
   commit;
dbms_output.put_line('update classes ended');
end if;
exception when others then
dbms_output.put_line('EXCEP1');
end;


execute immediate 'ALTER TRIGGER CLASSES_CHANGES ENABLE';


--prompt First commit


declare
/*to_modify number := 1;
cl_id  varchar2(16) := upper('ROWID_REAL');*/
begin
if to_modify = 1 then
   dbms_output.put_line( 'Начато изменение класса [' || cl_id || '].' || chr(10));
   execute immediate 'ALTER TABLE Z#'||cl_id||' DROP COLUMN ID';
   storage_mgr.create_objects_view();
   commit;
end if;
exception when others then
dbms_output.put_line('EXCEP2');
end;



--prompt Second commit

declare
  str varchar2(2048);
/*to_modify number := 1;
cl_id  varchar2(16) := upper('ROWID_REAL');*/
begin
  if to_modify = 1 then  
  
    if lib.pk_is_rowid(cl_id) then 
        dbms_output.put_line('класс WITH rowid [' || cl_id || '].');
    else 
        dbms_output.put_line('класс WITHOUT rowid [' || cl_id || '].');
    end if;
    
    lib.reset_class(cl_id);
    
    if lib.pk_is_rowid(cl_id) then 
        dbms_output.put_line('класс WITH rowid [' || cl_id || '].');
    else
        dbms_output.put_line('класс WITHOUT rowid [' || cl_id || '].');
    end if;
    
       for c in (select id, short_name, class_id from criteria where class_id = cl_id) loop
            select properties into props from classes where id = cl_id;
                    
            str := 'c.id='||c.id||' 
                    c.short_name='||c.short_name||
                    ' props='||props||
                    ' class_id='||c.class_id;
                    
                 dbms_output.put_line('Alter view ['||c.short_name||']['||c.id||'].' || chr(10));
                  
            dbms_output.put_line('begin update view ['||str||'].');
            
            data_views.Create_Vw_Crit(c.id);
                  
            dbms_output.put_line('end update view ['||c.short_name||'].');
            
            end loop;
            
    storage_mgr.create_collection_views(true, true);
    commit;
    dbms_output.put_line('Закончено изменение класса [' || cl_id || '].' || chr(10));
  end if;
end;

end;
/

/*print text
set serveroutput off
set echo off
spool off*/

