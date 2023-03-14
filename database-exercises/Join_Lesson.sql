-- show databases;
-- use employees;
-- show tables;
-- describe authorz
-- describe authors;
-- describe departments;
-- describe dept_emp;
-- describe dept_manager;
-- describe employees;
-- escribe quote;
-- describe quotes;
-- describe salaries;
-- describe titles;
/* select *
from employees;

select *
from departments;

select *
from dept_emp;

select *
from employees
join dept_emp on employees.emp_no = dept_emp.emp_no; */

use join_example_db;
select * 
from roles;

select *
from users
join roles on users.id = roles.id;

select *
from employees
join dept_emp on employees.emp_no = dept_emp.emp.no
join departments on dept_emp.dept_no = departments.dept_no;

select employees.first_name,
	employees.last_name,
	departments.dept_name
from employees
join dept_emp on employees.emp_no =dept_emp.emp_no
join departments on dept_emp.dept_no = departments.dept_no;

select e.first_name,
		e.last_name,
		d.dept_name
from employees as e
join dept_emp as de on e.emp_no = de.emp_no
join departments as d on dep.dept_no = d.dept_no