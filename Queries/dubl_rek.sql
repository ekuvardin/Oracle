set serveroutput on size 100000
SET VERIFY OFF
SET FEEDBACK OFF
SET TERMOUT OFF
set linesize 180

/*
  ���� �� ����� ������ �� >= 7.4.0.2, �� � ���� "������������� ������� ������" ��� ���������� ������ ���������, ������� 
  �������� � ����, ��� ��������� ���������� ��������� �� ���� �������, �������� ������, � ������� ������� ������ �������� ��� ��� ���������.
  
  ���� �� ����� ��������� ��� ������������, �� ���������� ������ �������� � ������������ �������, ���� ������������ JAVA-����������.
  ���� JAVA-���������� �� ������������, �� ������� ������ ����� �������� � ������� � ������-������. 
  
  ������� �������� �������� �� �������:
  
  ����� � ��� ����� �����
  ----------------------------------------------------------------------------------- 
  ��� : PLATFORM_TEST
  ������� : C_ZZZ 
  ��������� : ZZ,ZZZ
  ----------------------------------------------------------------------------------- 
  1. � class_tab_columns ��� ���������������� ������ ����� ���������(�������� dubl_error.log), ������� ��������� �� ���� �������.
    
    �� ����� �������� �������  �� ����� 2 ���������� ����������, ������, �������� ��� ������� ����� ������ ��� ������ �� ���.
    
    ������� ������ 
        select * from class_tab_columns c where c.qual in('ZZ','ZZZ') and c.class_id = 'PLATFORM_TEST';
        
        1.1 ��������, ��� ���� � ���������� ���������� ����(��. class_tab_columns.host_type), �� ������� ��� ����������� ������ �� ������ ���������
        � ������ �� �����, � ������� - ����� �������� ��� ������� ������ �� ���������� �� ���� ����������.
        
        ���� ���� � ���������� ���������� - �������� ���� �� ���, ������� �� ������ ������ ������� � ���������� �� � ������ 1.2
        
        ���� �� ���� ������:        
        ����� ���������� ��������, ������� ����� �� ����� ������.�������� ������:

        select u.TABLE_NAME, u.COLUMN_NAME, c.qual
        from user_tab_columns u, class_tab_columns c
        where u.table_name = (select table_name from class_tables where class_id = 'PLATFORM_TEST')
              and c.qual in('Z','ZZ') and c.class_id = 'PLATFORM_TEST' and c.column_name = u.COLUMN_NAME
              and c.host_type = data_type||
                      case
                      when data_precision is not null and nvl(data_scale,0)>0 then '('||data_precision||','||data_scale||')'
                      when data_precision is not null and nvl(data_scale,0)=0 then '('||data_precision||')'
                      when data_precision is null and data_scale is not null then '(*,'||data_scale||')'
                      when char_length>0 then '('||char_length||')'  end;
        
        �� ������, ������� ������ ������, ��������, ��� ������ ��������� ��������(�)(�� ����, ������� �����������) ������������ �� ������� � ������� ����� ���������� ���.
        ���� ������� ��������� - ��������� ����� �������� �� ���. ������ ��� �� � �� ����� ������ � ���������� � ������ 1.2
    
        1.2 ��� ������� �� ���������� ����������:
          1.2.1 ���� ������-���� �� ����������, ����������� �������� � dubl_error.log, �� �������� � class_tab_columns,
          �� � ����� ��������� � ���� "������������� ������� ������" ���������� � ���������� ������������� �������� ��� ���, �����
          ��� ���� ��� ������ 28 ��������, ��� "C_[�������� ���]" ���� ����������  � ������� column_name ������� class_tab_columns ��� ��������� ������.
          
          1.2.2. ���� �������� � �������� �������� ������ ���� � class_tab_columns, �� ������� column_name ������� class_tab_columns ��� ��������� ���������
          ���������� �������� �� ���, ������������ � "C_[����� ���, ���������� Oracle]", ���, ����� ����� ��� ������� ���� ����������
          � class_tab_columns ��� ��������� ������, � ����� ������� Oracle ����� ������� �� ������������ � ����� ��� ������ ����� ����� <=30 ��������.
    
    2. ������ "��������" � ���� "������������� ������� ������" � ���� �������������� ��� �� ������� "���������".
    ���� ������ � ������������ ���������� �� ��������, �� �������� ������.
    
    3. � ����� ������� �� ������������� ����������� ������, ������� ���� � ������ ������� � ������������� � ���������� �������.
*/

spool dubl_error.log

begin
  dbms_output.put_line('������ ���, � ������� ��������� ����������� ��������� �� ���� ������� ������� ���.');
  dbms_output.put_line('-----------------------------------------------------------------------------------');
  -- ����� �� �������� ��� ������, ��� �������, ������ ����������� ����������
  for c in(select  a.class_id, a.col_name, listagg(a.qual,',') within group(order by a.qual) as attrs
           from(-- �������� ����� ���� � class_attributes, �� ��� ����� �� ���� � class_tab_columns �� ��������:
                  -- ��������� ���������� ������
                  -- �� ��� �������� �������� ��������, � ���� �������� ���, ��� ������� �����������
             
             -- ��� ��� �� ������� length(hq.qual) > 28(��. ������� where), ������� ������ �������� class_mgr.make_column_name ��� �� ����� � ������ ���� >=0
             -- ���� ������ �������� <0, �� ������� ����������� �� ��������� ��������� "�$" (����� �� ���� length(hq.qual)<28, �� ����� �������� ���� ���� ���������, � �� ��� ��������)
             -- ������� ������ ���� ��� �� ����������.
             select hq.qual, nvl(ct.column_name, class_mgr.make_column_name(hq.qual,0)) as col_name, hq.class_id
             from
              class_tab_columns ct,
                 (-- ���� � class_attributes � ������� [SELF_CLASS_ID] ���������� ��� ������(���������� ��� ���������, �� ���� �� ������, ������� ������� � class_attributes)
                  -- �� �� ������ �������� ��� ��� ��������� �� ������, ���������� � ������� [SELF_CLASS_ID]
                  -- c ������� [�������� ��� ��������� � ������� ������].[�������� ��� ��������� �� ������ [SELF_CLASS_ID]],
                  -- ����� ����������� ��� = [�������� ��� ��������� � ������� ������]. ��� �������� ��� ����� � class_tab_columns
                  
                  -- ����� �� �������� �������� ��� ������, ������ ��� ���������.
                  select connect_by_root ca.class_id as class_id, ltrim(SYS_CONNECT_BY_PATH(ca.attr_id, '.'),'.') as qual
                  from class_attributes ca
                  -- �������� ������ �������� ���� ������. 
                  -- �� ���� ������ �� ���������, � ������� [SELF_CLASS_ID] <> "STRUCTURE"
                  where CONNECT_BY_ISLEAF = 1
                  connect by prior ca.self_class_id = ca.class_id)hq
                -- ����� ��������� ����� �������, ��� ��� �������� ����� ���� � class_attributes, �� ��� ����� �� ���� � class_tab_columns.
                -- ��������� ���������, �������� ��� ������� ������ 28 ��������. ���� ����� ��������� 28 �������,
                -- �� ���� ���� ������� ���������� �������������(� �������� ���) � ������� ������� �� ����������� � �����-���� ������.
             where length(hq.qual) <= 28 and ct.class_id(+) = hq.class_id and ct.qual(+) = hq.qual)a
             group by a.col_name, a.class_id
             having count(*) > 1)
  loop
    dbms_output.put_line('���       : ' || c.class_id);
    dbms_output.put_line('�������   : ' || c.col_name);    
    dbms_output.put_line('��������� : ' || c.attrs);
    dbms_output.put_line('-----------------------------------------------------------------------------------');
  end loop;
end;
/

spool off
