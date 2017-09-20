select  (id-1)-w,r.* from(
select lag(r.id,1) over(order by id) as w, r.* from z#sc_results r  where collection_id =97165790651 order by id)r
where w<>(id-1)
