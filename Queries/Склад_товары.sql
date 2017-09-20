with goods(id, goods_name) as (
select 1,'огурцы' from dual
union all
select 1,'помидоры' from dual),
goods_in_shelfs(id, goods_id, k) as(
select 1,1,10 from dual
union all
select 2,1,10 from dual
union all
select 3,2,10 from dual
union all
select 4,2,10 from dual),
zakaz_goods(id, zakaz_id, goods_id, k) as(
select 1,1,1,4 from dual
union all
select 2,1,1,2 from dual
union all
select 3,1,1,7 from dual
union all
select 4,1,2,9 from dual
union all
select 5,1,2,20 from dual)
select  nvl(shelf_id,       min(shelf_id)       over (partition by goods_id order by kk desc)) as shelf_id,
        nvl(zakaz_goods_id, min(zakaz_goods_id) over (partition by goods_id order by kk desc)) as zakaz_goods_id,
        lag(kk, 1, 0) over (partition by goods_id order by kk) as lagk,
        shelf_id, zakaz_goods_id, goods_id, k, kk
        from(
        select id as shelf_id, to_number(null) as zakaz_goods_id, goods_id, k,
            sum(k) over (partition by goods_id order by id) as kk
          from goods_in_shelfs
           union all
        select to_number(null) as shelf_id, id as zakaz_goods_id, goods_id, k,
            sum(k) over (partition by goods_id order by id) as kk
          from zakaz_goods)
