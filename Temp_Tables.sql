show databases;


/* Using the example from the lesson, create a temporary called employees_with_departments that contains first_name, 
last_name, and dept_name for employees currently with that department. 
Be absolutely sure to create this table on your own database. 
If you see "Access denied for user ...", it means that the query was 
attempting to write a new table to a database that you can only read.

-- Add a column named full_name to this table. It should be a VARCHAR whose length is the sum of the lengths of the first name and last name columns.
-- Update the table so that the full_name column contains the correct data.
-- Remove the first_name and last_name columns from the table.
-- What is another way you could have ended up with this same table? */
use pagel_2189;
CREATE TEMPORARY TABLE employees_with_departments
(first_name varchar(30), 
last_name varchar(30),
dept_name varchar(30))
;

-- adding a column
alter table employees_with_departments add full_name varchar (60);
INSERT INTO employees_with_departments(full_name) values(first_name, last_name)
;

-- delete a column


select *
from employees_with_departments
;
