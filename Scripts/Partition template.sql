CREATE TABLE sales
  ( p       NUMBER(10) not null
   ,v       NUMBER(10) not null
  )
 PARTITION BY RANGE (p)  interval(1) SUBPARTITION BY LIST(V)
  SUBPARTITION TEMPLATE 
 ( 
          SUBPARTITION p1 VALUES (1),
          SUBPARTITION p2 VALUES (2),
          SUBPARTITION p0 VALUES (DEFAULT)
 )
  (
  PARTITION p_before_range VALUES LESS THAN(1)
  );
  
 -- Data is inserted
 insert into sales (p, v) values ( 349524, 3);
 commit;
 -- Data is not inserted
 insert into sales(p,v) values ( 349525, 3);
 
 -- Limit on max partition calculate in this way
 -- floor((1024*1024) / 3 - 1 = 349524 
 
 -- Untill we can change template and add new subpartition we must delete data, that are higher than new limit
 -- floor((1024*1024) / 4 - 1 = 262143
 begin
  for c in(select a.partition_name from user_tab_partitions a where a.table_name = upper('sales') and a.partition_name <> upper('p_before_range'))
    loop
      execute immediate 'alter table sales drop partition('||c.partition_name||')';  
    end loop;
end;
/

-- Then we can change template
 ALTER TABLE sales
 SET SUBPARTITION TEMPLATE 
 ( 
          SUBPARTITION p1 VALUES (1),
          SUBPARTITION p2 VALUES (2),
          SUBPARTITION p3 VALUES (3),
          SUBPARTITION p0 VALUES (DEFAULT)
 );
 
 -- Data is inserted
 insert into sales(p,v) values ( 262143, 3);
 commit;
  -- Data is not inserted
 insert into sales(p,v) values ( 262144, 3);
 
 -- And now I observe strange behavior
 -- If i woudn't delete data in subpartition with p = 262143 then "insert into sales (p, v) values ( 349524, 3)" fails

 ALTER TABLE sales
 SET SUBPARTITION TEMPLATE 
 ( 
          SUBPARTITION p1 VALUES (1),
          SUBPARTITION p2 VALUES (2),
          SUBPARTITION p0 VALUES (DEFAULT)
 );
 
 -- Data is not inserted
 insert into sales (p, v) values ( 349524, 3);
  
   -- Data is inserted 
 insert into sales(p,v) values ( 349523, 3);
 commit;
 
 

