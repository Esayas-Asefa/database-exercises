/*1

Write a 
query that returns all employees, their department number, 
their start date, their end date, and a new column 'is_current_employee' 
that is a 1 if the employee is still with the company and 0 if not. 

tables I want to use are employees and dept_emp */

use employees;
show tables;

select *
from employees;
select *
from dept_emp;
 
select dept_no, from_date, to_date,   
	if(to_date like '9999%', 1, 0) as current_employees
from dept_emp;

#2
/* Write a query that returns all employee names (previous and current), 
and a new column 'alpha_group' that returns 'A-H', 'I-Q', 
or 'R-Z' depending on the first letter of their last name. */

select first_name, last_name,
case last_name
	when left(last_name, 1) like '[A-H]' 
    THEN 'A-H'
    when left(last_name, 1) like '[I-Q]'
    then 'I-Q'
    else 'R-Z'
END as 'Alpha_Group'
from employees;

# 3 How many employees (current or previous) were born in each decade?

select birth_date, emp_no
from employees;

select birth_date, emp_no, (select case birth_date 
when birth_date like '195%' then '50s'
when birth_date like '196%' 
then '60s'
end as decade_of_birth) as birth_decade
from employees;


select avg(salary)
from salaries;