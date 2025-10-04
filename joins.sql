use regex123;
select * from product;

select * from orders;

-- update orders set product=101 where orderid=995;

select product.pid, product.pname, product.price, orders.city from product join orders 
where orders.productid= product.pid;

select product.pid, product.pname, product.price, orders.city from
 product inner join orders 
on product.pid=orders.productid;

select product.pid, product.pname, product.price, orders.productid ,
orders.city from product
left join orders on product.pid=orders.productid;

-- right join
select product.pid, product.pname, product.price, orders.productid ,
orders.city from product
right join orders on product.pid=orders.productid;

use sakila;
select * from actor;

desc actor;
 select * from film_actor;
 
 desc film_actor;
  
drop database regex123;
create database regex123;

use regex123;
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50)
);

CREATE TABLE Enrollment (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseName VARCHAR(50),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID)
);


INSERT INTO Student (StudentID, StudentName) VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie'),
(4, 'David'),
(5, 'Eva'),
(6, 'Frank'),
(7, 'Grace'),
(8, 'Helen'),
(9, 'Ian'),
(10, 'Jack');


INSERT INTO Enrollment (EnrollmentID, StudentID, CourseName) VALUES
(101, 1, 'Math'),
(102, 2, 'Physics'),
(103, 3, 'Chemistry'),
(104, 1, 'English'),
(105, 5, 'Biology'),
(106, 7, 'History'),
(107, 10, 'Math');

select * from  student ;

select * from enrollment;

-- student who are enrollerd in any course
select s.studentid, s.studentname, e.enrollmentid from student as s 
join enrollment as e on s.studentid=e.studentid;

-- all students with enrolled courses
select s.studentid, s.studentname, e.enrollmentid from student as s 
 left join enrollment as e on s.studentid=e.studentid;
 
 -- display only student who are enrolled in atleast in one course 
 select  s.studentname, e.coursename from student as s 
 join enrollment as e on s.studentid=e.studentid;
 
 -- student who do not enrollment in any course
 select  s.studentname, e.coursename from student as s 
 join enrollment as e on s.studentid=e.studentid where enrollmentid is null;
 
 -- name of all student and in how many courses they enrolled

select s.studentid,count(e.enrollmentid) from student as s 
left join enrollment as e on s.studentid=e.studentid
group by s.studentid
 
 






