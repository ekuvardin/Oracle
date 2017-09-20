with t as (select 'схема1.таблица1.столбец2 -> схема2.таблица2.столбец2 = схема3.таблица3.столбец3 -> схема4.таблица4.столбец4 = схема5.таблица5.столбец5 -> схема6.таблица6.столбец6' s from dual)
select x.*
from t,
     xmltable('for $i in ora:tokenize(.," = | -> ") let $m:=ora:tokenize($i,"\.") return <r><schema>{$m[1]}</schema><table>{$m[2]}</table><column>{$m[3]}</column></r>' 
     passing t.s 
     columns 
            "S" varchar2(30) path '/r/schema',
            "T" varchar2(30) path '/r/table',
            "C" varchar2(30) path '/r/column')x;
