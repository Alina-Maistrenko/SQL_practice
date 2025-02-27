--Unformatted request
select * 
from salaries
limit 10;

--Top 5 Data Science salaries in 2023
SELECT
	year
	, job_title
	, comp_location AS country
	, salary_usd
FROM salaries
WHERE 
	year = 2023
	AND job_title = 'Data Scientist'
ORDER BY salary_usd DESC
LIMIT 5;

--ML Engineer Salaries in 2023
select
	salary_usd
	, year
	, job_title
from salaries
where 
	job_title = 'ML Engineer'
	and year = 2023
order by salary_usd desc
limit 10;

--Country with the Lowest Data Scientist Salary in 2023
select 
	comp_location
	, job_title
	, year
	, salary_usd
from salaries
where 
	year = 2023
	and job_title = 'Data Scientist'
order by salary_usd asc
limit 1;

--Salaries of Ukrainian Employees, Sorted by Ascending Salary
select 
	salary_usd
from salaries
where
	comp_location = 'UA'
order by salary_usd asc;

--Highest 5 Salaries for Remote Employees (remote_ratio = 100)
select 
	salary
	, remote_ratio
from salaries
where remote_ratio = 100
order by salary_usd desc
limit 5;

--Extract Distinct Column Values
select 
	distinct comp_location
from salaries

--Count of Unique Values in a Column
select 
	count(distinct comp_location)
from salaries;

--Average, Minimum, and Maximum Salary by 2023
select 
	round(avg(salary_usd),2) as avg_salary_usd
	, min(salary_usd) as min_salary_usd
	,max(salary_usd) as max_salary_usd
from salaries
where year = 2023;

--Top 5 Highest ML Engineer Salaries in 2023 (Converted to UAH)
select
	salary_usd
	, job_title
	, year
	, (salary_usd * 42) as salary_uah
from salaries
where 
	year = 2023
	and job_title = 'ML Engineer'
order by salary_usd desc
limit 5;

--Formatted Unique Remote Ratio Values
select distinct round((remote_ratio/100.0),2) as remote_frac
from salaries;

--Data with an additional column 'exp_level_full' with the full name of the employees' experience levels according to the exp_level column 
--(Entry-level (EN), Mid-level (MI), Senior-level (SE), Executive-level (EX))
select *
	,case
		when exp_level = 'EN' then 'Entry_level'
		when exp_level = 'MI' then 'Mid_level'
		when exp_level = 'SE' then 'Senior_level'
		else 'Executive_level' end      as exp_level_full
from salaries
limit 10;

--Data with an additional column 'salary_category', which displays different categories of salaries according to their value in the column 'salary_in_usd
	-- salary <= 20 000 - Category 1
	-- salary <= 50 000 - Category 2
	-- salary <= 100 000 - Category 3
	-- salary > 100 000 - Category 4
SELECT *
	, CASE
		WHEN salary_usd <= 20000	THEN 'Category 1'
		WHEN salary_usd <= 50000	THEN 'Category 2'
		WHEN salary_usd <= 100000	THEN 'Category 3'
		ELSE 'Category 4'   END     AS salary_category
FROM salaries
limit 10;

--Checking each column for missing values
select count(*) as total_nmb
	, count(salary_usd) as dist_nmb
	, count(*) - count(salary_usd) as null_nmb
from salaries





