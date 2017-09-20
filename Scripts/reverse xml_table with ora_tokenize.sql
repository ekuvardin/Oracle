with t as (
  select 11 INN, 11 OGRN, 'OOO1; OOO2' name from dual union all
    select 11 INN, 21 OGRN, 'OOO1; OOO3' name from dual
   )
   select inn,OGRN,n from t,
       xmltable('ora:tokenize(.,"; ")'
                  passing name
            columns n varchar2(20) path '.')
