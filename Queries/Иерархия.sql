select lpad(' ',(level-1)*4)||type_name || '  ' || text || ' ', level, r.* from
(select * from plp$ir where method_id = '2147487306')r
start with parent is null
connect by prior id =  parent;
