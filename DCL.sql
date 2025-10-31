-- GRANT AND REVOKE ROLES
-- GRANT--> the grant command assign specific privileges or roles to user or other roles.
-- REVOKE--> the revoke command remove preiviously granted privilages and role from user.


-- DCL--->(data control language) To give permission to access object
use regex1;
select * from employees;
-- create user
create user 'ram' identified by 'ram';
select * from mysql.user;  -- show all the users
show grants for 'ram'; -- will show privilages

-- GRANT STATEMENT
grant all privileges on tushar.* to 'ram';
show grants for 'ram';

-- REVOKE STATEMENT
revoke all privileges on tushar.* from 'ram';

-- how to create role insql
create  role role_name;
grant all privileges on sakila.* to role_name;
show grants for role_name;

use sakila;
create role'tushar';
grant 'tushar' to 'ram';



