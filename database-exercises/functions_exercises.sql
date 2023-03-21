use employees;

#1

/*Write a query to to find all employees whose last name starts and 
ends with 'E'. Use concat() to combine their first and last name 
together as a single column named full_name. */

select concat(first_name, ' ', last_name) as full_name
from employees
where last_name like 'e%e';

#2 
/* Convert the names produced in your last query to all uppercase. */
select upper(concat(first_name, ' ', last_name)) as full_name
from employees
where last_name like 'e%e';

#3
/* Use a function to determine how many results were returned from your 
previous query. */
select count(upper(concat(first_name, ' ', last_name))) as full_name
from employees
where last_name like 'e%e';

#4
/*Find all employees hired in the 90s and born on Christmas. 
Use datediff() function to find how many days they have been working 
at the company (Hint: You will also need to use NOW() or CURDATE()), */

select employees.emp_no, hire_date, birth_date, to_date
from employees
join dept_emp on employees.emp_no = dept_emp.emp_no
where hire_date like '%199%' and birth_date like '%12-25'
and to_date like '%9999%';

#5
/* Find the smallest and largest current salary from the salaries table. */
select max(salary), min(salary)
from salaries
where to_date like '9999%';


# 6
/* Use your knowledge of built in SQL functions to generate a username 
for all of the employees. A username should be all lowercase, and consist 
of the first character of the employees first name, the first 4 characters 
of the employees last name, an underscore, the month the employee was born, 
and the last two digits of the year that they were born. */

select lower(concat(substr(first_name, 1, 1),
substr(last_name, 1, 4), '_', MONTH(birth_date), right(YEAR(birth_date), 2)))
as username
from employees;
