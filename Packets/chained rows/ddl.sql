create table t as
select rownum id,
       lpad(rownum, rownum * 1000, rownum) id1,
       lpad(rownum, rownum * 1000, rownum) id2,
       lpad(rownum, rownum * 1000, rownum) id3
  from dual
connect by rownum <= 4;

create or replace function get_affected_blocks(p_sql in varchar2)
  return varchar2 is
  l_file_name varchar2(4000);
  l_ident     varchar2(4000) := sys_guid;
  l_tmp       varchar2(4000);
  result      varchar2(4000);
  function file2clob(p_filename in varchar2) return clob is
    l_clob         clob;
    l_bfile        bfile := bfilename('UDUMP', p_filename);
    l_dest_offset  integer := 1;
    l_src_offset   integer := 1;
    l_lang_context integer := dbms_lob.default_lang_ctx;
    l_warning      integer;
  begin
  
    dbms_lob.createtemporary(l_clob, false, dbms_lob.call);
    dbms_lob.fileopen(l_bfile);
  
    dbms_lob.loadclobfromfile(l_clob,
                              l_bfile,
                              dbms_lob.lobmaxsize,
                              l_dest_offset,
                              l_src_offset,
                              dbms_lob.default_csid,
                              l_lang_context,
                              l_warning);
  
    dbms_lob.fileclose(l_bfile);
    return l_clob;
  
  end;
begin
  execute immediate 'alter session set tracefile_identifier = ''' ||
                    l_ident || '''';
  execute immediate 'alter session set events ''10200 trace name context forever, level 1''';
  execute immediate p_sql
    into l_tmp;
  execute immediate 'alter session set events ''10200 trace name context off''';
  select regexp_replace(value, '(.*\\)(.*)', '\2')
    into l_file_name
    from v$diag_info
   where name = 'Default Trace File';
  result := replace(regexp_replace(file2clob(l_file_name),
                                   '(ktrget2\(\): completed for  block .*0x\d{3}[^0] : )(.*?)>\s?|.*\s?',
                                   '\2'),
                    '0x',
                    ' 0x');

  return result;
end get_affected_blocks;
/