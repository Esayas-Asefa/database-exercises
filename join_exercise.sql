# Join Example Database
use employees;

# 1
use join_example_db;

select *
from users;

select *
from roles;

#2
select *
from users
join roles on roles.id = users.id;

select *
from users
left join roles on roles.id = users.id;

select *
from users 
right join roles on roles.id = users.id;

select count(*)
from users
join roles on roles.id = users.id
group by id; 



use employees;
show tables;



#1
select *
from employees
join dept_manager on employees.emp_no = dept_manager.emp_no
join titles on titles.to_date = dept_manager.to_date
where titles.to_date like '9999%' and title like '%man%';

#2
select *
from employees
join dept_manager on employees.emp_no = dept_manager.emp_no
join titles on titles.to_date = dept_manager.to_date
where titles.to_date like '9999%' and employees.gender like 'F' 
and title like '%man%';

select * from employees;
select * from dept_emp;
select * from dept_manager;
select * from departments;
select * from titles;


#3 what do I need: to_date, title, dept_name
# need to do a count of employees in each dept
# what do I want to join? -- dept_emp and departments with dept_no
-- what else do I want to join? -- dept_emp and titles with emp_no

-- titles, emp_no --dept_emp, emp_no and dept_no -- departments, dept_no
select title, count(*) as count
from dept_emp
join titles on dept_emp.emp_no = titles.emp_no
join departments on departments.dept_no = dept_emp.dept_no
where dept_name = 'Customer Service' and dept_emp.to_date like '9999%'
group by title;

# 4
select salary, first_name, last_name, e.emp_no 
from employees as e
join salaries on e.emp_no = salaries.emp_no
join dept_manager on dept_manager.emp_no = salaries.emp_no
where salaries.to_date like '9999%';

select * from employees; -- emp_no, from_date, to_date, birth_date, fn, ln, hire_date, gender
select * from dept_emp; -- emp_no, dept_no, from_date, to_date 
select * from dept_manager; -- dept_no, emp_no, from_date, to_date
select * from departments; -- dept_no, dept_name
select * from titles; -- title, emp_no, from_date, to_date
select * from salaries; -- emp_no, salary, from_date, to_date

# 5
select dept_emp.dept_no, departments.dept_name, count(dept_emp.emp_no)
from employees
join dept_emp on employees.emp_no = dept_emp.emp_no
join departments on departments.dept_no = dept_emp.dept_no
where dept_emp.to_date like '9999%'
GROUP BY dept_emp.dept_no, departments.dept_name;

#6

select * from employees; -- emp_no, from_date, birth_date, fn, ln, hire_date, gender
select * from dept_emp; -- emp_no, dept_no, from_date, to_date 
select * from dept_manager; -- dept_no, emp_no, from_date, to_date
select * from departments; -- dept_no, dept_name
select * from titles; -- title, emp_no, from_date, to_date
select * from salaries; -- emp_no, salary, from_date, to_date

#7

select employees.first_name, employees.last_name, max(salary), 
departments.dept_name, dept_emp.dept_no
from dept_emp
join employees on employees.emp_no = dept_emp.emp_no
join dept_emp on dept_emp.emp_no = salaries.emp_no;


#8

select dept_manager.to_date, max(salary), dept_manager.emp_no,
 e.first_name, e.last_name
from dept_manager
join salaries as s on s.emp_no = dept_manager.emp_no
join employees as e on e.emp_no = dept_manager.emp_no
where dept_manager.to_date like '9999%'
group by dept_manager.to_date, dept_manager.emp_no;

#9

select departments.dept_name, avg(salary)
from dept_emp
join salaries on salaries.emp_no = dept_emp.emp_no
join departments on dept_emp.dept_no = departments.dept_no
group by departments.dept_name;







