# Warmup 

/* SELECT *
FROM orders
WHERE item_name IN ('chicken bowl', 'veggie bowl') 
AND quantity > 1; */

# Functions
-- SQL has built in functions, so we won't be creating them
-- Will take in data and perform task on that data

-- Format: name_of_function([input])

-- also: they don't always require an input

-- an example of what we've seen so far
/* select database();


-- Let's use the albums db for demo

show databases;
use albums_db;
select database();
show tables;

# Numerical funcitons

-- count: returns the number of rows in query
-- FORMAT: count(*)
 
 select * from albums;
 
 use employees;
 select count(*)
 from employees;
 
 -- ^^ shows how many rows in that database
 
 select count(*) as cnt
 from employees;
 
 -- select first_name, last_name, count(*)
 -- from employees;
 -- question --
 
-- "use" for accessing/switching between databases

use albums_db;
-- min, max, avg
-- FORMAT: MIN([INPUT]), MAX([input]), AVG9[input])

select MIN(sales) as min_sales
, MAX(sales) AS max_sales
, AVG(sales) as average_sales
, COUNT(*) as cnt_of_albums
from albums; *\

-- FORMAT: ROUNDING NUMBERS
-- ROUND(AVG(sales), 2 <<  places) as average sales

-- STRING FUNCTIONS
-- concat: combines things together
-- FORMAT: CONCAT([value1], [value2], [value3],...)

/* select concat('hello', 'pagel', '!');

select 'hellopagel'; */

use albums_db;

/* select concat(name, ' -- ' ,release_date) as release_date_album
	, sales
from albums; */

-- substr: extracts a portion of element
-- FORMAT: SUBSTR(string, start_position, how_man_elements_to_retrieve)
-- count from left to right, first letter is position 1

select 'hello pagel class';
select SUBSTR('hello pagel class!', 7, 5);
-- If starting position number is "-" it will start with the last letter as position 1

-- if you want to pull from the same position on an entire column

-- look up how to use locate in a "SUBSTR"

-- case conversation: uppercases or lowercases
-- FORMAT: UPPER([input],), LOWER ([INPUT])

/* select
	UPPER(artist) as all_caps_artist
    , lower(name) as all_lower_album -- white space doesn't matter
    , UPPER( concat(release_date, '--', name) ) AS DATE_ALBUM -- combining two functions
    , sales
from albums;



SELECT name, 
		UPPER(	LEFT(name,1))
		,LOWER( SUBSTR(name,2) 
        ,CONCAT(
		UPPER( LEFT(name,1)) -- upper case the first letter
        , 
        LOWER (SUBSTR(name,2) -- lowercasing everything starting at the second letter
        ); */
        
-- replace: replaces a piece of a string with another string
-- FORMAT: REPLACE(string, what_we_want_to_remove, new_string)

select REPLACE('hello pagel class!', 'pagel', '~~~PAGEL!!!!');
select REPLACE('hello pagel class!', 'a', 'AAAAA');
select name, genre, REPLACE(genre, 'rock', '!@#ROCK!!!') -- it is case sensitive
from albums;

select name
, genre
, REPLACE(lower(genre), 'rock', '!@ROCK!!!') -- lowercase the genre to find all of them!
from albums;

-- TIME AND DATE FUNCTIONS
-- descriptive functions

select NOW(); -- DATE AND TIME OF RIGHT NOW
SELECT current_date(); -- date of today
select curdate(); -- date of today
select curtime();

select now(), current_date(), curdate(), curtime();

select CONVERT_TZ(now(), '+00:00,' '-6:00');

-- we can pull out elements of date
-- YEAR(), MONTH(), DAY()

select now(), year(now()), month(now()), DAY(now()), HOUR(now());

-- CASTING: changing the data
-- FORMAT: CAST([value] as [datatype])

select 2 + 2;

select 1 + '2';

select 1 + CAST('2' AS SIGNED);

-- TO combine 2 digits, using concat