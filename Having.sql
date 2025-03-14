select *
from salaries
limit 20;

--For each profession and corresponding experience level, provide:
-- -the count in the table
-- -the average salary
select job_title
, exp_level
, count(*) as job_nmb
, round(avg(salary_usd),2) as salary_avg
from salaries
where year = 2023
group by job_title
, exp_level
order by 1,2 desc;

--For jobs that happen only once or twice, show the salary
select job_title
--, count(*) as job_nmb
, round(avg(salary_usd),2) as salary_avg
from salaries
where year = 2023
group by job_title
having count(*) = 1
order by 2 asc;

select job_title
--, count(*) as job_nmb
, round(avg(salary_usd),2) as salary_avg
from salaries
where year = 2023
group by job_title
having count(*) = 2
order by 2 asc;

select job_title
--, count(*) as job_nmb
, round(avg(salary_usd),2) as salary_avg
from salaries
where year = 2023
group by job_title
having 
	count(*) = 2
	and round(avg(salary_usd),2) > 200000
order by 2 asc;

























