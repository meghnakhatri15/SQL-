-- TCL -->transaction control language
-- transaction - logical statement
-- control / manage
-- tcl
-- transaction start --> ddl , dml ---> transaction end

-- 1). autocommit --> disable / write (start transaction)
-- 2).
-- 3). end --> (commit , ddl statement , dcl statement)
-- commit is a statemnt of tcl which will save the transaction permanently into the transaction in my database..
-- rollback is used to discard the changes in database ..

create database testing12;
use testing12;
create table xyz(id int, name varchar(20));
insert into xyz values(11,'aman'),(12,'user');
select * from xyz;

-- commit
start transaction;
insert into xyz values(99,'tushar');
select * from xyz;
commit;

-- rollback
start transaction;
SET SQL_SAFE_UPDATES =0; -- safe mode disabled
delete  from xyz;
select * from xyz;
rollback;      -- revert the transaction

start transaction;
insert into xyz values(12345,'meghna');
select * from xyz;

-- savepoint
start transaction;
update xyz set name='xyzzzzzz';
savepoint tushar_savepoint;
insert into xyz values(99,'tushar');
rollback to tushar_savepoint;
select * from xyz;

-- RECURSIVE CTE

with recursive cte as(
select emp.employeeid, emp.employeename, emp.employeename as managerchain
from employees as emp
where emp.manager is null
union
select emp.employeeid, emp.employeename, emp.employeename as managerchain,
concat(mgr.managerchain, '->', employeename) as managerchain
from employee as emp
join cte as mgr on emp.managerid=mgr.employeeid)

select * from cte;




