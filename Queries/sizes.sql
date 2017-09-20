select to_number(value) shared_pool_size, 

                         sum_obj_size,

                         sum_sql_size, 

                         sum_user_size, 

(sum_obj_size + sum_sql_size+sum_user_size)* 1.3 min_shared_pool, round(((sum_obj_size + sum_sql_size+sum_user_size)* 1.3)/1024/1024) MB

  from (select sum(sharable_mem) sum_obj_size 

          from v$db_object_cache),

               (select sum(sharable_mem) sum_sql_size

          from v$sqlarea),

               (select sum(250 * users_opening) sum_user_size

          from v$sqlarea), v$parameter

 where name = 'shared_pool_size';
 select
   name,
   SUM(bytes)
from
   V$SGASTAT
where
   pool='LARGE POOL'
group by 
   ROLLUP(name);
   
   select
  '0 (<140)' BUCKET, KSMCHCLS, KSMCHIDX,
  10*trunc(KSMCHSIZ/10) "From",
  count(*) "Count" ,
  max(KSMCHSIZ) "Biggest",
  trunc(avg(KSMCHSIZ)) "AvgSize",
  trunc(sum(KSMCHSIZ)) "Total"
from
  x$ksmsp
where
  KSMCHSIZ<140
and
  KSMCHCLS='free'
group by
  KSMCHCLS, KSMCHIDX, 10*trunc(KSMCHSIZ/10)
UNION ALL
select
  '1 (140-267)' BUCKET,
  KSMCHCLS,
  KSMCHIDX,
  20*trunc(KSMCHSIZ/20) ,
  count(*) ,
  max(KSMCHSIZ) ,
  trunc(avg(KSMCHSIZ)) "AvgSize",
  trunc(sum(KSMCHSIZ)) "Total"
from
  x$ksmsp
where
  KSMCHSIZ between 140 and 267
and
  KSMCHCLS='free'
group by
  KSMCHCLS, KSMCHIDX, 20*trunc(KSMCHSIZ/20)
UNION ALL
select
  '2 (268-523)' BUCKET,
  KSMCHCLS,
  KSMCHIDX,
  50*trunc(KSMCHSIZ/50) ,
  count(*) ,
  max(KSMCHSIZ) ,
  trunc(avg(KSMCHSIZ)) "AvgSize",
  trunc(sum(KSMCHSIZ)) "Total"
from
  x$ksmsp
where
  KSMCHSIZ between 268 and 523
and
  KSMCHCLS='free'
group by
  KSMCHCLS, KSMCHIDX, 50*trunc(KSMCHSIZ/50)
UNION ALL
select
  '3-5 (524-4107)' BUCKET,
  KSMCHCLS,
  KSMCHIDX,
  500*trunc(KSMCHSIZ/500) ,
  count(*) ,
  max(KSMCHSIZ) ,
  trunc(avg(KSMCHSIZ)) "AvgSize",
  trunc(sum(KSMCHSIZ)) "Total"
from
  x$ksmsp
where
  KSMCHSIZ between 524 and 4107
and
  KSMCHCLS='free'
group by
  KSMCHCLS, KSMCHIDX, 500*trunc(KSMCHSIZ/500)
UNION ALL
select
  '6+ (4108+)' BUCKET,
  KSMCHCLS,
  KSMCHIDX,
  1000*trunc(KSMCHSIZ/1000) ,
  count(*) ,
  max(KSMCHSIZ) ,
  trunc(avg(KSMCHSIZ)) "AvgSize",
  trunc(sum(KSMCHSIZ)) "Total"
from
  x$ksmsp
where
  KSMCHSIZ >= 4108
and
  KSMCHCLS='free'
group by
  KSMCHCLS, KSMCHIDX, 1000*trunc(KSMCHSIZ/1000);
