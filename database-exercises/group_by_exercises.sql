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

select lower(concat(substr(first_name, 1, 1),
substr(last_name, 1, 4), '_', MONTH(birth_date), right(YEAR(birth_date), 2)))
as username, count(*) as count
from employees
group by username
order by count desc;


#8
/* There are duplicates, the highest count of a username is 6 */


        
-- bonus

