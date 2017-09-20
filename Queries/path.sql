with t(id, name) as(
select 0 id, 'v_vdb_node0002' name from  dual union all
select 0 id, 'v_vdb_node0003' name from  dual union all
select 1 id, 'v_vdb_node0003' name from  dual union all
select 1 id, 'v_vdb_node0004' name from  dual union all
select 2 id, 'v_vdb_node0004' name from  dual union all
select 2 id, 'v_vdb_node0005' name from  dual union all
select 3 id, 'v_vdb_node0001' name from  dual union all
select 3 id, 'v_vdb_node0007' name from  dual union all
select 4 id, 'v_vdb_node0006' name from  dual union all
select 4 id, 'v_vdb_node0007' name from  dual union all
select 5 id, 'v_vdb_node0001' name from  dual union all
select 5 id, 'v_vdb_node0008' name from  dual union all
select 6 id, 'v_vdb_node0002' name from  dual union all
select 6 id, 'v_vdb_node0008' name from  dual union all
select 7 id, 'v_vdb_node0005' name from  dual union all
select 7 id, 'v_vdb_node0009' name from  dual union all
select 8 id, 'v_vdb_node0006' name from  dual union all
select 8 id, 'v_vdb_node0009' name from  dual)

select path from(
select starts || sys_connect_by_path(
CASE
   WHEN nvl(PRIOR ends,starts) = starts then ends
   WHEN nvl(PRIOR ends,starts) = ends then starts
   WHEN nvl(PRIOR starts,ends) = starts then ends
   WHEN nvl(PRIOR starts,ends) = ends then starts end
  ,'->') as path ,CASE
   WHEN nvl(PRIOR ends,starts) = starts then ends
   WHEN nvl(PRIOR ends,starts) = ends then starts
   WHEN nvl(PRIOR starts,ends) = starts then ends
   WHEN nvl(PRIOR starts,ends) = ends then starts end as r,starts from(
  select t1.id, t1.name as starts, t2.name as ends from t t1, t t2
  where t1.id = t2.id and t1.name < t2.name)
  where connect_by_isleaf = 1
  connect by nocycle prior ends = starts or prior starts = ends OR prior ends = ends or prior starts = starts
       )  
  where r=starts;


with t as (
select 0 id, 'v_vdb_node0002' name from  dual union all
select 0 id, 'v_vdb_node0003' name from  dual union all
select 1 id, 'v_vdb_node0003' name from  dual union all
select 1 id, 'v_vdb_node0004' name from  dual union all
select 2 id, 'v_vdb_node0004' name from  dual union all
select 2 id, 'v_vdb_node0005' name from  dual union all
select 3 id, 'v_vdb_node0001' name from  dual union all
select 3 id, 'v_vdb_node0007' name from  dual union all
select 4 id, 'v_vdb_node0006' name from  dual union all
select 4 id, 'v_vdb_node0007' name from  dual union all
select 5 id, 'v_vdb_node0001' name from  dual union all
select 5 id, 'v_vdb_node0008' name from  dual union all
select 6 id, 'v_vdb_node0002' name from  dual union all
select 6 id, 'v_vdb_node0008' name from  dual union all
select 7 id, 'v_vdb_node0005' name from  dual union all
select 7 id, 'v_vdb_node0009' name from  dual union all
select 8 id, 'v_vdb_node0006' name from  dual union all
select 8 id, 'v_vdb_node0009' name from  dual
)
    select sys_connect_by_path( case when name <> nvl(prior name,'0') then name end, '>') as path
      from t
     where connect_by_isleaf = 1
start with name  = 'v_vdb_node0001' and id = 3
connect by nocycle
         ( id   = prior id and level > 2 )
        or name = prior name
;
