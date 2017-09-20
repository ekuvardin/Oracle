 with demo1 as (
        select xmltype(get_table_alterxml('TAB1','TAB2')) xml from dual
    )
   select extractValue(value(dtl),'//text()') detail_id
   from demo1 t, table(XMLSequence(t.xml.extract('//ALTER_XML/ALTER_LIST/ALTER_LIST_ITEM/SQL_LIST/SQL_LIST_ITEM/TEXT','xmlns="http://xmlns.oracle.com/ku"'))) dtl;
