DECLARE
 l_credit_card_no char(8) := 'IBSIBS';
 l_ccn_raw RAW(128) := '494253494253';
 l_key     RAW(128) := '0123456789ABCDEF';

 l_encrypted_raw RAW(2048);
 l_decrypted_raw RAW(2048);
 l_encrypted_des RAW(2048);
BEGIN
  dbms_output.put_line('Source : ' ||
      l_ccn_raw);

dbms_output.put_line('Key : ' ||
      l_key);
      
  l_encrypted_raw := dbms_crypto.encrypt(l_ccn_raw,
  dbms_crypto.DES_CBC_PKCS5 , l_key);


  dbms_output.put_line('Encrypted1 : ' ||
  l_encrypted_raw);
  
  l_encrypted_raw := dbms_crypto.encrypt(l_ccn_raw,
  dbms_crypto.DES_CBC_PKCS5, l_encrypted_raw);
  
 /* dbms_output.put_line('Encrypted2 : ' ||
  RAWTOHEX(utl_raw.cast_to_raw(l_encrypted_raw)));*/
  
  dbms_output.put_line('Encrypted2 : ' ||
  l_encrypted_raw);

END;
/
