-- Database: LAB_MST

-- DROP DATABASE IF EXISTS "LAB_MST";

CREATE DATABASE "LAB_MST"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_India.1252'
    LC_CTYPE = 'English_India.1252'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    manager_id INT,
    department VARCHAR(50),
    salary INT
);
INSERT INTO Employees VALUES
(1, 'Amit', NULL, 'Management', 120000),
(2, 'Ravi', 1, 'Engineering', 80000),
(3, 'Neha', 1, 'Engineering', 82000),
(4, 'Karan', 2, 'Engineering', 60000),
(5, 'Simran', 2, 'Engineering', 62000),
(6, 'Pooja', 3, 'Engineering', 61000),
(7, 'Rahul', 3, 'Engineering', 64000),
(8, 'Arjun', 1, 'HR', 70000);

select * from employees;

select emp1.manager_id,emp1.emp_name as employee_1,emp2.emp_name as employee_2 
from employees as emp1
join employees as emp2
on emp1.manager_id = emp2.manager_id 
and emp1.emp_name < emp2.emp_name;

--Question 2 

select emp_id,emp_name,max(salary) as second_highest_salary  from employees where salary < (select max(salary) from employees)
group by emp_id 
order by salary 
desc limit 1;