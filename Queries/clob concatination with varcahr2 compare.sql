DECLARE
  l_start TIMESTAMP;
  l_end TIMESTAMP;
  l_clob CLOB;
  l_tmp_clob CLOB;
  l_iterations PLS_INTEGER := 1000;
BEGIN
  l_start := SYSTIMESTAMP;
 
  for i in 1 .. l_iterations loop
    l_clob := l_clob || TO_CHAR (SYSTIMESTAMP) || ', ';
  end loop;
 
  l_end := SYSTIMESTAMP;
  
  DBMS_OUTPUT.put_line ('CLOB := CLOB || VARCHAR2 method: ' || TO_CHAR (l_end - l_start));
  l_start := SYSTIMESTAMP;
  l_clob := NULL;
 
  FOR i IN 1 .. l_iterations LOOP
    l_clob := l_clob || TO_CLOB (TO_CHAR (SYSTIMESTAMP) || ', ');
  END LOOP;
 
  l_end := SYSTIMESTAMP;
  DBMS_OUTPUT.put_line ('CLOB := CLOB || TO_CLOB(VARCHAR2) method: ' || TO_CHAR (l_end - l_start));
  l_start := SYSTIMESTAMP;
  l_clob := NULL;
 
  FOR i IN 1 .. l_iterations LOOP
    l_tmp_clob := TO_CHAR (SYSTIMESTAMP) || ', ';
    l_clob := l_clob || l_tmp_clob;
  END LOOP;
 
  l_end := SYSTIMESTAMP;
  DBMS_OUTPUT.put_line ('CLOB := CLOB || TMP_CLOB method: ' || TO_CHAR (l_end - l_start));
  l_start := SYSTIMESTAMP;
  l_clob := ' '; -- for clob initialiation
 
  FOR i IN 1 .. l_iterations LOOP
    DBMS_LOB.append (l_clob, TO_CHAR (SYSTIMESTAMP) || ', ');
  END LOOP;
 
  l_end := SYSTIMESTAMP;
  DBMS_OUTPUT.put_line ('DBMS_LOB.append method: ' || TO_CHAR (l_end - l_start));
END;
