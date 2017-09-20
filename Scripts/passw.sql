DECLARE
   raw_input           RAW(128) := '4942534942530000';
   raw_key             RAW(128) := '0123456789ABCDEF';
   encrypted_raw               RAW(2048);
   encrypted_string            VARCHAR2(2048);
   decrypted_raw               RAW(2048);
   decrypted_string            VARCHAR2(2048); 

   BEGIN 
     dbms_output.put_line('SOURCE : ' ||
      raw_input);
      
      dbms_obfuscation_toolkit.DESEncrypt(input => raw_input, 
               key => raw_key, encrypted_data => encrypted_raw );
               

      dbms_output.put_line('Encrypted1 : ' ||
        encrypted_raw);
               
      dbms_obfuscation_toolkit.DESEncrypt(input => raw_input, 
               key => encrypted_raw, encrypted_data => encrypted_raw );
               

      dbms_output.put_line('Encrypted2 : ' ||
        encrypted_raw);
         
   END;
