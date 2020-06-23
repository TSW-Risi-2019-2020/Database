CREATE USER IF NOT EXISTS'StandardUser'@'%' IDENTIFIED BY 'Standard user';
SET PASSWORD FOR 'StandardUser'@'%' = 'Password1';
GRANT SELECT,DELETE,INSERT,UPDATE ON jflcorporation.* to 'StandardUser'@'%';

CREATE USER IF NOT EXISTS'UserWhoCanOnlySeeData'@'%' IDENTIFIED BY 'Spectator user';
SET PASSWORD FOR 'UserWhoCanOnlySeeData'@'%' = 'Password2';
GRANT SELECT ON jflcorporation.* to 'UserWhoCanOnlySeeData'@'%';

/*SELECT User,Host FROM mysql.user;*/

/*REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'StandardUser'@'%';
drop user 'StandardUser'@'%';*/

/*REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'UserWhoCanOnlySeeData'@'%';
drop user 'UserWhoCanOnlySeeData'@'%';*/