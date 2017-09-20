BEGIN
  DBMS_NETWORK_ACL_ADMIN.CREATE_ACL(acl         => 'network_services.xml',
                                    description => 'network_services.xml',
                                    principal   => 'AUD',
                                    is_grant    => true,
                                    privilege   => 'connect');
                                    
 
  DBMS_NETWORK_ACL_ADMIN.ADD_PRIVILEGE(acl       => 'network_services.xml',
                                       principal => 'AUD',
                                       is_grant  => true,
                                       privilege => 'resolve');
                                       
 
  DBMS_NETWORK_ACL_ADMIN.ASSIGN_ACL(acl  => 'network_services.xml',
                                    host => '*');
  commit;
END;
/

select * from  DBA_NETWORK_ACLS;
select * from  DBA_NETWORK_ACL_PRIVILEGES;
select * from  USER_NETWORK_ACL_PRIVILEGES;
