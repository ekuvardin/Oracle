WITH h AS (SELECT 0 AS rn, to_number(NULL) AS prn, 'root' AS point_name   FROM dual
UNION SELECT 1 AS rn, 0 AS prn, 'a' AS point_name  FROM dual
UNION SELECT 2 AS rn, 1 AS prn, 'b' AS point_name  FROM dual
UNION SELECT 3 AS rn, 1 AS prn, 'c' AS point_name  FROM dual
UNION SELECT 4 AS rn, 2 AS prn, 'd' AS point_name  FROM dual
UNION SELECT 5 AS rn, 3 AS prn, 'e' AS point_name  FROM dual
UNION SELECT 6 AS rn, 2 AS prn, 'f' AS point_name  FROM dual
UNION SELECT 7 AS rn, 3 AS prn, 'g' AS point_name  FROM dual
UNION SELECT 8 AS rn, 6 AS prn, 'h' AS point_name  FROM dual
UNION SELECT 9 AS rn, 5 AS prn, 'i' AS point_name  FROM dual
UNION SELECT 10 AS rn, 7 AS prn, 'j' AS point_name  FROM dual
UNION SELECT 11 AS rn, 10 AS prn, 'start' AS point_name, 'n' AS is_matching  FROM dual),

r(rn, prn, point_name, is_matching, lvl, pat) as( 
  select rn, prn, point_name, is_matching, 0, to_clob('start') from h
    where point_name = 'start'
  union all
  select h.rn, h.prn, h.point_name, h.is_matching, r.lvl+1, r.pat || TO_CLOB('->'||h.rn) from r, h
    where (r.prn = h.rn or h.prn = r.rn))
CYCLE rn SET is_cycle TO 'Y' DEFAULT 'N'

select *
from r where is_cycle = 'N' and is_matching = 'y'
