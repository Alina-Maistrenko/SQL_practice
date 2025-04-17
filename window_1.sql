
select *
 , salary_usd :: float / max_salary  as ratio_max
 , salary_usd / avg_salary  		 as ratio_avg
from cte
;

with cte as (
	select 
		job_title 
		, salary_usd 
		, SUM(salary_usd)	OVER(partition by job_title order by salary_usd)	as sum_salary
		, AVG(salary_usd) 	OVER(partition by job_title)	as avg_salary			
		, MIN(salary_usd)	OVER(partition by job_title)	as min_salary
		, MAX(salary_usd)	OVER(partition by job_title)	as max_salary
		, COUNT(salary_usd)	OVER(partition by job_title)	as job_cnt
		, SUM(salary_usd)	OVER(partition by job_title)	as sum_salary
	from salaries s 	
	where year = 2023
)

select *
	, 	salary_usd::float / max_salary	as ratio_max	-- CAST()
	, salary_usd / avg_salary 			as ratio_avg
from cte
;

with cte as(
	select 
		job_title
		, salary_usd
		, SUM(s.salary_usd) over(partition by job_title order by s.salary_usd )	 as sum_salary
	from salaries s 
	where year = 2023
)
select *
from cte
;
------------
with cte as (
	select 
		job_title 
		, salary_usd 
		, AVG(salary_usd) 	OVER(partition by job_title)	as avg_salary			
	from salaries s 	
	where year = 2023
)

select *
from cte
where salary_usd > avg_salary
;
