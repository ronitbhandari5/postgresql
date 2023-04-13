--Creating Table
CREATE TABLE Department(d_id int ,
						d_name varchar(20), 
						d_location varchar(10));
--Inserting Values into department table					
INSERT INTO Department 
VALUES(1,'Content','New York'),
(2,'Support','Chicago'),
(3,'Analytics','New York'),
(4,'Sales','Boston'),
(5,'Tech','Dallas'),
(6,'Finance','Chicago');
 SELECT * 
 FROM Department;
 
 CREATE TABLE Employee(e_id int,e_name varchar(10), e_salary int, e_age int, e_gender varchar(10),e_dept varchar(10) );
 
 INSERT INTO Employee
 VALUES(1,'Sam',93000,40,'Male','Operations'),
(3,'Anne',140000,25,'Female','Analytics'),
(6,'Jeff',112000,27,'Male','Operations'),
(7,'Adam',110000,28,'Male','Content'),
(8,'Priya',85000,37,'Female','Tech');

--Select Into clause
SELECT *
INTO Male_emp
FROM Employee
WHERE e_gender = 'Male';
  
SELECT * 
FROM Male_emp;

--Insert into Select statement
CREATE TABLE Female_emp(e_name varchar(10),e_dept varchar(10));

INSERT INTO Female_emp(e_name,e_dept)
SELECT e_name,e_dept
FROM Employee
WHERE e_gender = 'Female';

SELECT * 
FROM Female_emp;

--Dropping table
DROP TABLE Female_emp;

select * from department;
select * from employee;

--Updating records
update employee
set e_salary=105000
where e_id = 7;

--Cross join 
select d_id,d_name,e_name,e_dept from
department
cross join
employee
;

-- Right join
select d_id,d_name,e_name,e_gender,e_dept from
department
right join
employee
on department.d_name = employee.e_dept
;

-- Left join
select d_id,d_name,e_name,e_gender,e_dept from
department
right join
employee
on department.d_name = employee.e_dept
;

--Full join
select d_id,d_name,e_name,e_gender,e_dept from
department
full join
employee
on department.d_name = employee.e_dept
;

--Self join
select d_id,d_name,e_name,e_dept from
department,employee
;
--Count
select count(d_id)
from department;

--Sum
select sum(e_salary) AS "Total_Sum"
from employee;
--average
select avg(e_salary) AS "Avg_Salary"
from employee;

--Select distinct
SELECT DISTINCT e_dept
from employee;

--Order By
select e_name 
from employee 
order by e_name;

--Group By
select e_dept
from employee
group by e_dept;

--Having clause
select count(e_id)
from employee
having count(e_id)>3;

--Exist and Like clause
select *
from employee
where exists(select * from employee where e_name like 'A%');

--In clause
select * from 
employee 
where e_id in (1,3,8);

--Alter - 
--1. Adding colmun with default value
alter table employee 
add column "Email" varchar(20) default 'xyz@gmail.com'
select * from employee;
--2. Deleting column
alter table employee drop column email;
--3. Rename column
alter table employee rename column "Email" to "Email_id";
--4. Changing contraint
alter table employee add check(e_age<100);
alter table employee alter column e_age varchar(10) not null;
insert into employee(e_id,e_name,e_salary,e_age,e_gender,e_dept) values(9,'Ronit',150000,105,'Male','Tech','xyz@gmail.com');
-- Selecting 2nd highest salary
Select e_salary 
from(select e_salary from employee order by e_salary DESC limit 2) as emp
order by e_salary limit 1;

--Deleting records
delete from employee where e_age=25;

--Min() and Max()
select max(e_salary)
from employee;
select min(e_salary)
from employee;

--In clause
select *
from employee
where e_id in (1,6,8);

--BETWEEN clause
select *
from department
where d_id between 1 and 4;
