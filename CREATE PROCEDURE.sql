-- DELIMITER //

-- Create procedure p4(in var int)
-- begin
--      tushar: LOOP
--      set var=vat+1;
--      select * from actor where actor_id=var;
--      IF var=14 THEN 
--         LEAVE TUSHAR;
-- 	END IF;
--     
--     END LOOP;
--     end // 
--     DELIMITER // 

USE SAKILA;
DELIMITER //



CREATE PROCEDURE create_email_list1(IN eid INT, OUT email_list TEXT)
BEGIN
    -- variable to access value from cursor
    DECLARE done BOOL DEFAULT FALSE;
    DECLARE email_address VARCHAR(100) DEFAULT '';

    -- declare cursor for employee email
    DECLARE cur CURSOR FOR 
        SELECT first_name 
        FROM sakila.actor 
        WHERE actor_id < eid;

    -- handler for end of cursor
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    -- initialize output variable
    SET email_list = '';

    -- open cursor
    OPEN cur;

    process_loop: LOOP
        FETCH cur INTO email_address;

        IF done THEN
            LEAVE process_loop;
        END IF;

        -- concatenate the email into email list
        SET email_list = CONCAT(email_address, '-', email_list);
    END LOOP process_loop;

    -- close cursor
    CLOSE cur;
END //

DELIMITER ;





use sakila;
DELIMITER //

 create procedure create_payment(out amount_list text)
 
 begin
      declare v_amount decimal(5,2);
      declare done int default 0;
      
      declare cur cursor for
          select amount from sakila.payment where payment_id<10;
          
	  declare continue handler for not found set done=1;
      
      -- initialize out param
      set amount_list='';
      
      open cur;
      read_loop: loop
         fetch cur into v_amount;
         
         if done =1 then
           leave read_loop;
		end if;
        
	-- stop 
    if v_amount =5.99 then
      leave read_loop;
	end if;
end loop;

        
