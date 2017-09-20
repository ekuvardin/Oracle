with fl as (select 1 id, 'Field 1' f from dual
            union all 
            select 2 id, 'Field 2' f from dual
            union all 
            select 3 id, 'Field 3' f from dual),
      t as (select 23.5 d, 1 id from dual
            union all
            select 14.5 d, 1 id from dual 
            union all
            select 15.5 d, 1 id from dual 
            union all
            select 17.5 d, 2 id from dual 
            union all
            select 25.5 d, 2 id from dual 
            union all
            select 11.5 d, 3 id from dual)
select r.*, extractValue(r.column_value.extract('//column[position()=1]'),'column'), extractValue(r.column_value.extract('//column[position()=2]'),'column'),
to_char(extractValue(r.column_value.extract('//column[position()=1]'),'/column/@name')), extractValue(r.column_value.extract('//column[position()=2]'),'/column/@name')
 from(
select * from (select d, id from t)
pivot xml (sum(d) for id in (any)))a,
 TABLE(XMLSequence(a.ID_XML.extract('/PivotSet/item')))r
