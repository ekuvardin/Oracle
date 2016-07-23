-- Using backreference for search pattern
with t(str) as (
	select 'TEST 123 123 456' from dual union all -- must be 'TEST 123 456'
	select'TEST 123 456 123 456 456' from dual union all -- must be 'TEST 123 456 123 456'
	select'TEST 123/123/123/456' from dual union all -- must be 'TEST 123 456'
	select'TEST 123-123-456' from dual) -- must be 'TEST 123 456'
select str, 
regexp_replace(str,'(\d+)(\D(\1))+\D?','\1 ') from t