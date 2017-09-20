

/*
≈сли пароль дл€ указанного пользовател€ указан верно, то в Output выводитьс€ PWD found
иначе выводитьс€ PWD not found
*/
DECLARE 
  lv_pwd_raw    RAW(128); 
  lv_enc_raw    RAW(2048); 
  lv_hash_found varchar2(300); 
  cursor c_main(cp_user in varchar2) is 
    select substr(spare4, 3, 40) hash, substr(spare4, 43, 20) salt, spare4 
      from sys.user$ 
     where name = cp_user; 
  lv_user c_main%rowtype; 
BEGIN 
  open c_main(upper('test2')); -- указываем им€ пользовател€ в любом регистре, приводитьс€ к верхнему
  fetch c_main 
    into lv_user; 
  close c_main; 
  lv_pwd_raw    := utl_raw.cast_to_raw('aa‘') || -- указываем предполагаемый пароль в верном регистре
                   hextoraw(lv_user.salt); 
  lv_enc_raw    := sys.dbms_crypto.hash(lv_pwd_raw, 3); 
  lv_hash_found := utl_raw.cast_to_varchar2(lv_enc_raw); 
  if lv_enc_raw = lv_user.hash then 
    dbms_output.put_line('PWD found'); 
  else 
    dbms_output.put_line('PWD not found'); 
  end if; 
END;
