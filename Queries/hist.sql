select * from user_tab_histograms c where table_name = 'ARG_OBJECT' and c.COLUMN_NAME ='STATE_ID';

SELECT *
FROM   user_tab_col_statistics 
WHERE  table_name = 'ARG_OBJECT'

SELECT endpoint_value,
       endpoint_number,
       endpoint_number - LAG(endpoint_number, 1, 0) OVER (ORDER BY endpoint_value) AS frequency
FROM   user_tab_histograms
WHERE  table_name  = 'ARG_OBJECT'
AND    column_name = 'STATE_ID'
ORDER BY endpoint_value;

--8257855422, 8257855420

SELECT *
FROM   user_tab_columns
WHERE  table_name = 'ARG_ORDER' and column_name = 'STATE_ID'
ORDER BY column_id;


select * from user_indexes s where s.table_name = 'ARG_ORDER'
