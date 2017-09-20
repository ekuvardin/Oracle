select 1 from dual where REGEXP_LIKE ( '-321', '^[[:digit:]]{0,5},*[[:digit:]]{0,2}*$')
