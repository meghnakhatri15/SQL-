-- constraints--
-- rules and regulation which don't allow invalid data entry in the table.
use sakila;
create table test(id int);
insert into test values(10),(11),(10),(null);

-- 1. not null constraint
create table test2(id int not null);
insert into test values(10),(11),(10);
insert into test2 values(null),(12);-- this will give error

-- 2.unique constraint
create table test3(id int unique);
insert into test3 values(10),(11),(10);-- duplicate values / give error

-- 3. default constraint
create table test4(id int, gender varchar(20) default 'male');
insert into test4 (id) values(10);
select * from test4;

-- 4.check constraint
create table test5(id int, check (id>5), gender varchar(20) );
insert into test5 (id) values(10);
insert into test5 (id) values(3); -- it will give error
select * from test4;

create table test6(id int, check (id>5), gender varchar(20) check (gender in('male','female')) );
insert into test6 (id, gender) values(10,'male');
insert into test6 (id, gender) values(11,'transgenger');

--  give name to a constraint helps us to known easily
 create table test7(id int, check (id>5), gender varchar(20) constraint db_test7_gender_chk check (gender in('male','female')));-- 
insert into test7 (id, gender) values(10,'male');
insert into test7 (id, gender) values(11,'transgenger');

-- 5. primary key constraint
create table test8(id int primary key, gender varchar(20));-- 
insert into test8 (id, gender) values(10,'male');
insert into test8 (id, gender) values(11,'transgender');

-- 6. foreign key constraint
create table product (pid int primary key, pname varchar(20));
insert into product values (101,'iphone');
-- insert into product values(102,'ipad')
insert into product values (102,'ipad');
select * from product;

create table orders(order_id int ,price int ,pid int);
insert into orders values(1981, 200, 101), (1982, 260, 102), (1983, 275, 101), (1984, 300, 108);   -- foreign key constraint is not used that's why 108 id data is inserted easily
select * from orders;

-- with foreign key
create table orders2(order_id int ,price int ,pid int, foreign key(pid) references product(pid));
insert into orders2 values(1981, 200, 101), (1982, 260, 102), (1983, 275, 101), (1984, 300, 108);
select * from orders2;

-- create two tables employess and department
use sakila;
create table employees(emp_id int primary key, emp_name varchar(20), emp_email varchar(20) unique, department_id int);
insert into employees values(101,'megha','megha101@gmail.com',201);
select * from employees;

use sakila;
create table department(dept_id int unique, dept_name varchar(20) constraint meghna check (dept_name in('bio','physics')));
insert into department values(201,'bio'),(null, 'physics');
select * from department;