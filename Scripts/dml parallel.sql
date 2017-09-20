ALTER SESSION ENABLE PARALLEL DML;
alter session set timed_statistics=true;
alter session set events '10046 trace name context forever, level 12';
alter session set events '10046 trace name context off';
update /*+ PARALLEL */ test2 set s = dbms_random.value;

update test2 set x_cpy=x_cpy + dbms_random.value * 0;


insert /*+ APPEND */ into test2(x,s,x_cpy) (select x + r.w,s,x_cpy from test2,(select count(*) w from test2) r)
