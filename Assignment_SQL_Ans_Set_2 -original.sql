
use assignment;



--  1. select all employees in department 10 whose salary is greater than 3000. 
-- [table: employee]

-- Ans: 

select concat(fname,' ' ,lname) as Employee_Names from employee
where deptno= 10 and salary > 3000 ;







-- 2. The grading of students based on the marks they have obtained is done as follows:

-- Ans: 

select * from students;

alter table students add Class varchar(20);
select * from students;

UPDATE students  
SET Class = CASE   
WHEN marks <100 and marks >80 THEN 'Distinction'  
WHEN marks <80 and marks > 50 THEN 'First Class' 
WHEN marks <50 and marks > 40 THEN 'Second Class'  
else null
END ;



-- Q2. a. How many students have graduated with first class?

-- Ans:

select count(Class) as Num_of_first_class_student from students 
where Class = 'First Class';




-- Q2.b. How many students have obtained distinction? 

-- Ans:

select count(Class) as Num_of_Distinction_class_student from students 
where Class = 'Distinction';







-- 3. Get a list of city names from station with even ID numbers only. 
-- Exclude duplicates from your answer.[table: station]

-- Ans:

select distinct(city) from station 
where id % 2 =0 ;





/* 4. Find the difference between the total number of city entries in the table and 
the number of distinct city entries in the table. 
[table: station]  
*/

-- Ans:

select * from station;
select count(city) - count(distinct(city)) from station;






-- Q 5.a. Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) 
-- from STATION. Your result cannot contain duplicates. 
-- [Hint: Use RIGHT() / LEFT() methods ]

-- Ans:

select distinct(city) as city_name_starting_with_vowel_letter from station 
where left(city,1) in ('a', 'e', 'i', 'o', 'u');




-- b. Query the list of CITY names from STATION which have 
-- vowels (i.e., a, e, i, o, and u) as both their first and last characters. 
-- Your result cannot contain duplicates.

-- Ans:

select distinct(city) as city_name_starting_ending_with_vowel_letter from station 
where left(city,1) in ('a', 'e', 'i', 'o', 'u')
and right(city,1) in ('a', 'e', 'i', 'o', 'u');





-- c. Query the list of CITY names from STATION that do not start with vowels. 
-- Your result cannot contain duplicates

-- Ans:

select distinct(city) as city_name_starting_with_vowel_letter from station 
where left(city,1) not in ('a', 'e', 'i', 'o', 'u');




-- d. Query the list of CITY names from STATION that either do not start with 
-- vowels or do not end with vowels. 
-- Your result cannot contain duplicates. [table: station]

-- Ans:

select distinct(city) as city_name_starting_ending_with_vowel_letter from station 
where left(city,1) not in ('a', 'e', 'i', 'o', 'u')
or right(city,1) not in ('a', 'e', 'i', 'o', 'u');








-- 6. Write a query that prints a list of employee names having a salary 
-- greater than $2000 per month who have been employed for less than 36 months. 
-- Sort your result by descending order of salary. [table: emp]

-- Ans:

select * from emp;
select first_name as Name , salary as salary_greater_than_2000  , timestampdiff(month, hire_date ,current_date()) < 36
as month_less_than_36 from emp 
where salary > 2000 
and timestampdiff(month, hire_date ,current_date()) < 36
order by salary desc ;






-- 7. How much money does the company spend every month 
-- on salaries for each department? [table: employee]

-- Ans:

select deptno , sum(salary)  as total_salary 
from employee 
group by deptno ;






-- 8. How many cities in the CITY table have a Population larger than 100000. [table: city]

-- Ans:

select count(name)  as No_of_cities_greater_than_100000_population
from city
where population > 100000 ;





-- 9. What is the total population of California? [table: city]

-- Ans:

select sum(population) as 'total population of California' from city
where district = 'California' ;






-- 10. What is the average population of the districts in each country? [table: city]

-- Ans:

select countrycode as country  , district , avg(population) from city 
group by  district ;





-- 11. Find the ordernumber, status, customernumber, customername and comments 
-- for all orders that are ‘Disputed=  [table: orders, customers]

-- Ans:

select o.orderNumber , o.status , o.customerNumber , c.customerName , o.comments 
from orders o 
inner join customers c 
on o.customerNumber = c.customerNumber 
where o.status = 'Disputed' ;


--        END OF ASSIGNMENT SQL  SET  NO.  2 













