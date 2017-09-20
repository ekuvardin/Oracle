create materialized view ARG_WP_OBJECT_EVENT_MV
tablespace argis_tables
using index tablespace argis_indexes
refresh fast on demand
as
select 
  o.rowid o_rid,
  o.state_id,
  o.id
from 
  arg_object o
where o.state_id in(
      arg_state_get_bysysname(pSchemeSysName => 'RegisterForDeliveryScheme',
                              pStateSysName => 'RegisterForDeliveryStateSigned'),
      arg_state_get_bysysname(pSchemeSysName => 'RegisterForDeliveryScheme',
                              pStateSysName => 'RegisterForDeliveryStateCreated'));

begin
  arg_service.ExecDDL('alter table ARG_WP_OBJECT_EVENT_MV add constraint pk_ARG_WP_OBJECT_EVENT_MV primary key (id) deferrable initially deferred using index tablespace argis_indexes');
end; 
/

create materialized view log on ARG_WP_OBJECT_EVENT_MV
  with sequence, primary key, rowid /*, commit scn including new values*/
;


-- move to argis grant script
declare
    l_log_table USER_MVIEW_LOGS.LOG_TABLE%TYPE;
begin   
    select U.LOG_TABLE into l_log_table from USER_MVIEW_LOGS U WHERE U.MASTER = 'ARG_WP_OBJECT_EVENT_MV';
    
    arg_service.ExecDDL('grant select on ' || l_log_table || ' to web_partner');
    arg_service.ExecDDL('grant select on ARG_WP_OBJECT_EVENT_MV to web_partner');
exception when no_data_found then
    dbms_output.put_line('Error. Mat. view log hasn''t been created for "ARG_WP_OBJECT_EVENT_MV"');
end;
/


create materialized view ARG_WP_REGISTRY_DPD2WP_MV_P
tablespace argis_tables
using index tablespace argis_indexes
refresh fast on demand
as
select
  r.id,
  r.rowid r_rid,
  ord.rowid ord_rid,
  o.rowid o_rid,
  r.register_num as name,
  r.department_to_id as department_id,
  ord.execute_date as create_moment,
  arg_wp_util.Register_Check_Tsd_Only(r.id) as tsd_only,
  case
         when o.state_id = arg_state_get_bysysname(
                              pSchemeSysName => 'RegisterForDeliveryScheme',
                              pStateSysName => 'RegisterForDeliveryStateCreated')
               and arg_wp_util.Register_Check_Tsd_Only(r.id) = 0 
               then 1 else 0
         end as can_be_signed
from
  arg_register_for_delivery r,
  arg_order ord,
  ARG_WP_OBJECT_EVENT_MV o
where 1=1
  and r.department_to_id is not null
  -- mandatory
  and ( o.id = r.id )
  -- additional
  and ( ord.id (+) = r.order_master_id )
;

begin
  arg_service.ExecDDL('alter table ARG_WP_REGISTRY_DPD2WP_MV_P add constraint pk_arg_wp_registry_dpd2wp_mv_p primary key (id) deferrable initially deferred using index tablespace argis_indexes');
end; 
/


create materialized view log on ARG_WP_REGISTRY_DPD2WP_MV_P
  with sequence, primary key, rowid /*, commit scn including new values*/
;


-- move to argis grant script
declare
    l_log_table USER_MVIEW_LOGS.LOG_TABLE%TYPE;
begin   
    select U.LOG_TABLE into l_log_table from USER_MVIEW_LOGS U WHERE U.MASTER = 'ARG_WP_REGISTRY_DPD2WP_MV_P';
    
    arg_service.ExecDDL('grant select on ' || l_log_table || ' to web_partner');
    arg_service.ExecDDL('grant select on ARG_WP_REGISTRY_DPD2WP_MV_P to web_partner');
exception when no_data_found then
    dbms_output.put_line('Error. Mat. view log hasn''t been created for "ARG_WP_REGISTRY_DPD2WP_MV_P"');
end;
/

declare
  l_id arg_dict.id%type;
begin  
  -- Создание дополнительного мат. представления ARG_WP_OBJECT_EVENT_MV         
  l_id := Arg_Dict_Add('Dict.WP.MaterializedViews',
              null,
              'Заказы специальные',
              'Заказы специальные', 
              'ARG_WP_OBJECT_EVENT_MV',
              '000', -- делаем такой код, чтобы представление обновлялось раньше ARG_WP_REGISTRY_DPD2WP_MV_P
              'Тестовая Витрина заказов Web Partner',
              1);

  -- Создание дополнительного мат. представления ARG_WP_REGISTRY_DPD2WP_MV_P         
  l_id := Arg_Dict_Add('Dict.WP.MaterializedViews',
              null,
              'Тестовые реестры',
              'Тестовые реестры', 
              'ARG_WP_REGISTRY_DPD2WP_MV_P',
              '01',
              'Тестовая Витрина заказов Web Partner',
              1);
  
  commit;
end;
/
/*
-- Регистрация новых мат. представлений + помещаем их в компоненты для перевыдачи прав + удаляем из компонентов неиспользуемы объекты
declare
  task_id arg_Object.id%type;
begin
  task_id := arg_object_get_bysysname(pTypeSysName => 'Task',pSysName => 'WebPartner');
 
  for c in(
    select upper(o.TABLE_NAME) mview_name, a.id
          from user_tables o
          left join user_mview_logs ml on ml.master = o.TABLE_NAME
          left join arg_object a on o.TABLE_NAME = a.sysname
         where o.TABLE_NAME like 'ARG\_WP\_%' escape '\' and a.id is null)
     loop
          arg_Service.Server_Component_Register(pSysName => c.mview_name);
     end loop;
    
  for c in(
    select upper(o.TABLE_NAME) mview_name, a.id
          from user_tables o
          left join user_mview_logs ml on ml.master = o.TABLE_NAME
          join arg_object a on o.TABLE_NAME = a.sysname
         where o.TABLE_NAME like 'ARG\_WP\_%' escape '\')
     loop
          Arg_Task_SysComponent_Add(task_id, c.id);
     end loop;
     
  for c in(select a.id from arg_object a where a.sysname in('T_ARG_NUMBER_TABLE','T_ARG_TYPESIZE_TABLE','T_ARG_TYPESIZE'))
    loop
        arg_task_syscomponent_del(task_id, c.id);
    end loop;

  commit; 
  
end;
/*/


