select *
from salaries
limit 20;

/*TASK 1
Show employees with a salary higher than the average salary in the table.*/

select *
from salaries
where salary_usd >      -- Compare to average salary
(
select avg(salary_usd)
from salaries
where year = 2023
)
	and year = 2023;

/*TASK 2

Show all specialists who live in countries where the average salary is higher 
than the average salary across all countries.
*/

--Steps:

--Find the average salary across all countries.
--Find the average salary for each country.
--Compare the average salary of each country to the overall average salary. Find the countries where the average salary is higher.
--Show the specialists who live in those countries. 

---------------------------------------

select *									-- 4. specialists who live in those countries
from salaries
where emp_residence in 
(
	select 
	 comp_location    						-- 2. average salary for each country
	from salaries
	where year = 2023
	group by comp_location
	having round(avg(salary_usd), 2) >      -- 3. Compare the average salaries
( 
		select round(avg(salary_usd), 2)    -- 1. average salary across all countries.
		from salaries
		where year = 2023
)
)


/*TASK 3

Find the lowest salary from the highest salaries in each country.*/

--Steps:

--Find the highest salaries in each country for the year 2023.
--Then, find the lowest salary from those highest salaries.
--------------------------------
--1
select max(salary_usd)
	,comp_location
from salaries
where year = 2023
group by comp_location;

--2
select min(t.salary_usd)
from (
	select max(salary_usd) as salary_usd
	,comp_location
	from salaries
	where year = 2023
	group by comp_location
) as t
;

--Alternative
select max(salary_usd) as salary_usd
	,comp_location
	from salaries
	where year = 2023
	group by comp_location
	order by 1 asc
	limit 1


/*Task 4

For each job, show the difference between the average salary and the maximum salary 
of all employees.*/

-- 1.Find the maximum salary.
-- 2.Make a table of jobs and average salaries.
-- 3.Show the result.

--1
select max(salary_usd)
from salaries;

--2
select job_title
	, round(avg(salary_usd),2)
from salaries
group by job_title;

--3
select job_title
	, round(avg(salary_usd),2) -
	(
	select max(salary_usd)
	from salaries
) as diff
from salaries
group by job_title;


/*TASK 5. Show the employee data, who has the second highest salary in the table*/

select*
from (
select 
	job_title
	,salary_usd
from salaries
order by 2 desc
limit 2
) as t
order by salary_usd asc
limit 1;

-- Alternative
select 
	job_title
	,salary_usd
from salaries
order by 2 desc
limit 1 offset 1;


