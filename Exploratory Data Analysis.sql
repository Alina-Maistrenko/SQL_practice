select *
from salaries
limit 20;

select 
	count(*)
from salaries
;

select 
	count(salary_usd)
	, count(salary_usd) - count(*) as missing_values
from salaries
;

-- categorical data
select 
	job_title
	, count(*)
from salaries
group by 1
order by 2 desc
limit 10        -- LIMIT 10 and generate a bar chart
;

-- numeric data
select 
	job_title
	, exp_level
	, min(salary_usd)
	, max(salary_usd)
	, round(avg(salary_usd),2)
	, stddev(salary_usd)
from salaries
group by 1, 2
;

-- distribution
select 
	trunc(salary_usd, -1) -- trancate allows to make 160000 from 154560
from salaries
group by 1
;

select
	case 
		when salary_usd <= 10000 then 'A'
		when salary_usd <= 20000 then 'B'
		when salary_usd <= 50000 then 'C'
		when salary_usd <= 100000 then 'D'
		when salary_usd <= 200000 then 'E'
			else 'F' end as salary_category
	, count(*)
from salaries
group by 1
;

select 
	corr(remote_ratio, salary_usd)
from salaries



















