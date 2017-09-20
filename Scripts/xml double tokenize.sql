with t as (select '�����1.�������1.�������2 -> �����2.�������2.�������2 = �����3.�������3.�������3 -> �����4.�������4.�������4 = �����5.�������5.�������5 -> �����6.�������6.�������6' s from dual)
select x.*
from t,
     xmltable('for $i in ora:tokenize(.," = | -> ") let $m:=ora:tokenize($i,"\.") return <r><schema>{$m[1]}</schema><table>{$m[2]}</table><column>{$m[3]}</column></r>' 
     passing t.s 
     columns 
            "S" varchar2(30) path '/r/schema',
            "T" varchar2(30) path '/r/table',
            "C" varchar2(30) path '/r/column')x;
