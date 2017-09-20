declare
p_date1 date;
p_date2 date;
begin
p_date1 := to_date('2013-12-27 01:56:00','yyyy-mm-dd hh24:mi:ss');
p_date2 := to_date('2013-12-27 05:51:00','yyyy-mm-dd hh24:mi:ss');
check_zero(40,p_date1,p_date2, 36132561026);
end;
