create or replace package master_mind is

type r_rec is record(combination number, path varchar2(4000), result number);
type t_result is table of r_rec;

function calculate_res(p_numbers varchar2, p_operation varchar2, p_result number) return t_result PIPELINED;
function calculate_xquery(p_val varchar2) return number;
end master_mind;
/
create or replace package body master_mind is

  function calculate_res(p_numbers varchar2, p_operation varchar2, p_result number) return t_result PIPELINED is
    l_result r_rec;
  begin
    for r in(
      with numbers(a, rn) as(
        select a, rownum as rn from dual,
             xmltable('ora:tokenize(.,";")'
                        passing p_numbers
                  columns a number path '.')),
      operations(oper, rn) as(
        select oper, rownum as rn from dual,
             xmltable('ora:tokenize(.,";")'
                        passing p_operation
                  columns oper varchar2(20) path '.')),
      par(first_before, second_before, second_after, third_before, third_after, fourth_after, combination) as(
        select '((',  '',   ')',  '',   ')',  '',   1 from dual
        union all
        select '',    '(',  '',   '',   ')',  '',   2 from dual
        union all
        select '(',  '(',  '',   '',   '))',  '',   3 from dual
        union all
        select '',    '(',  '',   '(',  '',   '))', 4 from dual
        union all
        select '(',    '',  ')',   '(',  '',   ')', 5 from dual)
        select paths, combination
        from(
          select
            master_mind.calculate_xquery(first_before || t1.a || o1.oper || second_before || t2.a || second_after || o2.oper || third_before || t3.a || third_after || o3.oper || t4.a || fourth_after) as res,
            first_before || t1.a || o1.oper || second_before || t2.a || second_after || o2.oper || third_before || t3.a || third_after || o3.oper || t4.a || fourth_after as paths,
            t1.rn||o1.rn||t2.rn||o2.rn||t3.rn||o3.rn||t4.rn||p.combination as combination
          from
            numbers t1, numbers t2, numbers t3, numbers t4, operations o1, operations o2, operations o3, par p
          where
            t1.rn<>t2.rn and t1.rn<>t3.rn and t1.rn<>t4.rn and t2.rn<>t3.rn and t2.rn<>t4.rn and t3.rn<>t4.rn)
        where
          res = p_result)
    loop
      l_result.combination := r.combination;
      l_result.path := r.paths;
      l_result.result := p_result;

      pipe row(l_result);
    end loop;
  end;

  function calculate_xquery(p_val varchar2) return number is
    l_val number;
  begin
    select XMLCAST(XMLQUERY(p_val RETURNING CONTENT) AS NUMBER) into l_val from dual;
    return l_val;
  exception when others then
    return null;
  end;
end master_mind;
/
