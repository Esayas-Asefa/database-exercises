#basic_statement_exercises

use employees;

-- select *
-- from employees
-- where first_name IN ('Irena', 'Vidya', 'Maya') ;

#1. emp_no of top 3 are 10200, 10397, and 10601

-- select *
-- from employees 
-- where first_name = 'Irena' or 'Vidya' or 'Maya';
#2. emp no of top 3 are 10397, 10601, 10821

-- select *
-- from employees
-- where first_name IN ('Irena' , 'Vidya', 'Maya') AND gender = 'M';
#3. top 3 emp_no are 10200, 10397, and 10821


#4 
-- select *
-- from employees
-- where last_name LIKE 'e%';

#5 
-- select * 
-- from employees
-- where last_name LIKE '%E' OR 'E%'

# 6
-- select *
-- from employees
-- where last_name LIKE '%e';

#7
-- select *
-- from employees
-- where last_name LIKE 'e%' and '%e';

#8

-- select *
-- from employees
-- where hire_date LIKE '199%';
--  Top 3 emp_no 10008, 10011, 10012 

# 9

-- select *
-- from employees
-- where birth_date LIKE '%12-25';

# top 3 emp_no are 10078, 10115, 10261

#10

-- select * 
-- from employees
-- where birth_date LIKE '%12-25' AND hire_date LIKE '199%';

# Top 3 emp_no are 10261, 10438, 10681

#11 

select * 
from employees
where last_name LIKE '%q%';

#11

select *
from employees
where last_name LIKE '%q%' AND NOT '%qu%';