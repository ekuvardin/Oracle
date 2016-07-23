select XMLCAST(XMLQUERY(dist RETURNING CONTENT) AS NUMBER) from (select '(5+1)*2' dist from dual)
