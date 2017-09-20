with t (s, n) as (
   select '1 2 10 1', 47 from dual
),
res (s, n, r) as(
select /*+ NO_XML_QUERY_REWRITE  */  distinct s,n,r from t,
       xmltable('ora:tokenize(.," ")'
                  passing s
            columns r number path '.')
            where n>=r),
sums(s,n,r,ost) as(
select s, n, max(r)||'', n-max(r) from res
group by N,S
union all
select s, n, s.r || '+' ||(select max(r.r) from res r where r.n = s.n and s.ost>=r.r ) ,s.ost-(select max(r.r) from res r where r.n = s.n and s.ost>=r.r ) from sums s
where s.ost <> 0)

select * from sums
where ost=0;


