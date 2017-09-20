create table IBS_DIARY5_BACKUP
(
  id      NUMBER,
  time    TIMESTAMP(6),
  audsid  NUMBER,
  user_id VARCHAR2(70),
  topic   CHAR(1),
  code    VARCHAR2(30),
  text    VARCHAR2(4000)
)
tablespace T_AUD
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate indexes 
create index IDX_DIARY5_BCKP_TIME on IBS_DIARY5_BACKUP (TRUNC(TIME))
  tablespace T_AUD
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Grant/Revoke object privileges 
grant select on IBS_DIARY5_BACKUP to IBS with grant option;
grant select on IBS_DIARY5_BACKUP to IBS_UADMIN;
grant select on IBS_DIARY5_BACKUP to IBS_USER;

create or replace package test_lic is
  procedure enable_trigger(p_trigger varchar2, p_enable boolean);
  procedure delete_license(p_owner varchar2);
  procedure diary5_bckp(p_date date, p_type varchar2);
  procedure create_row_diary5(p_reg_date    date,
                              p_remove_date date,
                              p_text        varchar2);
  procedure delete_row_diary5(p_pref varchar2);
end test_lic;
/

create or replace package body test_lic is

  procedure enable_trigger(p_trigger varchar2, p_enable boolean) is
  begin
    if p_enable then
      execute immediate 'ALTER TRIGGER ' || p_trigger || ' ENABLE';
    else
      execute immediate 'ALTER TRIGGER ' || p_trigger || ' DISABLE';
    end if;
  end;

  procedure delete_license(p_owner varchar2) is
    o varchar2(30);
  begin
    enable_trigger('LICENSE_SETTINGS_CHANGES', false);
    select owner
      into o
      from owners
     where schema_owner = p_owner
       and rownum = 1;
    delete from license_settings where owner = p_owner;
    utils.write_log(o,
                    'U',
                    'LICENSE',
                    utils.get_msg('LICENSE_DELETED', p_owner));
    enable_trigger('LICENSE_SETTINGS_CHANGES', true);
  exception
    when no_data_found then
      raise lic_mgr.NO_PRIVILEGES;
  end;

  procedure diary5_bckp(p_date date, p_type varchar2) is
    l_date date;
    l_cnt  number;
  begin
    if p_date is not null and p_type is not null then
      l_date := trunc(p_date);
      if p_type = 'BCKP' then
        select count(1)
          into l_cnt
          from ibs_diary5_backup d
         where trunc(d.time) = l_date;
        if l_cnt = 0 then
          insert into ibs_diary5_backup
            (select * from ibs_diary5 where trunc(time) = l_date);
        end if;
        delete from ibs_diary5 where trunc(time) = l_date;
      elsif p_type = 'RSTR' then
        delete from ibs_diary5 d
         where trunc(d.time) in
               (select trunc(b.time)
                  from ibs_diary5_backup b
                 where trunc(b.time) = l_date);
        insert into ibs_diary5
          (select * from ibs_diary5_backup where trunc(time) = l_date);
      end if;
    else
      raise_application_error(-20900, 'Options can not be empty');
    end if;
  end;

  procedure create_row_diary5(p_reg_date    date,
                              p_remove_date date,
                              p_text        varchar2) is
    p_sid   number;
    p_topic char(1) := 'I';
  begin
    if p_text is not null and p_reg_date is not null then
      p_sid := trunc(dbms_random.value(1, 9999999));
      insert into IBS_DIARY5
        (ID, TIME, AUDSID, USER_ID, TOPIC, CODE, TEXT)
      values
        (DIARY_ID.NEXTVAL,
         p_reg_date,
         p_sid,
         p_sid,
         p_topic,
         'REG_CLIENT',
         p_text);
      if p_remove_date is not null then
        insert into IBS_DIARY5
          (ID, TIME, AUDSID, USER_ID, TOPIC, CODE, TEXT)
        values
          (DIARY_ID.NEXTVAL,
           p_remove_date,
           p_sid,
           p_sid,
           p_topic,
           'REMOVED',
           p_text);
      end if;
    end if;
  end create_row_diary5;

  procedure delete_row_diary5(p_pref varchar2) is
  begin
    delete from IBS_DIARY5
     where text like p_pref || '%'
       and to_char(audsid) = user_id;
  end delete_row_diary5;

end test_lic;
/

grant select on aud.license_settings to ibs;
/

grant execute on aud.test_lic to ibs;
/
