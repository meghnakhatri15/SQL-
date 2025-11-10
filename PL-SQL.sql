use tushar;
-- DELIMITER $$

-- CREATE PROCEDURE GetCustomerss()
-- BEGIN
-- 	SELECT * FROM SAKILA.ACTOR;
-- END$$
-- DELIMITER ;

-- call GetCustomerss();

DROP PROCEDURE GetCustomers2;
use tushar;
DELIMITER #
CREATE PROCEDURE GetCustomers2()
BEGIN
    select * from sakila.actor where actor_id=2;
    select * from sakila.actor where actor_id=1;
END#
DELIMITER ;
DROP PROCEDURE GetP2;
use tushar;
DELIMITER //
CREATE PROCEDURE GetP2(IN id int , OUT ename varchar(20) )
BEGIN
    select first_name into ename from sakila.actor where actor_id=eid;
END//
DELIMITER ;

SET @VAR=9;
CALL GetP5(@var);
select @var
DROP PROCEDURE GetP5;
use tushar;
DELIMITER //
CREATE PROCEDURE GetP5( INOUT var INT )
BEGIN
    select COUNT(*) INTO VAR from sakila.actor where actor_id=VAR AND ACTOR_ID>2;
END//
DELIMITER ;
-- variables in plsql
-- conditional statements
