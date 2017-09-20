PL/SQL Developer Test script 3.0
40
-- Created on 05/02/2014 by KUVARDIN 
declare 
  -- Local variables here
  g_username varchar2(1000);
   g_os_domain varchar2(1000); 
   g_test_name varchar2(1000);
    g_id number;
     g_subsys varchar2(1000);
     L_ERR number;
    L_TEMPARRRES  TYPE_REFSTRING_TABLE;
    L_ARRRES TYPE_REFSTRING_TABLE;
begin
  -- Test statements here
L_TEMPARRRES := TYPE_REFSTRING_TABLE();
L_ARRRES := TYPE_REFSTRING_TABLE();
L_TEMPARRRES.Extend();
L_ARRRES.extend();
L_TEMPARRRES(1) := 9097008289;
L_ARRRES(1) := 9088116599;
                  select  COUNT(1)
                  into L_ERR
                  from DUAL a1
                  where  exists (
                    select
                     LISTAGG(e1.C_VALUE,';') within group(order by c1.POSITION) A$1
                    from Z#SC_VALUES e1, Z#SC_RESULTS_NORM d1, CLASS_IND_COLUMNS c1, CLASS_INDEXES b1
                    where d1.COLLECTION_ID = L_ARRRES(1) and d1.C_OBJ_ATTRS = e1.COLLECTION_ID and d1.C_EVENT in ('I','X') and b1.CLASS_ID = d1.C_OBJ_CLASS and c1.QUAL = e1.C_QUAL and c1.INDEX_NAME = b1.NAME and b1.UNIQUENESS = 'UNIQUE'
                    group by c1.INDEX_NAME,e1.COLLECTION_ID
                    intersect
                    select
                     LISTAGG(i1.C_VALUE,';') within group(order by g1.POSITION) A$1
                    from (
                      select  k1.COLUMN_VALUE CL
                      from table(L_TEMPARRRES) k1
                    ) j1, Z#SC_VALUES i1, Z#SC_RESULTS_NORM h1, CLASS_IND_COLUMNS g1, CLASS_INDEXES f1
                    where h1.COLLECTION_ID = j1.CL and h1.C_OBJ_ATTRS = i1.COLLECTION_ID and h1.C_EVENT in ('I','X') and f1.CLASS_ID = h1.C_OBJ_CLASS and g1.QUAL = i1.C_QUAL and g1.INDEX_NAME = f1.NAME and f1.UNIQUENESS = 'UNIQUE'
										group by g1.INDEX_NAME,i1.COLLECTION_ID
									) and ROWNUM = 1;
                  dbms_output.put_line(l_err);
end;
0
0
