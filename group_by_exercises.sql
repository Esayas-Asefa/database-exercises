#1 THERE ARE 7 DISTINCT "titles"

select DISTINCT title
from titles
GROUP BY title;

#2 

show tables;

select DISTINCT last_name -- Didn't need "DISTINCT" because it's already being grouped
from employees
where last_name LIKE 'e%e'
GROUP BY last_name;


#3
select first_name, last_name
from employees
where last_name LIKE 'e%e'
GROUP BY first_name;

#4 and #5
select COUNT(last_name)
FROM employees
WHERE last_name LIKE '%q%' and last_name not like '%qu%'
group by last_name;

#6
select gender, first_name, count(*)
from employees
where first_name IN ('Irena', 'Vidya', 'Maya')
GROUP BY first_name, gender;
 
 #7
username

#8

/* select *
from
	(select
		lower(concat(
        left(first_name, 1)
        , left(last_name,4)
        ,'_'
        substr; */
        
-- bonus

