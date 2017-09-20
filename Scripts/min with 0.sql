with T as (
select 100 as bal, to_date('01.03.2014','DD.MM.YYYY') dt, 123 id
from dual union all
select 300 as bal, to_date('02.03.2014','DD.MM.YYYY') dt, 123 id
from dual union all
select -200 as bal, to_date('03.03.2014','DD.MM.YYYY') dt, 123 id
from dual union all
select -300 as bal, to_date('04.03.2014','DD.MM.YYYY') dt, 123 id
from dual union all
select 100 as bal, to_date('05.03.2014','DD.MM.YYYY') dt, 123 id
from dual union all
select -600 as bal, to_date('06.03.2014','DD.MM.YYYY') dt, 123 id
from dual union all
select 100 as bal, to_date('07.03.2014','DD.MM.YYYY') dt, 123 id
from dual union all
select 300 as bal, to_date('08.03.2014','DD.MM.YYYY') dt, 123 id
from dual union all
select -200 as bal, to_date('09.03.2014','DD.MM.YYYY') dt, 123 id
from dual union all
select -300 as bal, to_date('10.03.2014','DD.MM.YYYY') dt, 123 id
from dual 
)

select ttt.* , s-case when m<0 then m else 0 end as you_sum
from
(select TT.*
 , min(s)over(order by dt rows unbounded preceding)m
 from
  (select T.*
   , sum(bal)over(order by dt rows unbounded preceding)s 
   from T)TT
)TTT   
