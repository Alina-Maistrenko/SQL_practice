select *
from salaries
limit 20;

--Filter numeric columns
select *
from salaries
where year <> 2023
limit 20;

select *
from salaries
where year = 2023
limit 20;

select *
from salaries
where year >= 2023
limit 20;

--String column filter
select*
from salaries
where exp_level = 'SE'
limit 20;

select*
from salaries
where exp_level = 'SE'
and job_title = 'Data Scientist'
limit 20;

SELECT year
FROM salaries 
WHERE 
	exp_level = 'MI'
LIMIT 20;

-- Setting a range of values
SELECT distinct year
FROM salaries 
WHERE 1=1
	and year between 2020 and 2023
	--and year >= 2020
	--and year <=2023
LIMIT 20;

SELECT distinct year
FROM salaries 
WHERE 1=1
	and year not between 2021 and 2023
	--and year >= 2020
	--and year <=2023
LIMIT 20;

-- Inputting a list of numerical data
SELECT distinct year
FROM salaries 
WHERE 1=1
	and year in  (2020, 2021)
	--and year >= 2020
	--and year <=2023
LIMIT 20;

SELECT distinct year
FROM salaries 
WHERE 1=1
	and year not in  (2020, 2021)
	--and year >= 2020
	--and year <=2023
LIMIT 20;

--Inputting a list of text values
SELECT distinct job_title
FROM salaries 
WHERE 1=1
	and job_title in  ('Data Analyst', 'Data Scientist')
LIMIT 20;

--Searching text by pattern
SELECT distinct job_title
FROM salaries 
WHERE 1=1
	and job_title like  ('Data%')
LIMIT 20;

SELECT distinct job_title
FROM salaries 
WHERE 1=1
	and job_title like  ('%Data%')
LIMIT 20;

SELECT distinct job_title
FROM salaries 
WHERE 1=1
	and job_title like  ('Data Sc%')
LIMIT 20;

SELECT distinct job_title
FROM salaries 
WHERE 1=1
	and job_title not like  ('Data_A%')
LIMIT 20;

SELECT distinct job_title
FROM salaries 
WHERE 1=1
	and job_title like  ('_ata_A%')
LIMIT 20;

SELECT distinct job_title
FROM salaries 
WHERE 1=1
	and job_title ilike  ('data_A%')
LIMIT 20;

-- Filter empty values
select *
from salaries
where 1=1
	and year is not null
limit 20;

select count(*)
from salaries
where 1=1
	and year is not null
limit 20;

select count(year)
from salaries
where 1=1
	--and year is not null
limit 20;