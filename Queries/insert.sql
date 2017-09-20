set feedback off
set define off

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312665795', 1, 1, 'delete from Z#R2_FACT_OPER a1
	where a1.C_PRODUCT = P_PROD and a1.C_PN = plp$1$1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312665795', 3, 1, 'delete from Z#R2_ACC a1
	where a1.C_PRODUCT = P_PROD and a1.C_PN = plp$3$1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312665795', 4, 1, 'delete from Z#R2_PLAN_OPER a1
	where a1.C_PRODUCT = P_PROD and a1.C_PN = plp$4$1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312665795', 6, 1, 'delete from Z#R2_PROPERTIES a1
	where a1.C_PRODUCT = P_PROD and a1.C_PN = plp$6$1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312665795', 7, 1, 'delete from Z#R2_GRACE_HISTORY a1
	where a1.C_PRODUCT = P_PROD and a1.C_PN = plp$7$1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312672970', 2, 1, 'select  a1.ID CURRENCY, a1.C_CUR_SHORT CUR_NAME
from Z#FT_MONEY a1
where  exists (
	select  ''1'' A$1
	from Z#R2_ACC c1, Z#R2_DEPOSIT b1
	where b1.C_PN = c1.C_PN and b1.ID in (c1.C_PRODUCT,(-1)*c1.C_PRODUCT) and c1.C_TYPE_ACC = 3312657129 and ((plp$2$1 = ''1'') or  exists (
		select  ''1'' A$1
		from Z#AD_RECORDS d1
		where d1.C_ACC_NUM = c1.C_NUM_ACC and d1.C_PRODUCT = c1.C_PRODUCT and d1.C_REP_DATE <= P_DATE
	)) and (P_CURRENCY is NULL or P_CURRENCY = b1.C_CURRENCY) and (P_DEPART is NULL or (((plp$2$2 = ''1'') and b1.C_DEPART in (
		select  e1.ID A$1
		from Z#DEPART e1
		connect by prior e1.ID = e1.C_HIGH
		start with e1.ID = P_DEPART
	)) or ((plp$2$2 = ''0'') and b1.C_DEPART = P_DEPART))) and b1.C_CURRENCY = a1.ID
)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312672970', 4, 1, 'select  a1.ID ID, a1.PERIOD PERIOD, a1.NAME NAME, a1.PRODUCT PRODUCT, a1.NUM_ACC NUM_ACC, SUM(a1.SUMMA_DT*DECODE(a1.DT,''1'',1,(-1))*DECODE(a1.VID_SVOD,''П'',(-1),1)) SUM_NT
from (
	select  b1.ID ID, CALC_PERIOD(b1.ID) PERIOD, b2.C_NAME NAME, c1.C_PRODUCT PRODUCT, c1.C_NUM_ACC NUM_ACC, d1.C_SUMMA_DT SUMMA_DT, ''1'' DT, d3.C_CODE VID_SVOD
	from Z#TYPE_ACC d3, Z#AC_FIN d2, Z#AD_RECORDS d1, Z#R2_ACC c1, Z#R2_VID_DEPOSIT b2, Z#R2_DEPOSIT b1
	where b1.C_VID_DEPOSIT=b2.id(+) and d1.C_ACC_SVOD=d2.id(+) and d2.C_VID=d3.id(+)
	  and (b1.C_PN = c1.C_PN and c1.C_NUM_ACC = d1.C_ACC_NUM(+) and c1.C_PRODUCT = d1.C_PRODUCT(+) and d1.C_REP_DATE(+) <= P_DATE and b1.ID = c1.C_PRODUCT and c1.C_TYPE_ACC = 3312657129 and ((plp$4$1 = ''1'') or  exists (
		select  ''1'' A$1
		from Z#AD_RECORDS e1
		where d1.C_ACC_NUM = c1.C_NUM_ACC and d1.C_PRODUCT = c1.C_PRODUCT and d1.C_REP_DATE <= P_DATE
	)) and (b1.C_CURRENCY = V_TBL_CURR(J).CURRENCY) and (P_DEPART is NULL or (((plp$4$2 = ''1'') and b1.C_DEPART in (
		select  f1.ID A$1
		from Z#DEPART f1
		connect by prior f1.ID = f1.C_HIGH
		start with f1.ID = P_DEPART
	)) or ((plp$4$2 = ''0'') and b1.C_DEPART = P_DEPART))))
	union all
	select  g1.ID ID, CALC_PERIOD(g1.ID) PERIOD, g2.C_NAME NAME, h1.C_PRODUCT PRODUCT, h1.C_NUM_ACC NUM_ACC, i1.C_SUMMA_DT SUMMA_DT, ''0'' DT, i3.C_CODE VID_SVOD
	from Z#TYPE_ACC i3, Z#AC_FIN i2, Z#AD_RECORDS i1, Z#R2_ACC h1, Z#R2_VID_DEPOSIT g2, Z#R2_DEPOSIT g1
	where g1.C_VID_DEPOSIT=g2.id(+) and i1.C_ACC_SVOD_CORR=i2.id(+) and i2.C_VID=i3.id(+)
	  and (g1.C_PN = h1.C_PN and h1.C_NUM_ACC = i1.C_ACC_CORR(+) and h1.C_PRODUCT = i1.C_PRODUCT_CORR(+) and i1.C_REP_DATE(+) <= P_DATE and g1.ID = h1.C_PRODUCT and h1.C_TYPE_ACC = 3312657129 and ((plp$5$3 = ''1'') or  exists (
		select  ''1'' A$1
		from Z#AD_RECORDS j1
		where i1.C_ACC_CORR = h1.C_NUM_ACC and i1.C_PRODUCT_CORR = h1.C_PRODUCT and i1.C_REP_DATE <= P_DATE
	)) and (g1.C_CURRENCY = V_TBL_CURR(J).CURRENCY) and (P_DEPART is NULL or (((plp$5$4 = ''1'') and g1.C_DEPART in (
		select  k1.ID A$1
');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312666454', 1, 1, 'delete from Z#R2_PLAN_OPER a1
	where a1.C_PN = plp$1$1 and a1.C_PRODUCT = plp$1$2 and a1.C_PARAM = plp$THIS');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312660742', 1, 1, 'delete from Z#R2_AGENDA_JOUR a1
	where a1.C_AGENDA_CLASS = ''R2_AGENDA_GROUPS'' and a1.C_AGENDA_OPER in (
		select  b1.ID A$1
		from Z#R2_AGENDA_GROUPS b1
		where b1.C_PARENT_BP = plp$THIS
	)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312660742', 2, 1, 'delete from Z#R2_AGENDA_JOUR a1
	where a1.C_AGENDA_CLASS = ''R2_AGENDA_OPERS'' and a1.C_AGENDA_OPER in (
		select  b1.ID A$1
		from Z#R2_AGENDA_GROUPS c1, Z#R2_AGENDA_OPERS b1
		where b1.C_PARENT_GR = c1.ID and c1.C_PARENT_BP = plp$THIS
	)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312672970', 7, 1, 'select  a1.PERIOD PERIOD, a1.NAME NAME, DECODE(plp$7$3,''1'',a1.DEPART,null) DEPART, SUM(a1.SUMMA_DT*DECODE(a1.DT,''1'',1,(-1))*DECODE(a1.VID_SVOD,''П'',(-1),1)) SUM_NT
from (
	select  CALC_PERIOD(b1.ID) PERIOD, b2.C_NAME NAME, e1.C_CODE DEPART, d1.C_SUMMA_DT SUMMA_DT, ''1'' DT, d3.C_CODE VID_SVOD
	from Z#DEPART e1, Z#TYPE_ACC d3, Z#AC_FIN d2, Z#AD_RECORDS d1, Z#R2_ACC c1, Z#R2_VID_DEPOSIT b2, Z#R2_DEPOSIT b1
	where b1.C_VID_DEPOSIT=b2.id(+) and d1.C_ACC_SVOD=d2.id(+) and d2.C_VID=d3.id(+)
	  and (b1.C_PN = c1.C_PN and e1.ID = b1.C_DEPART and d1.C_ACC_NUM = c1.C_NUM_ACC and d1.C_PRODUCT = c1.C_PRODUCT and d1.C_REP_DATE <= P_DATE and b1.ID = c1.C_PRODUCT and c1.C_TYPE_ACC = 3312657129 and (b1.C_CURRENCY = V_TBL_CURR(J).CURRENCY) and (P_DEPART is NULL or (((plp$7$1 = ''1'') and b1.C_DEPART in (
		select  f1.ID A$1
		from Z#DEPART f1
		connect by prior f1.ID = f1.C_HIGH
		start with f1.ID = P_DEPART
	)) or ((plp$7$1 = ''0'') and b1.C_DEPART = P_DEPART))))
	union all
	select  CALC_PERIOD(g1.ID) PERIOD, g2.C_NAME NAME, j1.C_CODE DEPART, i1.C_SUMMA_DT SUMMA_DT, ''0'' DT, i3.C_CODE VID_SVOD
	from Z#DEPART j1, Z#TYPE_ACC i3, Z#AC_FIN i2, Z#AD_RECORDS i1, Z#R2_ACC h1, Z#R2_VID_DEPOSIT g2, Z#R2_DEPOSIT g1
	where g1.C_VID_DEPOSIT=g2.id(+) and i1.C_ACC_SVOD_CORR=i2.id(+) and i2.C_VID=i3.id(+)
	  and (g1.C_PN = h1.C_PN and j1.ID = g1.C_DEPART and i1.C_ACC_CORR = h1.C_NUM_ACC and i1.C_PRODUCT_CORR = h1.C_PRODUCT and i1.C_REP_DATE <= P_DATE and g1.ID = h1.C_PRODUCT and h1.C_TYPE_ACC = 3312657129 and (g1.C_CURRENCY = V_TBL_CURR(J).CURRENCY) and (P_DEPART is NULL or (((plp$8$2 = ''1'') and g1.C_DEPART in (
		select  k1.ID A$1
		from Z#DEPART k1
		connect by prior k1.ID = k1.C_HIGH
		start with k1.ID = P_DEPART
	)) or ((plp$8$2 = ''0'') and g1.C_DEPART = P_DEPART))))
) a1
group by a1.PERIOD,a1.NAME,DECODE(plp$7$3,''1'',a1.DEPART,null)
order by TO_NUMBER(SUBSTR(a1.PERIOD,1,2)),a1.NAME');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667661', 1, 1, 'select  ''1'', ''R2_RES_DELTA'', a1.C_PN, a1.C_PROD_CLASS, a1.C_ID_PROD, a1.C_ID_RES_VID, a1.C_ID_PORT, a1.C_DATE_PROV, a1.C_BASE_DELTA, a1.C_FINTOOL, a1.C_ST
from Z#R2_RES_DELTA a1
where ROWNUM <= 200');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312661647', 7, 1, 'select  a1.rowid
from Z#R2_DEPOSIT_PRC a1
where a1.C_PRODUCT = THIS and a1.C_PN = plp$7$1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312661647', 8, 1, 'select  a1.rowid
from Z#R2_DEPOSIT_SUM a1
where a1.C_PRODUCT = THIS and a1.C_PN = plp$8$1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312661647', 9, 1, 'select  a1.rowid
from Z#R2_DEPOSIT_PRC a1
where a1.ROWID = THIS and a1.C_PN = plp$9$1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312665791', 8, 1, 'delete from Z#R2_PLAN_OPER a1
	where a1.ROWID = TPLAN_DEL(IPLAN) and a1.C_PN = plp$8$1 and a1.C_PRODUCT = RCRED');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312672971', 3, 1, 'select  distinct a1.C_AC_FIN ACC_FIN, a1.C_TYPE_ACC TYPE_ACC, a2.C_FINTOOL ACC_CUR, a3.C_NUM ACC_BS2, a2.C_MAIN_V_ID ACC_NUM
from Z#DEPART a4, Z#PL_USV a3, Z#AC_FIN a2, Z#R2_ACC a1
where a1.C_AC_FIN=a2.id and a2.C_MAIN_USV=a3.id(+) and a2.C_DEPART=a4.id(+)
  and (a1.C_CLASS_NAME = ''R2_DEPOSIT'' and a1.C_DATE_BEG <= P_DATE_BEG and (a1.C_DATE_END is NULL or a1.C_DATE_END >= P_DATE_BEG) and ((P_BS2 is not NULL and a3.C_NUM in (
	select  b1.C_NUM NUM
	from Z#PL_US b1
	where b1.C_NUM = plp$3$3
)) or (P_R2_TYPE_ACC is not NULL and a1.C_TYPE_ACC = P_R2_TYPE_ACC)) and a2.C_FINTOOL = NVL(P_CUR,a2.C_FINTOOL) and (((plp$3$1 = ''1'') and a4.C_CODE like NVL(plp$3$2||''%'',a4.C_CODE||''%'')) or ((plp$3$1 = ''0'') and a2.C_DEPART = NVL(P_DEPART,a2.C_DEPART))))
order by a2.C_FINTOOL,a3.C_NUM,a2.C_MAIN_V_ID');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312672971', 4, 1, 'select  a1.C_NUM_ACC ACC
from Z#R2_ACC a1
where a1.C_AC_FIN = A.ACC_FIN and a1.C_CLASS_NAME = ''R2_DEPOSIT'' and a1.C_DATE_BEG <= P_DATE_BEG');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312661688', 1, 1, 'delete from Z#R2_DEBTS_FOR_FO a1
	where a1.C_PRODUCT = plp$THIS and a1.C_PN = plp$1$1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312661688', 2, 1, 'delete from Z#R2_FACT_OPER a1
	where a1.C_PRODUCT = plp$THIS and a1.C_PN = plp$2$1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312661688', 4, 1, 'delete from Z#R2_ACC a1
	where a1.C_PRODUCT = plp$THIS and a1.C_PN = plp$4$1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312661688', 5, 1, 'delete from Z#R2_DEPOSIT_PRC a1
	where a1.C_PRODUCT = plp$THIS and a1.C_PN = plp$5$1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312661688', 7, 1, 'delete from Z#R2_DEPOSIT_PROL a1
	where a1.C_PRODUCT = plp$THIS and a1.C_PN = plp$7$1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312661688', 8, 1, 'delete from Z#R2_DEPOSIT_SUM a1
	where a1.C_PRODUCT = plp$THIS and a1.C_PN = plp$8$1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3313461199', 1, 1, 'select  a1.C_PRODUCT, a1.C_PN, a1.C_TYPE_ACC, a1.C_NUM_ACC, a1.C_AC_FIN, a1.C_DATE_BEG, a1.C_DATE_END
from Z#R2_ACC a1
where a1.C_NUM_ACC = P_ACCOUNT and a1.C_PRODUCT is not NULL and NVL(a1.C_DATE_END,P_DATE+1) > P_DATE and a1.C_DATE_BEG <= P_DATE
order by a1.C_PRODUCT,a1.C_DATE_BEG');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3313461199', 2, 1, 'select  NVL(SUM(a1.C_SUMMA_OPER),0), NVL(SUM(a1.C_SUMMA_NT),0)
from Z#R2_VID_DEBT b2, Z#R2_DEBT_PART b1, Z#R2_FACT_OPER a1
where b1.C_VID_DEBT=b2.id
  and (a1.C_VID_OPER = b1.C_VID_OPER and b2.C_TYPE_ACC = ACCINFO(IDX).TYPE_ACC and a1.C_PRODUCT in (ACCINFO(IDX).PRODUCT,(-1)*ACCINFO(IDX).PRODUCT) and a1.C_PN = ACCINFO(IDX).PN and NVL(b1.C_DT,''0'') = ''1'' and a1.C_STATE_OPER is NULL and a1.C_DATE_OPER <= NVL(ACCINFO(IDX).DATE_TO,P_DATE) and a1.C_DATE_OPER < P_DATE and a1.C_SN is not NULL)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3313461199', 3, 1, 'select  NVL(SUM(a1.C_SUMMA_OPER),0), NVL(SUM(a1.C_SUMMA_NT),0)
from Z#R2_VID_DEBT b2, Z#R2_DEBT_PART b1, Z#R2_FACT_OPER a1
where b1.C_VID_DEBT=b2.id
  and (a1.C_VID_OPER = b1.C_VID_OPER and b2.C_TYPE_ACC = ACCINFO(IDX).TYPE_ACC and a1.C_PRODUCT in (ACCINFO(IDX).PRODUCT,(-1)*ACCINFO(IDX).PRODUCT) and a1.C_PN = ACCINFO(IDX).PN and NVL(b1.C_DT,''0'') = ''0'' and a1.C_STATE_OPER is NULL and a1.C_DATE_OPER <= NVL(ACCINFO(IDX).DATE_TO,P_DATE) and a1.C_DATE_OPER < P_DATE and a1.C_SN is not NULL)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3313461199', 4, 1, 'select  a1.C_PRODUCT, a1.C_PN, a1.C_TYPE_ACC, a1.C_NUM_ACC, a1.C_AC_FIN, NVL(a1.C_DATE_BEG,P_DATE_FROM), NVL(a1.C_DATE_END,P_DATE_TO)
from Z#R2_ACC a1
where a1.C_NUM_ACC = P_ACCOUNT and a1.C_PRODUCT is not NULL and NVL(a1.C_DATE_END,P_DATE_FROM) >= P_DATE_FROM and NVL(a1.C_DATE_BEG,P_DATE_TO) <= P_DATE_TO
order by a1.C_PRODUCT,a1.C_DATE_BEG');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3313461199', 5, 1, 'select  NVL(SUM(a1.C_SUMMA_OPER),0), NVL(SUM(a1.C_SUMMA_NT),0)
from Z#R2_PATTERN a2, Z#R2_FACT_OPER a1
where a1.C_PATTERN=a2.id
  and (a1.C_PRODUCT = ACCINFO(IDX).PRODUCT and a1.C_PN = ACCINFO(IDX).PN and a2.C_ACC_OPER = ACCINFO(IDX).TYPE_ACC and NVL(a2.C_DT,''1'') = ''1'' and a1.C_STATE_OPER is NULL and a1.C_DATE_OPER >= ACCINFO(IDX).DATE_FROM and a1.C_DATE_OPER <= ACCINFO(IDX).DATE_TO)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3313461199', 6, 1, 'select  NVL(SUM(a1.C_SUMMA_OPER),0), NVL(SUM(a1.C_SUMMA_NT),0)
from Z#R2_PATTERN a2, Z#R2_FACT_OPER a1
where a1.C_PATTERN=a2.id
  and (a1.C_PRODUCT = ACCINFO(IDX).PRODUCT and a1.C_PN = ACCINFO(IDX).PN and (a2.C_DT = ''0'' and a2.C_ACC_OPER = ACCINFO(IDX).TYPE_ACC or a2.C_DT is NULL and a2.C_ACC_OPER_CORR = ACCINFO(IDX).TYPE_ACC) and a1.C_STATE_OPER is NULL and a1.C_DATE_OPER >= ACCINFO(IDX).DATE_FROM and a1.C_DATE_OPER <= ACCINFO(IDX).DATE_TO)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315054239', 1, 1, 'select  a1.rowid
from Z#R2_FACT_OPER a1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315054239', 2, 1, 'select  a1.rowid
from Z#R2_FACT_OPER a1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315054239', 3, 1, 'select /*+ FIRST_ROWS */  a1.id
from Z#R2_FACT_OPER a1
where a1.ROWID>plp$FOR
order by a1.id');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315054239', 4, 1, 'select  a1.rowid
from Z#R2_FACT_OPER a1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315054239', 5, 1, 'select  a1.rowid
from Z#R2_FACT_OPER a1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315054239', 6, 1, 'select  a1.rowid
from Z#R2_FACT_OPER a1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315054239', 8, 1, 'select  a1.ID C_ID
from (
	select  b1.ROWID ID
	from Z#R2_FACT_OPER b1
) a1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315054239', 9, 1, 'select  a1.ROWID C_ID
from Z#R2_FACT_OPER a1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315054239', 10, 1, 'select  a1.ROWID C_REF
from Z#R2_FACT_OPER a1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315054239', 11, 1, 'select  a1.ROWID C_REF
from Z#R2_FACT_OPER a1
where a1.ROWID = ''1''');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315039646', 1, 1, 'select  a1.C_TYPE_ACC TYPE_ACC, a1.C_DATE_BEG DATE_BEG, a1.C_DATE_END DATE_END
from Z#R2_ACC a1
where a1.C_PN = P_R2_PN and a1.C_CLASS_NAME = P_R2_CLASS_NAME and a1.C_PRODUCT = plp$P_R2_PRODUCT and a1.C_NUM_ACC = P_R2_NUM_ACC
order by a1.C_DATE_BEG desc');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315054339', 1, 1, 'insert into Z#TYPE_ROWID1 a1 ( SN,SU, COLLECTION_ID, C_NUM, C_STR )
	values (1,rtl.uid$,NULL,P_NUM, P_STR)
	returning a1.ROWID, a1.ROWID
	into V_REF, V_ROWID');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315054339', 2, 1, 'insert into Z#TYPE_ROWID2 a1 ( SN,SU, C_NUM, C_ARR_TYPE_ROWID1 )
	values (1,rtl.uid$,P_NUM, SEQ_ID.nextval)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315054339', 3, 1, 'delete from Z#TYPE_ROWID1 a1
	where a1.COLLECTION_ID is NULL');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315054339', 4, 1, 'delete from Z#TYPE_ROWID2 a1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315054339', 5, 1, 'select  a1.rowid
from Z#TYPE_ROWID1 a1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315054339', 6, 1, 'select  a1.rowid
from Z#TYPE_ROWID1 a1
where a1.C_NUM = P_NUM');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315054339', 7, 1, 'select  a1.rowid
from Z#TYPE_ROWID1 a1
where P_NUM is NULL or a1.C_NUM = P_NUM');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315054339', 8, 1, 'select  a1.rowid
from Z#TYPE_ROWID2 a1
where a1.C_NUM = P_NUM');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315054339', 9, 1, 'select  a1.rowid
from Z#TYPE_ROWID2 a1
where a1.C_NUM = P_NUM');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315054339', 10, 1, 'select  a1.rowid
from Z#TYPE_ROWID2 a1
where a1.C_NUM = P_NUM');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315054339', 11, 1, 'select  a1.rowid
from Z#TYPE_ROWID2 a1
where a1.C_NUM = P_NUM');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312673061', 1, 1, 'select  a1.ROWID
from Z#R2_ACC a1
where plp$1$1 = a1.C_PN and THIS = a1.C_PRODUCT and a1.C_TYPE_ACC = 3312657168 and ROWNUM = 1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312673061', 3, 1, 'select  a1.ROWID
from Z#R2_ACC a1
where plp$3$1 = a1.C_PN and THIS = (-a1.C_PRODUCT) and a1.C_TYPE_ACC = 3312657129 and ROWNUM = 1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667950', 3, 1, 'select  a1.ID MI
from Z#R2_RES_ACC_TYPES a2, Z#R2_ACC_TYPE_REF a1
where a1.COLLECTION_ID=plp$3$1 and a1.C_ACC_TYPE_REF=a2.id
  and (a2.C_SOURCE_CLASS_REF = P_ACC_TYPE_CODE)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667950', 4, 1, 'select  a1.C_ID_RES_VID, a1.C_FINTOOL, null
from Z#R2_RES_BASE a1
where a1.C_PROD_CLASS = P_PROD.A#PROD_CLASS and a1.C_ID_PROD = P_PROD.A#ID_PROD and a1.C_PN = P_PROD.A#PN');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667950', 5, 1, 'select  a1.C_ID_RES_VID, a1.C_FINTOOL, a1.C_ID_PORT
from Z#R2_RES_BASE_INCL a1
where a1.C_PROD_CLASS = P_PROD.A#PROD_CLASS and a1.C_ID_PROD = P_PROD.A#ID_PROD and a1.C_PN = P_PROD.A#PN');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667950', 6, 1, 'select  a1.C_ID_RES_VID, a1.C_FINTOOL, NVL(SUM(a1.C_BASE_DELTA),0)
from Z#R2_RES_DELTA a1
where a1.C_PROD_CLASS = P_PROD.A#PROD_CLASS and a1.C_ID_PROD = P_PROD.A#ID_PROD and a1.C_PN = P_PROD.A#PN
group by a1.C_ID_RES_VID,a1.C_FINTOOL');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667950', 7, 1, 'select  a1.C_ACC_TYPE_REF
from Z#R2_ACC_TYPE_REF a1
where a1.COLLECTION_ID=plp$7$1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667950', 8, 1, 'select  a1.C_ID_RES_VID, a1.C_FINTOOL
from Z#R2_RES_BASE a1
where a1.C_ID_PROD = P_SEC_CHG_TBL(I).ID_PRODUCT and a1.C_PROD_CLASS = P_SEC_CHG_TBL(I).PROD_CLASS and (a1.C_PN = P_SEC_CHG_TBL(I).PN or P_SEC_CHG_TBL(I).PN is NULL)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667950', 9, 1, 'update Z#R2_RES_PROD a1 set
	a1.SN=nvl(a1.SN,1)+1, a1.SU=rtl.uid$, a1.C_IGN_CH_PORT = ''1''
	where a1.C_ID_PROD = P_PROD.A#ID_PROD and a1.C_PROD_CLASS = P_PROD.A#PROD_CLASS and a1.C_PN = P_PROD.A#PN');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667950', 10, 1, 'select  a1.C_ID_PORT, a1.C_FINTOOL, a1.C_BASE_AMT, a1.C_ID_RES_VID, a2.C_UPPER_RES_VID, a2.C_IS_MFO
from Z#R2_RES_VID a2, Z#R2_RES_BASE_INCL a1
where a1.C_ID_RES_VID=a2.id(+)
  and (a1.C_ID_PROD = P_PROD.A#ID_PROD)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667950', 11, 1, 'select  a1.C_ACC_TYPE_REF
from Z#R2_ACC_TYPE_REF a1
where a1.COLLECTION_ID=plp$11$1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667950', 12, 1, 'select  a2.C_NAME
from Z#R2_RES_PORT a2, Z#R2_RES_PROD a1
where a1.C_ID_PORT=a2.id(+)
  and (a1.C_PN = P_PN and a1.C_PROD_CLASS = P_PROD_CLASS and a1.C_ID_PROD = P_ID_PRODUCT)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667950', 13, 1, 'select  null, ''R2_RES_BASE_INCL'', a1.C_PN, a1.C_ID_RES_VID, a1.C_PROD_CLASS, a1.C_ID_PROD, a1.C_FINTOOL, a1.C_ON_DATE, a1.C_BASE_AMT, a1.C_DATE_ACTUAL, a1.C_ID_PORT
from Z#R2_RES_BASE_INCL a1
where a1.C_PN = AGR_PROD.PROD.A#PN and a1.C_PROD_CLASS = AGR_PROD.PROD.A#PROD_CLASS and a1.C_ID_PROD = AGR_PROD.PROD.A#ID_PROD and a1.C_ID_RES_VID = AGR_PROD.RES_VID');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667950', 14, 1, 'select  null, ''R2_RES_BASE'', a1.C_PN, a1.C_PROD_CLASS, a1.C_ID_PROD, a1.C_ID_RES_VID, a1.C_FINTOOL, a1.C_ON_DATE, a1.C_ACC_RES, a1.C_ACC_DT, a1.C_ACC_CT, a1.C_BASE_AMT, a1.C_RES_AMT, a1.C_DATE_ACTUAL
from Z#R2_RES_BASE a1
where a1.C_PN = AGR_PROD.PROD.A#PN and a1.C_PROD_CLASS = AGR_PROD.PROD.A#PROD_CLASS and a1.C_ID_PROD = AGR_PROD.PROD.A#ID_PROD and a1.C_ID_RES_VID = AGR_PROD.RES_VID');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667950', 15, 1, 'select  NVL(SUM(a1.C_BASE_DELTA),0), MAX(a1.C_FINTOOL)
from Z#R2_RES_DELTA a1
where a1.C_PN = AGR_PROD.PROD.A#PN and a1.C_PROD_CLASS = AGR_PROD.PROD.A#PROD_CLASS and a1.C_ID_PROD = AGR_PROD.PROD.A#ID_PROD and a1.C_ID_RES_VID = AGR_PROD.RES_VID and a1.C_DATE_PROV <= AGR_PROD.ON_DATE and a1.C_DATE_PROV >= D_DATE_ACTUAL');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3313463151', 1, 1, 'update Z#R2_AGENDA_OBJECT a1 set
	a1.SN=nvl(a1.SN,1)+1, a1.SU=rtl.uid$, a1.C_OBJ_DAY = P_DATE, a1.C_OBJ_DATE_EXEC = P_DATE-1
	where (a1.C_FILIAL = P_FILIAL or P_FILIAL is NULL)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3313463151', 2, 1, 'insert into Z#R2_AGENDA_OBJECT a1 ( SN,SU, C_OBJ_DATA,C_PN,C_OBJ_CLASS,C_OBJ_DAY,C_OBJ_DATE_EXEC,C_FILIAL )
	(
		select 1,rtl.uid$, b1.CLIENT A$1, b1.PN A$2, ''CL_PRIV'' A$3, P_DATE A$4, P_DATE-1 A$5, b1.FILIAL A$6
		from (
			select  c1.C_CLIENT CLIENT, c1.C_PN PN, c1.C_FILIAL FILIAL
			from Z#R2_AGENDA_OBJECT d1, Z#R2_DEPOSIT c1
			where c1.C_CLIENT = d1.C_OBJ_DATA(+) and c1.C_PN = d1.C_PN(+) and c1.C_FILIAL = d1.C_FILIAL(+) and (c1.C_FILIAL = P_FILIAL or P_FILIAL is NULL) and d1.C_OBJ_DATA is NULL
			group by c1.C_CLIENT,c1.C_PN,c1.C_FILIAL
			order by DBMS_RANDOM.VALUE
		) b1
	)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3002782893', 139, 1, 'select  COUNT(1)
from Z#R2_ACC_TYPE_REF a1
where a1.ID = RV');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3002782893', 143, 1, 'select  COUNT(1)
from Z#R2_RES_PROD a1
where a1.ROWID = RV');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3002782893', 406, 1, 'select  COUNT(1)
from Z#R2_RES_RISK_GR a1
where a1.ROWID = RV');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3002782892', 399, 1, 'select  COUNT(1)
from Z#R2_RES_RISK_GR_H a1
where a1.ROWID = RV');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3002782886', 233, 1, 'select  COUNT(1)
from Z#R2_DEPOSIT_SUM a1
where a1.ROWID = RV');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667950', 20, 1, 'select  a1.C_PN PN, a1.C_ID_PORT ID_PORT, a1.C_ID_PROD ID_PROD
from Z#R2_RES_PROD a1
where a1.C_ID_PORT = P_PORT_FROM and a1.C_ON_DATE >= P_ON_DATE
union
select  b1.C_PN PN, b1.C_ID_PORT A$2, b1.C_ID_PROD A$3
from Z#R2_RES_PRD_PRT_H b1
where b1.C_ID_PORT = P_PORT_FROM and b1.C_DATE_BEGIN <= P_ON_DATE and not  exists (
	select  c1.ROWID A$1
	from Z#R2_RES_PRD_PRT_H c1
	where c1.C_ID_PORT <> P_PORT_FROM and c1.C_DATE_BEGIN <= P_ON_DATE and c1.C_DATE_BEGIN >= b1.C_DATE_BEGIN
)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667673', 1, 1, 'select  a1.C_PN A$1, TO_CHAR(a1.ID) A$2, ''R2_RES_PORT'' A$3, a1.C_DEPART A$4
from Z#R2_RES_PORT a1
union all
select  b1.C_PN A$1, b1.C_ID_PROD A$2, b1.C_PROD_CLASS A$3, b1.C_DEPART A$4
from Z#R2_RES_PROD b1
where b1.C_PROD_CLASS = ''R2_LOAN'' and b1.C_ID_PORT is NULL');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667673', 2, 1, 'select  a1.ID
from Z#R2_RES_PORT_KIND a2, Z#R2_RES_PORT a1
where a1.C_PORT_KIND=a2.id
  and ( exists (
	select  b1.C_ACC_TYPE_REF A$1
	from Z#R2_ACC_TYPE_REF b1
	where b1.COLLECTION_ID=a2.C_ADDITIONAL_CODE
	  and (b1.C_ACC_TYPE_REF = Z$R2_RES_PROD_LIB_CONSTANT.MFO_BALANCE_CODE)
))');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667673', 3, 1, 'select  null, ''R2_RES_BASE'', a1.C_PN, a1.C_PROD_CLASS, a1.C_ID_PROD, a1.C_ID_RES_VID, a1.C_FINTOOL, a1.C_ON_DATE, a1.C_ACC_RES, a1.C_ACC_DT, a1.C_ACC_CT, a1.C_BASE_AMT, a1.C_RES_AMT, a1.C_DATE_ACTUAL
from Z#R2_RES_BASE a1
where a1.C_PN = T_PORT(J).PN and a1.C_PROD_CLASS = T_PORT(J).PROD_CLASS and a1.C_ID_PROD = T_PORT(J).PROD_ID');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667673', 4, 1, 'select  a1.C_ID_RES_VID, a1.C_FINTOOL, NVL(SUM(a1.C_BASE_DELTA),0)
from Z#R2_RES_DELTA a1
where a1.C_ID_PROD = T_PORT(J).PROD_ID and a1.C_PN = T_PORT(J).PN and a1.C_ST = ''1''
group by a1.C_ID_RES_VID,a1.C_FINTOOL');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667673', 5, 1, 'select  a1.C_ID_RES_VID, a1.C_FINTOOL, NVL(SUM(a1.C_BASE_DELTA),0)
from Z#R2_RES_DELTA a1
where a1.C_ID_PORT = T_PORT(J).PROD_ID and a1.C_ST = ''1''
group by a1.C_ID_RES_VID,a1.C_FINTOOL');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667673', 6, 1, 'select  a1.C_ID_RES_VID, NVL(SUM(a1.C_SUMMA),0)
from Z#R2_RES_FACT_OPER a1
where a1.C_PN = T_PORT(J).PN and a1.C_ID_PROD = T_PORT(J).PROD_ID and a1.C_PROD_CLASS = T_PORT(J).PROD_CLASS
group by a1.C_ID_RES_VID');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667673', 7, 1, 'update Z#R2_RES_FACT_OPER a1 set
	a1.SN=nvl(a1.SN,1)+1, a1.SU=rtl.uid$, a1.C_SUMMA = a1.C_SUMMA+TABLE_FACT_OPER_AGGR(J).SUMMA
	where a1.C_PN = TABLE_FACT_OPER_AGGR(J).PN and a1.C_ID_PROD = TABLE_FACT_OPER_AGGR(J).ID_PROD and a1.C_PROD_CLASS = TABLE_FACT_OPER_AGGR(J).PROD_CLASS and a1.C_ID_RES_VID = TABLE_FACT_OPER_AGGR(J).ID_RES_VID and a1.C_DATE_PROV = TABLE_FACT_OPER_AGGR(J).DATE_PROV and a1.C_DOC is NULL');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667673', 8, 1, 'insert into Z#R2_RES_FACT_OPER a1 ( SN,SU, C_PN, C_ID_PROD, C_PROD_CLASS, C_ID_RES_VID, C_DATE_PROV, C_SUMMA, C_ST )
	values (1,rtl.uid$,TABLE_FACT_OPER_AGGR(J).PN, TABLE_FACT_OPER_AGGR(J).ID_PROD, TABLE_FACT_OPER_AGGR(J).PROD_CLASS, TABLE_FACT_OPER_AGGR(J).ID_RES_VID, TABLE_FACT_OPER_AGGR(J).DATE_PROV, TABLE_FACT_OPER_AGGR(J).SUMMA, TABLE_FACT_OPER_AGGR(J).ST)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667673', 9, 1, 'delete from Z#R2_RES_FACT_OPER a1
	where a1.C_ST = ''0'' and a1.C_SUMMA = 0 and a1.C_ID_PROD = RPORT and a1.C_PN = T_PORT(J).PN');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667673', 10, 1, 'select  a1.ROWID, a1.C_ID_PROD, a1.C_PROD_CLASS, a1.C_ID_RES_VID, a1.C_PN, a1.C_DATE_PROV, a1.C_SUMMA
from Z#R2_RES_FACT_OPER a1
where a1.C_ST = ''0'' and a1.C_ID_PROD = RPORT and a1.C_PN = T_PORT(J).PN');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667673', 11, 1, 'update Z#R2_RES_FACT_OPER a1 set
	a1.SN=nvl(a1.SN,1)+1, a1.SU=rtl.uid$, a1.C_ST = 1, a1.C_COMMENT = S_ERR_TEXT
	where a1.ROWID = T_ID_FO(IDX)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667673', 12, 1, 'delete from Z#R2_RES_FACT_OPER a1
	where a1.C_ST = ''0'' and a1.C_SUMMA = 0 and a1.C_PROD_CLASS = ''R2_LOAN''');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667673', 13, 1, 'select  a1.ROWID, a1.C_ID_PROD, a1.C_PROD_CLASS, a1.C_ID_RES_VID, a1.C_PN, a1.C_DATE_PROV, a1.C_SUMMA
from Z#R2_RES_FACT_OPER a1
where a1.C_ST = ''0'' and a1.C_PROD_CLASS = ''R2_LOAN''');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667673', 14, 1, 'select  a1.C_DEPART
from Z#R2_RES_PROD a1
where a1.C_ID_PROD = TBL_FO(IDX_FO).ID_PROD and a1.C_PN = TBL_FO(IDX_FO).PN and a1.C_PROD_CLASS = ''R2_LOAN''');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667673', 15, 1, 'update Z#R2_RES_FACT_OPER a1 set
	a1.SN=nvl(a1.SN,1)+1, a1.SU=rtl.uid$, a1.C_ST = 1, a1.C_COMMENT = S_ERR_TEXT
	where a1.ROWID = TBL_FO(IDX_FO).ID');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3002782886', 328, 1, 'select  COUNT(1)
from Z#R2_DEP_SRC_FIN_A a1
where a1.ROWID = RV');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3002782886', 368, 1, 'select  COUNT(1)
from Z#R2_AGENDA_OBJECT a1
where a1.ROWID = RV');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3002782886', 422, 1, 'select  COUNT(1)
from Z#R2_PLAN_OPER a1
where a1.ROWID = RV');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3313436020', 2, 1, 'select  a1.rowid
from Z#AC_FIN a3, Z#R2_TYPE_ACC a2, Z#R2_ACC a1
where a1.C_TYPE_ACC=a2.id and a1.C_AC_FIN=a3.id
  and (a1.C_PRODUCT = plp$THIS and a1.C_PN = plp$2$1 and a1.C_CLASS_NAME = ''R2_LOAN'' and a1.C_DATE_END is NULL and a2.C_CLASS_ID <> ''R2_UNION'' and a3.C_MAIN_V_ID != a1.C_NUM_ACC and (a1.C_TYPE_ACC = P_TYPE_ACC or P_TYPE_ACC is NULL))');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312661662', 1, 1, 'select  a1.rowid
from Z#R2_FACT_OPER a1
where a1.C_PRODUCT = THIS and a1.C_PN = plp$1$1 and a1.C_CLASS_NAME = ''R2_DEPOSIT'' and a1.C_FOLDER_ID = (
	select  MAX(b1.C_FOLDER_ID) A$1
	from Z#R2_FACT_OPER b1
	where b1.C_PRODUCT = THIS and b1.C_PN = plp$1$1 and b1.C_CLASS_NAME = ''R2_DEPOSIT'' and b1.C_VID_OPER = 3312657311 and b1.C_STATE_OPER is NULL
) and a1.C_STATE_OPER is NULL');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312661662', 3, 1, 'select  a1.rowid
from Z#R2_FACT_OPER a1
where a1.C_PRODUCT = plp$THIS and a1.C_PN = plp$3$1 and a1.C_CLASS_NAME = ''R2_DEPOSIT'' and a1.C_DATE_OPER >= P_FACT_OPERS(1).A#DATE_OPER and a1.C_FOLDER_ID > P_FACT_OPERS(1).A#FOLDER_ID and a1.C_SN > P_FACT_OPERS(1).A#SN and a1.C_STATE_OPER is NULL');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312668708', 1, 1, 'select  a1.ID ID
from Z#R2_SUMMARIZED_MD a1
where a1.C_DOC is NULL and (
	select  COUNT(1) A$1
	from Z#R2_FACT_OPER b1
	where b1.C_DOC = a1.C_DOC and ROWNUM = 1
) = 0');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3002782892', 256, 1, 'select  COUNT(1)
from Z#R2_DEPOSIT_PROL a1
where a1.ROWID = RV');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3002782892', 292, 1, 'select  COUNT(1)
from Z#R2_AGENDA_JOUR a1
where a1.ROWID = RV');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312668057', 3, 1, 'select  a1.ROWID, ''R2_RES_RISK_GR'', a1.C_GROUP_NUM, a1.C_RES_PRC, a1.C_ON_DATE, a1.C_VID_RES
from Z#R2_RES_RISK_GR a1
where a1.C_ID_PROD = P_ID_PROD and a1.C_PROD_CLASS = P_PROD_CLASS and a1.C_PN = P_PN');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312668057', 4, 1, 'select  a1.ID, a1.CL, a1.GN, a1.RP, a1.D, a1.VR
from (
	select  b1.ROWID ID, ''R2_RES_RISK_GR_H'' CL, b1.C_GROUP_NUM GN, b1.C_RES_PRC RP, b1.C_ON_DATE D, b1.C_VID_RES VR
	from Z#R2_RES_RISK_GR_H b1
	where b1.C_ID_PROD = P_ID_PROD and b1.C_PROD_CLASS = P_PROD_CLASS and b1.C_PN = P_PN and b1.C_ON_DATE <= plp$P_ON_DATE and b1.C_VID_RES is NULL
	order by b1.C_ON_DATE desc
) a1
where ROWNUM = 1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312668057', 5, 1, 'select  a1.ID, a1.CL, a1.GN, a1.RP, a1.D, a1.VR
from (
	select  b1.ROWID ID, ''R2_RES_RISK_GR_H'' CL, b1.C_GROUP_NUM GN, b1.C_RES_PRC RP, b1.C_ON_DATE D, b1.C_VID_RES VR
	from Z#R2_RES_RISK_GR_H b1
	where b1.C_ID_PROD = P_ID_PROD and b1.C_PROD_CLASS = P_PROD_CLASS and b1.C_PN = P_PN and b1.C_ON_DATE <= plp$P_ON_DATE and b1.C_VID_RES = P_VID_RES
	order by b1.C_ON_DATE desc
) a1
where ROWNUM = 1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312668057', 6, 1, 'select  a1.ID, a1.CL, a1.GN, a1.RP, a1.D, a1.VR
from (
	select  b1.ROWID ID, ''R2_RES_RISK_GR_H'' CL, b1.C_GROUP_NUM GN, b1.C_RES_PRC RP, b1.C_ON_DATE D, b1.C_VID_RES VR
	from Z#R2_RES_RISK_GR_H b1
	where b1.C_ID_PROD = P_ID_PROD and b1.C_PROD_CLASS = P_PROD_CLASS and b1.C_PN = P_PN and b1.C_ON_DATE <= plp$P_ON_DATE and b1.C_VID_RES is NULL
	order by b1.C_ON_DATE desc
) a1
where ROWNUM = 1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312668057', 7, 1, 'select  a1.ROWID, a1.C_ON_DATE, a1.C_GROUP_NUM, a1.C_RES_PRC
from Z#R2_RES_RISK_GR a1
where a1.C_ID_PROD = P_ID_PROD and a1.C_PROD_CLASS = P_PROD_CLASS and a1.C_PN = P_PN and a1.C_VID_RES is NULL');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312668057', 8, 1, 'select  a1.ROWID, a1.C_ON_DATE, a1.C_GROUP_NUM, a1.C_RES_PRC
from Z#R2_RES_RISK_GR a1
where a1.C_ID_PROD = P_ID_PROD and a1.C_PROD_CLASS = P_PROD_CLASS and a1.C_PN = P_PN and a1.C_VID_RES = P_VID_RES');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312668057', 9, 1, 'update Z#R2_RES_RISK_GR a1 set
	a1.SN=nvl(a1.SN,1)+1, a1.SU=rtl.uid$, a1.C_GROUP_NUM = P_GROUP_NUM, a1.C_RES_PRC = P_RES_PRC, a1.C_ON_DATE = P_ON_DATE
	where a1.ROWID = R_GR');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312668057', 10, 1, 'select  a1.ROWID
from Z#R2_RES_RISK_GR_H a1
where a1.C_ID_PROD = P_ID_PROD and a1.C_PROD_CLASS = P_PROD_CLASS and a1.C_PN = P_PN and a1.C_ON_DATE = P_ON_DATE and a1.C_VID_RES is NULL');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312668057', 11, 1, 'select  a1.ROWID
from Z#R2_RES_RISK_GR_H a1
where a1.C_ID_PROD = P_ID_PROD and a1.C_PROD_CLASS = P_PROD_CLASS and a1.C_PN = P_PN and a1.C_ON_DATE = P_ON_DATE and a1.C_VID_RES = P_VID_RES');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312668057', 12, 1, 'update Z#R2_RES_RISK_GR_H a1 set
	a1.SN=nvl(a1.SN,1)+1, a1.SU=rtl.uid$, a1.C_GROUP_NUM = P_GROUP_NUM, a1.C_RES_PRC = P_RES_PRC
	where a1.ROWID = R_GR_H');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312668057', 13, 1, 'insert into Z#R2_RES_RISK_GR_H a1 ( SN,SU, C_ON_DATE, C_ID_PROD, C_PROD_CLASS, C_GROUP_NUM, C_RES_PRC, C_PN, C_VID_RES )
	values (1,rtl.uid$,GR_H.ON_DATE, GR_H.ID_PROD, GR_H.PROD_CLASS, GR_H.GROUP_NUM, GR_H.RES_PRC, GR_H.PN, GR_H.VID_RES)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312668057', 14, 1, 'insert into Z#R2_RES_RISK_GR a1 ( SN,SU, C_ON_DATE, C_ID_PROD, C_PROD_CLASS, C_GROUP_NUM, C_RES_PRC, C_PN, C_VID_RES )
	values (1,rtl.uid$,GR.ON_DATE, GR.ID_PROD, GR.PROD_CLASS, GR.GROUP_NUM, GR.RES_PRC, GR.PN, GR.VID_RES)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312668057', 15, 1, 'insert into Z#R2_RES_RISK_GR_H a1 ( SN,SU, C_ON_DATE, C_ID_PROD, C_PROD_CLASS, C_GROUP_NUM, C_RES_PRC, C_PN, C_VID_RES )
	values (1,rtl.uid$,GR.ON_DATE, GR.ID_PROD, GR.PROD_CLASS, GR.GROUP_NUM, GR.RES_PRC, GR.PN, GR.VID_RES)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3002782890', 65, 1, 'select  COUNT(1)
from Z#R2_TRANS_INFO a1
where a1.ROWID = RV');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3002782890', 204, 1, 'select  COUNT(1)
from Z#R2_GRACE_HISTORY a1
where a1.ROWID = RV');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3002782890', 297, 1, 'select  COUNT(1)
from Z#R2_DEP_ARCH a1
where a1.ROWID = RV');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312661672', 1, 1, 'select  a1.C_PRODUCT, a1.C_SN
from Z#R2_FACT_OPER a1
where a1.C_DOC = P_DOC and a1.C_DATE_OPER >= plp$P_DATE and a1.C_DATE_OPER < plp$P_DATE+1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312661672', 2, 1, 'select  1 A$1
from Z#R2_PROPERTIES a1
where a1.C_PRODUCT = P_PRODUCT and a1.C_PN = plp$2$1 and a1.C_GROUP_PROP = 3312657922 and a1.C_DATE_BEGIN < plp$P_DATE+1 and (a1.C_DATE_END >= plp$P_DATE or a1.C_DATE_END is NULL)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312661672', 4, 1, 'select  1 A$1
from Z#R2_FACT_OPER a1
where a1.C_PRODUCT = P_PRODUCT and a1.C_PN = plp$4$1 and a1.C_DATE_OPER >= plp$4$2 and a1.C_DATE_OPER < plp$P_DATE+1 and (null = ''1'') and a1.C_VID_OPER = 3312657307 and a1.C_DOC != P_DOC and a1.C_SN < P_FO_SN');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312675165', 1, 1, 'select distinct a1.ID ID, a1.C_NUM_DOG NUMDOG, a1.C_DATE_BEGIN DAT, a2.C_NAME VIDDOGNAME, a3.C_CUR_SHORT CURSHORT, b1.C_NUM_ACC ACCNUM, c1.C_SUMMA SALDO
from Z#R2_VID_DEBT c2, Z#R2_CRED_DEBT c1, Z#R2_TYPE_ACC b2, Z#R2_ACC b1, Z#CLIENT a4, Z#FT_MONEY a3, Z#R2_VID_DEPOSIT a2, Z#R2_DEPOSIT a1
where a1.C_VID_DEPOSIT=a2.id(+) and a1.C_CURRENCY=a3.id(+) and a1.C_CLIENT=a4.id and b1.C_TYPE_ACC=b2.id and c1.C_VID_DEBT=c2.id
  and (a1.C_CLIENT = P_CLIENT and a4.C_PN = plp$1$1 and a1.C_COM_STATUS in (2047879,6226536) and b1.C_PRODUCT = a1.ID and b1.C_PN = a1.C_PN and b2.C_CODE = ''D_ACCOUNT'' and c1.C_PRODUCT = a1.ID and c1.C_PN = a1.C_PN and c2.C_CODE = ''SUM_DOG'')');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667669', 1, 1, 'select  a1.C_PN, a1.C_ID_PROD, a1.C_PROD_CLASS, a1.C_DEPART
from Z#DEPART a2, Z#R2_RES_PROD a1
where a1.C_DEPART=a2.id
  and (a1.C_CLIENT = R_CLIENT and a1.C_PN = plp$1$1 and a2.C_FILIAL = P_FILIAL and a1.C_COM_STATUS = 2047879)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667669', 3, 1, 'select  a1.C_PN, a1.C_ID_PROD, a1.C_ID_RES_VID, a1.C_FINTOOL, null, null, a1.C_BASE_AMT, a1.C_RES_AMT
from Z#R2_RES_BASE a1
where a1.C_ID_PROD = REC_PROD.ID_PROD and a1.C_PN = REC_PROD.PN and a1.C_PROD_CLASS = REC_PROD.PROD_CLASS and (a1.C_ACC_CT is NULL or a1.C_ACC_DT is NULL)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667669', 4, 1, 'update Z#R2_RES_BASE a1 set
	a1.SN=nvl(a1.SN,1)+1, a1.SU=rtl.uid$, a1.C_ACC_DT = REC_BASE_IND.ACC_DT, a1.C_ACC_CT = REC_BASE_IND.ACC_CT
	where a1.C_PROD_CLASS = REC_PROD.PROD_CLASS and a1.C_ID_PROD = REC_BASE_IND.ID_PROD and a1.C_ID_RES_VID = REC_BASE_IND.ID_RES_VID and a1.C_FINTOOL = REC_BASE_IND.FINTOOL and a1.C_PN = REC_BASE_IND.PN');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667669', 5, 1, 'update Z#R2_RES_BASE a1 set
	a1.SN=nvl(a1.SN,1)+1, a1.SU=rtl.uid$, a1.C_ACC_DT = TBL_BASE_IND(J).ACC_DT, a1.C_ACC_CT = TBL_BASE_IND(J).ACC_CT
	where a1.C_PROD_CLASS = REC_PROD.PROD_CLASS and a1.C_ID_PROD = TBL_BASE_IND(J).ID_PROD and a1.C_ID_RES_VID = TBL_BASE_IND(J).ID_RES_VID and a1.C_FINTOOL = TBL_BASE_IND(J).FINTOOL and a1.C_PN = TBL_BASE_IND(J).PN');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667669', 6, 1, 'select  a1.ROWID, a1.C_PN, a1.C_ID_PROD, a1.C_PROD_CLASS, a1.C_ID_RES_VID, a1.C_ID_PORT, a1.C_DATE_PROV, a1.C_BASE_DELTA, a1.C_FINTOOL, a1.C_ST, case when a1.C_ID_PORT is NULL then 0 else 1 end
from Z#R2_RES_DELTA a1
where a1.C_PN = REC_PROD.PN and a1.C_DATE_PROV <= D_DATE_PROV and (a1.C_ST = ''0'' or a1.C_DATE_PROV <= D_DATE_DEL) and a1.C_ID_PROD = REC_PROD.ID_PROD and a1.C_PROD_CLASS = REC_PROD.PROD_CLASS');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667669', 7, 1, 'update Z#R2_RES_DELTA a1 set
	a1.SN=nvl(a1.SN,1)+1, a1.SU=rtl.uid$, a1.C_ST = ''1''
	where a1.ROWID = TBL_DELTA_UPD(J)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667669', 8, 1, 'delete from Z#R2_RES_DELTA a1
	where a1.ROWID = TBL_DELTA_DEL(J).ID_DELTA');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667669', 9, 1, 'update Z#R2_RES_BASE_INCL a1 set
	a1.SN=nvl(a1.SN,1)+1, a1.SU=rtl.uid$, a1.C_ON_DATE = TBL_BASE_PROD(J).DATE_PROV, a1.C_BASE_AMT = NVL(a1.C_BASE_AMT,0)+NVL(TBL_BASE_PROD(J).BASE_AMT,0), a1.C_DATE_ACTUAL = D_DATE_ACTUAL
	where a1.C_PROD_CLASS = TBL_BASE_PROD(J).PROD_CLASS and a1.C_ID_PROD = TBL_BASE_PROD(J).ID_PROD and a1.C_ID_RES_VID = TBL_BASE_PROD(J).ID_RES_VID and a1.C_PN = TBL_BASE_PROD(J).PN');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667669', 10, 1, 'update Z#R2_RES_BASE a1 set
	a1.SN=nvl(a1.SN,1)+1, a1.SU=rtl.uid$, a1.C_ON_DATE = TBL_BASE_PORT(J).DATE_PROV, a1.C_BASE_AMT = NVL(a1.C_BASE_AMT,0)+NVL(TBL_BASE_PORT(J).BASE_AMT,0), a1.C_DATE_ACTUAL = D_DATE_ACTUAL
	where a1.C_PROD_CLASS = TBL_BASE_PORT(J).PROD_CLASS and a1.C_ID_PROD = TBL_BASE_PORT(J).ID_PROD and a1.C_ID_RES_VID = TBL_BASE_PORT(J).ID_RES_VID and a1.C_PN = TBL_BASE_PORT(J).PN');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667669', 11, 1, 'update Z#R2_RES_BASE_AGR a1 set
	a1.SN=nvl(a1.SN,1)+1, a1.SU=rtl.uid$, a1.C_BASE_AMT = NVL(a1.C_BASE_AMT,0)+NVL(REC_BASE_AGR.BASE_AMT,0), a1.C_BASE_AMT_UPD = NVL(a1.C_BASE_AMT_UPD,0)+NVL(REC_BASE_AGR.BASE_AMT_UPD,0)
	where a1.C_THREAD_ID = REC_BASE_AGR.THREAD_ID and a1.C_ID_PORT = REC_BASE_AGR.ID_PORT and a1.C_ID_RES_VID = REC_BASE_AGR.ID_RES_VID and a1.C_FINTOOL = REC_BASE_AGR.FINTOOL and a1.C_DATE_PROV = REC_BASE_AGR.DATE_PROV and a1.C_IS_HIST = ''0'' and a1.C_PN = PN');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667669', 12, 1, 'insert into Z#R2_RES_BASE_AGR a1 ( SN,SU, C_THREAD_ID, C_ID_PORT, C_ID_RES_VID, C_FINTOOL, C_DATE_PROV, C_BASE_AMT, C_BASE_AMT_UPD, C_IS_HIST, C_PN )
	values (1,rtl.uid$,REC_BASE_AGR.THREAD_ID, REC_BASE_AGR.ID_PORT, REC_BASE_AGR.ID_RES_VID, REC_BASE_AGR.FINTOOL, REC_BASE_AGR.DATE_PROV, REC_BASE_AGR.BASE_AMT, REC_BASE_AGR.BASE_AMT_UPD, ''0'', PN)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667669', 13, 1, 'insert into Z#R2_RES_FACT_OPER a1 ( SN,SU, C_ID_PROD, C_PROD_CLASS, C_ID_RES_VID, C_PN, C_DATE_PROV, C_SUMMA, C_ST )
	values (1,rtl.uid$,REC_FACT_OPER.ID_PROD, REC_FACT_OPER.PROD_CLASS, REC_FACT_OPER.ID_RES_VID, REC_FACT_OPER.PN, REC_FACT_OPER.DATE_PROV, NVL(REC_FACT_OPER.SUMMA,0), ''0'')');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312660738', 1, 1, 'select  a1.ROWID
from Z#R2_AGENDA_OBJECT a1
where a1.C_OBJ_CLASS = P_CLASS and a1.C_OBJ_DATA = P_OBJ and NVL(a1.C_PN,1) = NVL(P_PN,1) and a1.C_FILIAL = NVL(P_FILIAL,a1.C_FILIAL) and ROWNUM = 1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312660738', 3, 1, 'select  a1.C_OBJ_DAY
from Z#R2_AGENDA_OBJECT a1
where a1.ROWID = OBJ_REF');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315044551', 2, 1, 'select  null
from Z#R2_PLAN_OPER a1
where a1.C_PRODUCT = RPROD and a1.C_PN = plp$2$1 and a1.C_DATE_OPER = P_OP_DATE and a1.C_OPER = plp$P_KIND_OPER and ROWNUM < 2');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312661671', 1, 1, 'select  a1.C_PRC_SCH
from Z#R2_DEPOSIT_PRC a1
where a1.C_PRODUCT = P_PROD and a1.C_PN = plp$1$1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312659221', 4, 1, 'update Z#R2_DEPOSIT_PRC a1 set
	a1.SN=nvl(a1.SN,1)+1, a1.SU=rtl.uid$, a1.C_CALC_NALOG = ''1''
	where a1.C_PRC_SCH = plp$THIS and a1.C_CALC_NALOG = ''0''');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312660613', 1, 1, 'select  COUNT(1)
from Z#R2_ACC_POOL_DEF a1
where a1.C_MASK = P_MASK');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312672973', 1, 1, 'select  a1.ROWID
from Z#R2_ACC a1
where plp$1$1 = a1.C_PN and THIS = a1.C_PRODUCT and a1.C_TYPE_ACC = 3312657129 and ROWNUM = 1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312672973', 3, 1, 'select  a1.ROWID
from Z#R2_ACC a1
where plp$3$1 = a1.C_PN and THIS = (-a1.C_PRODUCT) and a1.C_TYPE_ACC = 3312657168 and ROWNUM = 1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667476', 1, 1, 'select  ''1''
from DUAL a1
where  exists (
	select  null A$1
	from Z#R2_RES_FACT_OPER b1
	where b1.C_PN = plp$1$1 and b1.C_ID_PROD = plp$1$2 and b1.C_ID_RES_VID = plp$1$3
)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667476', 2, 1, 'select  a1.ROWID ID
from Z#R2_RES_BASE a1
where a1.C_PN = plp$2$1 and a1.C_ID_PROD = plp$2$2 and a1.C_ID_RES_VID = plp$2$3 and a1.C_FINTOOL != plp$2$4 and a1.C_ACC_RES = plp$2$5');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667966', 1, 1, 'select  a1.C_ON_DATE
from Z#R2_RES_RISK_GR a1
where a1.C_PROD_CLASS = plp$1$1 and a1.C_ID_PROD = P_ID_CLIENT and a1.C_PN = plp$1$2');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667966', 2, 1, 'update Z#R2_RES_RISK_GR a1 set
	a1.SN=nvl(a1.SN,1)+1, a1.SU=rtl.uid$, a1.C_ON_DATE = P_DATE_OPER, a1.C_GROUP_NUM = P_GROUP_NUM, a1.C_RES_PRC = P_RES_PRC
	where a1.C_PROD_CLASS = plp$2$1 and a1.C_ID_PROD = P_ID_CLIENT');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667966', 3, 1, 'select  a1.C_PN, a1.C_PROD_CLASS, a1.C_ID_PROD, a1.C_ID_RES_VID, a1.C_FINTOOL
from Z#R2_RES_PROD b1, Z#R2_RES_BASE a1
where a1.C_PROD_CLASS = b1.C_PROD_CLASS and a1.C_ID_PROD = b1.C_ID_PROD and a1.C_PN = b1.C_PN and b1.C_CLIENT = P_ID_CLIENT');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667966', 4, 1, 'insert into Z#R2_RES_DELTA a1 ( SN,SU, C_PN, C_PROD_CLASS, C_ID_PROD, C_ID_RES_VID, C_FINTOOL, C_DATE_PROV, C_BASE_DELTA, C_ST )
	values (1,rtl.uid$,TBL_BASE.C_PN(J), TBL_BASE.C_PROD_CLASS(J), TBL_BASE.C_ID_PROD(J), TBL_BASE.C_ID_RES_VID(J), TBL_BASE.C_FINTOOL(J), P_DATE_PROV, 0, ''0'')');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3002782888', 500, 1, 'select  COUNT(1)
from Z#R2_RES_DELTA a1
where a1.ROWID = RV');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3002782888', 36, 1, 'select  COUNT(1)
from Z#PROD_TEMP_TBL a1
where a1.ROWID = RV');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3002782888', 85, 1, 'select  COUNT(1)
from Z#R2_DEP_TRANSFER a1
where a1.ROWID = RV');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3002782889', 229, 1, 'select  COUNT(1)
from Z#R2_RES_BASE a1
where a1.ROWID = RV');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3002782889', 230, 1, 'select  COUNT(1)
from Z#R2_RES_DELAY a1
where a1.ROWID = RV');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3002782888', 145, 1, 'select  COUNT(1)
from Z#R2_ACC a1
where a1.ROWID = RV');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3002782888', 231, 1, 'select  COUNT(1)
from Z#R2_RES_PRD_PRT_H a1
where a1.ROWID = RV');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3002782888', 291, 1, 'select  COUNT(1)
from Z#R2_RES_FACT_OPER a1
where a1.ROWID = RV');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3002782888', 340, 1, 'select  COUNT(1)
from Z#R2_ACC_CRITERIA a1
where a1.ROWID = RV');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3002782888', 342, 1, 'select  COUNT(1)
from Z#R2_RES_BASE_AGR a1
where a1.ROWID = RV');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3002782889', 35, 1, 'select  COUNT(1)
from Z#R2_ACC2PROD a1
where a1.ID = RV');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312661673', 3, 1, 'select  a1.rowid
from Z#R2_FACT_OPER a1
where a1.C_PRODUCT = THIS and a1.C_PN = plp$3$1 and a1.C_DATE_CALC >= plp$3$2 and a1.C_DATE_CALC < plp$3$2+1 and a1.C_VID_OPER in (3312657374,3312657375) and a1.C_CLASS_BASE_PAY = ''R2_DEP_ARCH''');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312661673', 6, 1, 'select  a1.rowid
from Z#R2_FACT_OPER a1
where a1.C_PRODUCT = THIS and a1.C_PN = plp$6$1 and a1.C_DATE_CALC >= plp$6$2 and a1.C_VID_OPER not in (3312657374,3312657372,3312657375) and a1.C_SN > plp$6$3 and ROWNUM = 1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312661673', 10, 1, 'select  a1.rowid
from Z#R2_FACT_OPER a1
where a1.C_PRODUCT = plp$THIS and a1.C_PN = plp$10$1 and a1.C_DATE_CALC >= plp$10$2 and a1.C_DATE_CALC < plp$10$2+1 and a1.C_VID_OPER in (3312657374,3312657375)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312661673', 13, 1, 'select  a1.rowid
from Z#R2_FACT_OPER a1
where a1.C_PRODUCT = plp$THIS and a1.C_PN = plp$13$1 and a1.C_DATE_CALC >= plp$13$2 and a1.C_VID_OPER not in (3312657374,3312657372) and a1.C_SN > plp$13$3 and ROWNUM = 1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312661673', 16, 1, 'select  a1.rowid
from Z#R2_FACT_OPER a1
where a1.C_PRODUCT = plp$THIS and a1.C_PN = plp$16$1 and a1.C_DATE_CALC >= plp$16$2 and a1.C_DATE_CALC < plp$16$2+1 and a1.C_VID_OPER in (3312657374,3312657372,3312657375)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312661673', 21, 1, 'select  a1.rowid
from Z#R2_ACC a1
where a1.C_PRODUCT = plp$THIS and a1.C_PN = plp$21$1 and a1.C_CLASS_NAME = ''R2_DEPOSIT'' and a1.C_DATE_BEG < plp$21$2+1 and a1.C_TYPE_ACC = 3312657129
order by a1.C_DATE_BEG desc');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312661664', 5, 1, 'select  a1.rowid
from Z#R2_DEBTS_FOR_FO a1
where a1.C_PRODUCT = plp$5$1 and a1.C_PN = plp$5$2 and a1.C_NUM_OPER = plp$5$3');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312661664', 13, 1, 'select  a1.rowid
from Z#R2_DEP_ARCH a1
where a1.C_PRODUCT = P_PRODUCT and a1.C_PN = plp$13$1 and a1.C_DATE_BEGIN <= plp$P_DATE
order by a1.C_DATE_BEGIN desc');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3313452568', 1, 1, 'select  a1.rowid
from Z#R2_AN_ACCOUNT a1
where a1.C_MAIN_V_ID_NOKEY = SUBSTR(P_ACC_NUM,1,8)||''0''||SUBSTR(P_ACC_NUM,10) and a1.C_FILIAL = P_FILIAL');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3313442271', 10, 1, 'select  a1.ROWID
from Z#R2_FACT_OPER a1
where a1.C_PRODUCT = TBL_PROD(IDX).PROD_ID and a1.C_CLASS_NAME = TBL_PROD(IDX).PROD_CLASS and a1.C_DATE_OPER <= AD_REP_DATE and a1.C_DATE_OPER > ADD_MONTHS(AD_REP_DATE,(-1))');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312661666', 8, 1, 'select  a1.rowid
from Z#R2_FACT_OPER a1
where a1.C_PRODUCT = RDEP and a1.C_PN = plp$8$1 and a1.C_DATE_OPER >= DDATEBEG and a1.C_DATE_OPER < plp$P_DATEOPER+1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312661666', 28, 1, 'select  a1.rowid
from Z#R2_FACT_OPER a1
where a1.C_DOC_ID = P_NUMCORRID and a1.C_FOLDER_ID = P_NUMTRANSID and a1.C_PRODUCT = P_NUMPRODID and a1.C_PN = P_NUMPARTITION and a1.C_CLASS_NAME = ''R2_DEPOSIT''');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312661666', 29, 1, 'select  a1.rowid
from Z#R2_FACT_OPER a1
where a1.C_FOLDER_ID = P_NUMTRANSID and a1.C_PRODUCT = P_NUMPRODID and a1.C_PN = P_NUMPARTITION and a1.C_CLASS_NAME = ''R2_DEPOSIT''');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312661666', 30, 1, 'select  a1.rowid
from Z#R2_FACT_OPER a1
where a1.C_PRODUCT = P_NUMPRODID and a1.C_PN = P_NUMPARTITION and a1.C_CLASS_NAME = ''R2_DEPOSIT'' and a1.C_SN = P_NUMSN');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312661666', 34, 1, 'select  a1.C_STATE_OPER
from Z#R2_FACT_OPER a1
where a1.C_FOLDER_ID = P_NUMTRANSID and a1.C_DOC_ID = P_NUMCORRID and a1.C_DATE_OPER = P_DATECORR and a1.C_PATTERN = P_REFPATTERN and a1.C_PN = P_NUMPARTITION and NVL(a1.C_DOC,(-1)) = (-1)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312661666', 35, 1, 'update Z#R2_FACT_OPER a1 set
	a1.SN=nvl(a1.SN,1)+1, a1.SU=rtl.uid$, a1.C_DOC = P_SUMMARIZED_DOCS(IDX).SUMMARIZED_DOC
	where a1.C_FOLDER_ID = P_SUMMARIZED_DOCS(IDX).TRANS_ID and a1.C_DOC_ID = P_SUMMARIZED_DOCS(IDX).CORR_ID and a1.C_PN = P_SUMMARIZED_DOCS(IDX).PN and a1.C_PATTERN = P_SUMMARIZED_DOCS(IDX).PATTERN');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315042957', 2, 1, 'select  b1.C_DATE_OPER, b1.C_DATE_CALC, b1.C_SUMMA_OPER, b1.C_CURRENCY, b1.C_SUMMA_NT, (
	select  c1.C_ACC_NUM A$1
	from Z#AD_RECORDS c1
	where b1.C_PATTERN is not NULL and  exists (
		select  1 A$1
		from Z#R2_ACC d1
		where c1.C_ACC_NUM = d1.C_NUM_ACC
	) and b1.C_DOC_ID = c1.C_CORR_ID and b1.C_FOLDER_ID = c1.C_TRANS_ID and b1.C_PATTERN in (c1.C_PATT,c1.C_PATT_CORR) and ROWNUM = 1
), (
	select  e1.C_ACC_CORR A$1
	from Z#AD_RECORDS e1
	where b1.C_PATTERN is not NULL and  exists (
		select  1 A$1
		from Z#R2_ACC f1
		where e1.C_ACC_CORR = f1.C_NUM_ACC
	) and b1.C_DOC_ID = e1.C_CORR_ID and b1.C_FOLDER_ID = e1.C_TRANS_ID and b1.C_PATTERN in (e1.C_PATT,e1.C_PATT_CORR) and ROWNUM = 1
), a1.C_ACC_DT, a1.C_ACC_KT, a1.C_SUM, a1.C_SUM_PO, a1.C_DATE_PROV, a1.ID, NVL((
	select  g1.C_FILIAL A$1
	from Z#R2_DEPOSIT g1
	where g1.ID = b1.C_PRODUCT and ROWNUM = 1
),(
	select  h1.C_FILIAL A$1
	from Z#R2_LOAN h1
	where h1.ID = b1.C_PRODUCT and ROWNUM = 1
)), NVL((
	select  i1.C_DEPART A$1
	from Z#R2_DEPOSIT i1
	where i1.ID = b1.C_PRODUCT and ROWNUM = 1
),(
	select  j1.C_DEPART A$1
	from Z#R2_LOAN j1
	where j1.ID = b1.C_PRODUCT and ROWNUM = 1
)), (case when b1.C_DOC is NULL then null when b1.C_STATE_OPER is NULL and NVL(b1.C_CORRECTED,''0'') = ''0'' then ''Проведена'' when b1.C_STATE_OPER is NULL and NVL(b1.C_CORRECTED,''0'') = ''1'' then ''Сторнирована'' when b1.C_STATE_OPER = 0 then ''На доп.контроле'' when b1.C_STATE_OPER = 1 then ''Ликвидирована'' when b1.C_STATE_OPER = 2 then ''Ануллирована'' else ''Промежуточное состояние: ''||b1.C_STATE_OPER end), LIB.STATE_NAME(a1.STATE_ID,''MAIN_DOCUM''), b1.C_DOC_ID, b1.C_FOLDER_ID, (
	select  k1.ID A$1
	from Z#R2_LOAN k1
	where k1.ID = b1.C_PRODUCT and ROWNUM = 1
), (
	select  l1.ID A$1
	from Z#R2_DEPOSIT l1
	where l1.ID = b1.C_PRODUCT and ROWNUM = 1
), P_TUNE
from Z#R2_FACT_OPER b1, Z#MAIN_DOCUM a1
where a1.ID = b1.C_DOC and a1.C_DOCUMENT_UNO = ''R2$'' and a1.STATE_ID <> ''PROV'' and (b1.C_STATE_OPER is NULL and NVL(b1.C_CORRECTED,''0'') = ''0'')');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315042957', 3, 1, 'select  b1.C_DATE_OPER, b1.C_DATE_CALC, b1.C_SUMMA_OPER, b1.C_CURRENCY, b1.C_SUMMA_NT, (
	select  c1.C_ACC_NUM A$1
	from Z#AD_RECORDS c1
	where b1.C_PATTERN is not NULL and  exists (
		select  1 A$1
		from Z#R2_ACC d1
		where c1.C_ACC_NUM = d1.C_NUM_ACC
	) and b1.C_DOC_ID = c1.C_CORR_ID and b1.C_FOLDER_ID = c1.C_TRANS_ID and b1.C_PATTERN in (c1.C_PATT,c1.C_PATT_CORR) and ROWNUM = 1
), (
	select  e1.C_ACC_CORR A$1
	from Z#AD_RECORDS e1
	where b1.C_PATTERN is not NULL and  exists (
		select  1 A$1
		from Z#R2_ACC f1
		where e1.C_ACC_CORR = f1.C_NUM_ACC
	) and b1.C_DOC_ID = e1.C_CORR_ID and b1.C_FOLDER_ID = e1.C_TRANS_ID and b1.C_PATTERN in (e1.C_PATT,e1.C_PATT_CORR) and ROWNUM = 1
), a1.C_ACC_DT, a1.C_ACC_KT, a1.C_SUM, a1.C_SUM_PO, a1.C_DATE_PROV, a1.ID, NVL((
	select  g1.C_FILIAL A$1
	from Z#R2_DEPOSIT g1
	where g1.ID = b1.C_PRODUCT and ROWNUM = 1
),(
	select  h1.C_FILIAL A$1
	from Z#R2_LOAN h1
	where h1.ID = b1.C_PRODUCT and ROWNUM = 1
)), NVL((
	select  i1.C_DEPART A$1
	from Z#R2_DEPOSIT i1
	where i1.ID = b1.C_PRODUCT and ROWNUM = 1
),(
	select  j1.C_DEPART A$1
	from Z#R2_LOAN j1
	where j1.ID = b1.C_PRODUCT and ROWNUM = 1
)), (case when b1.C_DOC is NULL then null when b1.C_STATE_OPER is NULL and NVL(b1.C_CORRECTED,''0'') = ''0'' then ''Проведена'' when b1.C_STATE_OPER is NULL and NVL(b1.C_CORRECTED,''0'') = ''1'' then ''Сторнирована'' when b1.C_STATE_OPER = 0 then ''На доп.контроле'' when b1.C_STATE_OPER = 1 then ''Ликвидирована'' when b1.C_STATE_OPER = 2 then ''Ануллирована'' else ''Промежуточное состояние: ''||b1.C_STATE_OPER end), LIB.STATE_NAME(a1.STATE_ID,''MAIN_DOCUM''), b1.C_DOC_ID, b1.C_FOLDER_ID, (
	select  k1.ID A$1
	from Z#R2_LOAN k1
	where k1.ID = b1.C_PRODUCT and ROWNUM = 1
), (
	select  l1.ID A$1
	from Z#R2_DEPOSIT l1
	where l1.ID = b1.C_PRODUCT and ROWNUM = 1
), P_TUNE
from Z#R2_FACT_OPER b1, Z#MAIN_DOCUM a1
where a1.ID = b1.C_DOC and a1.C_DOCUMENT_UNO = ''R2$'' and a1.STATE_ID = ''PROV'' and not (b1.C_STATE_OPER is NULL and NVL(b1.C_CORRECTED,''0'') = ''0'')');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315042957', 4, 1, 'select  a1.C_DATE_OPER, a1.C_DATE_CALC, a1.C_SUMMA_OPER, a1.C_CURRENCY, a1.C_SUMMA_NT, b1.C_ACC_NUM, b1.C_ACC_CORR, null, null, null, null, null, null, NVL((
	select  d1.C_FILIAL A$1
	from Z#R2_DEPOSIT d1
	where d1.ID = a1.C_PRODUCT and ROWNUM = 1
),(
	select  e1.C_FILIAL A$1
	from Z#R2_LOAN e1
	where e1.ID = a1.C_PRODUCT and ROWNUM = 1
)), NVL((
	select  f1.C_DEPART A$1
	from Z#R2_DEPOSIT f1
	where f1.ID = a1.C_PRODUCT and ROWNUM = 1
),(
	select  g1.C_DEPART A$1
	from Z#R2_LOAN g1
	where g1.ID = a1.C_PRODUCT and ROWNUM = 1
)), (case when a1.C_DOC is NULL then null when a1.C_STATE_OPER is NULL and NVL(a1.C_CORRECTED,''0'') = ''0'' then ''Проведена'' when a1.C_STATE_OPER is NULL and NVL(a1.C_CORRECTED,''0'') = ''1'' then ''Сторнирована'' when a1.C_STATE_OPER = 0 then ''На доп.контроле'' when a1.C_STATE_OPER = 1 then ''Ликвидирована'' when a1.C_STATE_OPER = 2 then ''Ануллирована'' else ''Промежуточное состояние: ''||a1.C_STATE_OPER end), null, a1.C_DOC_ID, a1.C_FOLDER_ID, (
	select  h1.ID A$1
	from Z#R2_LOAN h1
	where h1.ID in (b1.C_PRODUCT,b1.C_PRODUCT_CORR) and ROWNUM = 1
), (
	select  i1.ID A$1
	from Z#R2_DEPOSIT i1
	where i1.ID in (b1.C_PRODUCT,b1.C_PRODUCT_CORR) and ROWNUM = 1
), P_TUNE
from Z#AD_RECORDS b1, Z#R2_FACT_OPER a1
where not  exists (
	select  1 A$1
	from Z#MAIN_DOCUM c1
	where c1.ID = a1.C_DOC
) and a1.C_DOC <> (-1) and a1.C_PATTERN is not NULL and a1.C_DOC_ID = b1.C_CORR_ID and a1.C_FOLDER_ID = b1.C_TRANS_ID and a1.C_PATTERN in (b1.C_PATT,b1.C_PATT_CORR)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315042957', 5, 1, 'select  null, null, null, null, null, null, null, a1.C_ACC_DT, a1.C_ACC_KT, a1.C_SUM, a1.C_SUM_PO, a1.C_DATE_PROV, a1.ID, a1.C_FILIAL, a1.C_DEPART, null, LIB.STATE_NAME(a1.STATE_ID,''MAIN_DOCUM''), a1.ID, TO_NUMBER(a1.C_IN_FOLDER), null, null, P_TUNE
from Z#MAIN_DOCUM a1
where not  exists (
	select  1 A$1
	from Z#R2_FACT_OPER b1
	where b1.C_DOC = a1.ID
) and a1.C_DOCUMENT_UNO = ''R2$''');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315042957', 6, 1, 'select  b1.C_DATE_OPER, b1.C_DATE_CALC, b1.C_SUMMA_OPER, b1.C_CURRENCY, b1.C_SUMMA_NT, (
	select  c1.C_ACC_NUM A$1
	from Z#AD_RECORDS c1
	where b1.C_PATTERN is not NULL and  exists (
		select  1 A$1
		from Z#R2_ACC d1
		where c1.C_ACC_NUM = d1.C_NUM_ACC
	) and b1.C_DOC_ID = c1.C_CORR_ID and b1.C_FOLDER_ID = c1.C_TRANS_ID and b1.C_PATTERN in (c1.C_PATT,c1.C_PATT_CORR) and ROWNUM = 1
), (
	select  e1.C_ACC_CORR A$1
	from Z#AD_RECORDS e1
	where b1.C_PATTERN is not NULL and  exists (
		select  1 A$1
		from Z#R2_ACC f1
		where e1.C_ACC_CORR = f1.C_NUM_ACC
	) and b1.C_DOC_ID = e1.C_CORR_ID and b1.C_FOLDER_ID = e1.C_TRANS_ID and b1.C_PATTERN in (e1.C_PATT,e1.C_PATT_CORR) and ROWNUM = 1
), a1.C_ACC_DT, a1.C_ACC_KT, a1.C_SUM, a1.C_SUM_PO, a1.C_DATE_PROV, a1.ID, NVL((
	select  g1.C_FILIAL A$1
	from Z#R2_DEPOSIT g1
	where g1.ID = b1.C_PRODUCT and ROWNUM = 1
),(
	select  h1.C_FILIAL A$1
	from Z#R2_LOAN h1
	where h1.ID = b1.C_PRODUCT and ROWNUM = 1
)), NVL((
	select  i1.C_DEPART A$1
	from Z#R2_DEPOSIT i1
	where i1.ID = b1.C_PRODUCT and ROWNUM = 1
),(
	select  j1.C_DEPART A$1
	from Z#R2_LOAN j1
	where j1.ID = b1.C_PRODUCT and ROWNUM = 1
)), (case when b1.C_DOC is NULL then null when b1.C_STATE_OPER is NULL and NVL(b1.C_CORRECTED,''0'') = ''0'' then ''Проведена'' when b1.C_STATE_OPER is NULL and NVL(b1.C_CORRECTED,''0'') = ''1'' then ''Сторнирована'' when b1.C_STATE_OPER = 0 then ''На доп.контроле'' when b1.C_STATE_OPER = 1 then ''Ликвидирована'' when b1.C_STATE_OPER = 2 then ''Ануллирована'' else ''Промежуточное состояние: ''||b1.C_STATE_OPER end), LIB.STATE_NAME(a1.STATE_ID,''MAIN_DOCUM''), b1.C_DOC_ID, b1.C_FOLDER_ID, (
	select  k1.ID A$1
	from Z#R2_LOAN k1
	where k1.ID = b1.C_PRODUCT and ROWNUM = 1
), (
	select  l1.ID A$1
	from Z#R2_DEPOSIT l1
	where l1.ID = b1.C_PRODUCT and ROWNUM = 1
), P_TUNE
from Z#R2_FACT_OPER b1, Z#MAIN_DOCUM a1
where a1.ID = b1.C_DOC and a1.C_DOCUMENT_UNO = ''FROMRETAILSUM'' and a1.STATE_ID <> ''PROV'' and (b1.C_STATE_OPER is NULL and NVL(b1.C_CORRECTED,''0'') = ''0'')');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315042957', 7, 1, 'select  b1.C_DATE_OPER, b1.C_DATE_CALC, b1.C_SUMMA_OPER, b1.C_CURRENCY, b1.C_SUMMA_NT, (
	select  c1.C_ACC_NUM A$1
	from Z#AD_RECORDS c1
	where b1.C_PATTERN is not NULL and  exists (
		select  1 A$1
		from Z#R2_ACC d1
		where c1.C_ACC_NUM = d1.C_NUM_ACC
	) and b1.C_DOC_ID = c1.C_CORR_ID and b1.C_FOLDER_ID = c1.C_TRANS_ID and b1.C_PATTERN in (c1.C_PATT,c1.C_PATT_CORR) and ROWNUM = 1
), (
	select  e1.C_ACC_CORR A$1
	from Z#AD_RECORDS e1
	where b1.C_PATTERN is not NULL and  exists (
		select  1 A$1
		from Z#R2_ACC f1
		where e1.C_ACC_CORR = f1.C_NUM_ACC
	) and b1.C_DOC_ID = e1.C_CORR_ID and b1.C_FOLDER_ID = e1.C_TRANS_ID and b1.C_PATTERN in (e1.C_PATT,e1.C_PATT_CORR) and ROWNUM = 1
), a1.C_ACC_DT, a1.C_ACC_KT, a1.C_SUM, a1.C_SUM_PO, a1.C_DATE_PROV, a1.ID, NVL((
	select  g1.C_FILIAL A$1
	from Z#R2_DEPOSIT g1
	where g1.ID = b1.C_PRODUCT and ROWNUM = 1
),(
	select  h1.C_FILIAL A$1
	from Z#R2_LOAN h1
	where h1.ID = b1.C_PRODUCT and ROWNUM = 1
)), NVL((
	select  i1.C_DEPART A$1
	from Z#R2_DEPOSIT i1
	where i1.ID = b1.C_PRODUCT and ROWNUM = 1
),(
	select  j1.C_DEPART A$1
	from Z#R2_LOAN j1
	where j1.ID = b1.C_PRODUCT and ROWNUM = 1
)), (case when b1.C_DOC is NULL then null when b1.C_STATE_OPER is NULL and NVL(b1.C_CORRECTED,''0'') = ''0'' then ''Проведена'' when b1.C_STATE_OPER is NULL and NVL(b1.C_CORRECTED,''0'') = ''1'' then ''Сторнирована'' when b1.C_STATE_OPER = 0 then ''На доп.контроле'' when b1.C_STATE_OPER = 1 then ''Ликвидирована'' when b1.C_STATE_OPER = 2 then ''Ануллирована'' else ''Промежуточное состояние: ''||b1.C_STATE_OPER end), LIB.STATE_NAME(a1.STATE_ID,''MAIN_DOCUM''), b1.C_DOC_ID, b1.C_FOLDER_ID, (
	select  k1.ID A$1
	from Z#R2_LOAN k1
	where k1.ID = b1.C_PRODUCT and ROWNUM = 1
), (
	select  l1.ID A$1
	from Z#R2_DEPOSIT l1
	where l1.ID = b1.C_PRODUCT and ROWNUM = 1
), P_TUNE
from Z#R2_FACT_OPER b1, Z#MAIN_DOCUM a1
where a1.ID = b1.C_DOC and a1.C_DOCUMENT_UNO = ''FROMRETAILSUM'' and a1.STATE_ID = ''PROV'' and not (b1.C_STATE_OPER is NULL and NVL(b1.C_CORRECTED,''0'') = ''0'')');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315042957', 8, 1, 'select  b1.C_DATE_OPER, b1.C_DATE_CALC, b1.C_SUMMA_OPER, b1.C_CURRENCY, b1.C_SUMMA_NT, (
	select  c1.C_ACC_NUM A$1
	from Z#AD_RECORDS c1
	where b1.C_PATTERN is not NULL and  exists (
		select  1 A$1
		from Z#R2_ACC d1
		where c1.C_ACC_NUM = d1.C_NUM_ACC
	) and b1.C_DOC_ID = c1.C_CORR_ID and b1.C_FOLDER_ID = c1.C_TRANS_ID and b1.C_PATTERN in (c1.C_PATT,c1.C_PATT_CORR) and ROWNUM = 1
), (
	select  e1.C_ACC_CORR A$1
	from Z#AD_RECORDS e1
	where b1.C_PATTERN is not NULL and  exists (
		select  1 A$1
		from Z#R2_ACC f1
		where e1.C_ACC_CORR = f1.C_NUM_ACC
	) and b1.C_DOC_ID = e1.C_CORR_ID and b1.C_FOLDER_ID = e1.C_TRANS_ID and b1.C_PATTERN in (e1.C_PATT,e1.C_PATT_CORR) and ROWNUM = 1
), a1.C_ACC_DT, a1.C_ACC_KT, a1.C_SUM, a1.C_SUM_PO, a1.C_DATE_PROV, a1.ID, NVL((
	select  g1.C_FILIAL A$1
	from Z#R2_DEPOSIT g1
	where g1.ID = b1.C_PRODUCT and ROWNUM = 1
),(
	select  h1.C_FILIAL A$1
	from Z#R2_LOAN h1
	where h1.ID = b1.C_PRODUCT and ROWNUM = 1
)), NVL((
	select  i1.C_DEPART A$1
	from Z#R2_DEPOSIT i1
	where i1.ID = b1.C_PRODUCT and ROWNUM = 1
),(
	select  j1.C_DEPART A$1
	from Z#R2_LOAN j1
	where j1.ID = b1.C_PRODUCT and ROWNUM = 1
)), (case when b1.C_DOC is NULL then null when b1.C_STATE_OPER is NULL and NVL(b1.C_CORRECTED,''0'') = ''0'' then ''Проведена'' when b1.C_STATE_OPER is NULL and NVL(b1.C_CORRECTED,''0'') = ''1'' then ''Сторнирована'' when b1.C_STATE_OPER = 0 then ''На доп.контроле'' when b1.C_STATE_OPER = 1 then ''Ликвидирована'' when b1.C_STATE_OPER = 2 then ''Ануллирована'' else ''Промежуточное состояние: ''||b1.C_STATE_OPER end), LIB.STATE_NAME(a1.STATE_ID,''MAIN_DOCUM''), b1.C_DOC_ID, b1.C_FOLDER_ID, (
	select  k1.ID A$1
	from Z#R2_LOAN k1
	where k1.ID = b1.C_PRODUCT and ROWNUM = 1
), (
	select  l1.ID A$1
	from Z#R2_DEPOSIT l1
	where l1.ID = b1.C_PRODUCT and ROWNUM = 1
), P_TUNE
from Z#R2_FACT_OPER b1, Z#MAIN_DOCUM a1
where a1.ID = b1.C_DOC and a1.C_DOCUMENT_UNO = ''FROMRETAILSUM'' and a1.STATE_ID = ''PROV'' and (b1.C_STATE_OPER is NULL and NVL(b1.C_CORRECTED,''0'') = ''0'') and NVL(b1.C_S');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315042957', 9, 1, 'select  b1.C_DATE_OPER, b1.C_DATE_CALC, b1.C_SUMMA_OPER, b1.C_CURRENCY, b1.C_SUMMA_NT, (
	select  c1.C_ACC_NUM A$1
	from Z#AD_RECORDS c1
	where b1.C_PATTERN is not NULL and  exists (
		select  1 A$1
		from Z#R2_ACC d1
		where c1.C_ACC_NUM = d1.C_NUM_ACC
	) and b1.C_DOC_ID = c1.C_CORR_ID and b1.C_FOLDER_ID = c1.C_TRANS_ID and b1.C_PATTERN in (c1.C_PATT,c1.C_PATT_CORR) and ROWNUM = 1
), (
	select  e1.C_ACC_CORR A$1
	from Z#AD_RECORDS e1
	where b1.C_PATTERN is not NULL and  exists (
		select  1 A$1
		from Z#R2_ACC f1
		where e1.C_ACC_CORR = f1.C_NUM_ACC
	) and b1.C_DOC_ID = e1.C_CORR_ID and b1.C_FOLDER_ID = e1.C_TRANS_ID and b1.C_PATTERN in (e1.C_PATT,e1.C_PATT_CORR) and ROWNUM = 1
), a1.C_ACC_DT, a1.C_ACC_KT, a1.C_SUM, a1.C_SUM_PO, a1.C_DATE_PROV, a1.ID, NVL((
	select  g1.C_FILIAL A$1
	from Z#R2_DEPOSIT g1
	where g1.ID = b1.C_PRODUCT and ROWNUM = 1
),(
	select  h1.C_FILIAL A$1
	from Z#R2_LOAN h1
	where h1.ID = b1.C_PRODUCT and ROWNUM = 1
)), NVL((
	select  i1.C_DEPART A$1
	from Z#R2_DEPOSIT i1
	where i1.ID = b1.C_PRODUCT and ROWNUM = 1
),(
	select  j1.C_DEPART A$1
	from Z#R2_LOAN j1
	where j1.ID = b1.C_PRODUCT and ROWNUM = 1
)), (case when b1.C_DOC is NULL then null when b1.C_STATE_OPER is NULL and NVL(b1.C_CORRECTED,''0'') = ''0'' then ''Проведена'' when b1.C_STATE_OPER is NULL and NVL(b1.C_CORRECTED,''0'') = ''1'' then ''Сторнирована'' when b1.C_STATE_OPER = 0 then ''На доп.контроле'' when b1.C_STATE_OPER = 1 then ''Ликвидирована'' when b1.C_STATE_OPER = 2 then ''Ануллирована'' else ''Промежуточное состояние: ''||b1.C_STATE_OPER end), LIB.STATE_NAME(a1.STATE_ID,''MAIN_DOCUM''), b1.C_DOC_ID, b1.C_FOLDER_ID, (
	select  k1.ID A$1
	from Z#R2_LOAN k1
	where k1.ID = b1.C_PRODUCT and ROWNUM = 1
), (
	select  l1.ID A$1
	from Z#R2_DEPOSIT l1
	where l1.ID = b1.C_PRODUCT and ROWNUM = 1
), P_TUNE
from Z#R2_FACT_OPER b1, Z#MAIN_DOCUM a1
where a1.ID = b1.C_DOC and a1.C_DOCUMENT_UNO = ''FROMRETAILSUM'' and NVL(a1.C_DATE_PROV,DUMMY_DATE) <> NVL(b1.C_DATE_CALC,DUMMY_DATE)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315042957', 10, 1, 'select  b1.C_DATE_OPER, b1.C_DATE_CALC, b1.C_SUMMA_OPER, b1.C_CURRENCY, b1.C_SUMMA_NT, (
	select  g1.C_ACC_NUM A$1
	from Z#AD_RECORDS g1
	where b1.C_PATTERN is not NULL and  exists (
		select  1 A$1
		from Z#R2_ACC h1
		where g1.C_ACC_NUM = h1.C_NUM_ACC
	) and b1.C_DOC_ID = g1.C_CORR_ID and b1.C_FOLDER_ID = g1.C_TRANS_ID and b1.C_PATTERN in (g1.C_PATT,g1.C_PATT_CORR) and ROWNUM = 1
), (
	select  i1.C_ACC_CORR A$1
	from Z#AD_RECORDS i1
	where b1.C_PATTERN is not NULL and  exists (
		select  1 A$1
		from Z#R2_ACC j1
		where i1.C_ACC_CORR = j1.C_NUM_ACC
	) and b1.C_DOC_ID = i1.C_CORR_ID and b1.C_FOLDER_ID = i1.C_TRANS_ID and b1.C_PATTERN in (i1.C_PATT,i1.C_PATT_CORR) and ROWNUM = 1
), a1.C_ACC_DT, a1.C_ACC_KT, a1.C_SUM, a1.C_SUM_PO, a1.C_DATE_PROV, a1.ID, NVL((
	select  k1.C_FILIAL A$1
	from Z#R2_DEPOSIT k1
	where k1.ID = b1.C_PRODUCT and ROWNUM = 1
),(
	select  l1.C_FILIAL A$1
	from Z#R2_LOAN l1
	where l1.ID = b1.C_PRODUCT and ROWNUM = 1
)), NVL((
	select  m1.C_DEPART A$1
	from Z#R2_DEPOSIT m1
	where m1.ID = b1.C_PRODUCT and ROWNUM = 1
),(
	select  n1.C_DEPART A$1
	from Z#R2_LOAN n1
	where n1.ID = b1.C_PRODUCT and ROWNUM = 1
)), (case when b1.C_DOC is NULL then null when b1.C_STATE_OPER is NULL and NVL(b1.C_CORRECTED,''0'') = ''0'' then ''Проведена'' when b1.C_STATE_OPER is NULL and NVL(b1.C_CORRECTED,''0'') = ''1'' then ''Сторнирована'' when b1.C_STATE_OPER = 0 then ''На доп.контроле'' when b1.C_STATE_OPER = 1 then ''Ликвидирована'' when b1.C_STATE_OPER = 2 then ''Ануллирована'' else ''Промежуточное состояние: ''||b1.C_STATE_OPER end), LIB.STATE_NAME(a1.STATE_ID,''MAIN_DOCUM''), b1.C_DOC_ID, b1.C_FOLDER_ID, (
	select  o1.ID A$1
	from Z#R2_LOAN o1
	where o1.ID = b1.C_PRODUCT and ROWNUM = 1
), (
	select  p1.ID A$1
	from Z#R2_DEPOSIT p1
	where p1.ID = b1.C_PRODUCT and ROWNUM = 1
), P_TUNE
from Z#R2_FACT_OPER b1, Z#AC_FIN a2, Z#MAIN_DOCUM a1
where a1.ID = b1.C_DOC and a1.C_DOCUMENT_UNO = ''FROMRETAILSUM'' and ((a1.C_ACC_DT=a2.id and (NVL(a2.C_MAIN_V_ID,''*'') <> NVL((
	select  c1.C_ACC_NUM A$1
	f');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315042957', 10, 2, 'rom Z#AD_RECORDS c1
	where b1.C_PATTERN is not NULL and  exists (
		select  1 A$1
		from Z#R2_ACC d1
		where c1.C_ACC_NUM = d1.C_NUM_ACC
	) and b1.C_DOC_ID = c1.C_CORR_ID and b1.C_FOLDER_ID = c1.C_TRANS_ID and b1.C_PATTERN in (c1.C_PATT,c1.C_PATT_CORR) and ROWNUM = 1
),''*''))) or (a1.C_ACC_KT=a2.id and (NVL(a2.C_MAIN_V_ID,''*'') <> NVL((
	select  e1.C_ACC_CORR A$1
	from Z#AD_RECORDS e1
	where b1.C_PATTERN is not NULL and  exists (
		select  1 A$1
		from Z#R2_ACC f1
		where e1.C_ACC_CORR = f1.C_NUM_ACC
	) and b1.C_DOC_ID = e1.C_CORR_ID and b1.C_FOLDER_ID = e1.C_TRANS_ID and b1.C_PATTERN in (e1.C_PATT,e1.C_PATT_CORR) and ROWNUM = 1
),''*''))))');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315043179', 1, 1, 'update Z#R2_FACT_OPER a1 set
	a1.SN=nvl(a1.SN,1)+1, a1.SU=rtl.uid$, a1.C_DOC = ID_NEW
	where FILAIL = (
		select  b1.C_FILIAL A$1
		from Z#R2_LOAN b1
		where a1.C_PRODUCT = b1.ID
	) and a1.C_DOC = ID_OLD');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315043179', 2, 1, 'update Z#R2_FACT_OPER a1 set
	a1.SN=nvl(a1.SN,1)+1, a1.SU=rtl.uid$, a1.C_DOC = ID_NEW
	where FILAIL = (
		select  b1.C_FILIAL A$1
		from Z#R2_DEPOSIT b1
		where a1.C_PRODUCT = b1.ID
	) and a1.C_DOC = ID_OLD');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315053481', 1, 1, 'delete from Z#R2_DEP_SRC_FIN_A a1
	where a1.C_PRODUCT = plp$THIS and a1.C_PN = PN');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315053481', 2, 1, 'delete from Z#R2_DEP_TRANSFER a1
	where a1.C_PRODUCT = plp$THIS and a1.C_PN = PN');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315053481', 3, 1, 'select  a1.ROWID, ''R2_FACT_OPER'', to_number(''''), '''', a1.C_DATE_OPER, a1.C_VID_OPER, a1.C_SUMMA_OPER, a1.C_CURRENCY, a1.C_PN, a1.C_STATE_OPER, a1.C_PRODUCT, a1.C_CLASS_NAME, a1.C_FOLDER_ID, a1.C_DOC_ID, a1.C_BASE_PAY, a1.C_SPLIT_DEBT, a1.C_PATTERN, a1.C_DOC, a1.C_SN, a1.C_DATE_CALC, a1.C_CLASS_BASE_PAY, a1.C_RATE_OPER, a1.C_CORRECTION_FO, a1.C_CORRECTED, a1.C_SUMMA_NT
from Z#R2_FACT_OPER a1
where a1.C_PRODUCT in (plp$THIS,(-plp$THIS)) and a1.C_PN = PN
order by a1.C_DATE_OPER,a1.C_SN');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312672968', 3, 1, 'select  GROUPING_ID(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC), case when GROUPING_ID(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC) = 3 then ''Валюта ''||a1.CODE_ISO||'':'' when GROUPING_ID(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC) = 0 then a1.CL_NAME when GROUPING_ID(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC) = 7 then ''Итого по валюте ''||a1.CODE_ISO||'':'' else '''' end, a1.ACC, a1.CODE_ISO, SUM(a1.SUMMA)
from (
	select  b1.ACC ACC, b2.C_CODE_ISO CODE_ISO, b1.SUMMA SUMMA, e2.C_NAME CL_NAME
	from Z#R2_FACT_OPER f1, Z#CLIENT e2, Z#R2_DEPOSIT e1, Z#FT_MONEY b2, (
		select  c1.C_REP_DATE REP_DATE, c1.C_VAL_DT VAL, c1.C_ACC_NUM ACC, c1.C_SUMMA_DT SUMMA, c1.C_CORR_ID CORR_ID, c1.C_TRANS_ID TRANS_ID, c1.C_PRODUCT PRODUCT
		from Z#AD_RECORDS c1
		union all
		select  d1.C_REP_DATE REP_DATE, d1.C_VAL_KT VAL, d1.C_ACC_CORR ACC, d1.C_SUMMA_KT SUMMA, d1.C_CORR_ID CORR_ID, d1.C_TRANS_ID TRANS_ID, d1.C_PRODUCT_CORR PRODUCT
		from Z#AD_RECORDS d1
	) b1
	where b1.VAL=b2.id(+) and e1.C_CLIENT=e2.id(+)
	  and (TRUNC(b1.REP_DATE) = P_DATE and f1.C_CLASS_NAME = ''R2_DEPOSIT'' and SUBSTR(b1.ACC,1,5) = ''47411'' and COALESCE(e1.C_DATE_CLOSE,P_DATE) >= P_DATE and b1.PRODUCT = e1.ID and b1.CORR_ID = f1.C_DOC_ID and b1.TRANS_ID = f1.C_FOLDER_ID and e1.C_PN = f1.C_PN and INSTR(V_LISTPROC,f1.C_VID_OPER||'','') > 0 and ((f1.C_STATE_OPER is NULL and NVL(f1.C_CORRECTED,''0'') = 0) and f1.C_CORRECTION_FO is NULL))
) a1
group by ROLLUP(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC)
having GROUPING_ID(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC) in (0,3,7)
order by a1.CODE_ISO,case when GROUPING_ID(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC) = 3 then 1 when GROUPING_ID(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC) = 0 then 2 when GROUPING_ID(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC) = 7 then 3 else 999 end,a1.ACC');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312672968', 4, 1, 'select  GROUPING_ID(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC), case when GROUPING_ID(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC) = 3 then ''Валюта ''||a1.CODE_ISO||'':'' when GROUPING_ID(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC) = 0 then a1.CL_NAME when GROUPING_ID(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC) = 7 then ''Итого по валюте ''||a1.CODE_ISO||'':'' else '''' end, a1.ACC, a1.CODE_ISO, SUM(a1.SUMMA)
from (
	select  b1.ACC ACC, b2.C_CODE_ISO CODE_ISO, b1.SUMMA SUMMA, e2.C_NAME CL_NAME
	from Z#R2_FACT_OPER f1, Z#CLIENT e2, Z#R2_DEPOSIT e1, Z#FT_MONEY b2, (
		select  c1.C_REP_DATE REP_DATE, c1.C_VAL_DT VAL, c1.C_ACC_NUM ACC, c1.C_SUMMA_DT SUMMA, c1.C_CORR_ID CORR_ID, c1.C_TRANS_ID TRANS_ID, c1.C_PRODUCT PRODUCT
		from Z#AD_RECORDS c1
		union all
		select  d1.C_REP_DATE REP_DATE, d1.C_VAL_KT VAL, d1.C_ACC_CORR ACC, d1.C_SUMMA_KT SUMMA, d1.C_CORR_ID CORR_ID, d1.C_TRANS_ID TRANS_ID, d1.C_PRODUCT_CORR PRODUCT
		from Z#AD_RECORDS d1
	) b1
	where b1.VAL=b2.id(+) and e1.C_CLIENT=e2.id(+)
	  and (TRUNC(b1.REP_DATE) = P_DATE and f1.C_CLASS_NAME = ''R2_DEPOSIT'' and SUBSTR(b1.ACC,1,5) = ''47411'' and COALESCE(e1.C_DATE_CLOSE,P_DATE) >= P_DATE and b1.PRODUCT = e1.ID and b1.CORR_ID = f1.C_DOC_ID and b1.TRANS_ID = f1.C_FOLDER_ID and e1.C_PN = f1.C_PN and INSTR(V_LISTPROC,f1.C_VID_OPER||'','') > 0 and ((f1.C_STATE_OPER is NULL and NVL(f1.C_CORRECTED,''0'') = 0) and f1.C_CORRECTION_FO is NULL) and b1.VAL = P_CURRENCY)
) a1
group by ROLLUP(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC)
having GROUPING_ID(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC) in (0,3,7)
order by a1.CODE_ISO,case when GROUPING_ID(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC) = 3 then 1 when GROUPING_ID(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC) = 0 then 2 when GROUPING_ID(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC) = 7 then 3 else 999 end,a1.ACC');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312672968', 5, 1, 'select  GROUPING_ID(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC), case when GROUPING_ID(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC) = 3 then ''Валюта ''||a1.CODE_ISO||'':'' when GROUPING_ID(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC) = 0 then a1.CL_NAME when GROUPING_ID(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC) = 7 then ''Итого по валюте ''||a1.CODE_ISO||'':'' else '''' end, a1.ACC, a1.CODE_ISO, SUM(a1.SUMMA)
from (
	select  b1.ACC ACC, b2.C_CODE_ISO CODE_ISO, b1.SUMMA SUMMA, e2.C_NAME CL_NAME
	from Z#R2_FACT_OPER f1, Z#CLIENT e2, Z#R2_DEPOSIT e1, Z#FT_MONEY b2, (
		select  c1.C_REP_DATE REP_DATE, c1.C_VAL_DT VAL, c1.C_ACC_NUM ACC, c1.C_SUMMA_DT SUMMA, c1.C_CORR_ID CORR_ID, c1.C_TRANS_ID TRANS_ID, c1.C_PRODUCT PRODUCT
		from Z#AD_RECORDS c1
		union all
		select  d1.C_REP_DATE REP_DATE, d1.C_VAL_KT VAL, d1.C_ACC_CORR ACC, d1.C_SUMMA_KT SUMMA, d1.C_CORR_ID CORR_ID, d1.C_TRANS_ID TRANS_ID, d1.C_PRODUCT_CORR PRODUCT
		from Z#AD_RECORDS d1
	) b1
	where b1.VAL=b2.id(+) and e1.C_CLIENT=e2.id(+)
	  and (TRUNC(b1.REP_DATE) = P_DATE and f1.C_CLASS_NAME = ''R2_DEPOSIT'' and SUBSTR(b1.ACC,1,5) = ''47411'' and COALESCE(e1.C_DATE_CLOSE,P_DATE) >= P_DATE and b1.PRODUCT = e1.ID and b1.CORR_ID = f1.C_DOC_ID and b1.TRANS_ID = f1.C_FOLDER_ID and e1.C_PN = f1.C_PN and INSTR(V_LISTPROC,f1.C_VID_OPER||'','') > 0 and ((f1.C_STATE_OPER is NULL and NVL(f1.C_CORRECTED,''0'') = 0) and f1.C_CORRECTION_FO is NULL) and e1.C_DEPART = P_DEPART)
) a1
group by ROLLUP(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC)
having GROUPING_ID(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC) in (0,3,7)
order by a1.CODE_ISO,case when GROUPING_ID(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC) = 3 then 1 when GROUPING_ID(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC) = 0 then 2 when GROUPING_ID(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC) = 7 then 3 else 999 end,a1.ACC');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312672968', 6, 1, 'select  GROUPING_ID(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC), case when GROUPING_ID(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC) = 3 then ''Валюта ''||a1.CODE_ISO||'':'' when GROUPING_ID(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC) = 0 then a1.CL_NAME when GROUPING_ID(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC) = 7 then ''Итого по валюте ''||a1.CODE_ISO||'':'' else '''' end, a1.ACC, a1.CODE_ISO, SUM(a1.SUMMA)
from (
	select  b1.ACC ACC, b2.C_CODE_ISO CODE_ISO, b1.SUMMA SUMMA, e2.C_NAME CL_NAME
	from Z#R2_FACT_OPER f1, Z#DEPART e3, Z#CLIENT e2, Z#R2_DEPOSIT e1, Z#FT_MONEY b2, (
		select  c1.C_REP_DATE REP_DATE, c1.C_VAL_DT VAL, c1.C_ACC_NUM ACC, c1.C_SUMMA_DT SUMMA, c1.C_CORR_ID CORR_ID, c1.C_TRANS_ID TRANS_ID, c1.C_PRODUCT PRODUCT
		from Z#AD_RECORDS c1
		union all
		select  d1.C_REP_DATE REP_DATE, d1.C_VAL_KT VAL, d1.C_ACC_CORR ACC, d1.C_SUMMA_KT SUMMA, d1.C_CORR_ID CORR_ID, d1.C_TRANS_ID TRANS_ID, d1.C_PRODUCT_CORR PRODUCT
		from Z#AD_RECORDS d1
	) b1
	where b1.VAL=b2.id(+) and e1.C_CLIENT=e2.id(+) and e1.C_DEPART=e3.id
	  and (TRUNC(b1.REP_DATE) = P_DATE and f1.C_CLASS_NAME = ''R2_DEPOSIT'' and SUBSTR(b1.ACC,1,5) = ''47411'' and COALESCE(e1.C_DATE_CLOSE,P_DATE) >= P_DATE and b1.PRODUCT = e1.ID and b1.CORR_ID = f1.C_DOC_ID and b1.TRANS_ID = f1.C_FOLDER_ID and e1.C_PN = f1.C_PN and INSTR(V_LISTPROC,f1.C_VID_OPER||'','') > 0 and ((f1.C_STATE_OPER is NULL and NVL(f1.C_CORRECTED,''0'') = 0) and f1.C_CORRECTION_FO is NULL) and e3.C_CODE like plp$6$1||''%'')
) a1
group by ROLLUP(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC)
having GROUPING_ID(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC) in (0,3,7)
order by a1.CODE_ISO,case when GROUPING_ID(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC) = 3 then 1 when GROUPING_ID(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC) = 0 then 2 when GROUPING_ID(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC) = 7 then 3 else 999 end,a1.ACC');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312672968', 7, 1, 'select  GROUPING_ID(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC), case when GROUPING_ID(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC) = 3 then ''Валюта ''||a1.CODE_ISO||'':'' when GROUPING_ID(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC) = 0 then a1.CL_NAME when GROUPING_ID(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC) = 7 then ''Итого по валюте ''||a1.CODE_ISO||'':'' else '''' end, a1.ACC, a1.CODE_ISO, SUM(a1.SUMMA)
from (
	select  b1.ACC ACC, b2.C_CODE_ISO CODE_ISO, b1.SUMMA SUMMA, e2.C_NAME CL_NAME
	from Z#R2_FACT_OPER f1, Z#CLIENT e2, Z#R2_DEPOSIT e1, Z#FT_MONEY b2, (
		select  c1.C_REP_DATE REP_DATE, c1.C_VAL_DT VAL, c1.C_ACC_NUM ACC, c1.C_SUMMA_DT SUMMA, c1.C_CORR_ID CORR_ID, c1.C_TRANS_ID TRANS_ID, c1.C_PRODUCT PRODUCT
		from Z#AD_RECORDS c1
		union all
		select  d1.C_REP_DATE REP_DATE, d1.C_VAL_KT VAL, d1.C_ACC_CORR ACC, d1.C_SUMMA_KT SUMMA, d1.C_CORR_ID CORR_ID, d1.C_TRANS_ID TRANS_ID, d1.C_PRODUCT_CORR PRODUCT
		from Z#AD_RECORDS d1
	) b1
	where b1.VAL=b2.id(+) and e1.C_CLIENT=e2.id(+)
	  and (TRUNC(b1.REP_DATE) = P_DATE and f1.C_CLASS_NAME = ''R2_DEPOSIT'' and SUBSTR(b1.ACC,1,5) = ''47411'' and COALESCE(e1.C_DATE_CLOSE,P_DATE) >= P_DATE and b1.PRODUCT = e1.ID and b1.CORR_ID = f1.C_DOC_ID and b1.TRANS_ID = f1.C_FOLDER_ID and e1.C_PN = f1.C_PN and INSTR(V_LISTPROC,f1.C_VID_OPER||'','') > 0 and ((f1.C_STATE_OPER is NULL and NVL(f1.C_CORRECTED,''0'') = 0) and f1.C_CORRECTION_FO is NULL) and e1.C_DEPART = P_DEPART and b1.VAL = P_CURRENCY)
) a1
group by ROLLUP(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC)
having GROUPING_ID(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC) in (0,3,7)
order by a1.CODE_ISO,case when GROUPING_ID(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC) = 3 then 1 when GROUPING_ID(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC) = 0 then 2 when GROUPING_ID(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC) = 7 then 3 else 999 end,a1.ACC');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312672968', 8, 1, 'select  GROUPING_ID(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC), case when GROUPING_ID(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC) = 3 then ''Валюта ''||a1.CODE_ISO||'':'' when GROUPING_ID(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC) = 0 then a1.CL_NAME when GROUPING_ID(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC) = 7 then ''Итого по валюте ''||a1.CODE_ISO||'':'' else '''' end, a1.ACC, a1.CODE_ISO, SUM(a1.SUMMA)
from (
	select  b1.ACC ACC, b2.C_CODE_ISO CODE_ISO, b1.SUMMA SUMMA, e2.C_NAME CL_NAME
	from Z#R2_FACT_OPER f1, Z#DEPART e3, Z#CLIENT e2, Z#R2_DEPOSIT e1, Z#FT_MONEY b2, (
		select  c1.C_REP_DATE REP_DATE, c1.C_VAL_DT VAL, c1.C_ACC_NUM ACC, c1.C_SUMMA_DT SUMMA, c1.C_CORR_ID CORR_ID, c1.C_TRANS_ID TRANS_ID, c1.C_PRODUCT PRODUCT
		from Z#AD_RECORDS c1
		union all
		select  d1.C_REP_DATE REP_DATE, d1.C_VAL_KT VAL, d1.C_ACC_CORR ACC, d1.C_SUMMA_KT SUMMA, d1.C_CORR_ID CORR_ID, d1.C_TRANS_ID TRANS_ID, d1.C_PRODUCT_CORR PRODUCT
		from Z#AD_RECORDS d1
	) b1
	where b1.VAL=b2.id(+) and e1.C_CLIENT=e2.id(+) and e1.C_DEPART=e3.id
	  and (TRUNC(b1.REP_DATE) = P_DATE and f1.C_CLASS_NAME = ''R2_DEPOSIT'' and SUBSTR(b1.ACC,1,5) = ''47411'' and COALESCE(e1.C_DATE_CLOSE,P_DATE) >= P_DATE and b1.PRODUCT = e1.ID and b1.CORR_ID = f1.C_DOC_ID and b1.TRANS_ID = f1.C_FOLDER_ID and e1.C_PN = f1.C_PN and INSTR(V_LISTPROC,f1.C_VID_OPER||'','') > 0 and ((f1.C_STATE_OPER is NULL and NVL(f1.C_CORRECTED,''0'') = 0) and f1.C_CORRECTION_FO is NULL) and e3.C_CODE like plp$8$1||''%'' and b1.VAL = P_CURRENCY)
) a1
group by ROLLUP(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC)
having GROUPING_ID(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC) in (0,3,7)
order by a1.CODE_ISO,case when GROUPING_ID(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC) = 3 then 1 when GROUPING_ID(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC) = 0 then 2 when GROUPING_ID(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC) = 7 then 3 else 999 end,a1.ACC');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3313425670', 9, 1, 'select  SUBSTR(a1.C_NUM_ACC,1,8)||SUBSTR(a1.C_NUM_ACC,10,4), ''0000000'', ''9999999'', NVL(b2.C_HIGH,b1.C_DEPART), b1.C_FILIAL, b3.C_CODE, b3.C_BANK, b1.C_FINTOOL, null
from Z#BRANCH b3, Z#DEPART b2, Z#AC_FIN b1, Z#R2_TYPE_ACC a2, Z#R2_ACC a1
where a1.C_TYPE_ACC=a2.id and b1.C_DEPART=b2.id(+) and b1.C_FILIAL=b3.id
  and (a2.C_IS_COMMON = ''0'' and a1.C_AC_FIN = b1.ID and not a1.C_NUM_ACC is NULL)
group by SUBSTR(a1.C_NUM_ACC,1,8)||SUBSTR(a1.C_NUM_ACC,10,4),NVL(b2.C_HIGH,b1.C_DEPART),b1.C_FILIAL,b3.C_BANK,b3.C_CODE,b1.C_FINTOOL,null');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667664', 1, 1, 'select  a1.C_ID_RES_VID, a1.C_FINTOOL, a1.C_BASE_AMT, 0, a1.C_BASE_AMT, a1.C_ON_DATE, a1.C_ID_RES_VID, a1.C_ACC_RES, a1.C_ACC_CT, a1.C_ACC_DT
from Z#R2_RES_BASE a1
where a1.C_PROD_CLASS = plp$1$1 and a1.C_ID_PROD = R_PORT');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667664', 2, 1, 'select  a1.C_ID_RES_VID, a1.C_FINTOOL, a1.C_ST, SUM(a1.C_BASE_DELTA)
from Z#R2_RES_DELTA a1
where a1.C_PROD_CLASS = plp$2$1 and a1.C_ID_PORT = R_PORT
group by a1.C_ID_RES_VID,a1.C_FINTOOL,a1.C_ST');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312658696', 1, 1, 'update Z#R2_RES_RISK_GR a1 set
	a1.SN=nvl(a1.SN,1)+1, a1.SU=rtl.uid$, a1.C_RES_PRC = plp$P_RES_PRC
	where a1.C_ID_PROD = P_PORT and a1.C_PN = 1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312658696', 2, 1, 'update Z#R2_RES_RISK_GR_H a1 set
	a1.SN=nvl(a1.SN,1)+1, a1.SU=rtl.uid$, a1.C_RES_PRC = plp$P_RES_PRC
	where a1.C_ID_PROD = P_PORT and a1.C_PN = 1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312656733', 1, 1, 'select  a1.id
from Z#R2_ACC_TYPE_REF a1
where a1.COLLECTION_ID=plp$1$1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315043275', 9, 1, 'select  a1.C_ACC_TYPE_REF
from Z#R2_ACC_TYPE_REF a1
where a1.COLLECTION_ID=plp$9$1
  and (a1.C_ACC_TYPE_REF = DEBT_CODE)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315043275', 10, 1, 'insert into Z#R2_ACC_TYPE_REF a1 ( SN,SU, ID,COLLECTION_ID, C_ACC_TYPE_REF )
	values (1,rtl.uid$,SEQ_ID.NEXTVAL,plp$10$1,DEBT_CODE)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312672900', 2, 1, 'select  a1.C_NUM_ACC NUM_ACC, b1.C_DATE_OP DATE_OP, b1.C_DATE_CLOSE DATE_CL, a1.C_PRODUCT PRODUCT, a1.C_CLASS_NAME PRODUCT_CLASS, c2.C_NAME SV_ACC_NAME, c1.C_NOTE SV_ACC_NOTE
from Z#ACCOUNT c2, Z#AC_FIN c1, Z#DEPART b2, Z#R2_AN_ACCOUNT b1, Z#AC_FIN a2, Z#R2_ACC a1
where a1.C_AC_FIN=a2.id and b1.C_DEPART=b2.id(+) and c1.id=c2.id
  and (b1.C_MAIN_V_ID = a1.C_NUM_ACC and a1.C_AC_FIN = c1.ID and ((plp$2$1 = ''1'' and b2.C_CODE like plp$2$2||''%'') or (plp$2$1 = ''0'' and b1.C_DEPART = P_DEPART)) and a2.C_MAIN_USV = P_BAL_ACC and ((V_OPT_DATE.A#0 = 1 and V_OPT_ACC.A#0 = 1 and b1.C_DATE_OP < P_DATE) or (V_OPT_DATE.A#0 = 1 and V_OPT_ACC.A#0 = 2 and b1.C_DATE_OP < P_DATE and (b1.C_DATE_CLOSE is NULL or b1.C_DATE_CLOSE >= P_DATE)) or (V_OPT_DATE.A#0 = 1 and V_OPT_ACC.A#0 = 3 and b1.C_DATE_CLOSE is not NULL and b1.C_DATE_CLOSE < P_DATE) or (V_OPT_DATE.A#0 = 2 and V_OPT_ACC.A#0 = 1 and (b1.C_DATE_OP >= P_DATE_BEG and b1.C_DATE_OP < P_DATE_END+1) or (b1.C_DATE_CLOSE is not NULL and b1.C_DATE_CLOSE >= P_DATE_BEG and b1.C_DATE_CLOSE < P_DATE_END+1)) or (V_OPT_DATE.A#0 = 2 and V_OPT_ACC.A#0 = 2 and b1.C_DATE_OP >= P_DATE_BEG and b1.C_DATE_OP < P_DATE_END+1) or (V_OPT_DATE.A#0 = 2 and V_OPT_ACC.A#0 = 3 and b1.C_DATE_CLOSE is not NULL and b1.C_DATE_CLOSE >= P_DATE_BEG and b1.C_DATE_CLOSE < P_DATE_END+1)))
order by case when V_OPT_ACC.A#0 = 3 then b1.C_DATE_CLOSE else b1.C_DATE_OP end,case when V_OPT_ACC.A#0 = 1 then b1.C_DATE_CLOSE end');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315043310', 5, 1, 'select  a1.id
from Z#R2_ACC_TYPE_REF a1
where a1.COLLECTION_ID=plp$5$1
  and (a1.C_ACC_TYPE_REF = CODE)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315043310', 6, 1, 'insert into Z#R2_ACC_TYPE_REF a1 ( SN,SU, ID,COLLECTION_ID, C_ACC_TYPE_REF )
	values (1,rtl.uid$,SEQ_ID.NEXTVAL,plp$6$1,CODE)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315043310', 11, 1, 'select  a1.ID CC
from Z#R2_ACC_TYPE_REF a1
where a1.COLLECTION_ID=plp$11$1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315043310', 12, 1, 'delete from Z#R2_ACC_TYPE_REF a1
	where a1.COLLECTION_ID=plp$12$1
	  and (a1.ID = COM_CODE.CC)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315043310', 16, 1, 'select  a1.ID CC
from Z#R2_ACC_TYPE_REF a1
where a1.COLLECTION_ID=plp$16$1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315043310', 17, 1, 'delete from Z#R2_ACC_TYPE_REF a1
	where a1.COLLECTION_ID=plp$17$1
	  and (a1.ID = COM_CODE.CC)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315043310', 21, 1, 'select  a1.ID CC
from Z#R2_ACC_TYPE_REF a1
where a1.COLLECTION_ID=plp$21$1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315043310', 22, 1, 'delete from Z#R2_ACC_TYPE_REF a1
	where a1.COLLECTION_ID=plp$22$1
	  and (a1.ID = COM_CODE.CC)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315043310', 26, 1, 'select  a1.ID CC
from Z#R2_ACC_TYPE_REF a1
where a1.COLLECTION_ID=plp$26$1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315043310', 27, 1, 'delete from Z#R2_ACC_TYPE_REF a1
	where a1.COLLECTION_ID=plp$27$1
	  and (a1.ID = COM_CODE.CC)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315043310', 31, 1, 'select  a1.ROWID D
from Z#R2_RES_DELAY a1
where a1.C_RES_VID is NULL');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312675074', 1, 1, 'delete from Z#PROD_TEMP_TBL a1
	where a1.C_SELECT_ID = V_SEQ_ID');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3314648162', 5, 1, 'select  a1.ROWID
from Z#R2_AN_ACCOUNT a1
where a1.C_COM_STATUS = CS_ACC_CLOSE and CHECK_ACC_CLOSE_DATE(OP_DATE,a1.C_DATE_CLOSE,P_FILIAL) = ''1''');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3314648162', 6, 1, 'select  a1.ROWID
from Z#R2_AN_ACCOUNT a1
where a1.C_COM_STATUS in (CS_ACC_CLOSE,CS_ACC_OPEN) and a1.C_FILIAL = P_FILIAL and not  exists (
	select  1 A$1
	from Z#AC_FIN b2, Z#R2_ACC b1
	where b1.C_AC_FIN=b2.id
	  and (b1.C_NUM_ACC = a1.C_MAIN_V_ID and b2.C_FILIAL = a1.C_FILIAL)
) and TRUNC(a1.C_DATE_STAMP) < P_DATE_OP');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312673062', 3, 1, 'select  distinct a1.C_AC_FIN ACC_FIN, a1.C_TYPE_ACC TYPE_ACC, a2.C_FINTOOL ACC_CUR, a3.C_NUM ACC_BS2, a2.C_MAIN_V_ID ACC_NUM
from Z#DEPART a4, Z#PL_USV a3, Z#AC_FIN a2, Z#R2_ACC a1
where a1.C_AC_FIN=a2.id and a2.C_MAIN_USV=a3.id(+) and a2.C_DEPART=a4.id(+)
  and (a1.C_CLASS_NAME = ''R2_LOAN'' and a1.C_DATE_BEG <= P_DATE_BEG and (a1.C_DATE_END is NULL or a1.C_DATE_END >= P_DATE_BEG) and ((P_BS2 is not NULL and a3.C_NUM in (
	select  b1.C_NUM NUM
	from Z#PL_US b1
	where b1.C_NUM = plp$3$3
)) or (P_R2_TYPE_ACC is not NULL and a1.C_TYPE_ACC = P_R2_TYPE_ACC)) and a2.C_FINTOOL = NVL(P_CUR,a2.C_FINTOOL) and (((plp$3$1 = ''1'') and a4.C_CODE like NVL(plp$3$2||''%'',a4.C_CODE||''%'')) or ((plp$3$1 = ''0'') and a2.C_DEPART = NVL(P_DEPART,a2.C_DEPART))))
order by a2.C_FINTOOL,a3.C_NUM,a2.C_MAIN_V_ID');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312673062', 4, 1, 'select  a1.C_NUM_ACC ACC
from Z#R2_ACC a1
where a1.C_AC_FIN = A.ACC_FIN and a1.C_CLASS_NAME = ''R2_LOAN'' and a1.C_DATE_BEG <= P_DATE_BEG');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3313442254', 2, 1, 'select  a1.C_COM_STATUS
from Z#R2_AN_ACCOUNT a1
where a1.C_MAIN_V_ID = P_ACC_NUM and a1.C_MAIN_V_ID_NOKEY = (SUBSTR(P_ACC_NUM,1,8)||''0''||SUBSTR(P_ACC_NUM,10)) and (P_FILIAL is NULL or a1.C_FILIAL = P_FILIAL)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312660664', 1, 1, 'select  a1.C_SUBSYSTEM
from Z#R2_ACC2PROD a1
where a1.C_BALNUM = V_STRBAL and TO_NUMBER(a1.C_BEGNUM) <= V_NUMTAIL and TO_NUMBER(a1.C_ENDNUM) >= V_NUMTAIL');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3002782885', 26, 1, 'select  COUNT(1)
from Z#R2_PROPERTIES a1
where a1.ROWID = RV');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3002782885', 133, 1, 'select  COUNT(1)
from Z#R2_RES_BASE_INCL a1
where a1.ROWID = RV');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3002782885', 229, 1, 'select  COUNT(1)
from Z#R2_AN_ACCOUNT a1
where a1.ROWID = RV');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667678', 1, 1, 'delete from Z#R2_RES_DELTA a1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667678', 2, 1, 'delete from Z#R2_RES_FACT_OPER a1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667678', 3, 1, 'delete from Z#R2_RES_RISK_GR a1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667678', 4, 1, 'delete from Z#R2_RES_BASE_INCL a1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667678', 5, 1, 'delete from Z#R2_RES_BASE a1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667678', 6, 1, 'delete from Z#R2_RES_PRD_PRT_H a1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667678', 7, 1, 'delete from Z#R2_RES_RISK_GR_H a1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667678', 10, 1, 'delete from Z#R2_RES_DELAY a1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667678', 11, 1, 'delete from Z#R2_RES_PROD a1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3002782895', 95, 1, 'select  COUNT(1)
from Z#R2_DEBTS_FOR_FO a1
where a1.ROWID = RV');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3002782895', 106, 1, 'select  COUNT(1)
from Z#TYPE_ROWID2 a1
where a1.ROWID = RV');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3002782895', 129, 1, 'select  COUNT(1)
from Z#R2_ACC_POOL_DEF a1
where a1.ID = RV');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3002782895', 130, 1, 'select  COUNT(1)
from Z#R2_DEBT_JOUR a1
where a1.ROWID = RV');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3002782895', 181, 1, 'select  COUNT(1)
from Z#R2_FACT_OPER a1
where a1.ROWID = RV');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3002782895', 271, 1, 'select  COUNT(1)
from Z#R2_ACC_POOL a1
where a1.ID = RV');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312668936', 1, 1, 'select  a1.rowid
from Z#R2_DEPOSIT_PRC a1
where (a1.C_PRC_SCH = plp$THIS) and ROWNUM < 2');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312669092', 2, 1, 'select  a1.C_TRANS_ID, a1.C_TYPE_OP, a1.C_DATE_OP, a1.C_DATE_CALC, a1.C_USER_OP, a1.C_DEPART, a1.C_DATE_STAMP, a1.C_RTL0, a1.C_MAIN_TRANS, a1.C_PROD_DATA
from Z#R2_TRANS_INFO a1
where a1.C_TRANS_ID = P_NUMTRANSID');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312669092', 3, 1, 'select  a1.C_TRANS_ID
from Z#R2_TRANS_INFO a1
where a1.C_MAIN_TRANS = P_NUMTRANSID');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312668325', 17, 1, 'select  a1.GR_NUM GR_NUM, a1.VALUTA VALUTA, a1.VALUTA_PO VALUTA_PO, a1.SUM_DT SUM_DT, a1.SUM_KT SUM_KT, a1.NUM_DT NUM_DT, a1.NUM_KT NUM_KT, a1.BIC_DT BIC_DT, a1.BIC_KT BIC_KT, a1.ACC_DT ACC_DT, a1.ACC_DT_NUM ACC_DT_NUM, a1.ACC_KT ACC_KT, a1.ACC_KT_NUM ACC_KT_NUM, a1.DOCUMENT_DATE DOCUMENT_DATE, a1.DATE_OP DATE_OP, a1.DATE_PROV DATE_PROV, a1.TYPE_OP TYPE_OP, a1.CLIENT_DT CLIENT_DT, a1.CLIENT_KT CLIENT_KT, a1.NAZN NAZN, a1.TRANS_ID TRANS_ID, a1.CORR_ID CORR_ID, a1.PATT PATT, a1.PATT_CORR PATT_CORR, a1.KIND_DOC KIND_DOC, a1.KIND_DOC_CORR KIND_DOC_CORR, a1.CNT_CORR CNT_CORR, a1.PRODUCT PRODUCT, a1.SN_DT SN_DT, a1.PRODUCT_CORR PRODUCT_CORR, a1.SN_KT SN_KT
from (
	select  DECODE(plp$17$1,''1'',UTILS.HASH_ID('';''||b1.C_ACC_NUM||'';''||b1.C_ACC_CORR||'';''||NVL(b1.C_BIC,OUR_BANK_BIK)||'';''||NVL(b1.C_BIC_CORR,OUR_BANK_BIK)||'';''),UTILS.HASH_ID('';''||b1.C_PRODUCT||'';''||b1.C_SN_DT||'';''||b1.C_PRODUCT_CORR||'';''||b1.C_SN_KT||'';'')) GR_NUM, b1.C_VAL_DT VALUTA, b1.C_VAL_KT VALUTA_PO, b1.C_SUMMA_DT SUM_DT, b1.C_SUMMA_KT SUM_KT, b1.C_ACC_NUM NUM_DT, b1.C_ACC_CORR NUM_KT, b1.C_BIC BIC_DT, b1.C_BIC_CORR BIC_KT, b1.C_ACC_SVOD ACC_DT, b2.C_MAIN_V_ID ACC_DT_NUM, b1.C_ACC_SVOD_CORR ACC_KT, b3.C_MAIN_V_ID ACC_KT_NUM, TRUNC(b1.C_REP_DATE) DOCUMENT_DATE, c1.C_DATE_OP DATE_OP, c1.C_DATE_CALC DATE_PROV, c1.C_TYPE_OP TYPE_OP, b1.C_CLIENT_DT CLIENT_DT, b1.C_CLIENT_KT CLIENT_KT, b1.C_NAZN NAZN, b1.C_TRANS_ID TRANS_ID, b1.C_CORR_ID CORR_ID, b1.C_PATT PATT, b1.C_PATT_CORR PATT_CORR, b4.C_KIND_DOC KIND_DOC, b5.C_KIND_DOC KIND_DOC_CORR, b1.C_PRODUCT PRODUCT, b1.C_SN_DT SN_DT, b1.C_PRODUCT_CORR PRODUCT_CORR, b1.C_SN_KT SN_KT, (
		select  COUNT(e1.ID) A$1
		from Z#AD_RECORDS e1
		where e1.C_TRANS_ID = b1.C_TRANS_ID and e1.C_CORR_ID = b1.C_CORR_ID and e1.C_PATT_CORR = b1.C_PATT_CORR
	) CNT_CORR
	from Z#R2_TRANS_INFO c1, Z#R2_PATTERN b5, Z#R2_PATTERN b4, Z#AC_FIN b3, Z#AC_FIN b2, Z#AD_RECORDS b1
	where b1.C_ACC_SVOD=b2.id(+) and b1.C_ACC_SVOD_CORR=b3.id(+) and b1.C_PATT=b4.id(+) and b1.C_PATT_CORR=b5.id(+)
	  and (b');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3002782891', 444, 1, 'select  COUNT(1)
from Z#TYPE_ROWID1 a1
where a1.ROWID = RV');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3314581130', 5, 1, 'select  a1.ROWID, a1.C_OPER, a2.C_CODE, a2.C_BUS_PROCESS, a1.C_DATE_OPER, NVL(a1.C_SUMMA,0), a1.C_CHANGE
from Z#R2_VID_OPER a2, Z#R2_PLAN_OPER a1
where a1.C_OPER=a2.id(+)
  and (a1.C_PN = O_LOAN.A#PN and a1.C_PRODUCT = O_LOAN.id)
order by a1.C_DATE_OPER,DECODE(a1.C_CHANGE,2,1,2)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3002782891', 24, 1, 'select  COUNT(1)
from Z#R2_DEPOSIT_PRC a1
where a1.ROWID = RV');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312668596', 12, 1, 'select  a1.ROWID
from Z#R2_DEBTS_FOR_FO a1
where a1.C_PRODUCT = (-ABS(TO_NUMBER(plp$P_PRODUCT_ID))) and a1.C_PN = G_LOANS(ABS(plp$P_PRODUCT_ID)).PN');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312668596', 13, 1, 'select  a1.ROWID
from Z#R2_FACT_OPER a1
where a1.C_PRODUCT in (ABS(TO_NUMBER(plp$P_PRODUCT_ID)),(-ABS(TO_NUMBER(plp$P_PRODUCT_ID)))) and a1.C_PN = G_LOANS(ABS(plp$P_PRODUCT_ID)).PN and a1.C_DATE_OPER >= G_LOANS(ABS(plp$P_PRODUCT_ID)).FACT_OPERS.DATE_BEG and (a1.C_DATE_OPER <= G_LOANS(ABS(plp$P_PRODUCT_ID)).FACT_OPERS.DATE_END or G_LOANS(ABS(plp$P_PRODUCT_ID)).FACT_OPERS.DATE_END is NULL)
order by a1.C_DATE_OPER,a1.C_SN');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312668596', 15, 1, 'select  a1.ROWID
from Z#R2_PLAN_OPER a1
where a1.C_PRODUCT = plp$P_PRODUCT_ID and a1.C_PN = G_LOANS(ABS(plp$P_PRODUCT_ID)).PN and ((a1.C_DATE_BEGIN is not NULL and a1.C_DATE_END is not NULL and a1.C_DATE_BEGIN >= G_LOANS(ABS(plp$P_PRODUCT_ID)).PLAN_OPERS.DATE_BEG and a1.C_DATE_END <= G_LOANS(ABS(plp$P_PRODUCT_ID)).PLAN_OPERS.DATE_END) or ((a1.C_DATE_OPER <= G_LOANS(ABS(plp$P_PRODUCT_ID)).PLAN_OPERS.DATE_END or G_LOANS(ABS(plp$P_PRODUCT_ID)).PLAN_OPERS.DATE_END is NULL) and a1.C_DATE_OPER >= G_LOANS(ABS(plp$P_PRODUCT_ID)).PLAN_OPERS.DATE_BEG))
order by a1.C_DATE_OPER');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312668596', 17, 1, 'select  a1.ROWID
from Z#R2_ACC a1
where a1.C_PRODUCT in (ABS(TO_NUMBER(plp$P_PRODUCT_ID)),(-ABS(TO_NUMBER(plp$P_PRODUCT_ID)))) and a1.C_PN = G_LOANS(ABS(plp$P_PRODUCT_ID)).PN and (a1.C_DATE_END is NULL or a1.C_DATE_END >= P_DATE_BEG)
order by a1.C_DATE_BEG');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312668596', 18, 1, 'select  a1.ROWID REF_, a1.C_DATE_BEG DATE_BEG
from Z#R2_GRACE_HISTORY a1
where a1.C_PRODUCT = plp$P_PRODUCT_ID and a1.C_PN = G_LOANS(ABS(plp$P_PRODUCT_ID)).PN');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312661494', 1, 1, 'delete from Z#R2_DEBT_JOUR a1
	where a1.C_PRODUCT = FACT_OPER.A#PRODUCT and a1.C_PN = FACT_OPER.A#PN and a1.C_SN = FACT_OPER.A#SN');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312668596', 9, 1, 'select  a1.ROWID
from Z#R2_DEPOSIT_SUM a1
where a1.C_PRODUCT = (-ABS(TO_NUMBER(P_PRODUCT_ID))) and a1.C_PN = G_LOANS(ABS(P_PRODUCT_ID)).PN');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312668596', 10, 1, 'select  a1.ROWID
from Z#R2_DEPOSIT_PRC a1
where a1.C_PRODUCT = (-ABS(TO_NUMBER(P_PRODUCT_ID))) and a1.C_PN = G_LOANS(ABS(P_PRODUCT_ID)).PN');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312668596', 11, 1, 'select  a1.ROWID
from Z#R2_DEPOSIT_PROL a1
where a1.C_PRODUCT = (-ABS(TO_NUMBER(P_PRODUCT_ID))) and a1.C_PN = G_LOANS(ABS(P_PRODUCT_ID)).PN');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312672969', 3, 1, 'select  GROUPING_ID(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC), case when GROUPING_ID(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC) = 3 then ''Валюта ''||a1.CODE_ISO||'':'' when GROUPING_ID(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC) = 0 then a1.CL_NAME when GROUPING_ID(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC) = 7 then ''Итого по валюте ''||a1.CODE_ISO||'':'' else '''' end, a1.ACC, a1.CODE_ISO, SUM(a1.SUMMA)
from (
	select  b1.ACC ACC, b2.C_CODE_ISO CODE_ISO, b1.SUMMA SUMMA, e2.C_NAME CL_NAME
	from Z#R2_FACT_OPER f1, Z#CLIENT e2, Z#R2_DEPOSIT e1, Z#FT_MONEY b2, (
		select  c1.C_REP_DATE REP_DATE, c1.C_VAL_DT VAL, c1.C_ACC_NUM ACC, c1.C_SUMMA_DT SUMMA, c1.C_CORR_ID CORR_ID, c1.C_TRANS_ID TRANS_ID, c1.C_PRODUCT PRODUCT
		from Z#AD_RECORDS c1
		union all
		select  d1.C_REP_DATE REP_DATE, d1.C_VAL_KT VAL, d1.C_ACC_CORR ACC, d1.C_SUMMA_KT SUMMA, d1.C_CORR_ID CORR_ID, d1.C_TRANS_ID TRANS_ID, d1.C_PRODUCT_CORR PRODUCT
		from Z#AD_RECORDS d1
	) b1
	where b1.VAL=b2.id(+) and e1.C_CLIENT=e2.id(+)
	  and (TRUNC(b1.REP_DATE) = P_DATE and f1.C_CLASS_NAME = ''R2_DEPOSIT'' and SUBSTR(b1.ACC,1,5) = ''47411'' and COALESCE(e1.C_DATE_CLOSE,P_DATE) >= P_DATE and b1.PRODUCT = e1.ID and b1.CORR_ID = f1.C_DOC_ID and b1.TRANS_ID = f1.C_FOLDER_ID and e1.C_PN = f1.C_PN and INSTR(V_LISTPROC,f1.C_VID_OPER||'','') > 0 and ((f1.C_STATE_OPER is NULL and NVL(f1.C_CORRECTED,''0'') = 0) and f1.C_CORRECTION_FO is NULL))
) a1
group by ROLLUP(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC)
having GROUPING_ID(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC) in (0,3,7)
order by a1.CODE_ISO,case when GROUPING_ID(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC) = 3 then 1 when GROUPING_ID(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC) = 0 then 2 when GROUPING_ID(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC) = 7 then 3 else 999 end,a1.ACC');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312672969', 5, 1, 'select  GROUPING_ID(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC), case when GROUPING_ID(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC) = 3 then ''Валюта ''||a1.CODE_ISO||'':'' when GROUPING_ID(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC) = 0 then a1.CL_NAME when GROUPING_ID(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC) = 7 then ''Итого по валюте ''||a1.CODE_ISO||'':'' else '''' end, a1.ACC, a1.CODE_ISO, SUM(a1.SUMMA)
from (
	select  b1.ACC ACC, b2.C_CODE_ISO CODE_ISO, b1.SUMMA SUMMA, e2.C_NAME CL_NAME
	from Z#R2_FACT_OPER f1, Z#CLIENT e2, Z#R2_DEPOSIT e1, Z#FT_MONEY b2, (
		select  c1.C_REP_DATE REP_DATE, c1.C_VAL_DT VAL, c1.C_ACC_NUM ACC, c1.C_SUMMA_DT SUMMA, c1.C_CORR_ID CORR_ID, c1.C_TRANS_ID TRANS_ID, c1.C_PRODUCT PRODUCT
		from Z#AD_RECORDS c1
		union all
		select  d1.C_REP_DATE REP_DATE, d1.C_VAL_KT VAL, d1.C_ACC_CORR ACC, d1.C_SUMMA_KT SUMMA, d1.C_CORR_ID CORR_ID, d1.C_TRANS_ID TRANS_ID, d1.C_PRODUCT_CORR PRODUCT
		from Z#AD_RECORDS d1
	) b1
	where b1.VAL=b2.id(+) and e1.C_CLIENT=e2.id(+)
	  and (TRUNC(b1.REP_DATE) = P_DATE and f1.C_CLASS_NAME = ''R2_DEPOSIT'' and SUBSTR(b1.ACC,1,5) = ''47411'' and COALESCE(e1.C_DATE_CLOSE,P_DATE) >= P_DATE and b1.PRODUCT = e1.ID and b1.CORR_ID = f1.C_DOC_ID and b1.TRANS_ID = f1.C_FOLDER_ID and e1.C_PN = f1.C_PN and INSTR(V_LISTPROC,f1.C_VID_OPER||'','') > 0 and ((f1.C_STATE_OPER is NULL and NVL(f1.C_CORRECTED,''0'') = 0) and f1.C_CORRECTION_FO is NULL) and e1.C_DEPART = P_DEPART)
) a1
group by ROLLUP(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC)
having GROUPING_ID(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC) in (0,3,7)
order by a1.CODE_ISO,case when GROUPING_ID(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC) = 3 then 1 when GROUPING_ID(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC) = 0 then 2 when GROUPING_ID(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC) = 7 then 3 else 999 end,a1.ACC');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312672969', 6, 1, 'select  GROUPING_ID(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC), case when GROUPING_ID(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC) = 3 then ''Валюта ''||a1.CODE_ISO||'':'' when GROUPING_ID(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC) = 0 then a1.CL_NAME when GROUPING_ID(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC) = 7 then ''Итого по валюте ''||a1.CODE_ISO||'':'' else '''' end, a1.ACC, a1.CODE_ISO, SUM(a1.SUMMA)
from (
	select  b1.ACC ACC, b2.C_CODE_ISO CODE_ISO, b1.SUMMA SUMMA, e2.C_NAME CL_NAME
	from Z#R2_FACT_OPER f1, Z#CLIENT e2, Z#R2_DEPOSIT e1, Z#FT_MONEY b2, (
		select  c1.C_REP_DATE REP_DATE, c1.C_VAL_DT VAL, c1.C_ACC_NUM ACC, c1.C_SUMMA_DT SUMMA, c1.C_CORR_ID CORR_ID, c1.C_TRANS_ID TRANS_ID, c1.C_PRODUCT PRODUCT
		from Z#AD_RECORDS c1
		union all
		select  d1.C_REP_DATE REP_DATE, d1.C_VAL_KT VAL, d1.C_ACC_CORR ACC, d1.C_SUMMA_KT SUMMA, d1.C_CORR_ID CORR_ID, d1.C_TRANS_ID TRANS_ID, d1.C_PRODUCT_CORR PRODUCT
		from Z#AD_RECORDS d1
	) b1
	where b1.VAL=b2.id(+) and e1.C_CLIENT=e2.id(+)
	  and (TRUNC(b1.REP_DATE) = P_DATE and f1.C_CLASS_NAME = ''R2_DEPOSIT'' and SUBSTR(b1.ACC,1,5) = ''47411'' and COALESCE(e1.C_DATE_CLOSE,P_DATE) >= P_DATE and b1.PRODUCT = e1.ID and b1.CORR_ID = f1.C_DOC_ID and b1.TRANS_ID = f1.C_FOLDER_ID and e1.C_PN = f1.C_PN and INSTR(V_LISTPROC,f1.C_VID_OPER||'','') > 0 and ((f1.C_STATE_OPER is NULL and NVL(f1.C_CORRECTED,''0'') = 0) and f1.C_CORRECTION_FO is NULL) and e1.C_DEPART = P_DEPART and b1.VAL = P_CURRENCY)
) a1
group by ROLLUP(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC)
having GROUPING_ID(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC) in (0,3,7)
order by a1.CODE_ISO,case when GROUPING_ID(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC) = 3 then 1 when GROUPING_ID(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC) = 0 then 2 when GROUPING_ID(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC) = 7 then 3 else 999 end,a1.ACC');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312672969', 4, 1, 'select  GROUPING_ID(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC), case when GROUPING_ID(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC) = 3 then ''Валюта ''||a1.CODE_ISO||'':'' when GROUPING_ID(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC) = 0 then a1.CL_NAME when GROUPING_ID(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC) = 7 then ''Итого по валюте ''||a1.CODE_ISO||'':'' else '''' end, a1.ACC, a1.CODE_ISO, SUM(a1.SUMMA)
from (
	select  b1.ACC ACC, b2.C_CODE_ISO CODE_ISO, b1.SUMMA SUMMA, e2.C_NAME CL_NAME
	from Z#R2_FACT_OPER f1, Z#CLIENT e2, Z#R2_DEPOSIT e1, Z#FT_MONEY b2, (
		select  c1.C_REP_DATE REP_DATE, c1.C_VAL_DT VAL, c1.C_ACC_NUM ACC, c1.C_SUMMA_DT SUMMA, c1.C_CORR_ID CORR_ID, c1.C_TRANS_ID TRANS_ID, c1.C_PRODUCT PRODUCT
		from Z#AD_RECORDS c1
		union all
		select  d1.C_REP_DATE REP_DATE, d1.C_VAL_KT VAL, d1.C_ACC_CORR ACC, d1.C_SUMMA_KT SUMMA, d1.C_CORR_ID CORR_ID, d1.C_TRANS_ID TRANS_ID, d1.C_PRODUCT_CORR PRODUCT
		from Z#AD_RECORDS d1
	) b1
	where b1.VAL=b2.id(+) and e1.C_CLIENT=e2.id(+)
	  and (TRUNC(b1.REP_DATE) = P_DATE and f1.C_CLASS_NAME = ''R2_DEPOSIT'' and SUBSTR(b1.ACC,1,5) = ''47411'' and COALESCE(e1.C_DATE_CLOSE,P_DATE) >= P_DATE and b1.PRODUCT = e1.ID and b1.CORR_ID = f1.C_DOC_ID and b1.TRANS_ID = f1.C_FOLDER_ID and e1.C_PN = f1.C_PN and INSTR(V_LISTPROC,f1.C_VID_OPER||'','') > 0 and ((f1.C_STATE_OPER is NULL and NVL(f1.C_CORRECTED,''0'') = 0) and f1.C_CORRECTION_FO is NULL) and b1.VAL = P_CURRENCY)
) a1
group by ROLLUP(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC)
having GROUPING_ID(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC) in (0,3,7)
order by a1.CODE_ISO,case when GROUPING_ID(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC) = 3 then 1 when GROUPING_ID(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC) = 0 then 2 when GROUPING_ID(a1.CODE_ISO,(-a1.CODE_ISO),a1.CL_NAME,a1.ACC) = 7 then 3 else 999 end,a1.ACC');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312672972', 1, 1, 'select  a1.C_NUM_ACC ACC, b1.ID PROD
from Z#R2_DEPOSIT b1, Z#R2_ACC a1
where b1.C_CLIENT = P_CLIENT and b1.C_PN = P_PN and a1.C_PRODUCT in (b1.ID,(-1)*b1.ID) and a1.C_PN = P_PN and a1.C_NUM_ACC is not NULL
group by b1.ID,a1.C_NUM_ACC');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312672972', 3, 1, 'select  b1.ROWID C_ACC, b1.C_NUM_ACC C_NUM_ACC, b1.C_DATE_BEG C_DATE_BEG, c1.C_FINTOOL C_FINTOOL
from Z#AC_FIN c1, Z#R2_ACC b1, Z#R2_DEPOSIT a1
where a1.C_CLIENT = P_CLIENT and a1.C_PN = plp$3$1 and b1.C_PRODUCT in (a1.ID,(-1)*a1.ID) and b1.C_PN = a1.C_PN and b1.C_AC_FIN = c1.ID and P_DATE >= b1.C_DATE_BEG and P_DATE <= NVL(b1.C_DATE_END,P_DATE) and P_DATE >= a1.C_DATE_BEGIN and P_DATE <= NVL(a1.C_DATE_END,P_DATE) and P_DATE <= NVL(a1.C_DATE_CLOSE,P_DATE) and b1.C_CLASS_NAME = ''R2_DEPOSIT'' and ((null = ''1'') or b1.C_NUM_ACC is not NULL)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312669126', 4, 1, 'select  a1.C_DATE_BEG A$1
from Z#R2_ACC a1
where a1.C_NUM_ACC = P_ACC_NUM and a1.C_DATE_BEG < P_DATE+1
order by a1.C_DATE_BEG desc');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312669126', 5, 1, 'select  a1.C_DATE_BEG A$1
from Z#R2_ACC a1
where a1.C_NUM_ACC = P_ACC_NUM and a1.C_PN = P_PN and a1.C_DATE_BEG < P_DATE+1
order by a1.C_DATE_BEG desc');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312672970', 10, 1, 'select  a1.ID ID, a1.PERIOD PERIOD, a1.PERIOD_CUR PERIOD_CUR, a1.NAME NAME, a1.PRODUCT PRODUCT, a1.NUM_ACC NUM_ACC, SUM(a1.SUMMA_DT*DECODE(a1.DT,''1'',1,(-1))*DECODE(a1.VID_SVOD,''П'',(-1),1)) SUM_NT
from (
	select  b1.ID ID, CALC_PERIOD(b1.ID) PERIOD, CALC_PERIOD(b1.ID,plp$10$1) PERIOD_CUR, b2.C_NAME NAME, c1.C_PRODUCT PRODUCT, c1.C_NUM_ACC NUM_ACC, d1.C_SUMMA_DT SUMMA_DT, ''1'' DT, d3.C_CODE VID_SVOD
	from Z#TYPE_ACC d3, Z#AC_FIN d2, Z#AD_RECORDS d1, Z#R2_ACC c1, Z#R2_VID_DEPOSIT b2, Z#R2_DEPOSIT b1
	where b1.C_VID_DEPOSIT=b2.id(+) and d1.C_ACC_SVOD=d2.id(+) and d2.C_VID=d3.id(+)
	  and (b1.C_PN = c1.C_PN and c1.C_NUM_ACC = d1.C_ACC_NUM(+) and c1.C_PRODUCT = d1.C_PRODUCT(+) and d1.C_REP_DATE(+) <= P_DATE and b1.ID = c1.C_PRODUCT and c1.C_TYPE_ACC = 3312657129 and ((plp$10$2 = ''1'') or  exists (
		select  ''1'' A$1
		from Z#AD_RECORDS e1
		where e1.C_ACC_NUM = c1.C_NUM_ACC and e1.C_PRODUCT = c1.C_PRODUCT and e1.C_REP_DATE <= P_DATE
	)) and (b1.C_CURRENCY = V_TBL_CURR(J).CURRENCY) and (P_DEPART is NULL or (((plp$10$3 = ''1'') and b1.C_DEPART in (
		select  f1.ID A$1
		from Z#DEPART f1
		connect by prior f1.ID = f1.C_HIGH
		start with f1.ID = P_DEPART
	)) or ((plp$10$3 = ''0'') and b1.C_DEPART = P_DEPART))))
	union all
	select  g1.ID ID, CALC_PERIOD(g1.ID) PERIOD, CALC_PERIOD(g1.ID,plp$11$4) PERIOD_CUR, g2.C_NAME NAME, h1.C_PRODUCT PRODUCT, h1.C_NUM_ACC NUM_ACC, i1.C_SUMMA_DT SUMMA_DT, ''0'' DT, i3.C_CODE VID_SVOD
	from Z#TYPE_ACC i3, Z#AC_FIN i2, Z#AD_RECORDS i1, Z#R2_ACC h1, Z#R2_VID_DEPOSIT g2, Z#R2_DEPOSIT g1
	where g1.C_VID_DEPOSIT=g2.id(+) and i1.C_ACC_SVOD_CORR=i2.id(+) and i2.C_VID=i3.id(+)
	  and (g1.C_PN = h1.C_PN and h1.C_NUM_ACC = i1.C_ACC_CORR(+) and h1.C_PRODUCT = i1.C_PRODUCT_CORR(+) and i1.C_REP_DATE(+) <= P_DATE and g1.ID = h1.C_PRODUCT and h1.C_TYPE_ACC = 3312657129 and ((plp$11$5 = ''1'') or  exists (
		select  ''1'' A$1
		from Z#AD_RECORDS j1
		where j1.C_ACC_CORR = h1.C_NUM_ACC and j1.C_PRODUCT_CORR = h1.C_PRODUCT and j1.C_REP_DATE <= P_DATE
	)) and (g1.C_CURRENCY ');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312672970', 13, 1, 'select  a1.PERIOD PERIOD, a1.PERIOD_CUR PERIOD_CUR, a1.NAME NAME, DECODE(plp$13$5,''1'',a1.DEPART,null) DEPART, SUM(a1.SUMMA_DT*DECODE(a1.DT,''1'',1,(-1))*DECODE(a1.VID_SVOD,''П'',(-1),1)) SUM_NT
from (
	select  CALC_PERIOD(b1.ID) PERIOD, CALC_PERIOD(b1.ID,plp$13$1) PERIOD_CUR, b2.C_NAME NAME, e1.C_CODE DEPART, d1.C_SUMMA_DT SUMMA_DT, ''1'' DT, d3.C_CODE VID_SVOD
	from Z#DEPART e1, Z#TYPE_ACC d3, Z#AC_FIN d2, Z#AD_RECORDS d1, Z#R2_ACC c1, Z#R2_VID_DEPOSIT b2, Z#R2_DEPOSIT b1
	where b1.C_VID_DEPOSIT=b2.id(+) and d1.C_ACC_SVOD=d2.id(+) and d2.C_VID=d3.id(+)
	  and (b1.C_PN = c1.C_PN and e1.ID = b1.C_DEPART and d1.C_ACC_NUM = c1.C_NUM_ACC and d1.C_PRODUCT = c1.C_PRODUCT and d1.C_REP_DATE <= P_DATE and b1.ID = c1.C_PRODUCT and c1.C_TYPE_ACC = 3312657129 and (b1.C_CURRENCY = V_TBL_CURR(J).CURRENCY) and (P_DEPART is NULL or (((plp$13$2 = ''1'') and b1.C_DEPART in (
		select  f1.ID A$1
		from Z#DEPART f1
		connect by prior f1.ID = f1.C_HIGH
		start with f1.ID = P_DEPART
	)) or ((plp$13$2 = ''0'') and b1.C_DEPART = P_DEPART))))
	union all
	select  CALC_PERIOD(g1.ID) PERIOD, CALC_PERIOD(g1.ID,plp$14$3) PERIOD_CUR, g2.C_NAME NAME, j1.C_CODE DEPART, i1.C_SUMMA_DT SUMMA_DT, ''0'' DT, i3.C_CODE VID_SVOD
	from Z#DEPART j1, Z#TYPE_ACC i3, Z#AC_FIN i2, Z#AD_RECORDS i1, Z#R2_ACC h1, Z#R2_VID_DEPOSIT g2, Z#R2_DEPOSIT g1
	where g1.C_VID_DEPOSIT=g2.id(+) and i1.C_ACC_SVOD_CORR=i2.id(+) and i2.C_VID=i3.id(+)
	  and (g1.C_PN = h1.C_PN and j1.ID = g1.C_DEPART and i1.C_ACC_CORR = h1.C_NUM_ACC and i1.C_PRODUCT_CORR = h1.C_PRODUCT and i1.C_REP_DATE <= P_DATE and g1.ID = h1.C_PRODUCT and h1.C_TYPE_ACC = 3312657129 and (g1.C_CURRENCY = V_TBL_CURR(J).CURRENCY) and (P_DEPART is NULL or (((plp$14$4 = ''1'') and g1.C_DEPART in (
		select  k1.ID A$1
		from Z#DEPART k1
		connect by prior k1.ID = k1.C_HIGH
		start with k1.ID = P_DEPART
	)) or ((plp$14$4 = ''0'') and g1.C_DEPART = P_DEPART))))
) a1
group by a1.PERIOD,a1.PERIOD_CUR,a1.NAME,DECODE(plp$13$5,''1'',a1.DEPART,null)
order by TO_NUMBER(SUBSTR(a1.PERIOD,1,2)),TO_');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667951', 5, 1, 'select  a1.C_PN, a1.C_PROD_CLASS, a1.C_ID_PROD, a1.C_DEPART, a1.C_CLIENT, a1.C_COM_STATUS, a1.C_ID_PORT, a1.C_ON_DATE
from Z#R2_RES_PROD a1
where a1.C_PN = P_PROD.PN and a1.C_PROD_CLASS = P_PROD.PROD_CLASS and a1.C_ID_PROD = P_PROD.ID_PROD');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667951', 7, 1, 'select  a1.C_PN, a1.C_ID_PROD, a1.C_PROD_CLASS, a1.C_ON_DATE, a1.C_DATE_END, a1.C_ST, a1.C_FINTOOL, a1.C_DELAY_AMT
from Z#R2_RES_DELAY a1
where a1.C_PN = P_PROD.PN and a1.C_PROD_CLASS = P_PROD.PROD_CLASS and a1.C_ID_PROD = P_PROD.ID_PROD and plp$P_ON_DATE >= a1.C_ON_DATE and (a1.C_DATE_END is NULL or plp$P_ON_DATE < a1.C_DATE_END) and a1.C_RES_VID = DELAY_RES_VID');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667951', 10, 1, 'select  SUM(NVL(a1.C_RES_AMT,0))
from Z#R2_RES_BASE a1
where P_ACC = a1.C_ACC_RES and NVL(plp$10$1,plp$10$2) = a1.C_PN');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667951', 11, 1, 'select  a1.ROWID, a1.C_SUMMA
from Z#R2_RES_BASE b1, Z#R2_RES_FACT_OPER a1
where a1.C_PROD_CLASS = b1.C_PROD_CLASS and a1.C_ID_PROD = b1.C_ID_PROD and a1.C_ID_RES_VID = b1.C_ID_RES_VID and a1.C_PN = b1.C_PN and P_ACC = b1.C_ACC_RES and NVL(plp$11$1,plp$11$2) = b1.C_PN
order by a1.C_DATE_PROV,a1.ROWID desc');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667951', 12, 1, 'select  a1.C_RES_PRC
from Z#R2_RES_RISK_GR a1
where a1.C_PROD_CLASS = plp$12$1 and a1.C_ID_PROD = P_PORT and a1.C_ON_DATE < P_ON_DATE+1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667951', 13, 1, 'select  a1.RES_PRC
from (
	select  b1.C_RES_PRC RES_PRC
	from Z#R2_RES_RISK_GR_H b1
	where b1.C_PROD_CLASS = plp$13$1 and b1.C_ID_PROD = P_PORT and b1.C_ON_DATE < P_ON_DATE+1
	order by b1.C_ON_DATE desc
) a1
where ROWNUM < 2');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667951', 14, 1, 'select  a1.C_ACC_RES, a1.C_ACC_DT, a1.C_ACC_CT
from Z#R2_RES_BASE a1
where a1.C_PN = P_PN and a1.C_ID_PROD = P_ID_PROD and a1.C_PROD_CLASS = P_PROD_CLASS and a1.C_ID_RES_VID = P_RES_VID and ROWNUM = 1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667951', 15, 1, 'select  a1.C_ACC_RES, a1.C_ACC_DT, a1.C_ACC_CT
from Z#R2_RES_BASE a1
where a1.C_PN = P_PN and a1.C_PROD_CLASS = ''R2_RES_PORT'' and a1.C_ID_PROD = P_PORT and a1.C_ID_RES_VID = P_RES_VID and ROWNUM = 1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667951', 16, 1, 'select  a1.C_ON_DATE, NVL(a1.C_RES_AMT,0)
from Z#R2_RES_BASE a1
where a1.C_ID_PROD = P_ID_PROD and a1.C_PROD_CLASS = P_PROD_CLASS and a1.C_ID_RES_VID = P_RES_VID and a1.C_PN = P_PN and (a1.C_ACC_RES = plp$P_ACC_RES)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667951', 17, 1, 'select  SUM(NVL(a1.C_SUMMA,0))
from Z#R2_RES_FACT_OPER a1
where a1.C_ID_PROD = P_ID_PROD and a1.C_PROD_CLASS = P_PROD_CLASS and a1.C_ID_RES_VID = P_RES_VID and a1.C_PN = P_PN and a1.C_DATE_PROV > P_ON_DATE');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667951', 18, 1, 'select  SUM(NVL(a1.SUMM,0)), a1.FINTOOL
from (
	select  b1.C_BASE_AMT SUMM, b1.C_FINTOOL FINTOOL
	from Z#R2_RES_BASE b1
	where b1.C_ID_PROD = P_PORT and b1.C_ID_RES_VID = P_ID_RES_VID and b1.C_PN = N_PN
	union all
	select  c1.C_BASE_DELTA A$1, c1.C_FINTOOL A$2
	from Z#R2_RES_DELTA c1
	where c1.C_ID_PORT = P_PORT and c1.C_ID_RES_VID = P_ID_RES_VID and c1.C_DATE_PROV < plp$P_DATE1+1
) a1
group by a1.FINTOOL');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667951', 19, 1, 'select  a1.C_ID_PROD
from Z#R2_RES_PROD a1
where a1.C_PROD_CLASS = ''R2_LOAN'' and a1.C_ID_PORT = P_PORT');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667951', 21, 1, 'select  SUM(NVL(a1.C_SUMMA,0))
from Z#R2_RES_BASE b1, Z#R2_RES_FACT_OPER a1
where a1.C_PROD_CLASS = b1.C_PROD_CLASS and a1.C_ID_PROD = b1.C_ID_PROD and a1.C_ID_RES_VID = b1.C_ID_RES_VID and P_ACC = b1.C_ACC_RES and NVL(plp$21$1,plp$21$2) = b1.C_PN and a1.C_PN = b1.C_PN');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3313442663', 13, 1, 'select  a1.A$1
from (
	select  c2.C_TYPE_ACC A$1
	from Z#R2_VID_DEBT c2, Z#R2_DEBT_PART c1, Z#R2_FACT_OPER b1
	where c1.C_VID_DEBT=c2.id(+)
	  and (b1.C_PRODUCT in (PRODUCT,(-1)*PRODUCT) and b1.C_VID_OPER = c1.C_VID_OPER and b1.C_VID_OPER = VID_OPER and NVL(c1.C_DT,''0'') = ''1'' and b1.C_DATE_OPER <= DATE_OPER and ROWNUM < 2)
	order by b1.C_DATE_OPER desc
) a1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3313442663', 14, 1, 'select  a1.C_NUM_ACC NUM_ACC
from Z#R2_ACC a1
where a1.C_TYPE_ACC = TYPE_ACC and a1.C_PRODUCT = PRODUCT and a1.C_DATE_BEG <= DATE_OPER and NVL(a1.C_DATE_END,TO_DATE(''01.01.9999'',''DD.MM.YYYY''))+1 > DATE_OPER
order by a1.C_DATE_BEG desc');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312668054', 1, 1, 'select  a1.C_PN
from Z#R2_RES_PROD a1
where a1.C_PROD_CLASS = P_PROD_CLASS and a1.C_ID_PROD = P_ID_OBJ');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312668054', 2, 1, 'select  a1.C_PN
from Z#R2_RES_PROD a1
where a1.C_PROD_CLASS = P_PROD_CLASS and a1.C_ID_PROD = P_ID_OBJ');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312666926', 1, 1, 'delete from Z#R2_PROPERTIES a1
	where a1.C_PN = P_PN and a1.C_PRODUCT = P_PRODUCT and a1.C_GROUP_PROP = OBJ.A#GROUP_PROP and a1.C_DATE_BEGIN >= OBJ.A#DATE_BEGIN');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312666926', 2, 1, 'update Z#R2_PROPERTIES a1 set
	a1.SN=nvl(a1.SN,1)+1, a1.SU=rtl.uid$, a1.C_DATE_END = DECODE(LEAST(a1.C_DATE_END,P_DATE_BEGIN),OBJ.A#DATE_BEGIN,(OBJ.A#DATE_BEGIN-1),a1.C_DATE_END)
	where a1.C_PN = P_PN and a1.C_PRODUCT = P_PRODUCT and a1.C_GROUP_PROP = OBJ.A#GROUP_PROP and (a1.C_DATE_BEGIN <= OBJ.A#DATE_END or a1.C_DATE_END >= OBJ.A#DATE_BEGIN)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312666926', 5, 1, 'select /*+ index_desc(a1) */  a1.C_REF_VALUE, a1.C_NUM_VALUE, a1.C_STR_VALUE, a1.C_DATE_VALUE, a1.C_BOOL_VALUE
from Z#R2_PROPERTIES a1
where a1.C_PN = P_PN and a1.C_PRODUCT = P_PRODUCT and a1.C_GROUP_PROP = P_GROUP_PROP and a1.C_DATE_BEGIN <= plp$P_DATE and NVL(a1.C_DATE_END,plp$P_DATE) >= plp$P_DATE and ROWNUM = 1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312666926', 7, 1, 'select  a1.C_DATE_SET SETDATE
from Z#R2_PROPERTY_GRP a2, Z#R2_PROPERTIES a1
where a1.C_GROUP_PROP=a2.id
  and (a1.C_PN = P_PN and a1.C_PRODUCT = P_PRODUCT and a2.C_CODE = P_PROPERTY_CODE)
order by a1.C_DATE_SET desc');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312666926', 8, 1, 'delete from Z#R2_PROPERTIES a1
	where a1.C_PN = P_PN and a1.C_PRODUCT = P_PRODUCT and a1.C_GROUP_PROP = P_GROUP_PROP');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312666929', 1, 1, 'delete from Z#R2_PROPERTIES a1
	where a1.C_PN = P_PN and a1.C_PRODUCT = plp$P_PRODUCT and a1.C_GROUP_PROP = P_GROUP_PROP and a1.C_DATE_BEGIN >= plp$P_DATE_BEG and a1.ROWID != plp$THIS');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312666929', 2, 1, 'update Z#R2_PROPERTIES a1 set
	a1.SN=nvl(a1.SN,1)+1, a1.SU=rtl.uid$, a1.C_DATE_END = DECODE(LEAST(a1.C_DATE_END,plp$P_DATE_BEG),plp$P_DATE_BEG,(plp$P_DATE_BEG-1),a1.C_DATE_END)
	where a1.C_PN = P_PN and a1.C_PRODUCT = plp$P_PRODUCT and a1.C_GROUP_PROP = P_GROUP_PROP and (a1.C_DATE_BEGIN <= plp$P_DATE_END or a1.C_DATE_END >= plp$P_DATE_BEG) and a1.ROWID != plp$THIS');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312666928', 1, 1, 'delete from Z#R2_PROPERTIES a1
	where a1.C_PN = THIS_OBJ.A#PN and a1.C_PRODUCT = THIS_OBJ.A#PRODUCT and a1.C_GROUP_PROP = P_GROUP_PROP and a1.C_DATE_BEGIN >= plp$P_DATE_BEG and a1.ROWID != THIS_OBJ.id');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312666928', 2, 1, 'update Z#R2_PROPERTIES a1 set
	a1.SN=nvl(a1.SN,1)+1, a1.SU=rtl.uid$, a1.C_DATE_END = DECODE(LEAST(a1.C_DATE_END,plp$P_DATE_BEG),plp$P_DATE_BEG,(plp$P_DATE_BEG-1),a1.C_DATE_END)
	where a1.C_PN = THIS_OBJ.A#PN and a1.C_PRODUCT = THIS_OBJ.A#PRODUCT and a1.C_GROUP_PROP = P_GROUP_PROP and (a1.C_DATE_BEGIN <= plp$P_DATE_END or a1.C_DATE_END >= plp$P_DATE_BEG) and a1.ROWID != THIS_OBJ.id');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312658700', 2, 1, 'update Z#R2_RES_DELAY a1 set
	a1.SN=nvl(a1.SN,1)+1, a1.SU=rtl.uid$, a1.C_DELAY_AMT = NVL(TBL_PROD(I).SUMMA,0), a1.C_DATE_END = TBL_PROD(I).DATE_LAST_OPER
	where a1.C_ID_PROD = TBL_PROD(I).PRODUCT and a1.C_PN = TBL_PROD(I).PN and a1.C_DATE_END is NULL');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315049919', 2, 1, 'select  a1.C_ID_PROD
from Z#R2_RES_PROD a1
where a1.C_ID_PORT = P_RES_PORT and a1.C_PROD_CLASS = ''R2_LOAN'' and a1.C_ON_DATE <= P_DATE');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312665755', 2, 1, 'select  a1.rowid
from Z#R2_FACT_OPER a1
where a1.C_DOC_ID = P_NUMCORRID and a1.C_PATTERN = P_REFPATTERN and a1.C_PN = plp$2$1 and a1.C_PRODUCT = P_NUMPRODID and a1.C_DATE_OPER = P_DATEOPER');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312661677', 9, 1, 'select  a1.rowid
from Z#R2_DEPOSIT_PRC a1
where a1.C_PRODUCT = P_PRODUCT and a1.C_PN = plp$9$1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312661677', 10, 1, 'select  a1.rowid
from Z#R2_DEPOSIT_SUM a1
where a1.C_PRODUCT = P_PRODUCT and a1.C_PN = plp$10$1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312661675', 3, 1, 'select  a1.rowid
from Z#R2_DEP_ARCH a1
where a1.C_PRODUCT = plp$THIS and a1.C_PN = plp$3$1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312661675', 4, 1, 'delete from Z#R2_DEPOSIT_SUM a1
	where a1.C_PRODUCT = plp$THIS and a1.C_PN = plp$4$1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312661675', 5, 1, 'delete from Z#R2_DEPOSIT_PRC a1
	where a1.C_PRODUCT = plp$THIS and a1.C_PN = plp$5$1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312661675', 6, 1, 'delete from Z#R2_DEPOSIT_PROL a1
	where a1.C_PRODUCT = plp$THIS and a1.C_PN = plp$6$1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312661675', 7, 1, 'select  a1.rowid
from Z#R2_ACC a1
where a1.C_PRODUCT = plp$THIS and a1.C_PN = plp$7$1 and a1.C_CLASS_NAME = ''R2_DEPOSIT''');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315053424', 17, 1, 'insert into Z#R2_DEP_SRC_FIN_A a1 ( SN,SU, C_PRODUCT, C_PN, C_DATE_OPER, C_SRC, C_SUM_INCOME, C_SUM_WR_OFF, C_SN )
	values (1,rtl.uid$,DEP_ID, TBL_SRC_FIN_A(I).PN, TBL_SRC_FIN_A(I).DATE_OPER, TBL_SRC_FIN_A(I).SRC, TBL_SRC_FIN_A(I).AMT, TBL_SRC_FIN_A(I).AMT_WR, TBL_SRC_FIN_A(I).SN)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315053424', 18, 1, 'update Z#R2_DEP_SRC_FIN_A a1 set
	a1.SN=nvl(a1.SN,1)+1, a1.SU=rtl.uid$, a1.C_DATE_OPER = case when a1.C_DATE_OPER > TBL_SRC_FIN_A(I).DATE_OPER then a1.C_DATE_OPER else TBL_SRC_FIN_A(I).DATE_OPER end
	where a1.C_PRODUCT = DEP_ID and a1.C_PN = TBL_SRC_FIN_A(I).PN and a1.C_SRC = TBL_SRC_FIN_A(I).SRC and a1.C_SN is NULL');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315053424', 19, 1, 'insert into Z#R2_DEP_SRC_FIN_A a1 ( SN,SU, C_PRODUCT, C_PN, C_SRC, C_SUM_INCOME, C_SUM_WR_OFF, C_DATE_OPER, C_SN )
	values (1,rtl.uid$,DEP_ID, TBL_SRC_FIN_A(I).PN, TBL_SRC_FIN_A(I).SRC, null, 0, TBL_SRC_FIN_A(I).DATE_OPER, null)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315053424', 20, 1, 'update Z#R2_DEP_SRC_FIN_A a1 set
	a1.SN=nvl(a1.SN,1)+1, a1.SU=rtl.uid$, a1.C_SUM_WR_OFF = a1.C_SUM_WR_OFF-TBL_SRC_FIN_A(I).AMT, a1.C_DATE_OPER = case when a1.C_DATE_OPER > TBL_SRC_FIN_A(I).DATE_OPER then a1.C_DATE_OPER else TBL_SRC_FIN_A(I).DATE_OPER end
	where a1.C_PRODUCT = DEP_ID and a1.C_PN = TBL_SRC_FIN_A(I).PN and a1.C_SRC = TBL_SRC_FIN_A(I).SRC and a1.C_SN is NULL');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315053424', 21, 1, 'update Z#R2_DEP_SRC_FIN_A a1 set
	a1.SN=nvl(a1.SN,1)+1, a1.SU=rtl.uid$, a1.C_SUM_WR_OFF = TBL_INC(I).AMT_WR
	where a1.ROWID = TBL_INC(I).RF');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315053424', 22, 1, 'delete from Z#R2_DEP_SRC_FIN_A a1
	where a1.ROWID = TBL_INC(I).RF');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315053424', 23, 1, 'update Z#R2_DEP_SRC_FIN_A a1 set
	a1.SN=nvl(a1.SN,1)+1, a1.SU=rtl.uid$, a1.C_SUM_WR_OFF = NVL(a1.C_SUM_WR_OFF,0)+TBL_INC_WR_OFF(I), a1.C_DATE_OPER = case when a1.C_DATE_OPER > plp$UPD_DATE then a1.C_DATE_OPER else plp$UPD_DATE end
	where a1.C_PRODUCT = DEP_ID and a1.C_PN = TBL_INC(I).PN and a1.C_SRC = DATE_SRC and a1.C_SN is NULL');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315053424', 24, 1, 'insert into Z#R2_DEP_SRC_FIN_A a1 ( SN,SU, C_PRODUCT, C_PN, C_SRC, C_SN, C_DATE_OPER, C_SUM_WR_OFF )
	values (1,rtl.uid$,DEP_ID, TBL_INC(I).PN, case when plp$UPD_DATE-TBL_INC(I).DATE_OPER >= plp$24$1 and plp$24$2 is not NULL then plp$24$3 else TBL_INC(I).SRC end, null, plp$UPD_DATE, TBL_INC_WR_OFF(I))');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315053424', 25, 1, 'insert into Z#R2_DEP_TRANSFER a1 ( SN,SU, C_PRODUCT, C_PN, C_SRC, C_DATE_OPER, C_DATE_WR_OFF, C_SUM_WR_OFF, C_SN, C_INCOME_SN, C_WR_OFF_OPER )
	values (1,rtl.uid$,DEP_ID, TBL_WR_OFF(I).PN, TBL_WR_OFF(I).SRC, TBL_WR_OFF(I).DATE_OPER, TBL_WR_OFF(I).DATE_WR_OFF, TBL_WR_OFF(I).AMT_WR, TBL_WR_OFF(I).SN, TBL_WR_OFF(I).INCOME_SN, TBL_WR_OFF(I).WR_OFF_OPER)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315053424', 26, 1, 'select  a1.ROWID, a1.C_PRODUCT, a1.C_PN, a1.C_SUM_INCOME, a1.C_SUM_WR_OFF, a1.C_SRC, a1.C_DATE_OPER, a1.C_SN
from Z#R2_DEP_SRC_FIN_A a1
where a1.C_PRODUCT = FO_INFO.A#PRODUCT and a1.C_PN = FO_INFO.A#PN and a1.C_SRC = CUR_SRC and a1.C_SUM_INCOME-a1.C_SUM_WR_OFF > 0 and a1.C_SN is not NULL and a1.C_DATE_OPER <= FO_INFO.A#DATE_OPER
order by a1.C_DATE_OPER');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315053424', 28, 1, 'select  a1.C_CLIENT
from Z#R2_FACT_OPER b1, Z#R2_DEPOSIT a1
where b1.C_FOLDER_ID = P_TBL_FACT_OPER(FO_ITER).A#FOLDER_ID and b1.C_DOC_ID = P_TBL_FACT_OPER(FO_ITER).A#DOC_ID and b1.C_PRODUCT <> P_TBL_FACT_OPER(FO_ITER).A#PRODUCT and b1.C_PRODUCT = a1.ID');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315053424', 29, 1, 'select  a1.C_CLIENT
from Z#R2_FACT_OPER b1, Z#R2_DEPOSIT a1
where b1.C_FOLDER_ID = P_TBL_FACT_OPER(FO_ITER).A#FOLDER_ID and b1.C_DOC_ID = P_TBL_FACT_OPER(FO_ITER).A#DOC_ID and b1.C_PRODUCT = P_TBL_FACT_OPER(FO_ITER).A#PRODUCT and b1.C_PRODUCT = a1.ID');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315053424', 30, 1, 'select  a1.C_PRODUCT, a1.C_PN, a1.C_SN
from Z#R2_PATTERN a2, Z#R2_FACT_OPER a1
where a1.C_PATTERN=a2.id
  and (a1.C_FOLDER_ID = P_TBL_FACT_OPER(FO_ITER).A#FOLDER_ID and a1.C_DOC_ID = P_TBL_FACT_OPER(FO_ITER).A#DOC_ID and (a2.C_DT = ''1''))');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315053424', 31, 1, 'select  null, a1.C_PRODUCT, a1.C_PN, null, a1.C_SUM_WR_OFF, a1.C_SRC, a1.C_DATE_OPER, a1.C_INCOME_SN
from Z#R2_DEP_TRANSFER a1
where a1.C_PRODUCT = WR_OFF_PROD and a1.C_PN = WR_OFF_PN and a1.C_SN = WR_OFF_SN');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315053424', 32, 1, 'select  a1.ROWID, a1.C_PRODUCT, a1.C_PN, a1.C_SUM_INCOME, a1.C_SUM_WR_OFF, a1.C_SRC, a1.C_DATE_OPER, a1.C_SN
from Z#R2_DEP_SRC_FIN_A a1
where a1.C_PRODUCT = P_DEP and a1.C_PN = P_PN and a1.C_SN = P_SN');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315053424', 33, 1, 'select  null, a1.C_PRODUCT, a1.C_PN, 0, SUM(a1.C_SUM_WR_OFF), a1.C_SRC, null, a1.C_INCOME_SN
from Z#R2_DEP_TRANSFER a1
where a1.C_PRODUCT = P_DEP and a1.C_PN = P_PN and a1.C_INCOME_SN = P_SN
group by a1.C_PRODUCT,a1.C_PN,a1.C_SRC,a1.C_INCOME_SN');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315053424', 34, 1, 'update Z#R2_DEP_TRANSFER a1 set
	a1.SN=nvl(a1.SN,1)+1, a1.SU=rtl.uid$, a1.C_INCOME_SN = null
	where a1.C_PRODUCT = P_DEP and a1.C_PN = P_PN and a1.C_INCOME_SN = P_SN');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315053424', 35, 1, 'select  null, a1.C_PRODUCT, a1.C_PN, null, a1.C_SUM_WR_OFF, a1.C_SRC, a1.C_DATE_OPER, a1.C_INCOME_SN
from Z#R2_DEP_TRANSFER a1
where a1.C_PRODUCT = P_DEP and a1.C_PN = P_PN and a1.C_SN = P_WR_OFF_SN');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315053424', 36, 1, 'select  a1.ROWID, a1.C_PRODUCT, a1.C_PN, a1.C_SUM_INCOME, a1.C_SUM_WR_OFF, a1.C_SRC, a1.C_DATE_OPER, a1.C_SN
from Z#R2_DEP_SRC_FIN_A a1
where a1.C_PRODUCT = P_DEP and a1.C_PN = P_PN and a1.C_SN is not NULL');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315053424', 37, 1, 'delete from Z#R2_DEP_TRANSFER a1
	where a1.C_PRODUCT = P_DEP and a1.C_PN = P_PN and a1.C_SN = P_WR_OFF_SN');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315053424', 39, 1, 'select  a1.C_WR_OFF_OPER
from Z#R2_DEP_TRANSFER a1
where a1.C_PRODUCT = FO_INFO.A#PRODUCT and a1.C_PN = FO_INFO.A#PN and a1.C_SN = FO_INFO.A#SN and ROWNUM = 1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315053424', 40, 1, 'select  case when a1.DATE_OPER <= P_ON_DATE then SUM(a1.AMT) else SUM(a1.AMT)+(
	select  NVL(SUM(e1.C_SUM_WR_OFF),0) A$1
	from Z#R2_DEP_SOURCE e2, Z#R2_DEP_TRANSFER e1
	where e1.C_SRC=e2.id
	  and (e1.C_PRODUCT = a1.PROD and e1.C_PN = a1.PN and case when P_ON_DATE-e1.C_DATE_OPER >= e2.C_DETAIL_DAYS and e2.C_DETAIL_DAYS is not NULL then e2.C_NEXT_SRC else e1.C_SRC end = a1.SRC and e1.C_DATE_WR_OFF > P_ON_DATE)
) end
from (
	select  d1.C_PRODUCT PROD, d1.C_PN PN, case when P_ON_DATE-b1.DATE_OPER >= b2.C_DETAIL_DAYS and b2.C_DETAIL_DAYS is not NULL then d2.C_NEXT_SRC else d1.C_SRC end SRC, d1.C_DATE_OPER DATE_OPER, NVL(b1.SUM_INCOME,0)-NVL(b1.SUM_WR_OFF,0) AMT
	from Z#R2_DEP_SOURCE d2, Z#R2_DEP_SRC_FIN_A d1, Z#R2_DEP_SOURCE b2, (
		select  c1.C_PRODUCT PRODUCT, c1.C_PN PN, c1.C_DATE_OPER DATE_OPER, case when c1.C_DATE_OPER-c1.C_DATE_OPER >= c2.C_DETAIL_DAYS and c2.C_DETAIL_DAYS is not NULL then c2.C_NEXT_SRC else c1.C_SRC end SRC, c1.C_SUM_WR_OFF SUM_WR_OFF, c1.C_SN SN, c1.C_SUM_INCOME SUM_INCOME
		from Z#R2_DEP_SOURCE c2, Z#R2_DEP_SRC_FIN_A c1
		where c1.C_SRC=c2.id(+)
		  and (c1.C_DATE_OPER <= P_ON_DATE and c1.C_PRODUCT = P_DEP and c1.C_PN = P_PN)
	) b1
	where b1.SRC=b2.id(+) and d1.C_SRC=d2.id(+)
	  and (b1.PRODUCT(+) = d1.C_PRODUCT and b1.PN(+) = d1.C_PN and b1.SRC(+) = d1.C_SRC and d1.C_SN is NULL and d1.C_PRODUCT = P_DEP and d1.C_PN = P_PN)
) a1
where a1.SRC = P_SOURCE
group by a1.PROD,a1.PN,a1.SRC,a1.DATE_OPER');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312661699', 3, 1, 'select  a1.rowid
from Z#R2_TYPE_ACC a2, Z#R2_ACC a1
where a1.C_TYPE_ACC=a2.id
  and (a1.C_PRODUCT = plp$THIS and a1.C_PN = plp$3$1 and a1.C_CLASS_NAME = ''R2_DEPOSIT'' and a1.C_DATE_END is NULL and (a1.C_TYPE_ACC = P_TYPE_ACC or P_TYPE_ACC is NULL) and a2.C_CLASS_ID != ''R2_UNION'')');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315044574', 4, 1, 'select  a1.rowid
from Z#R2_FACT_OPER a1
where a1.C_FOLDER_ID = plp$4$1 and a1.C_DOC_ID = plp$4$2 and a1.C_DATE_OPER = plp$4$3 and a1.C_PRODUCT != plp$4$4');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315040548', 7, 1, 'select  a1.C_MAIN_V_ID MAIN_V_ID
from Z#R2_ACC b1, Z#R2_AN_ACCOUNT a1
where a1.C_MAIN_V_ID = b1.C_NUM_ACC and a1.C_MAIN_V_ID_NOKEY = SUBSTR(b1.C_NUM_ACC,1,8)||''0''||SUBSTR(b1.C_NUM_ACC,10) and b1.C_CLASS_NAME = ''R2_DEPOSIT'' and b1.C_PRODUCT = V_FO.A#PRODUCT and b1.C_PN = V_FO.A#PN');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312672945', 2, 1, 'select distinct a1.C_FOLDER_ID FO_TRANS, a1.C_DOC_ID FO_CORR, a1.C_SUMMA_OPER FO_SUM, a1.C_DOC FO_DOC, a1.C_PRODUCT PRODUCT, a1.C_PATTERN PATTERN, a1.C_DATE_CALC DATE_CALC, a1.C_DATE_OPER DATE_OPER, a1.C_FOLDER_ID||a1.C_DOC_ID||a1.C_DOC IDX
from Z#R2_FACT_OPER a1
where a1.C_FOLDER_ID in (
	select  b1.C_TRANS_ID A$1
	from Z#R2_TRANS_PARAM b1
	where b1.C_CODE like ''CORR._.CORR_DATE'' and b1.C_PARAM_DATE >= DATE_FROM and b1.C_PARAM_DATE < DATE_TO+1
) and ( exists (
	select  c1.C_FILIAL A$1
	from Z#R2_DEPOSIT c1
	where c1.ID = a1.C_PRODUCT and c1.C_FILIAL = P_BRANCH
) or  exists (
	select  d1.C_FILIAL A$1
	from Z#R2_LOAN d1
	where d1.ID = a1.C_PRODUCT and d1.C_FILIAL = P_BRANCH
)) and a1.C_PATTERN is not NULL and ((a1.C_CORRECTION_FO is not NULL and a1.C_STATE_OPER is NULL) or (a1.C_STATE_OPER = ''1''))
order by a1.C_FOLDER_ID,a1.C_DOC_ID,a1.C_DOC');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312678921', 2, 1, 'select  a1.C_FOLDER_ID FOLDER_ID, a1.C_DOC_ID DOC_ID, MIN(a1.C_DATE_OPER) DATE_OPER
from Z#R2_TRANS_INFO b1, Z#R2_FACT_OPER a1
where a1.C_FOLDER_ID = b1.C_TRANS_ID and b1.C_PROD_DATA is not NULL and a1.C_STATE_OPER is NULL and a1.C_PATTERN is not NULL and a1.C_FOLDER_ID is not NULL and a1.C_DOC_ID is not NULL and a1.C_DATE_OPER >= P_DATE_FROM and a1.C_DATE_OPER <= P_DATE_TO
group by a1.C_FOLDER_ID,a1.C_DOC_ID');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312672944', 1, 1, 'select  a1.C_CLASS_NAME CLASS_NAME, a1.C_PRODUCT PRODUCT, a1.C_PN PN, a1.C_SUMMA_OPER SUMMA, a1.C_SUMMA_NT SUM_NT, a1.C_PATTERN PATTERN, a1.C_DATE_OPER DATE_OPER
from Z#R2_FACT_OPER a1
where a1.C_DOC_ID = plp$P_DOC_ID and a1.C_FOLDER_ID = plp$P_FOLDER_ID');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312672944', 2, 1, 'select  a1.C_NUM_ACC ACC, b1.C_DT DT
from Z#R2_PATTERN b1, Z#R2_ACC a1
where a1.C_PRODUCT = F.PRODUCT and a1.C_PN = F.PN and b1.ID = F.PATTERN and a1.C_TYPE_ACC = b1.C_ACC_OPER and a1.C_DATE_BEG <= F.DATE_OPER and NVL(a1.C_DATE_END,TO_DATE(''01/01/3014'',''dd/mm/yyyy'')) > F.DATE_OPER
order by a1.C_DATE_BEG desc');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312672944', 5, 1, 'select * 
from (
	select  a1.C_DOC_ID FO_ID, a1.C_DATE_OPER FO_DATEOPER, b1.C_NUM_DOG NUMDOG, a1.C_SUMMA_OPER FO_SUM_PL, a1.C_SUMMA_NT FO_SUM_NT, a1.C_FOLDER_ID FO_TRANS, b1.ID DEP_ID, a1.C_DOC_ID FO_CORR, a1.C_PATTERN FO_PATT, a1.C_CLASS_NAME FO_CLASS, a1.C_DOC FO_DOC, a1.C_SN FO_SN
	from Z#DEPART c2, Z#R2_TRANS_INFO c1, Z#R2_DEPOSIT b1, Z#R2_FACT_OPER a1
	where c1.C_DEPART=c2.id(+)
	  and (a1.C_CLASS_NAME = ''R2_DEPOSIT'' and ((c1.C_DATE_CALC is not NULL and c1.C_DATE_CALC = P_DATE) or c1.C_DATE_OP = P_DATE) and ((a1.C_DATE_CALC is not NULL and a1.C_DATE_CALC = P_DATE) or a1.C_DATE_OPER = P_DATE) and ((plp$5$1 = ''1'') or ((plp$5$1 = ''0'') and a1.C_STATE_OPER is NULL)) and a1.C_CURRENCY = NVL(P_CUR,a1.C_CURRENCY) and a1.C_FOLDER_ID = c1.C_TRANS_ID and ((plp$5$2 = ''0'') or ((plp$5$2 = ''1'') and c1.C_USER_OP = NVL(P_CRUSER,c1.C_USER_OP))) and (((plp$5$3 = ''1'') and c2.C_CODE like plp$5$4||''%'') or ((plp$5$3 = ''0'') and c1.C_DEPART = P_DEPART)) and a1.C_PRODUCT in (b1.ID,(-1)*b1.ID) and a1.C_PN = b1.C_PN)
	union all
	select  d1.C_DOC_ID FO_ID, d1.C_DATE_OPER FO_DATEOPER, e1.C_NUM_DOG NUMDOG, d1.C_SUMMA_OPER FO_SUM_PL, d1.C_SUMMA_NT FO_SUM_NT, d1.C_FOLDER_ID FO_TRANS, e1.ID DEP_ID, d1.C_DOC_ID FO_CORR, d1.C_PATTERN FO_PATT, d1.C_CLASS_NAME FO_CLASS, d1.C_DOC FO_DOC, d1.C_SN FO_SN
	from Z#DEPART f2, Z#R2_TRANS_INFO f1, Z#R2_LOAN e1, Z#R2_FACT_OPER d1
	where f1.C_DEPART=f2.id(+)
	  and (d1.C_CLASS_NAME = ''R2_LOAN'' and ((f1.C_DATE_CALC is not NULL and f1.C_DATE_CALC = P_DATE) or f1.C_DATE_OP = P_DATE) and ((d1.C_DATE_CALC is not NULL and d1.C_DATE_CALC = P_DATE) or d1.C_DATE_OPER = P_DATE) and ((plp$5$5 = ''1'') or ((plp$5$5 = ''0'') and d1.C_STATE_OPER is NULL)) and d1.C_CURRENCY = NVL(P_CUR,d1.C_CURRENCY) and d1.C_FOLDER_ID = f1.C_TRANS_ID and ((plp$5$6 = ''0'') or ((plp$5$6 = ''1'') and f1.C_USER_OP = NVL(P_CRUSER,f1.C_USER_OP))) and (((plp$5$7 = ''1'') and f2.C_CODE like plp$5$8||''%'') or ((plp$5$7 = ''0'') and f1.C_DEPART = P_DEPART)) and d1.C_PRODUCT in (e1.ID,(-1)*e1.ID) and d1.C_PN = e');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312661668', 1, 1, 'select  a1.rowid
from Z#R2_ACC a1
where a1.C_PRODUCT = P_PROD and a1.C_PN = plp$1$1 and a1.C_TYPE_ACC = P_TYPE_ACC and a1.C_DATE_BEG < plp$P_DATE+1 and (a1.C_DATE_END is NULL or a1.C_DATE_END >= plp$P_DATE)
order by a1.C_DATE_BEG desc');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312661668', 2, 1, 'select  a1.rowid
from Z#R2_ACC a1
where a1.C_NUM_ACC = P_ACC_NUM and a1.C_DATE_BEG <= P_DATE and (a1.C_DATE_END > P_DATE+1 or a1.C_DATE_END is NULL)
order by a1.C_DATE_BEG desc');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312661668', 3, 1, 'select  a1.rowid
from Z#R2_ACC a1
where a1.C_NUM_ACC = P_ACC_NUM and a1.C_PN = P_PN and a1.C_DATE_BEG <= P_DATE and (a1.C_DATE_END > P_DATE+1 or a1.C_DATE_END is NULL)
order by a1.C_DATE_BEG desc');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312661668', 4, 1, 'select  a1.rowid
from Z#R2_ACC a1
where a1.C_NUM_ACC = P_ACC_NUM and a1.C_CLASS_NAME = ''R2_DEPOSIT'' and a1.C_DATE_BEG < P_DATE+1
order by a1.C_DATE_BEG desc');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312661668', 5, 1, 'select  a1.rowid
from Z#R2_ACC a1
where a1.C_NUM_ACC = P_ACC_NUM and a1.C_PN = P_PN and a1.C_CLASS_NAME = ''R2_DEPOSIT'' and a1.C_DATE_BEG < P_DATE+1
order by a1.C_DATE_BEG desc');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312661668', 9, 1, 'select  a1.rowid
from Z#R2_DEP_ARCH a1
where a1.C_PRODUCT = P_PRODUCT and a1.C_PN = plp$9$1 and a1.C_DATE_BEGIN <= ON_DATE
order by a1.C_DATE_BEGIN desc');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312661670', 1, 1, 'select  MAX(a1.C_DATE_OPER)
from Z#R2_FACT_OPER a1
where a1.C_PRODUCT = P_PRODUCT and a1.C_PN = plp$1$1 and a1.C_CLASS_NAME = ''R2_DEPOSIT'' and a1.C_VID_OPER in (3312657374,3312657375) and a1.C_DATE_OPER < P_ON_DATE+1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312661670', 4, 1, 'select  a1.rowid
from Z#R2_FACT_OPER a1
where a1.C_PRODUCT = P_PRODUCT and a1.C_PN = plp$4$1 and a1.C_CLASS_NAME = ''R2_DEPOSIT'' and a1.C_VID_OPER in (3312657374,3312657375) and a1.C_DATE_OPER < P_DATE+1
order by a1.C_DATE_OPER desc');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312661670', 13, 1, 'select  a1.rowid
from Z#R2_DEP_ARCH a1
where a1.C_PRODUCT = P_PRODUCT and a1.C_PN = plp$13$1 and a1.C_DATE_BEGIN <= P_DATE and a1.C_DATE_END+1 > P_DATE');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312661670', 14, 1, 'select  a1.rowid
from Z#R2_ACC a1
where a1.C_PRODUCT = P_PRODUCT and a1.C_PN = plp$14$1 and a1.C_CLASS_NAME = ''R2_DEPOSIT'' and a1.C_NUM_ACC = P_NUM_ACC');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312675166', 3, 1, 'select  a1.ID ID, a2.C_NAME VIDDOGNAME, a3.C_CUR_SHORT CURSHORT, b1.C_NUM_ACC ACCNUM, c1.C_SUMMA SALDO
from Z#R2_VID_DEBT c2, Z#R2_CRED_DEBT c1, Z#R2_TYPE_ACC b2, Z#R2_ACC b1, Z#CLIENT a4, Z#FT_MONEY a3, Z#R2_VID_DEPOSIT a2, Z#R2_DEPOSIT a1
where a1.C_VID_DEPOSIT=a2.id(+) and a1.C_CURRENCY=a3.id(+) and a1.C_CLIENT=a4.id and b1.C_TYPE_ACC=b2.id and c1.C_VID_DEBT=c2.id
  and (a1.C_CLIENT = P_CLIENT and a4.C_PN = plp$3$1 and a1.C_COM_STATUS in (2047879,6226536) and b1.C_PRODUCT = a1.ID and b1.C_PN = a1.C_PN and b2.C_CODE = ''D_ACCOUNT'' and c1.C_PRODUCT = a1.ID and c1.C_PN = a1.C_PN and c2.C_CODE = ''SUM_DOG'')
order by a1.C_DATE_BEGIN');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312675166', 6, 1, 'select  a1.C_PROD DEPN, a1.C_PART_NUM SUMPAY, a1.C_EDITION_UNO SUMINRUB, b1.C_NUM_ACC ACCNUM, c1.C_SUMMA SALDO
from Z#R2_VID_DEBT c2, Z#R2_CRED_DEBT c1, Z#R2_TYPE_ACC b2, Z#R2_ACC b1, Z#R2_DEPOSIT a3, Z#R2_LAST_WILL a2, Z#R2_LAST_WILL a1
where a1.C_UP_WILL=a2.id and a1.C_PROD=a3.id and b1.C_TYPE_ACC=b2.id and c1.C_VID_DEBT=c2.id
  and (a1.C_UP_WILL = P_LASTWILL and a2.C_PN = plp$6$1 and b1.C_PRODUCT = a1.C_PROD and b1.C_PN = a3.C_PN and b2.C_CODE = ''D_ACCOUNT'' and c1.C_PRODUCT = a1.C_PROD and c1.C_PN = a3.C_PN and c2.C_CODE = ''SUM_DOG'')');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312675164', 1, 1, 'select distinct a1.ID ID, a1.C_NUM_DOG NUMDOG, a1.C_DATE_BEGIN DAT, a2.C_NAME VIDDOGNAME, a3.C_CUR_SHORT CURSHORT, b1.C_NUM_ACC ACCNUM, c1.C_SUMMA SALDO
from Z#R2_VID_DEBT c2, Z#R2_CRED_DEBT c1, Z#R2_TYPE_ACC b2, Z#R2_ACC b1, Z#CLIENT a4, Z#FT_MONEY a3, Z#R2_VID_DEPOSIT a2, Z#R2_DEPOSIT a1
where a1.C_VID_DEPOSIT=a2.id(+) and a1.C_CURRENCY=a3.id(+) and a1.C_CLIENT=a4.id and b1.C_TYPE_ACC=b2.id and c1.C_VID_DEBT=c2.id
  and (a1.C_CLIENT = P_CLIENT and a4.C_PN = plp$1$1 and a1.C_COM_STATUS in (2047879,6226536) and b1.C_PRODUCT = a1.ID and b1.C_PN = a1.C_PN and b2.C_CODE = ''D_ACCOUNT'' and c1.C_PRODUCT = a1.ID and c1.C_PN = a1.C_PN and c2.C_CODE = ''SUM_DOG'')');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312660964', 1, 1, 'select  a1.ROWID
from Z#R2_AGENDA_JOUR a1
where a1.C_KEY = P_KEY and a1.C_AGENDA_CLASS = plp$P_CLASS and a1.C_AGENDA_OPER = plp$P_OPER and a1.C_RTL0 = NVL(TO_NUMBER(SYS_CONTEXT(''IBS_SYSTEM'',''RTL0'')),0)+1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3314648204', 1, 1, 'delete from Z#R2_AGENDA_OBJECT a1
	where a1.C_OBJ_DATA in (
		select  b1.C_OBJ_DATA A$1
		from Z#R2_AGENDA_OBJECT b1
		where b1.C_PN = P_PN or P_PN is NULL and b1.C_FILIAL = P_FILIAL and not  exists (
			select  c1.ID A$1
			from Z#R2_DEPOSIT c1
			where c1.C_CLIENT = b1.C_OBJ_DATA and c1.C_PN = b1.C_PN
		)
	)
	returning a1.ROWID
	bulk collect into R2AGO');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312660739', 38, 1, 'select  a1.ROWID
from Z#R2_AGENDA_OBJECT a1
where a1.C_OBJ_DATA = OBJ_DATA and a1.C_OBJ_CLASS = OBJ_CLASS and a1.C_FILIAL = plp$38$1 and a1.C_PN = OBJ_PN
for update of a1.C_OBJ_DAY nowait');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312660739', 39, 1, 'delete from Z#R2_AGENDA_OBJECT a1
	where a1.C_OBJ_DATA = OBJ_DATA and a1.C_OBJ_CLASS = OBJ_CLASS and a1.C_FILIAL = plp$39$1 and a1.C_PN = OBJ_PN');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312669386', 3, 1, 'update Z#R2_DEPOSIT_PRC a1 set
	a1.SN=nvl(a1.SN,1)+1, a1.SU=rtl.uid$, a1.C_CALC_NALOG = ''1''
	where a1.C_PRC_SCH = P_PRC_SCH and a1.C_CALC_NALOG = ''0''');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667954', 4, 1, 'select  a1.C_ACC_TYPE_REF
from Z#R2_ACC_TYPE_REF a1
where a1.COLLECTION_ID=plp$4$1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667954', 6, 1, 'select  a1.ROWID
from Z#R2_RES_PROD a1
where a1.C_PN = P_PROD.A#PN and a1.C_PROD_CLASS = P_PROD.A#PROD_CLASS and a1.C_ID_PROD = P_PROD.A#ID_PROD');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667954', 7, 1, 'select  a1.ROWID
from Z#R2_RES_PROD a1
where a1.C_PN = P_PROD.A#PN and a1.C_PROD_CLASS = P_PROD.A#PROD_CLASS and a1.C_ID_PROD = P_PROD.A#ID_PROD');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667954', 8, 1, 'update Z#R2_RES_PROD a1 set
	a1.SN=nvl(a1.SN,1)+1, a1.SU=rtl.uid$, a1.C_ID_PORT = P_PROD.A#ID_PORT, a1.C_ON_DATE = P_PROD.A#ON_DATE
	where a1.C_PN = P_PROD.A#PN and a1.C_PROD_CLASS = P_PROD.A#PROD_CLASS and a1.C_ID_PROD = P_PROD.A#ID_PROD');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667954', 9, 1, 'delete from Z#R2_RES_PROD a1
	where a1.C_PN = P_PROD.A#PN and a1.C_PROD_CLASS = P_PROD.A#PROD_CLASS and a1.C_ID_PROD = P_PROD.A#ID_PROD');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667954', 10, 1, 'select  a1.ROWID
from Z#R2_RES_DELAY a1
where a1.C_PN = P_PROD.A#PN and a1.C_PROD_CLASS = P_PROD.A#PROD_CLASS and a1.C_ID_PROD = P_PROD.A#ID_PROD and plp$P_ON_DATE >= a1.C_ON_DATE and (a1.C_DATE_END is NULL or plp$P_ON_DATE < a1.C_DATE_END) and a1.C_RES_VID = P_RES_VID');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667954', 11, 1, 'select  a1.ROWID
from Z#R2_RES_DELAY a1
where a1.C_PN = P_PROD.A#PN and a1.C_PROD_CLASS = P_PROD.A#PROD_CLASS and a1.C_ID_PROD = P_PROD.A#ID_PROD and plp$P_ON_DATE >= a1.C_ON_DATE and (a1.C_DATE_END is NULL or plp$P_ON_DATE < a1.C_DATE_END)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667954', 12, 1, 'select  a1.ROWID
from Z#R2_RES_DELAY a1
where a1.C_PN = P_PROD.A#PN and a1.C_PROD_CLASS = P_PROD.A#PROD_CLASS and a1.C_ID_PROD = P_PROD.A#ID_PROD and plp$P_ON_DATE >= a1.C_ON_DATE and (a1.C_DATE_END is NULL or plp$P_ON_DATE < a1.C_DATE_END) and a1.C_RES_VID = P_RES_VID');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667954', 13, 1, 'select  a1.C_PN, a1.C_ID_PROD, a1.C_PROD_CLASS, a1.C_ON_DATE, a1.C_DATE_END, a1.C_ST, a1.C_FINTOOL, a1.C_DELAY_AMT
from Z#R2_RES_DELAY a1
where a1.ROWID = plp$P_DELAY_REC.R_DELAY');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667954', 16, 1, 'select  a1.C_ACC_TYPE_REF
from Z#R2_ACC_TYPE_REF a1
where a1.COLLECTION_ID=plp$16$1
  and (a1.C_ACC_TYPE_REF = DEBT_CODE_REF)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667954', 17, 1, 'select  a1.C_ACC_TYPE_REF
from Z#R2_ACC_TYPE_REF a1
where a1.COLLECTION_ID=plp$17$1
  and (a1.C_ACC_TYPE_REF = DEBT_CODE_REF)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667954', 19, 1, 'select  a1.C_ACC_TYPE_REF
from Z#R2_ACC_TYPE_REF a1
where a1.COLLECTION_ID=plp$19$1
  and (a1.C_ACC_TYPE_REF = Z$R2_RES_PROD_LIB_CONSTANT.DEBT_TYPE_CODE)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667954', 20, 1, 'select  a1.C_ACC_TYPE_REF
from Z#R2_ACC_TYPE_REF a1
where a1.COLLECTION_ID=plp$20$1
  and (a1.C_ACC_TYPE_REF = Z$R2_RES_PROD_LIB_CONSTANT.MFO_BALANCE_CODE)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667954', 21, 1, 'select  a1.C_ACC_TYPE_REF
from Z#R2_ACC_TYPE_REF a1
where a1.COLLECTION_ID=plp$21$1
  and (a1.C_ACC_TYPE_REF = Z$R2_RES_PROD_LIB_CONSTANT.DEBT_TYPE_CODE)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667954', 22, 1, 'update Z#R2_RES_DELAY a1 set
	a1.SN=nvl(a1.SN,1)+1, a1.SU=rtl.uid$, a1.C_DELAY_AMT = P_DELAY.A#DELAY_AMT, a1.C_ON_DATE = P_DELAY.A#ON_DATE, a1.C_DATE_END = P_DELAY.A#DATE_END, a1.C_ST = plp$22$1
	where a1.ROWID = P_R_DELAY');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667954', 23, 1, 'select  a1.ID_PORT
from (
	select  b1.C_ID_PORT ID_PORT
	from Z#R2_RES_PRD_PRT_H b1
	where b1.C_PROD_CLASS = P_PROD.A#PROD_CLASS and b1.C_ID_PROD = P_PROD.A#ID_PROD and b1.C_PN = P_PROD.A#PN and b1.C_DATE_BEGIN < plp$P_ON_DATE+1
	order by b1.C_DATE_BEGIN desc
) a1
where ROWNUM < 2');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667954', 24, 1, 'update Z#R2_RES_PRD_PRT_H a1 set
	a1.SN=nvl(a1.SN,1)+1, a1.SU=rtl.uid$, a1.C_ID_PORT = P_PORT_NEW
	where a1.C_ID_PROD = plp$P_PROD.A#ID_PROD and a1.C_PROD_CLASS = plp$P_PROD.A#PROD_CLASS and a1.C_PN = plp$P_PROD.A#PN and a1.C_DATE_BEGIN = plp$P_ON_DATE');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667954', 25, 1, 'update Z#R2_RES_BASE_INCL a1 set
	a1.SN=nvl(a1.SN,1)+1, a1.SU=rtl.uid$, a1.C_ID_PORT = TBL_BASE_PORT(TBL_RES_BASE(I).RES_VID)
	where a1.C_ID_PROD = P_PROD.A#ID_PROD and a1.C_ID_RES_VID = TBL_RES_BASE(I).RES_VID');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667954', 26, 1, 'update Z#R2_RES_PRD_PRT_H a1 set
	a1.SN=nvl(a1.SN,1)+1, a1.SU=rtl.uid$, a1.C_ID_PORT = TBL_BASE_PORT(TBL_RES_BASE(I).RES_VID)
	where a1.C_ID_PROD = P_PROD.A#ID_PROD and a1.C_PROD_CLASS = P_PROD.A#PROD_CLASS and a1.C_PN = P_PROD.A#PN and a1.C_DATE_BEGIN = plp$P_ON_DATE and a1.C_ID_RES_VID = TBL_RES_BASE(I).RES_VID');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667954', 27, 1, 'select  a2.C_FILIAL, a1.C_DEPART
from Z#DEPART a2, Z#R2_RES_PROD a1
where a1.C_DEPART=a2.id(+)
  and (a1.C_ID_PROD = P_ID_PROD and a1.C_PROD_CLASS = P_PROD_CLASS and a1.C_PN = P_PN)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667954', 28, 1, 'select  a1.C_ON_DATE, NVL(a1.C_RES_AMT,0)
from Z#R2_RES_BASE a1
where a1.C_ID_PROD = P_ID_PROD and a1.C_PROD_CLASS = P_PROD_CLASS and a1.C_ID_RES_VID = P_RES_VID and a1.C_PN = P_PN and (a1.C_ACC_RES = plp$P_ACC_RES)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667954', 29, 1, 'select  SUM(NVL(a1.C_SUMMA,0))
from Z#R2_RES_FACT_OPER a1
where a1.C_ID_PROD = P_ID_PROD and a1.C_PROD_CLASS = P_PROD_CLASS and a1.C_ID_RES_VID = P_RES_VID and a1.C_PN = P_PN and a1.C_DATE_PROV > P_ON_DATE');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667954', 30, 1, 'update Z#R2_RES_BASE a1 set
	a1.SN=nvl(a1.SN,1)+1, a1.SU=rtl.uid$, a1.C_ON_DATE = P_ON_DATE, a1.C_RES_AMT = NVL(a1.C_RES_AMT,0)+NVL(plp$P_RES_AMT,0), a1.C_BASE_AMT = NVL(a1.C_BASE_AMT,0)+NVL(plp$P_BASE_AMT,0)
	where a1.C_ID_PROD = P_ID_PROD and a1.C_ID_RES_VID = P_RES_VID and a1.C_PN = P_PN');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3313436620', 22, 1, 'select  a1.ROWID A$1
from Z#R2_FACT_OPER a1
where a1.C_PRODUCT = plp$22$1 and a1.C_PN = plp$22$2 and a1.C_DATE_OPER = P_DATE and (a1.C_STATE_OPER is NULL or a1.C_STATE_OPER = ''0'') and a1.C_BASE_PAY = P_DOG_SERVICE and a1.C_CLASS_BASE_PAY = ''R2_DOG_SERVICE''');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667666', 1, 1, 'select  a1.C_FINTOOL
from Z#R2_RES_BASE a1
where a1.C_ID_PROD = P_PORT and a1.C_PROD_CLASS = plp$1$1 and a1.C_ID_RES_VID = P_RES_VID');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667666', 2, 1, 'select  a1.C_ID_PROD RES_PORT, a1.C_ID_RES_VID RES_VID
from Z#R2_RES_BASE a1
where a1.C_PROD_CLASS = ''R2_RES_PORT'' and a1.C_ACC_RES = P_RES_ACC');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667666', 4, 1, 'select distinct a1.C_ID_RES_VID ID_RES_VID, a1.C_ACC_RES ACC_RES, a1.C_ACC_DT ACC_DT, a1.C_ACC_CT ACC_CT
from Z#R2_RES_BASE a1
where a1.C_ID_PROD = THIS and a1.C_PROD_CLASS = plp$4$1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667861', 1, 1, 'select  COUNT(1)
from Z#R2_RES_PORT a2, Z#R2_RES_PROD a1
where a1.C_ID_PORT=a2.id
  and (a2.C_PORT_KIND = P_PORT_KIND)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667861', 2, 1, 'select  a1.C_ACC_TYPE_REF
from Z#R2_ACC_TYPE_REF a1
where a1.COLLECTION_ID=plp$2$1
  and (a1.C_ACC_TYPE_REF = Z$R2_RES_PROD_LIB_CONSTANT.DEBT_TYPE_CODE)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667861', 3, 1, 'select  a1.C_ACC_TYPE_REF
from Z#R2_ACC_TYPE_REF a1
where a1.COLLECTION_ID=plp$3$1
  and (a1.C_ACC_TYPE_REF = Z$R2_RES_PROD_LIB_CONSTANT.MFO_BALANCE_CODE)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667861', 5, 1, 'select  a1.C_ACC_TYPE_REF
from Z#R2_ACC_TYPE_REF a1
where a1.COLLECTION_ID=plp$5$1
  and (a1.C_ACC_TYPE_REF = Z$R2_RES_PROD_LIB_CONSTANT.DEBT_TYPE_CODE)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667861', 6, 1, 'delete from Z#R2_ACC_TYPE_REF a1
	where a1.COLLECTION_ID=plp$6$1
	  and (a1.C_ACC_TYPE_REF = Z$R2_RES_PROD_LIB_CONSTANT.DEBT_TYPE_CODE)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667861', 7, 1, 'select  a1.C_ACC_TYPE_REF
from Z#R2_ACC_TYPE_REF a1
where a1.COLLECTION_ID=plp$7$1
  and (a1.C_ACC_TYPE_REF = Z$R2_RES_PROD_LIB_CONSTANT.MFO_BALANCE_CODE)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667861', 8, 1, 'delete from Z#R2_ACC_TYPE_REF a1
	where a1.COLLECTION_ID=plp$8$1
	  and (a1.C_ACC_TYPE_REF = Z$R2_RES_PROD_LIB_CONSTANT.MFO_BALANCE_CODE)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667670', 4, 1, 'select  a1.C_ACC_RES, a1.C_ACC_DT, a1.C_ACC_CT
from Z#R2_RES_BASE a1
where a1.C_PN = P_PN and a1.C_PROD_CLASS = P_PROD_CLASS and a1.C_ID_PROD = P_PROD and a1.C_ID_RES_VID = P_RES_VID and ROWNUM = 1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667670', 5, 1, 'select  a1.ROWID
from Z#R2_RES_BASE a1
where a1.C_ID_PROD = P_PROD and a1.C_PROD_CLASS = P_PROD_CLASS and a1.C_ID_RES_VID = P_RES_VID and a1.C_PN = P_PN and a1.C_ACC_RES is not NULL and ROWNUM = 1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667670', 6, 1, 'select  a1.ROWID
from Z#R2_RES_BASE a1
where a1.C_ID_PROD = P_PROD and a1.C_PROD_CLASS = P_PROD_CLASS and a1.C_ID_RES_VID = P_RES_VID and a1.C_FINTOOL = P_FINTOOL and a1.C_PN = P_PN and ROWNUM = 1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667667', 2, 1, 'select  a1.ROWID GR
from Z#R2_RES_RISK_GR a1
where a1.C_ID_PROD = THIS and a1.C_VID_RES is not NULL');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315052614', 4, 1, 'update Z#R2_DEPOSIT_PRC a1 set
	a1.SN=nvl(a1.SN,1)+1, a1.SU=rtl.uid$, a1.C_CALC_NALOG = ''1''
	where a1.C_PRC_SCH = plp$THIS and a1.C_CALC_NALOG = ''0''');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315044550', 2, 1, 'select  a1.ID
from Z#R2_LOAN a1
where a1.C_COM_STATUS = 2047879 and a1.C_FILIAL = NVL(P_FILIAL,a1.C_FILIAL) and  exists (
	select /*+ FIRST_ROWS(1) */  1 A$1
	from Z#R2_PLAN_OPER b1
	where b1.C_PRODUCT = a1.ID and b1.C_PN = a1.C_PN and b1.C_DATE_OPER = P_DATE and b1.C_OPER = P_KIND_OPER
)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3313470922', 8, 1, 'select  a1.rowid
from Z#R2_FACT_OPER a1
where a1.C_PRODUCT = RDEP and a1.C_PN = plp$8$1 and a1.C_DATE_OPER >= DDATEBEG and a1.C_DATE_OPER < plp$P_DATEOPER+1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312661698', 3, 1, 'select  MAX(a1.C_DATE_OPER)
from Z#R2_FACT_OPER a1
where a1.C_PRODUCT in ((-1)*ABS(P_PRODUCT),ABS(P_PRODUCT)) and a1.C_PN = plp$3$1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3313440512', 3, 1, 'select  MAX(a1.C_DATE_OPER)
from Z#R2_FACT_OPER a1
where a1.C_PRODUCT in ((-1)*ABS(P_PRODUCT),ABS(P_PRODUCT)) and a1.C_PN = plp$3$1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312668696', 1, 1, 'select  a1.C_DOC
from Z#R2_FACT_OPER a1
where a1.C_DOC_ID = P_NUMCORRID and a1.C_FOLDER_ID = P_NUMTRANSID and a1.C_PN = P_NUMPARTITION and a1.C_PATTERN = P_REFPATTERN and a1.C_PRODUCT = P_NUMDOGID and a1.C_CLASS_NAME = plp$1$1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312668696', 4, 1, 'update Z#R2_FACT_OPER a1 set
	a1.SN=nvl(a1.SN,1)+1, a1.SU=rtl.uid$, a1.C_DOC = null
	where a1.C_DOC = V_DOC');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312661151', 13, 1, 'select  NVL(a1.NUM,0)+1, NVL(a1.LAST_NUM-1,TO_NUMBER(LPAD(''9'',plp$P_NUM_LEN,''9'')))
from (
	select  b1.NUM NUM, LEAD(b1.NUM) over (order by b1.NUM) LAST_NUM
	from (
		select  0 NUM
		from DUAL c1
		union all
		select  TO_NUMBER(SUBSTR(d1.C_MAIN_V_ID_NOKEY,NUM_POS)) NUM
		from Z#R2_AN_ACCOUNT d1
		where d1.C_MAIN_V_ID_NOKEY like P_MASK||''%''
	) b1
) a1
where a1.NUM+1 < a1.LAST_NUM or a1.LAST_NUM is NULL');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312661151', 16, 1, 'select  a1.ID, null, null
from Z#R2_ACC_POOL a1
where a1.C_BEG_NUM_ACC = ACC_MASK and TO_NUMBER(a1.C_MAX_NUM_ACC) > GREATEST(a1.C_MIN_NUM_ACC,NVL(a1.C_LAST_NUM,0)) and a1.C_STATUS = CS_POOL_ONLINE and a1.C_RTL0 = NVL(TO_NUMBER(SYS_CONTEXT(''IBS_SYSTEM'',''RTL0'')),0)+1
order by DBMS_RANDOM.VALUE');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312661151', 17, 1, 'select  a1.ROWID, a1.C_COM_STATUS, a1.C_MAIN_V_ID
from Z#R2_AN_ACCOUNT a1
where a1.C_MAIN_V_ID_NOKEY = ACC_NUM and a1.C_FILIAL = plp$17$1 and ROWNUM < 2
for update of a1.C_COM_STATUS nowait');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312661151', 18, 1, 'update Z#R2_AN_ACCOUNT a1 set
	a1.SN=nvl(a1.SN,1)+1, a1.SU=rtl.uid$, a1.C_COM_STATUS = CS_ACC_TO_OPEN
	where a1.C_MAIN_V_ID = P_ACC_TBL(I) and a1.C_FILIAL = P_FILIAL');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312661151', 19, 1, 'select  a1.ROWID
from Z#R2_AN_ACCOUNT a1
where a1.C_MAIN_V_ID_NOKEY = SUBSTR(P_AN_ACC,1,8)||''0''||SUBSTR(P_AN_ACC,10) and a1.C_FILIAL = P_FILIAL');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312661151', 20, 1, 'update Z#R2_ACC_POOL a1 set
	a1.SN=nvl(a1.SN,1)+1, a1.SU=rtl.uid$, a1.C_STATUS = CS_POOL_OFFLINE
	where (a1.C_RTL0 = P_NODE or P_NODE is NULL) and a1.C_BEG_NUM_ACC = P_ACC_MASK and a1.C_MAX_NUM_ACC = a1.C_LAST_NUM');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312661151', 21, 1, 'select  a1.ID, NVL(a1.C_MAX_NUM_ACC,0)-NVL(a1.C_MIN_NUM_ACC,0), NVL(a1.C_MAX_NUM_ACC,0)-NVL(a1.C_MIN_NUM_ACC,0)
from Z#R2_ACC_POOL a1
where a1.C_BEG_NUM_ACC = P_ACC_MASK and a1.C_STATUS = CS_POOL_ONLINE and (NVL(a1.C_MAX_NUM_ACC,0)-NVL(a1.C_MIN_NUM_ACC,0))/2 > (NVL(a1.C_LAST_NUM,0)-NVL(a1.C_MIN_NUM_ACC,0)) and (a1.C_RTL0 = P_NODE or P_NODE is NULL) and a1.C_TIME_USE > SYSDATE-.000115740740740740740740740740740740740741');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312661151', 22, 1, 'select  a1.ID, null, null
from Z#R2_ACC_POOL a1
where a1.C_BEG_NUM_ACC = P_ACC_MASK and a1.C_STATUS = CS_POOL_ONLINE and (a1.C_RTL0 = P_NODE or P_NODE is NULL)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312661151', 23, 1, 'select  a1.ROWID
from Z#R2_AN_ACCOUNT a1
where a1.C_MAIN_V_ID_NOKEY = SUBSTR(P_AN_ACC,1,8)||''0''||SUBSTR(P_AN_ACC,10) and a1.C_FILIAL = P_FILIAL');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312660589', 1, 1, 'select  a1.C_ACC
from Z#R2_ACC_CRITERIA a1
where a1.C_ACC_SVOD = P_REFACCSVOD and a1.C_CLIENT = P_REFCLIENT');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312660611', 1, 1, 'delete from Z#R2_ACC_POOL a1
	where a1.C_BEG_NUM_ACC = P_MASK');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312661692', 1, 1, 'select  a1.rowid
from Z#R2_ACC a1
where a1.C_PRODUCT = P_PROD and a1.C_PN = plp$1$1 and a1.C_CLASS_NAME = plp$1$2 and (a1.C_TYPE_ACC = P_TYPE_ACC or P_TYPE_ACC is NULL)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312661695', 1, 1, 'select  a1.rowid
from Z#R2_ACC a1
where a1.C_PRODUCT = plp$THIS and a1.C_PN = plp$1$1 and a1.C_CLASS_NAME = ''R2_DEPOSIT'' and a1.C_TYPE_ACC = P_TYPE_ACC and a1.C_DATE_BEG < P_DATE+1
order by a1.C_DATE_BEG desc');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312661695', 2, 1, 'select  a1.rowid
from Z#R2_ACC a1
where a1.C_PRODUCT = plp$THIS and a1.C_PN = plp$2$1 and a1.C_CLASS_NAME = ''R2_DEPOSIT'' and a1.C_TYPE_ACC = P_TYPE_ACC and a1.C_DATE_BEG < P_DATE+1
order by a1.C_DATE_BEG desc');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315040243', 4, 1, 'select  a1.rowid
from Z#R2_DEPOSIT_PRC a1
where a1.C_PRODUCT = RDEP and a1.C_PN = CLIENT_PN');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312660610', 1, 1, 'select  distinct a1.C_BEG_NUM_ACC
from Z#R2_ACC_POOL b1, Z#R2_ACC_POOL a1
where a1.ID != b1.ID and a1.C_BEG_NUM_ACC = b1.C_BEG_NUM_ACC and (b1.C_MIN_NUM_ACC >= a1.C_MIN_NUM_ACC and b1.C_MAX_NUM_ACC <= a1.C_MAX_NUM_ACC or b1.C_MIN_NUM_ACC <= a1.C_MIN_NUM_ACC and b1.C_MAX_NUM_ACC >= a1.C_MIN_NUM_ACC)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312660610', 2, 1, 'select  distinct a1.C_BEG_NUM_ACC BEG_NUM
from Z#R2_ACC_POOL a1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312660610', 3, 1, 'select  1
from Z#R2_AN_ACCOUNT b1, Z#R2_ACC_POOL a1
where a1.C_BEG_NUM_ACC = POOL.BEG_NUM and b1.C_MAIN_V_ID_NOKEY like a1.C_BEG_NUM_ACC||''%'' and a1.C_STATUS = 3312656976 and b1.C_MAIN_V_ID_NOKEY >= a1.C_BEG_NUM_ACC||LPAD(NVL(a1.C_LAST_NUM,a1.C_MIN_NUM_ACC),20-LENGTH(a1.C_BEG_NUM_ACC),''0'') and b1.C_MAIN_V_ID_NOKEY <= a1.C_BEG_NUM_ACC||LPAD(a1.C_MAX_NUM_ACC,20-LENGTH(a1.C_BEG_NUM_ACC),''0'') and b1.C_COM_STATUS = 6226536 and b1.C_MAIN_V_ID_NOKEY != a1.C_BEG_NUM_ACC||LPAD(NVL(a1.C_LAST_NUM,a1.C_MIN_NUM_ACC),20-LENGTH(a1.C_BEG_NUM_ACC),''0'') and ROWNUM = 1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315040108', 2, 1, 'select  null, null, null, a1.C_VID_DEPOSIT, a1.C_DATE_BEGIN, a1.C_DATE_END, a1.C_PN, a1.C_PRODUCT
from Z#R2_DEP_ARCH a1
where a1.C_PRODUCT = RDEP and a1.C_PN = plp$2$1
order by a1.C_DATE_BEGIN');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3313455097', 1, 1, 'select  a1.rowid
from Z#R2_FACT_OPER a1
where a1.C_FOLDER_ID = V_FOLDERS(IDX).A#TRANS_ID and a1.C_PRODUCT in (P_PRODUCT,(-P_PRODUCT)) and a1.C_PN = plp$1$1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312661148', 1, 1, 'select  distinct a1.ACC_NUM
from (
	select  b1.C_BEG_NUM_ACC ACC_NUM
	from Z#R2_ACC_POOL b1
	where b1.C_RTL0 = P_NODE or P_NODE is NULL
	union all
	select  c1.C_MASK ACC_NUM
	from Z#R2_ACC_POOL_DEF c1
) a1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312661151', 9, 1, 'select  a1.ROWID, a1.C_MAIN_V_ID_NOKEY, a1.C_MAIN_V_ID
from Z#R2_AN_ACCOUNT a1
where a1.C_MAIN_V_ID_NOKEY like P_MASK||''%'' and a1.C_COM_STATUS = CS_ACC_UNUSED and not  exists (
	select  1 A$1
	from Z#R2_AN_ACCOUNT b1
	where b1.ROWID <> a1.ROWID and a1.C_MAIN_V_ID_NOKEY = b1.C_MAIN_V_ID_NOKEY
)
order by a1.C_MAIN_V_ID_NOKEY');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312661151', 10, 1, 'select  a1.ROWID
from Z#R2_AN_ACCOUNT a1
where a1.ROWID = ACC_TBL(I) and a1.C_COM_STATUS = CS_ACC_UNUSED
for update of a1.C_COM_STATUS nowait');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312661151', 11, 1, 'update Z#R2_AN_ACCOUNT a1 set
	a1.SN=nvl(a1.SN,1)+1, a1.SU=rtl.uid$, a1.C_COM_STATUS = plp$P_ACC_STATUS, a1.C_DEPART = P_DEPART, a1.C_FILIAL = plp$P_FILIAL, a1.C_DATE_OP = P_ACCDATEOPEN, a1.C_RTL0 = POOL_NODE
	where a1.ROWID = ACC_TBL(J)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312661151', 12, 1, 'select  NVL(a1.NUM,0)+1, NVL(a1.LAST_NUM-1,TO_NUMBER(LPAD(''9'',plp$P_NUM_LEN,''9'')))
from (
	select  b1.NUM NUM, LEAD(b1.NUM) over (order by b1.NUM) LAST_NUM
	from (
		select  TO_NUMBER(SUBSTR(MAX(c1.C_MAIN_V_ID_NOKEY),NUM_POS)) NUM
		from Z#R2_AN_ACCOUNT c1
		where c1.C_MAIN_V_ID_NOKEY like P_MASK||''%''
	) b1
) a1
where a1.NUM+1 < a1.LAST_NUM or a1.LAST_NUM is NULL');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312661690', 4, 1, 'select  a1.rowid
from Z#R2_ACC a1
where a1.C_PRODUCT = THIS and a1.C_PN = plp$4$1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312665764', 2, 1, 'select  a1.C_NUM_ACC
from Z#R2_ACC a1
where a1.C_PRODUCT = P_LOAN_ID and a1.C_PN = plp$2$1 and a1.C_TYPE_ACC = P_TYPE_ACC and a1.C_DATE_BEG < plp$P_ON_DATE+1 and (a1.C_DATE_END is NULL or a1.C_DATE_END >= plp$P_ON_DATE) and ROWNUM = 1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312659527', 136, 1, 'select  a1.ROWID, DECODE(a1.C_CLASS_NAME,''R2_DEPOSIT'',3312656961,''R2_LOAN'',3312656965,''R2_SALARY'',3312656969), a1.C_FOLDER_ID, a1.C_DOC_ID, a1.C_DATE_OPER
from Z#R2_FACT_OPER a1
where a1.C_PRODUCT = plp$136$1 and a1.C_SN = plp$136$2 and a1.C_FOLDER_ID = plp$136$3 and ROWNUM = 1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312665759', 16, 1, 'select  a1.rowid
from Z#R2_PLAN_OPER a1
where a1.C_PN = plp$16$1 and a1.C_PRODUCT = plp$THIS and a1.C_PARAM is not NULL');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312661687', 7, 1, 'select  a1.rowid
from Z#R2_DEPOSIT_PRC a1
where a1.C_DOG4PRC = plp$THIS and a1.C_PN = plp$7$1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315040325', 3, 1, 'select  a1.rowid
from Z#R2_DEPOSIT_PRC a1
where a1.C_PRODUCT = RDEP and a1.C_PN = CLIENT_PN');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312661648', 5, 1, 'select  a1.ROWID
from Z#R2_DEP_ARCH a1
where a1.C_PRODUCT = P_PROD and a1.C_PN = plp$5$1 and a1.C_DATE_BEGIN < P_DATE_REPORT');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312661648', 6, 1, 'select  a1.rowid
from Z#R2_DEPOSIT_PRC a1
where a1.C_PRODUCT = P_PROD and a1.C_PN = plp$6$1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312661648', 7, 1, 'select  MAX(a1.C_DATE_OPER)
from Z#R2_FACT_OPER a1
where a1.C_PRODUCT = P_PROD and a1.C_PN = plp$7$1 and a1.C_VID_OPER in (3312657311) and a1.C_DATE_OPER <= P_DATE_REPORT-1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312661648', 13, 1, 'select  a1.C_PRC_SCH_BROKEN
from Z#R2_DEPOSIT_PRC a1
where a1.C_PRODUCT = P_PROD and a1.C_PN = plp$13$1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312661648', 17, 1, 'select  a1.C_SUMMA_OPER SUMM, a1.C_VID_OPER VID
from Z#R2_FACT_OPER a1
where a1.C_PN = plp$17$1 and a1.C_VID_OPER in (3312657310,3312657333) and a1.C_PRODUCT = P_PROD and a1.C_DATE_OPER > P_DATE_BEGIN and a1.C_DATE_OPER < P_DATE_REPORT');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312661648', 22, 1, 'select  a1.ROWID, a1.C_VID_DEPOSIT, a2.C_NAME, DECODE(a2.C_HAS_TIMEOUT,''1'',1,0), a1.C_DATE_BEGIN, a1.C_DATE_END, case when a1.C_DATE_END is not NULL then a1.C_DATE_END-a1.C_DATE_BEGIN else null end, a1.C_PRC_SCH, a1.C_DEP_NO_KT, a1.C_DATE_DOP_BEG, a1.C_DATE_DOP_END, a1.C_NOT_USE_SUM, a1.C_SUM_KT_MIN, a1.C_SUM_KT_MAX
from Z#R2_VID_DEPOSIT a2, Z#R2_DEP_ARCH a1
where a1.C_VID_DEPOSIT=a2.id(+)
  and (a1.C_PRODUCT = P_AGR and a1.C_PN = plp$22$1 and a1.C_DATE_BEGIN <= P_DATE and a1.C_DATE_END > P_DATE-1)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312661648', 23, 1, 'select  a1.rowid
from Z#R2_DEPOSIT_PRC a1
where a1.C_PRODUCT = P_AGR and a1.C_PN = plp$23$1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312661648', 34, 1, 'select  COUNT(a1.ROWID)
from Z#R2_DEP_ARCH a1
where a1.C_PRODUCT = P_AGR and a1.C_PN = plp$34$1 and a1.C_DATE_BEGIN < P_DATE');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3313442617', 3, 1, 'select  MAX(a1.C_DATE_CALC), MAX(a1.C_PRODUCT), MAX(a1.C_CLASS_NAME), MAX(a1.C_PN)
from Z#R2_FACT_OPER a1
where a1.C_DOC_ID = DOC_ID and a1.C_FOLDER_ID = FOLDER_ID
group by a1.C_FOLDER_ID,a1.C_DOC_ID');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3313442718', 1, 1, 'select  MIN(a1.C_DATE_OPER)
from Z#R2_TRANS_INFO b1, Z#R2_FACT_OPER a1
where a1.C_FOLDER_ID = b1.C_TRANS_ID and b1.C_PROD_DATA is not NULL and a1.C_STATE_OPER is NULL and a1.C_PATTERN is not NULL and a1.C_FOLDER_ID is not NULL and a1.C_DOC_ID is not NULL and not  exists (
	select /*+ first_rows(1) */  1 NUM
	from Z#AD_RECORDS c1
	where c1.C_TRANS_ID = a1.C_FOLDER_ID and c1.C_CORR_ID = a1.C_DOC_ID
)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3313442718', 2, 1, 'select distinct a1.STR
from (
	select /*+ FIRST_ROWS(10000) */ distinct ABS(b1.C_PRODUCT) STR, b1.C_DATE_OPER DATE_OPER, b1.C_SN SN
	from Z#R2_TRANS_INFO c1, Z#R2_FACT_OPER b1
	where b1.C_FOLDER_ID = c1.C_TRANS_ID and c1.C_PROD_DATA is not NULL and b1.C_STATE_OPER is NULL and b1.C_PATTERN is not NULL and b1.C_FOLDER_ID is not NULL and b1.C_DOC_ID is not NULL and b1.C_DATE_OPER > MIN_DATE-1 and not  exists (
		select /*+ first_rows(1) */  1 NUM
		from Z#AD_RECORDS d1
		where d1.C_TRANS_ID = b1.C_FOLDER_ID and d1.C_CORR_ID = b1.C_DOC_ID and d1.C_REP_DATE > MIN_DATE-1
	)
	order by b1.C_DATE_OPER desc,b1.C_SN desc
) a1
where ROWNUM <= 100000');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3313442718', 4, 1, 'select /*+ FIRST_ROWS(1) */ distinct a1.C_FOLDER_ID||''#''||a1.C_DOC_ID
from Z#R2_TRANS_INFO b1, Z#R2_FACT_OPER a1
where a1.C_FOLDER_ID = b1.C_TRANS_ID and b1.C_PROD_DATA is not NULL and a1.C_STATE_OPER is NULL and a1.C_PATTERN is not NULL and a1.C_FOLDER_ID is not NULL and a1.C_DOC_ID is not NULL and ROWNUM < 2 and not  exists (
	select /*+ first_rows(1) */  1 NUM
	from Z#AD_RECORDS c1
	where c1.C_TRANS_ID = a1.C_FOLDER_ID and c1.C_CORR_ID = a1.C_DOC_ID
)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3313442718', 5, 1, 'select  a1.STR
from (
	select /*+ FIRST_ROWS(10000) */ distinct b1.C_FOLDER_ID||''#''||b1.C_DOC_ID||''#''||TO_CHAR(b1.C_DATE_OPER,''DD.MM.YYYY'') STR, b1.C_DATE_OPER DATE_OPER, b1.C_SN SN
	from Z#R2_TRANS_INFO c1, Z#R2_FACT_OPER b1
	where b1.C_FOLDER_ID = c1.C_TRANS_ID and c1.C_PROD_DATA is not NULL and b1.C_STATE_OPER is NULL and b1.C_PATTERN is not NULL and b1.C_FOLDER_ID is not NULL and b1.C_DOC_ID is not NULL and b1.C_DATE_OPER > MIN_DATE-1 and b1.C_PRODUCT in (
		select distinct ABS(TRIM(REGEXP_SUBSTR(d1.C_STR,''[^,|;.]+'',1,ROWNUM))) SPLIT
		from (
			select  VCURRTASK C_STR
			from DUAL e1
		) d1
		where not REGEXP_SUBSTR(d1.C_STR,''[^,|;.]+'',1,ROWNUM) is NULL
		connect by LEVEL <= LENGTH(REGEXP_REPLACE(d1.C_STR,''[^,|;.]+''))+1
		union all
		select distinct (-ABS(TRIM(REGEXP_SUBSTR(f1.C_STR,''[^,|;.]+'',1,ROWNUM)))) SPLIT
		from (
			select  VCURRTASK C_STR
			from DUAL g1
		) f1
		where not REGEXP_SUBSTR(f1.C_STR,''[^,|;.]+'',1,ROWNUM) is NULL
		connect by LEVEL <= LENGTH(REGEXP_REPLACE(f1.C_STR,''[^,|;.]+''))+1
	) and not  exists (
		select /*+ first_rows(1) */  1 NUM
		from Z#AD_RECORDS h1
		where h1.C_TRANS_ID = b1.C_FOLDER_ID and h1.C_CORR_ID = b1.C_DOC_ID and h1.C_REP_DATE > MIN_DATE-1
	)
	order by b1.C_DATE_OPER,b1.C_SN,b1.C_FOLDER_ID||''#''||b1.C_DOC_ID||''#''||TO_CHAR(b1.C_DATE_OPER,''DD.MM.YYYY'')
) a1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3313442718', 11, 1, 'select  MIN(a1.C_DATE_OPER)
from Z#R2_FACT_OPER a1
where a1.C_FOLDER_ID = FOLDER_ID and a1.C_DOC_ID = DOC_ID');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312673045', 5, 1, 'select * 
from (
	select  a1.C_REP_DATE DATE_CALC, b1.C_DOC DOC, a1.C_NAZN NAZN, NVL(a1.C_ACC_CORR,a2.C_MAIN_V_ID) ACC_CORR, ''1'' DT, a1.C_DATE_STAMP DATE_STAMP, a1.C_TRANS_ID TRANS_ID, a1.C_CORR_ID CORR_ID, a1.C_SUMMA_DT SUMM, a4.C_CODE VID_SVOD, a1.C_SALDO SALDO, a1.C_SN_DT SN, a1.ID ID
	from Z#R2_FACT_OPER b1, Z#TYPE_ACC a4, Z#AC_FIN a3, Z#AC_FIN a2, Z#AD_RECORDS a1
	where a1.C_ACC_SVOD_CORR=a2.id(+) and a1.C_ACC_SVOD=a3.id(+) and a3.C_VID=a4.id(+)
	  and (a1.C_ACC_NUM = plp$5$1 and a1.C_PRODUCT = V_PROD and a1.C_REP_DATE >= P_DATE_BEGIN and a1.C_REP_DATE <= P_DATE_END and b1.C_DOC_ID = a1.C_CORR_ID and b1.C_FOLDER_ID = a1.C_TRANS_ID and b1.C_PATTERN = a1.C_PATT)
	union all
	select  c1.C_REP_DATE DATE_CALC, d1.C_DOC DOC, c1.C_NAZN NAZN, NVL(c1.C_ACC_NUM,c2.C_MAIN_V_ID) ACC_CORR, ''0'' DT, c1.C_DATE_STAMP DATE_STAMP, c1.C_TRANS_ID TRANS_ID, c1.C_CORR_ID CORR_ID, c1.C_SUMMA_KT SUMM, c4.C_CODE VID_SVOD, c1.C_SALDO_CORR SALDO, c1.C_SN_KT SN, c1.ID ID
	from Z#R2_FACT_OPER d1, Z#TYPE_ACC c4, Z#AC_FIN c3, Z#AC_FIN c2, Z#AD_RECORDS c1
	where c1.C_ACC_SVOD=c2.id(+) and c1.C_ACC_SVOD_CORR=c3.id(+) and c3.C_VID=c4.id(+)
	  and (c1.C_ACC_CORR = plp$5$2 and c1.C_PRODUCT_CORR = V_PROD and c1.C_REP_DATE >= P_DATE_BEGIN and c1.C_REP_DATE <= P_DATE_END and d1.C_DOC_ID = c1.C_CORR_ID and d1.C_FOLDER_ID = c1.C_TRANS_ID and d1.C_PATTERN = c1.C_PATT_CORR)
) a1
	order by a1.DATE_CALC,a1.SN,a1.TRANS_ID,a1.CORR_ID,a1.ID');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3314617123', 3, 8, 'K_CUR = Z$SYSTEM_VARIABLES.NATCUR then j1.C_SRV_FEE_BANK_AMT else j1.C_SRV_FEE_BANK_AMT*Z$DOCUMENT_LIB_CUR.GET_RATE(j1.C_SRV_FEE_BANK_CUR,m1.DAT) end COMISS_BANK, case when j1.C_SRV_FEE_ISS_CUR = Z$SYSTEM_VARIABLES.NATCUR then j1.C_SRV_FEE_ISS_AMT else j1.C_SRV_FEE_ISS_AMT*Z$DOCUMENT_LIB_CUR.GET_RATE(j1.C_SRV_FEE_ISS_CUR,m1.DAT) end COMISS_ISS, case when NVL(j1.C_SRV_STTL_PAY_CUR,Z$SYSTEM_VARIABLES.NATCUR) = Z$SYSTEM_VARIABLES.NATCUR then j1.C_SRV_ADD_FEE_AMT else j1.C_SRV_ADD_FEE_AMT*Z$DOCUMENT_LIB_CUR.GET_RATE(j1.C_SRV_STTL_PAY_CUR,m1.DAT) end COMISS_ADD
	from (
		select  n1.C_BASE_PAY TRAN, MIN(NVL(n1.C_DATE_CALC,n1.C_DATE_OPER)) DAT
		from Z#R2_FACT_OPER n1
		where n1.C_CLASS_BASE_PAY = ''R2_IP_TRANSACTS'' and n1.C_BASE_PAY is not NULL
		group by n1.C_BASE_PAY
	) m1, (
		select  l1.C_TRAN TRAN, SUM(NVL(l1.C_AMOUNT,0)) AMOUNT, SUM(NVL(l1.C_AMOUNT_CRED,0)) AMOUNT_CRED
		from Z#R2_IP_CHANGE_LA l1
		where l1.C_STATUS is NULL and l1.C_TRAN is not NULL
		group by l1.C_TRAN
	) k1, Z#CLIENT j27, Z#IP_CLIENT j26, Z#IP_PAY_SYSTEM j25, Z#IP_PAY_SYSTEM j24, Z#TYPE_PLASTIC j23, Z#OWS_PLASTIC_TYPE j22, Z#IP_PRODUCTS j21, Z#BRANCH j20, Z#IP_BRANCH j19, Z#DEPART j18, Z#R2_DEPOSIT j17, Z#R2_IP_ACCOUNTS j16, Z#DEPART j15, Z#IP_PROCESSINGS j14, Z#IP_TRANS_TYPES j13, Z#IP_TERM_TYPE j12, Z#NAMES_CITY j11, Z#PERSONAL_ADDRESS j10, Z#R2_IP_MERCH_CN j9, Z#NAMES_CITY j8, Z#PERSONAL_ADDRESS j7, Z#R2_IP_TERMINAL j6, Z#CLIENT j5, Z#BRANCH j4, Z#IP_CARD_TYPE j3, Z#R2_IP_CARDS j2, Z#R2_IP_TRANSACTS j1
	where j1.C_SRV_CARD_REF=j2.id(+) and j2.C_TYPE=j3.id(+) and j2.C_FILIAL=j4.id(+) and j4.C_BANK=j5.id(+) and j1.C_SRV_TERMINAL_REF=j6.id(+) and j6.C_ADDRESS=j7.id(+) and j7.C_CITY=j8.id(+) and j6.C_IP_MERCH_CN_REF=j9.id(+) and j9.C_ADDRESS=j10.id(+) and j10.C_CITY=j11.id(+) and j6.C_IP_TERM_TYPE_REF=j12.id(+) and j1.C_SRV_IP_TRANS_TYP=j13.id and j13.C_IP_PROCESSINGS=j14.id and j2.C_DEPART=j15.id(+) and j2.C_IP_ACCOUNTS_REF=j16.id(+) and j16.C_PROD_REF=j17.id(+) and j17.C_DEPART=j18.id(+) and j1.C_');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3314617123', 3, 9, 'SRV_IP_BRANCH=j19.id(+) and j19.C_BRANCH=j20.id(+) and j2.C_IP_PRODUCTS_REF=j21.id(+) and j21.C_PLASTIC_REF=j22.id(+) and j22.C_TYPE_PLASTIC=j23.id(+) and j23.C_PAY_SYS=j24.id(+) and j1.C_SRV_PAY_SYS_REF=j25.id(+) and j2.C_IP_CLIENT_REF=j26.id(+) and j26.C_CLIENT=j27.id(+)
	  and (k1.TRAN = j1.ID and m1.TRAN = j1.ID and j1.C_SRV_CARD_REF is not NULL and m1.DAT >= AD_REP_DATE_BEG and m1.DAT < AD_REP_DATE_END+1 and j14.C_TYPE_PROC = 3189227540 and ((NVL(j1.C_SRV_FEE_BANK_AMT,0)+NVL(j1.C_SRV_FEE_PRC_AMT,0)+NVL(j1.C_SRV_FEE_ISS_AMT,0)+NVL(j1.C_SRV_ADD_FEE_AMT,0)) = 0 and NVL(k1.AMOUNT,0) != 0 or (NVL(j1.C_SRV_TRANS_AMOUNT,0)-NVL(j1.C_SRV_STTL_PAY_AMT,0)) > 0) and not  exists (
		select /*+ FIRST_ROWS(1) */  1 A$1
		from (
			select  q1.C_BASE_PAY TRAN, MIN(NVL(q1.C_DATE_CALC,q1.C_DATE_OPER)) DAT
			from Z#R2_FACT_OPER q1
			where q1.C_CLASS_BASE_PAY = ''R2_IP_TRANSACTS'' and q1.C_BASE_PAY is not NULL
			group by q1.C_BASE_PAY
		) p1, Z#IP_TRANS_TYPES o2, Z#R2_IP_TRANSACTS o1
		where o1.C_SRV_IP_TRANS_TYP=o2.id
		  and (m1.DAT <= p1.DAT and p1.TRAN = o1.ID and p1.DAT < AD_REP_DATE_END+1 and o1.C_SRV_CARD_REF = j1.C_SRV_CARD_REF and o1.C_SRV_STTL_RCP_AMT = j1.C_SRV_STTL_PAY_AMT and o1.C_SRV_STTL_RCP_CUR = j1.C_SRV_STTL_PAY_CUR and INSTR(''#''||3054221569||''#''||3189282276||''#'',''#''||o2.C_TYPE_PROC_TRANS||''#'') > 0 and o1.C_SRV_COM_STATUS is NULL and o1.C_PN = j1.C_PN)
	) and INSTR(''#''||3054221569||''#''||3189282276||''#'',''#''||j13.C_TYPE_PROC_TRANS||''#'') = 0 and j1.C_SRV_COM_STATUS is NULL and (P_PN is NULL or j1.C_PN = P_PN))
	union all
	select  v1.C_PN PN, null TYPE_CARD_NAME, null TYPE_CARD_CODE, ''0'' OUR_CARD, null ISSUER_COUNTRY, ''1'' OUR_TERMINAL, NVL(v4.C_COUNTRY,v7.C_COUNTRY) TERMINAL_COUNTRY, v8.C_NAME TERM_TYPE_NAME, v8.C_CODE TERM_TYPE_CODE, v9.C_CAPTION TYPE_TRANS_NAME, v9.C_NAME TYPE_TRANS_CODE, v10.C_NAME TYPE_TRANS_PROC, v1.C_SIC_CODE SIC_CODE, Z$AD_CONTROL_LIB_REPORT.GETSUBJECTCLIENT(v12.C_BANK,TASK_AD_REP_DATE_END) OKATO, v13.C_NAME PAY_SYS_NAME, v13.C_CODE PAY_SYS_CO');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3313442685', 7, 1, 'select  a1.C_SN, a1.C_SUMMA_OPER, a1.C_DATE_OPER, a1.C_VID_OPER, a1.C_DOC, null, a1.C_BASE_PAY, null
from Z#R2_FACT_OPER a1
where a1.C_PRODUCT = P_DEP and a1.C_PN = plp$7$1 and a1.C_DATE_OPER <= P_DAT and a1.C_VID_OPER in (3312657307,3312657308,3312657309,3312657384,3312657374,3312657447)
order by a1.C_DATE_OPER,a1.C_SN');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3313442685', 15, 1, 'select  a1.C_DATE_BEGIN, a1.C_DATE_END, a1.C_SUM_DOG
from Z#R2_DEP_ARCH a1
where a1.C_PRODUCT = P_DEP and a1.C_PN = plp$15$1 and a1.C_DATE_END <= P_DAT
order by a1.C_DATE_END');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3313442685', 24, 1, 'select  a1.C_DATE_BEGIN, a1.C_DATE_END, a1.C_PRC_SCH
from Z#R2_DEP_ARCH a1
where a1.C_PRODUCT = TBLDATA(IDX).PRODUCT and a1.C_PN = plp$24$1 and a1.C_DATE_BEGIN < DDATE and a1.C_DATE_END > DDATEDEBT');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3313442685', 39, 1, 'select  a1.C_DATE_BEGIN DAT
from Z#R2_DEP_ARCH a1
where a1.C_PRODUCT = TBLDATA(IDX).PRODUCT and a1.C_PN = plp$39$1 and a1.C_DATE_END <= DDATEDEBT
order by a1.C_DATE_END');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3313442685', 40, 1, 'select  a1.rowid
from Z#R2_DEPOSIT_SUM a1
where a1.C_PRODUCT = TBLDATA(IDX).PRODUCT and a1.C_PN = plp$40$1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312675168', 2, 1, 'select  a1.ID ID, a2.C_NAME VIDDOGNAME, a3.C_CUR_SHORT CURSHORT, b1.C_NUM_ACC ACCNUM, c1.C_PART_NUM SUMPAY, c1.C_EDITION_UNO SUMINRUB, c1.ID LAST_WILL
from Z#R2_LAST_WILL c2, Z#R2_LAST_WILL c1, Z#R2_TYPE_ACC b2, Z#R2_ACC b1, Z#FT_MONEY a3, Z#R2_VID_DEPOSIT a2, Z#R2_DEPOSIT a1
where a1.C_VID_DEPOSIT=a2.id(+) and a1.C_CURRENCY=a3.id(+) and b1.C_TYPE_ACC=b2.id and c1.C_UP_WILL=c2.id
  and (c1.C_UP_WILL = P_LASTWILL and c1.C_DOCUM is NULL and c2.C_PN = plp$2$1 and c1.C_PROD = a1.ID and b1.C_PRODUCT = a1.ID and b1.C_PN = a1.C_PN and b2.C_CODE = ''D_ACCOUNT'')
order by a1.C_DATE_BEGIN');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312661694', 17, 1, 'select  DECODE(a1.C_VID_OPER,RVIDOPERSNB,a1.C_SUMMA_OPER,0), DECODE(a1.C_VID_OPER,RVIDOPERSN,a1.C_SUMMA_OPER,0)
from Z#R2_FACT_OPER a1
where a1.C_PRODUCT = plp$THIS and a1.C_PN = plp$17$1 and a1.C_CLASS_NAME = ''R2_DEPOSIT'' and a1.C_DATE_OPER >= TRUNC(P_DATE_CAP,''Y'') and a1.C_DATE_OPER < P_DATE_CAP and a1.C_VID_OPER in (RVIDOPERSNB,RVIDOPERSN)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312661694', 29, 1, 'select  SUM(a1.C_SUMMA_OPER)
from Z#R2_FACT_OPER a1
where a1.C_PRODUCT = plp$THIS and a1.C_PN = plp$29$1 and a1.C_CLASS_NAME = plp$29$2 and a1.C_DATE_OPER < DDATENEXT and a1.C_VID_OPER = 3312657311');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312661674', 9, 1, 'select  a1.ROWID
from Z#R2_DEPOSIT_SUM a1
where a1.C_PRODUCT = THIS and a1.C_PN = plp$9$1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312661674', 10, 1, 'select  a1.ROWID
from Z#R2_DEPOSIT_PRC a1
where a1.C_PRODUCT = THIS and a1.C_PN = plp$10$1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312661674', 11, 1, 'select  a1.ROWID
from Z#R2_DEPOSIT_PROL a1
where a1.C_PRODUCT = THIS and a1.C_PN = plp$11$1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312660687', 4, 1, 'select  a1.ROWID
from Z#R2_PLAN_OPER a1
where a1.C_PRODUCT = P_CRED and a1.C_PN = P_PN and a1.C_SN = N_PLAN_SN');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312660687', 22, 1, 'select  a1.ROWID, ''R2_PLAN_OPER'', to_number(''''), '''', a1.C_PN, a1.C_PRODUCT, a1.C_SUMMA, a1.C_CURRENCY, a1.C_OPER, a1.C_DATE_OPER, a1.C_PARAM, a1.C_SUMMA_EXEC, a1.C_IS_EXECUTED, a1.C_DATE_BEGIN, a1.C_DATE_END, a1.C_OUTTIME_SUM, a1.C_CHANGE, a1.C_FULL_EXEC, a1.C_SN
from Z#R2_PLAN_OPER a1
where a1.C_PRODUCT = plp$22$1 and a1.C_PN = plp$22$2');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312665766', 1, 1, 'select  a1.C_NUM_ACC, a1.C_AC_FIN
from Z#R2_ACC a1
where a1.C_PRODUCT = PROD_ID and a1.C_PN = PROD_PN and a1.C_TYPE_ACC = ACCTYPE');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312665766', 4, 1, 'select  a1.rowid
from Z#R2_FACT_OPER a1
where a1.C_FOLDER_ID = P_NUMTRANSID and a1.C_DOC_ID = P_NUMCORRID and a1.C_PRODUCT = P_NUMPRODID and a1.C_PN = P_NUMPARTITION and a1.C_CLASS_NAME = ''R2_LOAN''');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312665766', 5, 1, 'select  a1.rowid
from Z#R2_FACT_OPER a1
where a1.C_FOLDER_ID = P_NUMTRANSID and a1.C_PRODUCT = P_NUMPRODID and a1.C_PN = P_NUMPARTITION and a1.C_CLASS_NAME = ''R2_LOAN''');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312665766', 6, 1, 'select  a1.rowid
from Z#R2_FACT_OPER a1
where a1.C_PRODUCT = P_NUMPRODID and a1.C_PN = P_NUMPARTITION and a1.C_CLASS_NAME = ''R2_LOAN'' and a1.C_SN = P_NUMSN');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312665766', 8, 1, 'select  a1.C_STATE_OPER
from Z#R2_FACT_OPER a1
where a1.C_FOLDER_ID = P_NUMTRANSID and a1.C_DOC_ID = P_NUMCORRID and a1.C_DATE_OPER = P_DATECORR and a1.C_PATTERN = P_REFPATTERN and a1.C_PN = P_NUMPARTITION and NVL(a1.C_DOC,(-1)) = (-1)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312665766', 9, 1, 'update Z#R2_FACT_OPER a1 set
	a1.SN=nvl(a1.SN,1)+1, a1.SU=rtl.uid$, a1.C_DOC = P_SUMMARIZED_DOCS(IDX).SUMMARIZED_DOC
	where a1.C_FOLDER_ID = P_SUMMARIZED_DOCS(IDX).TRANS_ID and a1.C_DOC_ID = P_SUMMARIZED_DOCS(IDX).CORR_ID and a1.C_PN = P_SUMMARIZED_DOCS(IDX).PN and a1.C_PATTERN = P_SUMMARIZED_DOCS(IDX).PATTERN');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312665787', 3, 1, 'select  MAX(a1.C_DATE_OPER)
from Z#R2_FACT_OPER a1
where a1.C_PRODUCT in ((-1)*ABS(P_PRODUCT),ABS(P_PRODUCT)) and a1.C_PN = plp$3$1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315052801', 1, 1, 'delete from Z#R2_RES_DELTA a1
	where a1.C_ID_PROD = plp$1$1 and a1.C_PROD_CLASS = plp$1$2 and a1.C_PN = plp$1$3');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315052801', 2, 1, 'delete from Z#R2_RES_BASE_INCL a1
	where a1.C_ID_PROD = plp$2$1 and a1.C_PROD_CLASS = plp$2$2 and a1.C_PN = plp$2$3');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315052801', 3, 1, 'delete from Z#R2_RES_DELAY a1
	where a1.C_ID_PROD = plp$3$1 and a1.C_PROD_CLASS = plp$3$2 and a1.C_PN = plp$3$3');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315052801', 4, 1, 'select  a1.ROWID, ''R2_FACT_OPER'', to_number(''''), '''', a1.C_DATE_OPER, a1.C_VID_OPER, a1.C_SUMMA_OPER, a1.C_CURRENCY, a1.C_PN, a1.C_STATE_OPER, a1.C_PRODUCT, a1.C_CLASS_NAME, a1.C_FOLDER_ID, a1.C_DOC_ID, a1.C_BASE_PAY, a1.C_SPLIT_DEBT, a1.C_PATTERN, a1.C_DOC, a1.C_SN, a1.C_DATE_CALC, a1.C_CLASS_BASE_PAY, a1.C_RATE_OPER, a1.C_CORRECTION_FO, a1.C_CORRECTED, a1.C_SUMMA_NT
from Z#R2_FACT_OPER a1
where a1.C_PRODUCT = plp$4$1 and a1.C_PN = plp$4$2
order by a1.C_DATE_OPER,a1.C_SN');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312666167', 8, 1, 'select  a1.rowid
from Z#R2_DEPOSIT_PRC a1
where a1.C_PRODUCT = plp$8$1 and a1.C_PN = plp$8$2');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312666167', 13, 1, 'select  a1.rowid
from Z#R2_DEPOSIT_SUM a1
where a1.C_PRODUCT = REFDEPOSIT and a1.C_PN = plp$13$1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312666167', 14, 1, 'select  a1.rowid
from Z#R2_DEPOSIT_PRC a1
where a1.C_PRODUCT = REFDEPOSIT and a1.C_PN = plp$14$1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312666167', 31, 1, 'select  a1.rowid
from Z#R2_DEPOSIT_PRC a1
where a1.C_PRODUCT = REFDEPOSIT and a1.C_PN = plp$31$1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667675', 1, 1, 'update Z#R2_RES_FACT_OPER a1 set
	a1.SN=nvl(a1.SN,1)+1, a1.SU=rtl.uid$, a1.C_SUMMA = a1.C_SUMMA+P_TBL_FO(J).SUMMA
	where a1.C_PN = P_TBL_FO(J).PN and a1.C_ID_PROD = P_TBL_FO(J).ID_PROD and a1.C_PROD_CLASS = P_TBL_FO(J).PROD_CLASS and a1.C_ID_RES_VID = P_TBL_FO(J).ID_RES_VID and a1.C_DATE_PROV = P_TBL_FO(J).DATE_PROV and a1.C_DOC is NULL');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667675', 2, 1, 'insert into Z#R2_RES_FACT_OPER a1 ( SN,SU, C_PN, C_ID_PROD, C_PROD_CLASS, C_ID_RES_VID, C_DATE_PROV, C_SUMMA, C_ST )
	values (1,rtl.uid$,P_TBL_FO(J).PN, P_TBL_FO(J).ID_PROD, P_TBL_FO(J).PROD_CLASS, P_TBL_FO(J).ID_RES_VID, P_TBL_FO(J).DATE_PROV, P_TBL_FO(J).SUMMA, P_TBL_FO(J).ST)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667675', 3, 1, 'select  a1.C_DEPART
from Z#R2_RES_PROD a1
where a1.C_ID_PROD = REC_FO.ID_PROD and a1.C_PN = REC_FO.PN and a1.C_PROD_CLASS = REC_FO.PROD_CLASS');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667675', 4, 1, 'select  a1.C_ACC_TYPE_REF
from Z#R2_ACC_TYPE_REF a1
where a1.COLLECTION_ID=plp$4$1
  and (a1.C_ACC_TYPE_REF = Z$R2_RES_PROD_LIB_CONSTANT.MFO_BALANCE_CODE)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667675', 5, 1, 'select  a1.C_MFO
from Z#R2_RES_PROD a1
where a1.C_ID_PROD = REC_FO.ID_PROD and a1.C_PN = REC_FO.PN and a1.C_PROD_CLASS = REC_FO.PROD_CLASS');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667675', 6, 1, 'update Z#R2_RES_FACT_OPER a1 set
	a1.SN=nvl(a1.SN,1)+1, a1.SU=rtl.uid$, a1.C_ST = 1, a1.C_COMMENT = S_ERR_TEXT
	where a1.ROWID = REC_FO.ID');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667675', 7, 1, 'delete from Z#R2_RES_FACT_OPER a1
	where a1.ROWID = TBL_FO2(I).ID');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667675', 8, 1, 'select  a1.C_ID_PORT, a1.C_ID_RES_VID, a1.C_FINTOOL, a1.C_DATE_PROV, NVL(SUM(a1.C_BASE_AMT),0), NVL(SUM(a1.C_BASE_AMT_UPD),0)
from Z#R2_RES_BASE_AGR a1
where a1.C_IS_HIST = ''0''
group by a1.C_ID_PORT,a1.C_ID_RES_VID,a1.C_FINTOOL,a1.C_DATE_PROV
order by a1.C_ID_PORT');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667675', 9, 1, 'delete from Z#R2_RES_BASE_AGR a1
	where a1.C_ID_PORT = REC_BASE_AGR.ID_PORT and a1.C_ID_RES_VID = REC_BASE_AGR.ID_RES_VID and a1.C_FINTOOL = REC_BASE_AGR.FINTOOL and a1.C_DATE_PROV = REC_BASE_AGR.DATE_PROV');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667675', 11, 1, 'select  a1.C_ID_RES_VID, a1.C_FINTOOL, a1.C_BASE_AMT
from Z#R2_RES_BASE a1
where a1.C_PN = REC_PORT.PN and a1.C_PROD_CLASS = REC_PORT.PROD_CLASS and a1.C_ID_PROD = REC_PORT.PROD_ID');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667675', 12, 1, 'select  a1.C_ID_RES_VID, a1.C_FINTOOL, SUM(a1.C_BASE_DELTA)
from Z#R2_RES_DELTA a1
where a1.C_ID_PORT = REC_PORT.PROD_ID and a1.C_ST = ''1''
group by a1.C_ID_RES_VID,a1.C_FINTOOL');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667675', 13, 1, 'select  a1.C_ID_RES_VID, a1.C_FINTOOL, SUM(a1.C_BASE_DELTA)
from Z#R2_RES_DELTA a1
where a1.C_ID_PROD = REC_PORT.PROD_ID and a1.C_PN = REC_PORT.PN and a1.C_ST = ''1''
group by a1.C_ID_RES_VID,a1.C_FINTOOL');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667675', 14, 1, 'select  a1.C_ID_RES_VID, SUM(NVL(a1.C_SUMMA,0))
from Z#R2_RES_FACT_OPER a1
where a1.C_PN = REC_PORT.PN and a1.C_ID_PROD = REC_PORT.PROD_ID
group by a1.C_ID_RES_VID');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667675', 15, 1, 'select  a1.ROWID, a1.C_ID_PROD, a1.C_PROD_CLASS, a1.C_ID_RES_VID, a1.C_PN, a1.C_DATE_PROV, a1.C_SUMMA, null, null
from Z#R2_RES_FACT_OPER a1
where a1.C_ST = ''0'' and a1.C_ID_PROD = REC_PORT.PROD_ID and a1.C_PN = REC_PORT.PN');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312665769', 16, 1, 'delete from Z#R2_PLAN_OPER a1
	where a1.C_PRODUCT = P_CRED and a1.C_PN = P_PN and a1.C_DATE_OPER >= DDATEFROMDEL and a1.C_DATE_BEGIN >= DDATEFROMDEL and a1.C_CHANGE != 2');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312665769', 19, 1, 'delete from Z#R2_PLAN_OPER a1
	where a1.C_PRODUCT = P_CRED and a1.C_PN = P_PN and  exists (
		select  b1.ID A$1
		from Z#R2_PARAM_PLAN b1
		where b1.ID = a1.C_PARAM and b1.C_PN = P_PN and b1.C_OPER_COUNT = 0 and b1.C_PLAN_DATES = ''0''
	)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312665769', 39, 1, 'select  a1.ROWID, ''R2_PLAN_OPER'', to_number(''''), '''', a1.C_PN, a1.C_PRODUCT, a1.C_SUMMA, a1.C_CURRENCY, a1.C_OPER, a1.C_DATE_OPER, a1.C_PARAM, a1.C_SUMMA_EXEC, a1.C_IS_EXECUTED, a1.C_DATE_BEGIN, a1.C_DATE_END, a1.C_OUTTIME_SUM, a1.C_CHANGE, a1.C_FULL_EXEC, a1.C_SN
from Z#R2_PLAN_OPER a1
where a1.C_PRODUCT = P_CRED and a1.C_PN = P_PN
order by a1.C_DATE_OPER,a1.C_DATE_END,DECODE(a1.C_OPER,VID_OPER_GASH_LOAN,3,VID_OPER_GASH_PRC,2,1),DECODE(a1.C_CHANGE,1,2,1)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312665769', 46, 1, 'insert into Z#R2_PLAN_OPER a1 ( SN,SU, C_PN, C_PRODUCT, C_SUMMA, C_CURRENCY, C_OPER, C_DATE_OPER, C_PARAM, C_SUMMA_EXEC, C_IS_EXECUTED, C_DATE_BEGIN, C_DATE_END, C_OUTTIME_SUM, C_CHANGE, C_FULL_EXEC, C_SN )
	values (1,rtl.uid$,TPLANROW.C_PN(IIDX), TPLANROW.C_PRODUCT(IIDX), TPLANROW.C_SUMMA(IIDX), TPLANROW.C_CURRENCY(IIDX), TPLANROW.C_OPER(IIDX), TPLANROW.C_DATE_OPER(IIDX), TPLANROW.C_PARAM(IIDX), TPLANROW.C_SUMMA_EXEC(IIDX), TPLANROW.C_IS_EXECUTED(IIDX), TPLANROW.C_DATE_BEGIN(IIDX), TPLANROW.C_DATE_END(IIDX), TPLANROW.C_OUTTIME_SUM(IIDX), TPLANROW.C_CHANGE(IIDX), TPLANROW.C_FULL_EXEC(IIDX), TPLANROW.C_SN(IIDX))');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312665769', 47, 1, 'update Z#R2_PLAN_OPER a1 set
	a1.SN=nvl(a1.SN,1)+1, a1.SU=rtl.uid$, a1.C_PN = TPLANROW.C_PN(IIDX), a1.C_PRODUCT = TPLANROW.C_PRODUCT(IIDX), a1.C_SUMMA = TPLANROW.C_SUMMA(IIDX), a1.C_CURRENCY = TPLANROW.C_CURRENCY(IIDX), a1.C_OPER = TPLANROW.C_OPER(IIDX), a1.C_DATE_OPER = TPLANROW.C_DATE_OPER(IIDX), a1.C_PARAM = TPLANROW.C_PARAM(IIDX), a1.C_SUMMA_EXEC = TPLANROW.C_SUMMA_EXEC(IIDX), a1.C_IS_EXECUTED = TPLANROW.C_IS_EXECUTED(IIDX), a1.C_DATE_BEGIN = TPLANROW.C_DATE_BEGIN(IIDX), a1.C_DATE_END = TPLANROW.C_DATE_END(IIDX), a1.C_OUTTIME_SUM = TPLANROW.C_OUTTIME_SUM(IIDX), a1.C_CHANGE = TPLANROW.C_CHANGE(IIDX), a1.C_FULL_EXEC = TPLANROW.C_FULL_EXEC(IIDX), a1.C_SN = TPLANROW.C_SN(IIDX)
	where a1.C_PRODUCT = P_CRED and a1.C_PN = P_PN and a1.C_SN = TPLANROW.C_SN(IIDX)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312665769', 48, 1, 'delete from Z#R2_PLAN_OPER a1
	where a1.C_PRODUCT = P_CRED and a1.C_PN = P_PN and a1.C_SN = TDELETEDID(IIDX)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312666456', 1, 1, 'select  a1.C_DATE_OPER, a1.C_OPER, a1.C_SUMMA
from Z#R2_PLAN_OPER a1
where a1.C_PRODUCT = plp$RCRED and a1.C_PN = plp$1$1 and a1.C_DATE_OPER >= DCALCBEG and a1.C_DATE_OPER < DCALCEND');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312660687', 29, 1, 'select  a1.C_SN
from Z#R2_PLAN_OPER a1
where a1.C_PRODUCT = plp$29$1 and a1.C_PN = plp$29$2 and a1.C_CHANGE = 2');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312660687', 32, 1, 'delete from Z#R2_PLAN_OPER a1
	where a1.C_PRODUCT = plp$32$1 and a1.C_PN = plp$32$2 and a1.C_CHANGE <> 2');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312660687', 33, 1, 'delete from Z#R2_PLAN_OPER a1
	where a1.C_PRODUCT = plp$33$1 and a1.C_PN = plp$33$2 and a1.C_SN = TPLANDEL(I)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312660687', 34, 1, 'update Z#R2_PLAN_OPER a1 set
	a1.SN=nvl(a1.SN,1)+1, a1.SU=rtl.uid$, a1.C_PARAM = TPLANUPD.C_PARAM(I), a1.C_CHANGE = TPLANUPD.C_O_CHANGE(I), a1.C_CURRENCY = TPLANUPD.C_O_CURRENCY(I), a1.C_DATE_BEGIN = TPLANUPD.C_O_DATE_BEGIN(I), a1.C_DATE_END = TPLANUPD.C_O_DATE_END(I), a1.C_FULL_EXEC = TPLANUPD.C_O_FULL_EXEC(I), a1.C_IS_EXECUTED = TPLANUPD.C_O_IS_EXECUTED(I), a1.C_DATE_OPER = TPLANUPD.C_O_ON_DATE(I), a1.C_OPER = TPLANUPD.C_O_OPER(I), a1.C_OUTTIME_SUM = TPLANUPD.C_O_OUTTIME_SUM(I), a1.C_SUMMA = TPLANUPD.C_O_SUMMA(I), a1.C_SUMMA_EXEC = TPLANUPD.C_O_SUMMA_EXEC(I)
	where a1.C_PRODUCT = plp$34$1 and a1.C_PN = plp$34$2 and a1.C_SN = TPLANUPD.C_SN(I)
	returning a1.C_SN
	bulk collect into TPLANUPDRES');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312660687', 35, 1, 'insert into Z#R2_PLAN_OPER a1 ( SN,SU, C_SN, C_PARAM, C_CHANGE, C_CURRENCY, C_DATE_BEGIN, C_DATE_END, C_FULL_EXEC, C_IS_EXECUTED, C_DATE_OPER, C_OPER, C_OUTTIME_SUM, C_PN, C_PRODUCT, C_SUMMA, C_SUMMA_EXEC )
	values (1,rtl.uid$,TPLANINS.C_SN(I), TPLANINS.C_PARAM(I), TPLANINS.C_O_CHANGE(I), TPLANINS.C_O_CURRENCY(I), TPLANINS.C_O_DATE_BEGIN(I), TPLANINS.C_O_DATE_END(I), TPLANINS.C_O_FULL_EXEC(I), TPLANINS.C_O_IS_EXECUTED(I), TPLANINS.C_O_ON_DATE(I), TPLANINS.C_O_OPER(I), TPLANINS.C_O_OUTTIME_SUM(I), TPLANINS.C_O_PN(I), TPLANINS.C_O_PRODUCT(I), TPLANINS.C_O_SUMMA(I), TPLANINS.C_O_SUMMA_EXEC(I))');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3314660912', 10, 1, 'select  a1.rowid
from Z#R2_TYPE_ACC a2, Z#R2_ACC a1
where a1.C_TYPE_ACC=a2.id
  and (a1.C_AC_FIN = REQCLIENT.A#1.A#2 and a2.C_CODE = ''СЧЕТ_ТО'' and a1.C_NUM_ACC = plp$10$1 and a1.C_CLASS_NAME = ''R2_LOAN'' and a1.C_PN = plp$10$2 and a1.C_PRODUCT = RCRED and ROWNUM < 2)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312668694', 10, 1, 'update Z#R2_FACT_OPER a1 set
	a1.SN=nvl(a1.SN,1)+1, a1.SU=rtl.uid$, a1.C_DOC = NVL(NVL(TBLLINKDOC(I).MD_ID_UPD2,TBLLINKDOC(I).MD_ID_UPD1),TBLLINKDOC(I).MD_ID)
	where a1.C_DOC = TBLLINKDOC(I).MD_ID');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315052479', 1, 1, 'select  a1.C_PN, a1.C_PROD_CLASS, a1.C_ID_PROD, a1.C_ID_PORT, b1.C_CURRENCY
from Z#R2_LOAN b1, Z#R2_RES_PROD a1
where a1.C_PROD_CLASS = ''R2_LOAN'' and a1.C_ID_PROD = b1.ID and a1.C_PN = b1.C_PN and b1.ID = plp$1$1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667676', 1, 1, 'update Z#R2_RES_DELAY a1 set
	a1.SN=nvl(a1.SN,1)+1, a1.SU=rtl.uid$, a1.C_ST = ''1''
	where a1.C_PN = plp$1$1 and a1.C_ID_PROD = plp$1$2 and a1.C_ON_DATE = plp$1$3 and a1.C_RES_VID = plp$1$4');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667676', 2, 1, 'select  a1.C_PN, a1.C_ID_PROD, a1.C_PROD_CLASS
from Z#DEPART a2, Z#R2_RES_PROD a1
where a1.C_DEPART=a2.id
  and (a1.C_CLIENT = R_CLIENT and a1.C_PN = plp$2$1 and a2.C_FILIAL = P_FILIAL and a1.C_COM_STATUS = 2047879)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667964', 2, 1, 'select  a1.C_ID_PORT, a1.C_ID_PROD, a1.C_PN
from Z#R2_RES_PROD a1
where a1.C_PROD_CLASS = ''R2_LOAN''');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3313471819', 3, 1, 'select  a1.C_FOLDER_ID FOLDER_ID, a1.C_DOC_ID DOC_ID, MIN(a1.C_DATE_OPER) DATE_OPER
from Z#R2_TRANS_INFO b1, Z#R2_FACT_OPER a1
where a1.C_FOLDER_ID = b1.C_TRANS_ID and b1.C_PROD_DATA is not NULL and a1.C_STATE_OPER is NULL and a1.C_PATTERN is not NULL and a1.C_FOLDER_ID is not NULL and a1.C_DOC_ID is not NULL and not  exists (
	select  1 NUM
	from Z#AD_RECORDS c1
	where c1.C_TRANS_ID = a1.C_FOLDER_ID and c1.C_CORR_ID = a1.C_DOC_ID
)
group by a1.C_FOLDER_ID,a1.C_DOC_ID');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312677095', 7, 1, 'select  a1.rowid
from Z#R2_FACT_OPER a1
where a1.C_PRODUCT in (P_DEPOSIT,(-P_DEPOSIT)) and a1.C_PN = plp$7$1 and a1.C_FOLDER_ID = plp$P_FOLDER_ID');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315040544', 2, 1, 'select  a1.C_PN PN, a1.C_CLASS_NAME CLASS_NAME, a1.C_DOC DOC, a1.C_FOLDER_ID FOLDER_ID, a1.C_DOC_ID DOC_ID, a1.C_PATTERN PATTERN, a1.C_PRODUCT PRODUCT, a1.C_CLASS_BASE_PAY CLASS_BASE_PAY, a1.C_BASE_PAY BASE_PAY, a1.C_DATE_CALC DATE_CALC, a1.C_DATE_OPER DATE_OPER, a1.C_SUMMA_NT SUMMA_NT
from Z#R2_DEPOSIT b1, Z#R2_FACT_OPER a1
where a1.C_STATE_OPER is NULL and a1.C_PATTERN is not NULL and a1.C_FOLDER_ID is not NULL and a1.C_DOC_ID is not NULL and a1.C_PN is not NULL and not  exists (
	select  1 NUM
	from Z#AD_TRANSACT_ATTR c1
	where a1.C_FOLDER_ID = c1.C_FO_TRANS_ID and a1.C_DOC_ID = c1.C_FO_CORR_ID and a1.C_PATTERN = c1.C_FO_PATTERN
) and a1.C_CLASS_NAME = ''R2_DEPOSIT'' and b1.C_PN is not NULL and b1.ID = a1.C_PRODUCT and b1.C_VID_DEPOSIT in (
	select  d1.ID A$1
	from Z#R2_VID_DEPOSIT d1
	where (d1.C_IS_CARD_DEP = ''1'')
)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3313442662', 91, 1, 'select  a1.C_SUMMA_OPER, a1.C_DATE_OPER, a1.C_VID_OPER, null, null
from Z#R2_FACT_OPER a1
where a1.C_PRODUCT = TABLE_AD_CRED(IDX).DOG_REF and a1.C_PN = plp$91$1 and a1.C_CLASS_NAME = ''R2_LOAN'' and INSTR(STR_OPERS,''#''||a1.C_VID_OPER||''#'') > 0 and a1.C_DATE_OPER <= AD_REP_DATE and a1.C_DATE_OPER > NVL(MAX_CALC_DATE,TO_DATE(''01.01.1014'',''DD.MM.YYYY''))
order by a1.C_DATE_OPER');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3313434275', 1, 1, 'select  a1.ROWID
from Z#R2_TRANS_INFO a1
where a1.C_TRANS_ID = P_NUMTRANSID');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3313434275', 25, 1, 'select  a1.C_FOLDER_ID FOLDER_ID, a1.C_DATE_OPER DATE_OPER, a1.C_CLASS_NAME CLASS_NAME, a1.C_CLASS_BASE_PAY CLASS_BASE_PAY, a1.C_BASE_PAY BASE_PAY, a1.C_STATE_OPER STATE_OPER
from Z#R2_FACT_OPER a1
where a1.C_DOC = P_MD
order by a1.C_FOLDER_ID');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3313434275', 27, 1, 'select  a1.ROWID
from Z#R2_TRANS_INFO a1
where a1.C_TRANS_ID = P_NUMTRANSID');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667662', 1, 1, 'select  a1.ROWID
from Z#R2_RES_FACT_OPER a1
where a1.C_DOC_ID = P_NUMCORRID and a1.C_PATTERN = P_REFPATTERN and a1.C_ID_PROD = P_NUMPRODID and a1.C_PN = N_PN and a1.C_DATE_PROV = P_DATEOPER');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667662', 2, 1, 'select  a1.ROWID
from Z#R2_RES_FACT_OPER a1
where a1.C_DOC_ID = P_NUMCORRID and a1.C_PATTERN = P_REFPATTERN and a1.C_ID_PROD = P_NUMPRODID and a1.C_DATE_PROV = P_DATEOPER');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667662', 4, 1, 'select  a1.C_PROD_CLASS, a1.C_PN
from Z#R2_RES_PROD a1
where a1.C_ID_PROD = P_NUMPRODID and a1.C_PROD_CLASS = ''R2_LOAN'' and a1.C_ID_PORT is NULL');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667662', 7, 1, 'update Z#R2_RES_FACT_OPER a1 set
	a1.SN=nvl(a1.SN,1)+1, a1.SU=rtl.uid$, a1.C_DOC = P_TBLOPERS(IDX).A#DOC, a1.C_ST = plp$7$1, a1.C_FOLDER_ID = P_NUMTRANSID, a1.C_DOC_ID = P_TBLOPERS(IDX).A#DOC_ID, a1.C_PATTERN = P_TBLOPERS(IDX).A#PATTERN, a1.C_COMMENT = null
	where a1.ROWID = FO_ID');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667662', 8, 1, 'select  a1.ROWID OPER_ID, a1.C_PATTERN PATTERN, a1.C_ST STATUS
from Z#R2_RES_FACT_OPER a1
where a1.C_DOC_ID = P_NUMCORRID and a1.C_FOLDER_ID = P_NUMTRANSID and a1.C_DATE_PROV = P_DATEOPER and a1.C_ID_PROD = P_NUMPRODID and a1.C_PN = P_NUMPARTITION');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667662', 9, 1, 'update Z#R2_RES_FACT_OPER a1 set
	a1.SN=nvl(a1.SN,1)+1, a1.SU=rtl.uid$, a1.C_DOC = P_SUMMARIZED_DOCS(IDX).SUMMARIZED_DOC
	where a1.C_DOC_ID = P_SUMMARIZED_DOCS(IDX).CORR_ID and a1.C_FOLDER_ID = P_SUMMARIZED_DOCS(IDX).TRANS_ID and a1.C_PATTERN = P_SUMMARIZED_DOCS(IDX).PATTERN');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667662', 10, 1, 'select  a1.ROWID
from Z#R2_TRANS_INFO a1
where a1.C_TRANS_ID = P_NUMTRANSID');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667662', 11, 1, 'select  a1.C_ST, a1.ROWID
from Z#R2_RES_FACT_OPER a1
where a1.C_DOC_ID = P_NUMCORRID and a1.C_DATE_PROV = P_DATECORR and a1.C_PATTERN = P_REFPATTERN and NVL(a1.C_DOC,(-1)) = (-1)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315051347', 4, 1, 'select  ''1''
from Z#R2_PROPERTIES a1
where a1.C_PRODUCT = RDEP and a1.C_PN = P_PN and a1.C_GROUP_PROP = 3312657922');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315051347', 6, 1, 'select  a1.rowid
from Z#R2_ACC a1
where a1.C_PRODUCT = RDEP and a1.C_PN = P_PN and a1.C_TYPE_ACC = 3312657129 and a1.C_DATE_BEG < P_DATE+1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315051347', 9, 1, 'select  a1.ROWID
from Z#R2_ACC a1
where a1.C_PN = P_PN and a1.C_NUM_ACC = P_ACC');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315051347', 10, 1, 'select  a1.ROWID
from Z#R2_ACC a1
where a1.C_PN = P_PN and a1.C_PRODUCT = plp$P_PRODUCT and a1.C_NUM_ACC = P_ACC');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315051347', 25, 1, 'select  a1.C_DOC
from Z#R2_FACT_OPER a1
where a1.C_PRODUCT = plp$P_PRODUCT and a1.C_PN = P_PN and a1.C_FOLDER_ID = plp$P_TRANS_ID and a1.C_CLASS_BASE_PAY = ''EXECUTORY_PROCES''');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315051347', 29, 1, 'select  a1.rowid
from Z#R2_ACC a1
where a1.C_PRODUCT = RDEP and a1.C_PN = P_PN and a1.C_TYPE_ACC = 3312657129 and a1.C_DATE_BEG < plp$P_DATE_END+1 and (a1.C_DATE_END is NULL or a1.C_DATE_END >= P_DATE_BEG)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667952', 2, 1, 'update Z#R2_RES_DELAY a1 set
	a1.SN=nvl(a1.SN,1)+1, a1.SU=rtl.uid$, a1.C_ST = ''1''
	where a1.ROWID = P_DELAY.ID_DELAY');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667952', 3, 1, 'select  a1.C_PN, a1.C_ID_PROD, a1.C_PROD_CLASS, a1.C_ID_RES_VID, a1.C_FINTOOL, a1.C_ACC_DT, a1.C_ACC_CT, b1.C_DEPART, a1.C_BASE_AMT, a1.C_RES_AMT, a1.C_ACC_RES
from Z#R2_RES_PROD b1, Z#R2_RES_BASE a1
where b1.C_ID_PROD = a1.C_ID_PROD and a1.C_PN = IDX_PN and  exists (
	select  c1.ROWID A$1
	from Z#R2_RES_DELTA c1
	where c1.C_PN = IDX_PN and c1.C_DATE_PROV <= P_DATE_PROV and (c1.C_ST = ''0'' or c1.C_DATE_PROV <= D_DATE_DEL) and a1.C_ID_PROD = c1.C_ID_PROD and a1.C_PROD_CLASS = c1.C_PROD_CLASS and a1.C_ID_RES_VID = c1.C_ID_RES_VID and a1.C_FINTOOL = c1.C_FINTOOL
) and a1.C_PROD_CLASS = ''R2_LOAN''');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667952', 4, 1, 'update Z#R2_RES_BASE a1 set
	a1.SN=nvl(a1.SN,1)+1, a1.SU=rtl.uid$, a1.C_ACC_DT = TBL_BASE_ACC(J).ACC_DT, a1.C_ACC_CT = TBL_BASE_ACC(J).ACC_CT, a1.C_ACC_RES = TBL_BASE_ACC(J).ACC_RES
	where a1.C_PROD_CLASS = ''R2_LOAN'' and a1.C_ID_PROD = TBL_BASE_ACC(J).ID_PROD and a1.C_ID_RES_VID = TBL_BASE_ACC(J).ID_RES_VID and a1.C_FINTOOL = TBL_BASE_ACC(J).FINTOOL and a1.C_PN = TBL_BASE_ACC(J).PN');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667952', 5, 1, 'select  a1.ROWID, a1.C_PN, a1.C_ID_PROD, a1.C_PROD_CLASS, a1.C_ID_RES_VID, a1.C_ID_PORT, a1.C_DATE_PROV, a1.C_BASE_DELTA, a1.C_FINTOOL, a1.C_ST, case when a1.C_ID_PORT is NULL then 0 else 1 end, case when b1.C_MFO is NULL then 0 else 1 end
from Z#R2_RES_PROD b1, Z#R2_RES_DELTA a1
where a1.C_PN = IDX_PN and a1.C_DATE_PROV <= P_DATE_PROV and (a1.C_ST = ''0'' or a1.C_DATE_PROV <= D_DATE_DEL) and (a1.C_ID_PORT = P_R_PORT or P_R_PORT is NULL) and b1.C_ID_PROD = a1.C_ID_PROD and b1.C_PROD_CLASS = a1.C_PROD_CLASS and b1.C_PN = a1.C_PN and ROWNUM <= N_BULK_LIMIT');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667952', 6, 1, 'select  a1.ROWID, a1.C_PN, a1.C_ID_PROD, a1.C_PROD_CLASS, a1.C_ID_RES_VID, a1.C_ID_PORT, a1.C_DATE_PROV, a1.C_BASE_DELTA, a1.C_FINTOOL, a1.C_ST, case when a1.C_ID_PORT is NULL then 0 else 1 end, case when b1.C_MFO is NULL then 0 else 1 end
from Z#R2_RES_PROD b1, Z#R2_RES_DELTA a1
where a1.C_PN = IDX_PN and MOD(a1.C_ID_PROD,P_STREAM_COUNT)+1 = P_STREAM_NUM and a1.C_DATE_PROV <= P_DATE_PROV and (a1.C_ST = ''0'' or a1.C_DATE_PROV <= D_DATE_DEL) and b1.C_ID_PROD = a1.C_ID_PROD and b1.C_PROD_CLASS = a1.C_PROD_CLASS and b1.C_PN = a1.C_PN and ROWNUM <= N_BULK_LIMIT');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667952', 12, 1, 'update Z#R2_RES_DELTA a1 set
	a1.SN=nvl(a1.SN,1)+1, a1.SU=rtl.uid$, a1.C_ST = ''1''
	where a1.ROWID = TBL_DELTA_TMP(J)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667952', 13, 1, 'delete from Z#R2_RES_DELTA a1
	where a1.ROWID = TBL_DELTA_TMP(J)');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667952', 14, 1, 'update Z#R2_RES_BASE_INCL a1 set
	a1.SN=nvl(a1.SN,1)+1, a1.SU=rtl.uid$, a1.C_ON_DATE = TBL_BASE_PROD(J).DATE_PROV, a1.C_BASE_AMT = NVL(a1.C_BASE_AMT,0)+NVL(TBL_BASE_PROD(J).BASE_AMT,0), a1.C_DATE_ACTUAL = D_DATE_ACTUAL
	where a1.C_PROD_CLASS = TBL_BASE_PROD(J).PROD_CLASS and a1.C_ID_PROD = TBL_BASE_PROD(J).ID_PROD and a1.C_ID_RES_VID = TBL_BASE_PROD(J).ID_RES_VID and a1.C_PN = TBL_BASE_PROD(J).PN');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667952', 15, 1, 'update Z#R2_RES_FACT_OPER a1 set
	a1.SN=nvl(a1.SN,1)+1, a1.SU=rtl.uid$, a1.C_SUMMA = NVL(a1.C_SUMMA,0)+NVL(TBL_FACT_OPER(J).SUMMA,0)
	where a1.C_ID_PROD = TBL_FACT_OPER(J).ID_PROD and a1.C_PROD_CLASS = TBL_FACT_OPER(J).PROD_CLASS and a1.C_ID_RES_VID = TBL_FACT_OPER(J).ID_RES_VID and a1.C_PN = TBL_FACT_OPER(J).PN and a1.C_DATE_PROV = TBL_FACT_OPER(J).DATE_PROV and a1.C_ST = ''0''');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667952', 16, 1, 'insert into Z#R2_RES_FACT_OPER a1 ( SN,SU, C_ID_PROD, C_PROD_CLASS, C_ID_RES_VID, C_PN, C_DATE_PROV, C_SUMMA, C_ST )
	values (1,rtl.uid$,TBL_FACT_OPER(J).ID_PROD, TBL_FACT_OPER(J).PROD_CLASS, TBL_FACT_OPER(J).ID_RES_VID, TBL_FACT_OPER(J).PN, TBL_FACT_OPER(J).DATE_PROV, TBL_FACT_OPER(J).SUMMA, ''0'')');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667952', 17, 1, 'update Z#R2_RES_BASE a1 set
	a1.SN=nvl(a1.SN,1)+1, a1.SU=rtl.uid$, a1.C_ON_DATE = TBL_BASE_PORT_TMP(J).DATE_PROV, a1.C_BASE_AMT = NVL(a1.C_BASE_AMT,0)+NVL(TBL_BASE_PORT_TMP(J).BASE_AMT,0), a1.C_DATE_ACTUAL = D_DATE_ACTUAL
	where a1.C_PROD_CLASS = TBL_BASE_PORT_TMP(J).PROD_CLASS and a1.C_ID_PROD = TBL_BASE_PORT_TMP(J).ID_PROD and a1.C_ID_RES_VID = TBL_BASE_PORT_TMP(J).ID_RES_VID and a1.C_FINTOOL = TBL_BASE_PORT_TMP(J).FINTOOL and a1.C_PN = TBL_BASE_PORT_TMP(J).PN');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667952', 18, 1, 'select  a1.ID_DELAY, a1.PN, a1.ID_PROD, a1.PROD_CLASS, a1.ON_DATE, a1.DATE_END, a1.DELAY_AMT, a1.ST, a1.FINTOOL, a1.RES_VID, a1.IS_MFO, a1.IGN_CH_PORT
from (
	select  b1.ROWID ID_DELAY, b1.C_PN PN, b1.C_ID_PROD ID_PROD, b1.C_PROD_CLASS PROD_CLASS, b1.C_ON_DATE ON_DATE, b1.C_DATE_END DATE_END, b1.C_DELAY_AMT DELAY_AMT, b1.C_ST ST, b1.C_FINTOOL FINTOOL, b1.C_RES_VID RES_VID, c1.C_MFO IS_MFO, c1.C_IGN_CH_PORT IGN_CH_PORT
	from Z#R2_RES_PROD c1, Z#R2_RES_DELAY b1
	where b1.C_PN = IDX_PN and b1.C_ON_DATE <= P_DATE_PROV and (NVL(b1.C_ST,''0'') = ''0'' or b1.C_DATE_END is NULL) and (b1.C_ID_PROD > N_LAST_PROD or b1.C_ID_PROD = N_LAST_PROD and b1.C_ON_DATE > D_LAST_DELAY) and c1.C_ID_PROD = b1.C_ID_PROD and c1.C_PROD_CLASS = b1.C_PROD_CLASS and c1.C_PN = b1.C_PN
	order by b1.C_ID_PROD,b1.C_ON_DATE
) a1
where ROWNUM <= N_BULK_LIMIT');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667952', 19, 1, 'select  a1.ID_DELAY, a1.PN, a1.ID_PROD, a1.PROD_CLASS, a1.ON_DATE, a1.DATE_END, a1.DELAY_AMT, a1.ST, a1.FINTOOL, a1.RES_VID, a1.IS_MFO, a1.IGN_CH_PORT
from (
	select  b1.ROWID ID_DELAY, b1.C_PN PN, b1.C_ID_PROD ID_PROD, b1.C_PROD_CLASS PROD_CLASS, b1.C_ON_DATE ON_DATE, b1.C_DATE_END DATE_END, b1.C_DELAY_AMT DELAY_AMT, b1.C_ST ST, b1.C_FINTOOL FINTOOL, b1.C_RES_VID RES_VID, c1.C_MFO IS_MFO, c1.C_IGN_CH_PORT IGN_CH_PORT
	from Z#R2_RES_PROD c1, Z#R2_RES_DELAY b1
	where b1.C_PN = IDX_PN and MOD(b1.C_ID_PROD,P_STREAM_COUNT)+1 = P_STREAM_NUM and b1.C_ON_DATE <= P_DATE_PROV and (NVL(b1.C_ST,''0'') = ''0'' or b1.C_DATE_END is NULL) and (b1.C_ID_PROD > N_LAST_PROD or b1.C_ID_PROD = N_LAST_PROD and b1.C_ON_DATE > D_LAST_DELAY) and c1.C_ID_PROD = b1.C_ID_PROD and c1.C_PROD_CLASS = b1.C_PROD_CLASS and c1.C_PN = b1.C_PN
	order by b1.C_ID_PROD,b1.C_ON_DATE
) a1
where ROWNUM <= N_BULK_LIMIT');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3313442700', 3, 1, 'select  a1.C_VID_OPER A$1, a1.C_PRODUCT A$2, a1.C_CLASS_NAME A$3, a1.C_CURRENCY A$4, SUM(case when a1.C_DATE_OPER <= REP_DATE then a1.C_SUMMA_OPER else 0 end) A$5, SUM(case when a1.C_DATE_OPER >= REP_DATE-5 and a1.C_DATE_OPER < REP_DATE-1 then a1.C_SUMMA_OPER else 0 end) A$6, SUM(case when a1.C_DATE_OPER >= REP_DATE-30 and a1.C_DATE_OPER < REP_DATE-5 then a1.C_SUMMA_OPER else 0 end) A$7, SUM(case when a1.C_DATE_OPER >= REP_DATE-90 and a1.C_DATE_OPER < REP_DATE-30 then a1.C_SUMMA_OPER else 0 end) A$8, SUM(case when a1.C_DATE_OPER >= REP_DATE-180 and a1.C_DATE_OPER < REP_DATE-90 then a1.C_SUMMA_OPER else 0 end) A$9, SUM(case when a1.C_DATE_OPER >= REP_DATE-360 and a1.C_DATE_OPER < REP_DATE-180 then a1.C_SUMMA_OPER else 0 end) A$10, SUM(case when a1.C_DATE_OPER < REP_DATE-360 then a1.C_SUMMA_OPER else 0 end) A$11, SUM(case when a1.C_DATE_OPER >= REP_DATE-1 and a1.C_DATE_OPER <= REP_DATE then a1.C_SUMMA_OPER else 0 end) A$12, SUM(case when MONTHS_BETWEEN(REP_DATE,a1.C_DATE_OPER) < 1 and MONTHS_BETWEEN(REP_DATE,a1.C_DATE_OPER) >= 0 then a1.C_SUMMA_OPER else 0 end) A$13, SUM(a1.C_SUMMA_OPER) A$14, MAX(b1.C_DATE_OPER) A$15
from Z#R2_FACT_OPER b1, Z#R2_FACT_OPER a1
where a1.C_PN = plp$3$1 and a1.C_CLASS_NAME = b1.C_CLASS_NAME and a1.C_PRODUCT = b1.C_PRODUCT and a1.C_VID_OPER = b1.C_VID_OPER and a1.C_CURRENCY = b1.C_CURRENCY and a1.C_PN = b1.C_PN and b1.C_DATE_OPER < REP_DATE and MONTHS_BETWEEN(b1.C_DATE_OPER,REP_DATE) > (-2)
group by a1.C_CLASS_NAME,a1.C_PRODUCT,a1.C_VID_OPER,a1.C_CURRENCY');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3313442700', 4, 1, 'select  a1.C_OPER A$1, a1.C_PRODUCT A$2, a1.C_CURRENCY A$3, SUM(case when a1.C_DATE_OPER >= REP_DATE then a1.C_SUMMA else 0 end) A$4, SUM(case when a1.C_DATE_OPER >= REP_DATE and a1.C_DATE_OPER <= REP_DATE+1 then a1.C_SUMMA else 0 end) A$5, SUM(case when a1.C_DATE_OPER > REP_DATE+1 and a1.C_DATE_OPER <= REP_DATE+5 then a1.C_SUMMA else 0 end) A$6, SUM(case when a1.C_DATE_OPER > REP_DATE+5 and a1.C_DATE_OPER <= REP_DATE+10 then a1.C_SUMMA else 0 end) A$7, SUM(case when a1.C_DATE_OPER > REP_DATE+10 and a1.C_DATE_OPER <= REP_DATE+20 then a1.C_SUMMA else 0 end) A$8, SUM(case when a1.C_DATE_OPER > REP_DATE+20 and a1.C_DATE_OPER <= REP_DATE+30 then a1.C_SUMMA else 0 end) A$9, SUM(case when a1.C_DATE_OPER > REP_DATE+30 and a1.C_DATE_OPER <= REP_DATE+90 then a1.C_SUMMA else 0 end) A$10, SUM(case when a1.C_DATE_OPER > REP_DATE+90 and a1.C_DATE_OPER <= REP_DATE+180 then a1.C_SUMMA else 0 end) A$11, SUM(case when a1.C_DATE_OPER > REP_DATE+180 and a1.C_DATE_OPER <= REP_DATE+270 then a1.C_SUMMA else 0 end) A$12, SUM(case when a1.C_DATE_OPER > REP_DATE+270 and MONTHS_BETWEEN(a1.C_DATE_OPER,REP_DATE) <= 12 then a1.C_SUMMA else 0 end) A$13, SUM(case when MONTHS_BETWEEN(a1.C_DATE_OPER,REP_DATE) > 12 then a1.C_SUMMA else 0 end) A$14, SUM(case when MONTHS_BETWEEN(a1.C_DATE_OPER,REP_DATE) < 1 and MONTHS_BETWEEN(a1.C_DATE_OPER,REP_DATE) >= 0 then a1.C_SUMMA else 0 end) A$15, SUM(case when a1.C_DATE_OPER < REP_DATE then a1.C_SUMMA else 0 end) A$16, SUM(a1.C_SUMMA) A$17, SUM(case when MONTHS_BETWEEN(a1.C_DATE_OPER,c1.C_DATE_BEGIN) > 12 then a1.C_SUMMA else 0 end) A$18, MIN(b1.C_DATE_OPER) A$19
from Z#R2_LOAN c1, Z#R2_PLAN_OPER b1, Z#R2_PLAN_OPER a1
where a1.C_PN = c1.C_PN and a1.C_PRODUCT = c1.ID and a1.C_PN = plp$4$1 and a1.C_PN = b1.C_PN and a1.C_PRODUCT = b1.C_PRODUCT and a1.C_OPER = b1.C_OPER and a1.C_CURRENCY = b1.C_CURRENCY and NVL(b1.C_IS_EXECUTED,''0'') <> ''1'' and b1.C_DATE_OPER < REP_DATE
group by a1.C_PRODUCT,a1.C_OPER,a1.C_CURRENCY');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3313442700', 11, 1, 'select  a1.C_VID_OPER A$1, a1.C_PRODUCT A$2, a1.C_CLASS_NAME A$3, a1.C_CURRENCY A$4, SUM(case when a1.C_DATE_OPER <= REP_DATE then a1.C_SUMMA_OPER else 0 end) A$5, SUM(case when a1.C_DATE_OPER >= REP_DATE-5 and a1.C_DATE_OPER < REP_DATE-1 then a1.C_SUMMA_OPER else 0 end) A$6, SUM(case when a1.C_DATE_OPER >= REP_DATE-30 and a1.C_DATE_OPER < REP_DATE-5 then a1.C_SUMMA_OPER else 0 end) A$7, SUM(case when a1.C_DATE_OPER >= REP_DATE-90 and a1.C_DATE_OPER < REP_DATE-30 then a1.C_SUMMA_OPER else 0 end) A$8, SUM(case when a1.C_DATE_OPER >= REP_DATE-180 and a1.C_DATE_OPER < REP_DATE-90 then a1.C_SUMMA_OPER else 0 end) A$9, SUM(case when a1.C_DATE_OPER >= REP_DATE-360 and a1.C_DATE_OPER < REP_DATE-180 then a1.C_SUMMA_OPER else 0 end) A$10, SUM(case when a1.C_DATE_OPER < REP_DATE-360 then a1.C_SUMMA_OPER else 0 end) A$11, SUM(case when a1.C_DATE_OPER >= REP_DATE-1 and a1.C_DATE_OPER <= REP_DATE then a1.C_SUMMA_OPER else 0 end) A$12, SUM(case when MONTHS_BETWEEN(REP_DATE,a1.C_DATE_OPER) < 1 and MONTHS_BETWEEN(REP_DATE,a1.C_DATE_OPER) >= 0 then a1.C_SUMMA_OPER else 0 end) A$13, SUM(a1.C_SUMMA_OPER) A$14, MAX(c1.C_DATE_OPER) A$15
from Z#R2_FACT_OPER c1, Z#R2_LOAN b1, Z#R2_FACT_OPER a1
where a1.C_PN = b1.C_PN and a1.C_PRODUCT = b1.ID and a1.C_CLASS_NAME = ''R2_LOAN'' and b1.C_CLIENT = CLIENT and a1.C_CLASS_NAME = c1.C_CLASS_NAME and a1.C_PRODUCT = c1.C_PRODUCT and a1.C_VID_OPER = c1.C_VID_OPER and a1.C_CURRENCY = c1.C_CURRENCY and a1.C_PN = c1.C_PN and c1.C_DATE_OPER < REP_DATE and MONTHS_BETWEEN(c1.C_DATE_OPER,REP_DATE) > (-2)
group by a1.C_CLASS_NAME,a1.C_PRODUCT,a1.C_VID_OPER,a1.C_CURRENCY
union all
select  d1.C_VID_OPER A$1, d1.C_PRODUCT A$2, d1.C_CLASS_NAME A$3, d1.C_CURRENCY A$4, SUM(case when d1.C_DATE_OPER <= REP_DATE then d1.C_SUMMA_OPER else 0 end) A$5, SUM(case when d1.C_DATE_OPER >= REP_DATE-5 and d1.C_DATE_OPER < REP_DATE-1 then d1.C_SUMMA_OPER else 0 end) A$6, SUM(case when d1.C_DATE_OPER >= REP_DATE-30 and d1.C_DATE_OPER < REP_DATE-5 then d1.C_SUMMA_OPER else 0 end) A');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3313442700', 11, 2, '$7, SUM(case when d1.C_DATE_OPER >= REP_DATE-90 and d1.C_DATE_OPER < REP_DATE-30 then d1.C_SUMMA_OPER else 0 end) A$8, SUM(case when d1.C_DATE_OPER >= REP_DATE-180 and d1.C_DATE_OPER < REP_DATE-90 then d1.C_SUMMA_OPER else 0 end) A$9, SUM(case when d1.C_DATE_OPER >= REP_DATE-360 and d1.C_DATE_OPER < REP_DATE-180 then d1.C_SUMMA_OPER else 0 end) A$10, SUM(case when d1.C_DATE_OPER < REP_DATE-360 then d1.C_SUMMA_OPER else 0 end) A$11, SUM(case when d1.C_DATE_OPER >= REP_DATE-1 and d1.C_DATE_OPER <= REP_DATE then d1.C_SUMMA_OPER else 0 end) A$12, SUM(case when MONTHS_BETWEEN(REP_DATE,d1.C_DATE_OPER) < 1 and MONTHS_BETWEEN(REP_DATE,d1.C_DATE_OPER) >= 0 then d1.C_SUMMA_OPER else 0 end) A$13, SUM(d1.C_SUMMA_OPER) A$14, MAX(f1.C_DATE_OPER) A$15
from Z#R2_FACT_OPER f1, Z#R2_DEPOSIT e1, Z#R2_FACT_OPER d1
where d1.C_PN = e1.C_PN and d1.C_PRODUCT = e1.ID and d1.C_CLASS_NAME = ''R2_DEPOSIT'' and e1.C_CLIENT = CLIENT and d1.C_CLASS_NAME = f1.C_CLASS_NAME and d1.C_PRODUCT = f1.C_PRODUCT and d1.C_VID_OPER = f1.C_VID_OPER and d1.C_CURRENCY = f1.C_CURRENCY and d1.C_PN = f1.C_PN and f1.C_DATE_OPER < REP_DATE and MONTHS_BETWEEN(f1.C_DATE_OPER,REP_DATE) > (-2)
group by d1.C_CLASS_NAME,d1.C_PRODUCT,d1.C_VID_OPER,d1.C_CURRENCY');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3313442700', 14, 1, 'select  a1.C_OPER, a1.C_PRODUCT, a1.C_CURRENCY, SUM(case when a1.C_DATE_OPER >= REP_DATE then a1.C_SUMMA else 0 end), SUM(case when a1.C_DATE_OPER >= REP_DATE and a1.C_DATE_OPER <= REP_DATE+1 then a1.C_SUMMA else 0 end), SUM(case when a1.C_DATE_OPER > REP_DATE+1 and a1.C_DATE_OPER <= REP_DATE+5 then a1.C_SUMMA else 0 end), SUM(case when a1.C_DATE_OPER > REP_DATE+5 and a1.C_DATE_OPER <= REP_DATE+10 then a1.C_SUMMA else 0 end), SUM(case when a1.C_DATE_OPER > REP_DATE+10 and a1.C_DATE_OPER <= REP_DATE+20 then a1.C_SUMMA else 0 end), SUM(case when a1.C_DATE_OPER > REP_DATE+20 and a1.C_DATE_OPER <= REP_DATE+30 then a1.C_SUMMA else 0 end), SUM(case when a1.C_DATE_OPER > REP_DATE+30 and a1.C_DATE_OPER <= REP_DATE+90 then a1.C_SUMMA else 0 end), SUM(case when a1.C_DATE_OPER > REP_DATE+90 and a1.C_DATE_OPER <= REP_DATE+180 then a1.C_SUMMA else 0 end), SUM(case when a1.C_DATE_OPER > REP_DATE+180 and a1.C_DATE_OPER <= REP_DATE+270 then a1.C_SUMMA else 0 end), SUM(case when a1.C_DATE_OPER > REP_DATE+270 and MONTHS_BETWEEN(a1.C_DATE_OPER,REP_DATE) <= 12 then a1.C_SUMMA else 0 end), SUM(case when MONTHS_BETWEEN(a1.C_DATE_OPER,REP_DATE) > 12 then a1.C_SUMMA else 0 end), SUM(case when MONTHS_BETWEEN(a1.C_DATE_OPER,REP_DATE) < 1 and MONTHS_BETWEEN(a1.C_DATE_OPER,REP_DATE) >= 0 then a1.C_SUMMA else 0 end), SUM(case when a1.C_DATE_OPER < REP_DATE then a1.C_SUMMA else 0 end), SUM(a1.C_SUMMA), SUM(case when MONTHS_BETWEEN(a1.C_DATE_OPER,b1.C_DATE_BEGIN) > 12 then a1.C_SUMMA else 0 end), MIN(c1.C_DATE_OPER)
from Z#R2_PLAN_OPER c1, Z#R2_LOAN b1, Z#R2_PLAN_OPER a1
where a1.C_PN = b1.C_PN and a1.C_PRODUCT = b1.ID and b1.C_CLIENT = CLIENT and a1.C_PN = plp$14$1 and a1.C_PN = c1.C_PN and a1.C_PRODUCT = c1.C_PRODUCT and a1.C_OPER = c1.C_OPER and a1.C_CURRENCY = c1.C_CURRENCY and NVL(c1.C_IS_EXECUTED,''0'') <> ''1'' and c1.C_DATE_OPER < REP_DATE
group by a1.C_PRODUCT,a1.C_OPER,a1.C_CURRENCY');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315051785', 8, 1, 'select  a1.rowid
from Z#R2_ACC a1
where a1.C_PRODUCT = RCRED and a1.C_PN = plp$8$1 and a1.C_AC_FIN = P_ACC and a1.C_NUM_ACC = plp$8$2 and a1.C_TYPE_ACC = plp$8$3 and a1.C_DATE_BEG = plp$8$4 and a1.C_CLASS_NAME = ''R2_LOAN''');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312662702', 1, 1, 'select  a1.rowid
from Z#R2_DEBTS_FOR_FO a1
where a1.C_PRODUCT = NPRODUCT and a1.C_PN = plp$1$1 and a1.C_NUM_OPER = plp$NUMDOC');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312662702', 3, 1, 'select  a1.rowid
from Z#R2_FACT_OPER a1
where a1.C_FOLDER_ID = plp$3$1 and a1.C_PN = plp$3$2 and a1.C_CLASS_NAME = ''R2_LOAN''');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312662702', 4, 1, 'select  a1.rowid
from Z#R2_FACT_OPER a1
where a1.C_FOLDER_ID = plp$4$1 and a1.C_PN = plp$4$2');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3312667956', 1, 1, 'select  SUM(NVL(a1.SUMM,0)), a1.FINTOOL
from (
	select  b1.C_BASE_AMT SUMM, b1.C_FINTOOL FINTOOL
	from Z#R2_RES_BASE b1
	where b1.C_ID_PROD = P_CRED and b1.C_ID_RES_VID = P_ID_RES_VID and b1.C_PN = P_PN
	union all
	select  c1.C_BASE_AMT A$1, c1.C_FINTOOL A$2
	from Z#R2_RES_BASE_INCL c1
	where c1.C_ID_PROD = P_CRED and c1.C_ID_RES_VID = P_ID_RES_VID and c1.C_PN = P_PN
	union all
	select  d1.C_BASE_DELTA A$1, d1.C_FINTOOL A$2
	from Z#R2_RES_DELTA d1
	where d1.C_ID_PROD = P_CRED and d1.C_ID_RES_VID = P_ID_RES_VID and d1.C_DATE_PROV < plp$P_DATE1+1 and d1.C_PN = P_PN
) a1
group by a1.FINTOOL');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315043352', 1, 1, 'select  SUM(NVL(a1.SUMM,0)), a1.FINTOOL
from (
	select  b1.C_BASE_AMT SUMM, b1.C_FINTOOL FINTOOL
	from Z#R2_RES_BASE b1
	where b1.C_ID_PROD = P_PORT and b1.C_ID_RES_VID = P_ID_RES_VID and b1.C_PN = N_PN
	union all
	select  c1.C_BASE_DELTA A$1, c1.C_FINTOOL A$2
	from Z#R2_RES_DELTA c1
	where c1.C_ID_PORT = P_PORT and c1.C_ID_RES_VID = P_ID_RES_VID and c1.C_DATE_PROV < plp$P_DATE1+1
) a1
group by a1.FINTOOL');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315043352', 2, 1, 'select  NVL(SUM(a1.SUMM),0)
from (
	select  b1.C_BASE_AMT SUMM
	from Z#R2_RES_BASE_INCL b1
	where b1.C_ID_PROD = P_ID_PROD and b1.C_FINTOOL = P_FINTOOL and b1.C_PN = P_PN and (b1.C_ID_RES_VID = P_RES_VID)
	union all
	select  c1.C_BASE_DELTA A$1
	from Z#R2_RES_DELTA c1
	where c1.C_ID_PROD = P_ID_PROD and c1.C_PN = P_PN and c1.C_FINTOOL = P_FINTOOL and c1.C_DATE_PROV < P_DATE+1 and (c1.C_ID_RES_VID = P_RES_VID)
) a1');

insert into rowid_cursors (METHOD_ID, POSITION, PIECE, TEXT)
values ('3315043352', 3, 1, 'select  a1.C_ID_PROD, a1.C_PN, b1.C_CURRENCY, b1.C_NUM_DOG
from Z#R2_LOAN b1, Z#R2_RES_PROD a1
where a1.C_PROD_CLASS = ''R2_LOAN'' and a1.C_ID_PORT = P_PORT and a1.C_ID_PROD = b1.ID and a1.C_PN = b1.C_PN
order by a1.C_ID_PROD');


