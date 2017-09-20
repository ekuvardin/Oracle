declare
v varchar2(4000);
m number;
function getlong( p_tname in varchar2,
                                     p_cname in varchar2,
                                      p_rowid in varchar2) return varchar2
as
     l_cursor    integer default dbms_sql.open_cursor;
     l_n         number;
     l_long_val  varchar2(4000);
      l_long_len  number;
      l_buflen    number := 4000;
      l_curpos    number := 0;
 begin
      dbms_sql.parse( l_cursor,
                     'select ' || p_cname || ' from ' || p_tname ||
                                                          ' where VIEW_NAME = :x',
                     dbms_sql.native );
    dbms_sql.bind_variable( l_cursor, ':x', p_rowid );

   dbms_sql.define_column_long(l_cursor, 1);
    l_n := dbms_sql.execute(l_cursor);

       if (dbms_sql.fetch_rows(l_cursor)>0)
      then
        dbms_sql.column_value_long(l_cursor, 1, l_buflen, l_curpos ,
                                   l_long_val, l_long_len );
    end if;
    dbms_sql.close_cursor(l_cursor);
     return l_long_val;
  end getlong;
begin
  for i in( select u.* from user_views u where u.VIEW_NAME in(select name from user_dependencies v where v.REFERENCED_NAME = 'Z$SCRIPTS_VW_LIB'))
  loop
   v := getlong('user_views', 'text', i.VIEW_NAME);
   select count(1) into m from dual where regexp_like(v,'Z\$SCRIPTS\_\VW\_LIB.GET\_ID\_TEST\([(0-9)|(A-z)|(\$)|(\#)(.)]+(,\''){1}JAVA(\'',\''){1}[0-9]+(\'',){1}\''1\''','i');
   if(m = 1) then
    dbms_output.put_line(i.VIEW_NAME);
   end if;
  end loop;  
end;
/
