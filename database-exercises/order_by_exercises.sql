use employees;

select *
from employees
where first_name IN ('Irena', 'Vidya', 'Maya') ;

-- emp_no of top 3 are 10200, 10397, and 10601

select *
from employees 
where first_name = 'Irena' or 'Vidya' or 'Maya';

--  emp no of top 3 are 10397, 10601, 10821

-- top 3 emp_no are 10200, 10397, and 10821
select *
from employees
where first_name IN ('Irena' , 'Vidya', 'Maya') AND gender = 'M';


select *
from employees
where last_name LIKE 'e%';


select * 
from employees
where last_name LIKE '%E' OR 'E%';


select *
from employees
where last_name LIKE '%e';


select *
from employees
where last_name LIKE 'e%' and '%e';

#8

select *
from employees
where hire_date LIKE '199%';
--  Top 3 emp_no 10008, 10011, 10012 

# 9

select *
from employees
where birth_date LIKE '%12-25';

# top 3 emp_no are 10078, 10115, 10261

#10

select * 
from employees
where birth_date LIKE '%12-25' AND hire_date LIKE '199%';

# Top 3 emp_no are 10261, 10438, 10681

#11 

select * 
from employees
where last_name LIKE '%q%';



#1 Top name is Vidya Awdeh and the last name is Irena Pelz.
select *
from employees
where first_name IN ('Irena', 'Vidya', 'Maya')
order by first_name desc;
 
 #2 First name is Vidya Akiyama, and last name is Irena Zuberek
 select *
 from employees
 where first_name IN ('Irena', 'Vidya', 'Maya')
 order by first_name desc, last_name asc;
 
 #3 Maya Zyda, and Irena Action
 select *
 from employees
 where first_name IN ('Irena', 'Vidya', 'Maya')
 order by last_name  desc, first_name asc;
 
 #4 10131 Ramzi Erde, and 499648 Tadahiro Erde
 select *
 from employees
 where last_name like 'e%e';
 
#5 899 rows returned, newest hire 1999-11-27
select *
from employees
where last_name like 'e%e'
order by hire_date desc;

#6 362 rows returned, oldest employee is Anwar Collavizza and Waiman Ghelli
select *
from employees
where hire_date like '199%' and birth_date like '%12-25'
order by birth_date asc;