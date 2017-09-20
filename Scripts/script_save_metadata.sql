set serveroutput on format wrapped
SET FEEDBACK OFF

UNDEFINE TEMP_TABL
UNDEFINE ROWID_CURSOR
UNDEFINE ROWID_PLPLUS

begin
    DBMS_OUTPUT.put_line('Print name of temp table');
end;
/

def TEMP_TABL='&&TEMP_TABL'

begin
    DBMS_OUTPUT.put_line('Print name of table where store cursors');
end;
/

def ROWID_CURSOR='&&ROWID_CURSOR'

begin
    DBMS_OUTPUT.put_line('Print name of table where store cursors mapping to plplus code');
end;
/

def ROWID_PLPLUS='&&ROWID_PLPLUS'

create table &TEMP_TABL as
select method_id, position from cursors cr where exists (select 1 from (select /*+ materialize*/'Z#'||id as name from classes c where c.properties like '%ROWID 1%')t where cr.text like '%'||t.name||'%')
/

create table &ROWID_CURSOR as select * from cursors c
where exists(select 1 from &TEMP_TABL t where c.method_id = t.method_id and c.position = t.position)
/

drop table &TEMP_TABL
/

create table &ROWID_PLPLUS
(
  method_id  VARCHAR2(16),
  position   NUMBER,
  section    VARCHAR2(40),
  plp_line   NUMBER,
  plsql_line NUMBER
)
/

create or replace procedure get_plplus_line(p_method_id varchar2, p_pos number, p_insert varchar2 default 'false') is
-- если p_insert = 'true', значит мы вставляем результаты в таблицу
l_method_id varchar2(16) := p_method_id;
l_position number := p_pos;
l_t type_number_table := type_number_table();
l_temp type_number_table;
l_is_select boolean := false;
l_line_into_in_select number := 0;
CURSOR get_token is
  select tokenize.*, m.class_id, m.short_name, m.package_name from methods m,
  (select r, method_id, position, row_number() over(partition by method_id, position order by rownum) as rn   from(
  select /*+ NO_XML_QUERY_REWRITE  */ r, t.method_id, t.position, rownum from &ROWID_CURSOR t,
  -- ниже следующий код не выравнивтать, так как нельзя вставить chr(10) явно(как код перевода строки).
  -- ora:tokenize разбивает строку на несколько строк. Символом разделения служит символ перевода строки.
           xmltable('ora:tokenize(.,"
")'
                    passing t.text || '
'
              columns r varchar(4000) path '.')where t.method_id = l_method_id and t.position = l_position))tokenize
             where m.id = tokenize.method_id;

procedure show_results is
  begin
     for i in 1..l_t.count
       loop
         for res in(select * from host2plp where method_id =l_method_id and line <= l_t(i) order by plp_line desc)
           loop
              if p_insert = 'true' then
                insert into &ROWID_PLPLUS(Method_Id, Position, Section, Plp_Line, Plsql_Line)
                values (p_method_id, p_pos, res.section, res.plp_line, l_t(i));
              else
                dbms_output.put_line('SECTION: '||res.section);
                dbms_output.put_line('PLP_LINE: '||res.plp_line);
                dbms_output.put_line('PLSQL_LINE: '||l_t(i));
              end if;
              exit;
           end loop;

           dbms_output.put_line(' ');
       end loop;
  end show_results;
begin
  -- первый проход
  for c in get_token
    loop
      select u.line - (c.rn - 1) bulk collect into l_temp from user_source u where u.name = c.package_name and u.TYPE = 'PACKAGE BODY' and u.TEXT like '%'||c.r||'%';

      if c.rn = 1 then
        l_t := l_temp;
        if upper(c.r) like 'SELECT%' then
          l_is_select := true;
        end if;
      else
        l_t := l_t MULTISET INTERSECT l_temp;

        if l_t.count = 0 then
          l_line_into_in_select := c.rn;
          exit;
        end if;

      end if;
    end loop;

    show_results();

-- бывает так, что в курсоку нет оператора insert into, тогда необходим второй проход, чтобы найти соответсвие.
-- Для этого нужно сдвинуть сравнение строк на 1, начиная с l_line_into_in_select строки. То есть последней строки, где
-- l_t.count = 0 в предыдущем цикле.
    if l_is_select and l_line_into_in_select>0 then
        if l_t.count=0 then
          for c in get_token
          loop
            select u.line - case when c.rn<l_line_into_in_select then (c.rn - 1) else c.rn end
            bulk collect into l_temp from user_source u where u.name = c.package_name and u.TYPE = 'PACKAGE BODY' and u.TEXT like '%'||c.r||'%';

            if c.rn = 1 then
              l_t := l_temp;
            else
              l_t := l_t MULTISET INTERSECT l_temp;
            end if;
          end loop;
        end if;

      show_results();
    end if;
end get_plplus_line;
/

begin
  for c in(select * from &ROWID_CURSOR r where r.piece = 1)
    loop
      get_plplus_line(c.method_id, c.position, 'true');
    end loop;
end;
/

commit
/
