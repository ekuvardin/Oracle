declare
t_api_name type_refstring_table;
type tbl_info is table of type_refstring_table index by varchar2(200);
t_api tbl_info;
n pls_integer := 0;
begin
select name bulk collect into t_api_name from(
 select table_name as name  from class_tables
 union all
 select short_name  from criteria
 union all
 select short_name  from criteria
 union all
 select package_name from methods
 union all
 select interface from classes
 union all
 select table_name as name  from class_tables
 union all
 select short_name  from criteria
 union all
 select short_name  from criteria
 union all
 select package_name from methods
 union all
 select interface from classes
 union all
 select table_name as name  from class_tables
 union all
 select short_name  from criteria
 union all
 select short_name  from criteria
 union all
 select package_name from methods
 union all
 select interface from classes)t;
 dbms_output.put_line('TABLE SIZE: '||t_api_name.count);
  
for c in (
  with   uuud$ as (
  select /*+ materialize */ a.referenced_type, a.referenced_name, a.name from(
  select ud.referenced_type, ud.referenced_name, ud.name
  from user_dependencies ud
  where ud.type = 'VIEW'
         and (ud.name like 'VW/_CRIT%' escape '/'
              or  ud.name like 'VW/_RPT%' escape '/')
         and ud.referenced_owner = inst_info.gowner
         and ud.referenced_type in ('PACKAGE', 'TABLE', 'VIEW')
  union all
  select ud.referenced_type, ud.referenced_name, ud.name
  from user_dependencies ud
  where ud.type = 'VIEW'
         and (ud.name like 'VW/_CRIT%' escape '/'
              or  ud.name like 'VW/_RPT%' escape '/')
         and ud.referenced_owner = inst_info.gowner
         and ud.referenced_type in ('PACKAGE', 'TABLE', 'VIEW')
   union all
  select ud.referenced_type, ud.referenced_name, ud.name
  from user_dependencies ud
  where ud.type = 'VIEW'
         and (ud.name like 'VW/_CRIT%' escape '/'
              or  ud.name like 'VW/_RPT%' escape '/')
         and ud.referenced_owner = inst_info.gowner
         and ud.referenced_type in ('PACKAGE', 'TABLE', 'VIEW')
   union all
  select ud.referenced_type, ud.referenced_name, ud.name
  from user_dependencies ud
  where ud.type = 'VIEW'
         and (ud.name like 'VW/_CRIT%' escape '/'
              or  ud.name like 'VW/_RPT%' escape '/')
         and ud.referenced_owner = inst_info.gowner
         and ud.referenced_type in ('PACKAGE', 'TABLE', 'VIEW'))a)
   select
  /*+ OPT_PARAM('_hash_join_enabled','true') OPT_PARAM('_optimizer_sortmerge_join_enabled','true') OPT_PARAM('_b_tree_bitmap_plans','true') */
          d.class_id, d.short_name, d.name, d.tp, d.REFERENCED_TYPE,d.REFERENCED_NAME,
          decode(d.tp, 'METHODS', m.id, 'CLASSES', substr(d.api_name,3))  api_id
   from
   (
     select c.class_id, c.short_name, c.name,ud.REFERENCED_TYPE,ud.REFERENCED_NAME,
     decode(ud.REFERENCED_TYPE,'TABLE','CLASSES','PACKAGE',decode(substr(ud.REFERENCED_NAME,1,2),'Z#','CLASSES','METHODS'),'VIEW','CLASSES') tp,
     decode(ud.REFERENCED_TYPE,'PACKAGE',decode(substr(ud.REFERENCED_NAME,1,2),'Z#',substr(ud.REFERENCED_NAME,1,length(ud.REFERENCED_NAME)-10),ud.REFERENCED_NAME),ud.REFERENCED_NAME) api_name
     from uuud$ ud, criteria c
     where c.short_name = ud.name
     and
     (  -- ѕредставление либо локальное незарегистрированное
       not exists(select 1 from criteria c2, objects_options o where c2.short_name=ud.name and o.class_id=c2.class_id and o.short_name=c2.short_name)
       or  -- либо относитс€ к приложению с признаком в лицензии "ѕровер€ть использование лицензируемых API"
       exists(select 1 from criteria c2, objects_options o, system_options so, aud.license_params lp
               where c2.short_name=ud.name and o.class_id=c2.class_id and o.short_name=c2.short_name
               and o.option_id=so.id and so.id=lp.id and lp.api_check='1' and lp.owner=inst_info.gowner)
     )
     and
     (
       exists (select 1 from methods m, table(t_api_name) t where ud.REFERENCED_TYPE='PACKAGE' and m.package_name=ud.REFERENCED_NAME and m.package_name=t.column_value)
       or
       exists (select 1 from table(t_api_name) t where ud.REFERENCED_TYPE='TABLE' and t.column_value=ud.REFERENCED_NAME)
       or
       exists (select 1 from table(t_api_name) t where ud.REFERENCED_TYPE='PACKAGE' and ud.REFERENCED_NAME like 'Z#%#INTERFACE' and t.column_value=ud.REFERENCED_NAME)
       or
       exists (select 1 from table(t_api_name) t where ud.REFERENCED_TYPE='VIEW' and t.column_value=ud.REFERENCED_NAME)
     )
   )d, methods m
   where d.api_name=m.package_name(+))
  loop
    if not t_api.exists(c.api_id) then
      t_api(c.api_id):= type_refstring_table();
    end if;
    t_api(c.api_id).extend(1);
    t_api(c.api_id)(t_api(c.api_id).last):= rpad(c.class_id,40)|| rpad(c.short_name,40)||rpad(c.name,40)||'CRITERIA';
    n := n+1;
  end loop;
  
  dbms_output.put_line('ROWCOUNT :' || n);
end;
