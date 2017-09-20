declare
l_part sys.ODCIVarchar2List;
l_table_name varchar2(4000) := 'IBS_DIARY6';
begin

select partition_name
bulk collect into l_part
from all_TAB_PARTITIONS u
where u.table_name = l_table_name and regexp_like(u.partition_name,'P([1|(2,3)]){2}(_)(\d){2}');

for i in 1..l_part.count
  loop
    execute immediate 'ALTER TABLE AUD.' || l_table_name ||' TRUNCATE PARTITION '|| l_part(i);
    dbms_output.put_line('PARTITION ' || l_part(i) || ' HAS BEEN TRUNCATED');
  end loop;
end;
