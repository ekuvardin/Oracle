select sp.object_name as index_name,
sp.options,
sum(sa.executions) as executions#,
max(timestamp) as last_used
from v$sql_plan sp, v$sqlarea sa
where sa.address = sp.address
and sa.hash_value =sp.hash_value
and sp.operation = 'INDEX'
and object_owner in ('IBS')
and object_name in('IDX_Z#SC_RESULTS_COL_EV_OBJ', 'IDX_Z#SC_RESULTS_COLL_OBJ')
group by object_name, options
order by 3 desc;


select sp.*
from v$sql_plan sp, v$sqlarea sa
where sa.address = sp.address
and sa.hash_value =sp.hash_value
and sp.operation = 'INDEX'
and object_owner in ('IBS')
and object_name in('IDX_Z#SC_RESULTS_COL_EV_OBJ', 'IDX_Z#SC_RESULTS_COLL_OBJ')
order by 3 desc;



select * from v$segment_statistics where object_name = 'IDX_Z#SC_RESULTS_COLL_OBJ's
