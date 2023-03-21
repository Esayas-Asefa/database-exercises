/* Solutions

Database and Tables



Basic Statements



Where Advanced



Order By



Limit



Functions



Group By



Joins_Exercises

solution for join example database #3

select roldes.name as role_name,
count(users.name) as number_of_employees
from users
right join roles on users.role_id = roles.id
group by role_name

learn to use curdate and making aliases and practice concat*/

/*solution #3
select t.title
	count(de.emp_no) as count
from dept_emp as de
	join titles as t using(emp_no)
	join departments as d using(dept_no)
where t.to_date > curdate() 
	and de.to_date > curdate()
	and d.dept_name = 'Customer Service'
group by t.title;

Subqueries_exercises

warmup
select active, count(*)
from customer
group by active;
--any time we have to do classifications, use group by

for case statement exercises
1. 
step 1
select *
from employees
join dept_emp
using (emp_no)
;
step 2--used join because employees doesn't show dept_no
replace
select emp_no,
hire_date, 
if(to_date > now(), 1, 0) as is_current_employee
from employees
join dept_emp
using (emp)no)

removing the duplicates from the above problem

select emp_no, max(to_date)
from dept_emp
group by emp_no

select *
from employees
	join
		(
		select emp_no, max(to_date) as max_date
        from dept_emp
        group by emp_no
        ) as current_hire_date
        using (emp_no);
	
slect emp_no, concat(first_name, ' ', last_name)
, hire_date
, max_date
, dept_no
, if(max_date > now(), TRUE, FALSE) as is_current_employee
from employees 
	join
		(select emp_no, max(to_date) as max_date
        from dept_emp
        group by emp_no)
select * 
from dept_emp
limit 11

2. 
step 1
select *
from employees

select last_name
	case
		when left(last_name,1) <= 'H' then 'A-H'
        when left(last_name,1) <= 'I' then 'I-Q'
        else 'R-Z'
	end as alpha_group
from employees

one way 
select first_name
from employees
where first_name

3. 
step 1
select *
from employees
step 2
select min(birth_date), max(birth_date 
from employees
to see the range of decades

step 3
select birth_date
	case
		when birth_date like '195%' then '50s'
        else '60s'
	end as birth_decade, count(*) -- can throw count in anywhere 
    in the select statement
    from employees
    group by birth_decade;
 
 4.
 step 1
 
 select *
 from departments;
 
 step 2
 select dept_name
	case
		when dept_name IN ('research', 'development') then 'R&D'
        when dept_name IN ('sales', 'marketing') then 'Sales & Marketing'
        when dept_name IN ('Product', 'Quality Management') then 'Prod & QM'
        when dept_name IN ('Finance', 'human resources') then 'Finance & HR'
        else dept_name
	end as dept_group,
    round(avg(salary),2)
    dept_emp.*,
    salaries.*
from departments
	join dept_emp
		using (dept_no)
	join salaries
		using(emp_no)
where salaries.to_date > now()
	and dept_emp.to_date > now()
group by dept_group;

select * from salaries limit 10;
select * form dept_emp limit 10;

SELECT emp_no, dept_no, from_date, to_date,
	to_date > NOW() AS 'is_current_employee'
    FROM dept_emp
	WHERE (emp_no, to_date) IN (SELECT emp_no, MAX(to_date) FROM dept_emp GROUP BY emp_no);
   
   
   solution for join example database #3

select roldes.name as role_name,
count(users.name) as number_of_employees
from users
right join roles on users.role_id = roles.id
group by role_name

learn to use curdate and making aliases and practice concat

solution #5
select d.dept_no,
	d.dept_name,
	count(de.emp_no) as num_employees
from dept_emp as de
	join departments as d using(dept_no)
where de.to_date > curdate()
group by dept_no, dept_name

solution #6
select d.dept_name, 
		avg(s.salary) as average_salary
from dept_emp as de
join salaries as s on de.emp_no = s.emp_no
	and de.to_date > curdate()
    and s.to_date > curdate()
join departments as d using(dept_no)
group by d.dept_name
order by average_salary desc
limit 1; 

#7 Solution
select e.first_name,
		e.last_name
from employees as e
join dept_emp as de on e.emp_no = de.emp_no
	and de.to_date > curdate()
join salaries as s on e.emp_no = s.emp_no
	and s.to_date > curdate()
join departments as d on de.dept_no = d.dept_no
	and d.dept_name = 'Marketing'
order by s.salary desc
limit 1

#8
select e.first_name, 
		e.last_name, 
		s.salary, 
        d.dept_name
from employees
join dept_manager as dm on e.emp_no = dm.emp_no
	and dm.to_date > curdate()
join salaries as s on e.emp_no = s.emp_no
	and s.to_date > curdate()
join departments as d using(dept_no)
order by s.salary desc
limit 1;

#9 solution
don't need "as"
select d.dept_name,
		round(avg(s.salary), 2) as avg_dept_salary
from departments as d 
	join dept_emp as de using(dept_no)
	join salaries as s using(emp_no)
group by d.dept_name
order by avg_dept_salary desc 

CREATE TEMP TABLE

1. 1
create table 
USE employees;

select e.first_name, e.last_name, dept_name
from employees as e
join dept_emp as de using(emp_no)
join departments as d using(dept_no)
where to_date > curdate();

use pagel_2189;

create temporary table employees_with_departments as
(select e.first_name, e.last_name, dept_name
from employees as e
join dept_emp as de using(emp_no)
join departments as d using(dept_no)
where to_date > curdate()); 

select *
from employees_with_departments; 

describe employees_with_departments; 

alter table employees_with_departments
add full_name varchar(30);

alter for changing the actual columns
update for altering data points in the table

select *
from employees_with_departments;

update employees_with_departments
set full_name = concat(first_name, ' ', last_name);

select *
from employees_with_departments;

alter table employees_with_departments 
drop column first_name
drop column last_name;

drop table if exists employees_with_departments;

2. Create a temporary table based on the payment table from the sakila database.
Write the SQL necessary to transform the amount column such that it is stored as an 
integer representing the number of cents of the payment. For example, 1.99 should become 199.

select amount * 100 as amount in pennies
from sakila.payment;

create temporary table payments as (select amount * 100 
as amount in pennies
from sakila.payment);

select *
from payments;

describe payments

alter tbale payments
modify amount_in_pennies into not null;

select *
from payments;

different way

drop table if exists payments;

create temporary table payments as (
	select amount
    from sakila.payment
    );

select *
from payments;

update payments
set amount = amount * 100;

describe payments

to alter how many characters are seen for amount

alter table payments
modify amount dec(10,2);

select *
from payments;

alter table payments
modify amount int not null;

select *
from payments;

3.

Go back to the employees database. Find out how the current average pay in each 
department compares to the overall current pay for everyone at the company. 
For this comparison, you will calculate the z-score for each salary. In terms of 
salary, what is the best department right now to work for? The worst?


will use this for temp table
select avg(salary), std(salary)
from employees.salaries
where to_date > curdate()

create temporary table overall_aggregates as (
select avg(salary), std(salary)
from employees.salaries
where to_date > curdate()
);

select *
from overall_aggregates;

select dept_name, avg(salary) as department_current_average
from employees.salaries
join employees.dept_emp using(emp_no)
join employees.departments using(dept_no)
where employees.dept_emp.to_date > curdate()
and employees.salaries.to_date > curdate()
group by dept_name;

crete temporary table current_info as (

);

confirm the table exists as it should with

select *
from current_info;

now we can start adding columns to this temp table

alter table current_info
add overall_avg float(10,2);

alter table current_info
add overall_std float(10,2);

check new table post alteration(adding of columns)

select *
from current_info;

fill with data /