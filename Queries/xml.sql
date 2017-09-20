/*select t.column_value.getrootelement(), extractvalue(value(t),'/*')
from table(xmlsequence(extract(xmltype(dbms_xmlgen.getXML(q'[
select  C_ACTIONS,C_BROKEN,C_CMP,C_CMP_E,C_CMP_F,C_CMP_F_TUNE,C_COMPLEX,C_ERROR,C_FILES,C_GUID,C_HISTORY#ARR,C_HISTORY#ORD_ASC,C_HISTORY#TEXT,C_IS_COMMIT,C_IS_MT,C_JAVA_TEST,C_KEYS,C_LAST_NUM,C_NAME,C_NEED_PROFILE,C_NOTE,C_NO_GROUP_RUN,C_OS_USER,C_PROTECT#ARR,C_PROTECT#REC,C_PROTECT#UPD,C_PROTECT#UPD_REF,C_PROTECTED,C_RECS,C_REC_TEST,C_REPLACE_ID,C_REQUEST,C_RESTORE,C_RUN_PARAMS,C_SES_ID,C_STATE_NOTE,C_STATUS_CRIT,C_SUBSYS,C_TESTS,C_UNITS,C_USER,C_USER_RESP,ID,SN,SU 

from z#scripts z where nvl(z.id,0)= 832280403
]'))
,'/*//*'))) t;
*/
declare
l_xmltype xmltype;
l_clob clob  := 'zero';
id number := 832280403;
l_req varchar2(4000) := 'select  C_ACTIONS,C_BROKEN,C_CMP,C_CMP_E,C_CMP_F,C_CMP_F_TUNE,C_COMPLEX,C_ERROR,C_FILES,C_GUID,C_HISTORY#ARR,C_HISTORY#ORD_ASC,C_HISTORY#TEXT,C_IS_COMMIT,C_IS_MT,C_JAVA_TEST,C_KEYS,C_LAST_NUM,C_NAME,C_NEED_PROFILE,C_NOTE,C_NO_GROUP_RUN,C_OS_USER,C_PROTECT#ARR,C_PROTECT#REC,C_PROTECT#UPD,C_PROTECT#UPD_REF,C_PROTECTED,C_RECS,C_REC_TEST,C_REPLACE_ID,C_REQUEST,C_RESTORE,C_RUN_PARAMS,C_SES_ID,C_STATE_NOTE,C_STATUS_CRIT,C_SUBSYS,C_TESTS,C_UNITS,C_USER,C_USER_RESP,ID,SN,SU 

from z#scripts z where nvl(z.id,0) = '||id;


begin
  select c_script into l_clob from z#scripts z where z.id = 832280403;

  l_xmltype := XMLTYPE.CREATEXML(dbms_xmlgen.getXML(l_req)).APPENDCHILDXML ( '/ROWSET/ROW',
                                   XMLTYPE ( '<C_SCRIPT>'||q'[']'||substr(l_clob,1,1200)||q'[']'||'</C_SCRIPT>')                                          
                                 ) ;
dbms_output.put_line(l_xmltype.getClobVal());
end;
/
/*
DECLARE
 L_XML XMLTYPE;
BEGIN
 L_XML := XMLTYPE.CREATEXML ( '<abc><def></def></abc>' )
                 .APPENDCHILDXML ( '/abc/def',
                                   XMLTYPE.CREATEXML ( '<TextNode>ghi</TextNode>' )
                                          .EXTRACT ( '/TextNode/text()' )
                                 ) ;
 DBMS_OUTPUT.PUT_LINE( L_XML.getStringVal() );
END;




