with melomaniacs as(

	select 
		 c.CustomerId 
		, c.FirstName
		, c.LastName
		, COUNT(DISTINCT g.GenreId) as nmb_genres
	from InvoiceLine il 
	left join Track t on il.TrackId = t.TrackId
	left join Genre g on t.GenreId = g.GenreId 
	left join Invoice i on il.InvoiceId = i.InvoiceId
	left join Customer c on i.CustomerId = c.CustomerId
	group by 1, 2, 3
	HAVING COUNT(distinct g.GenreId) >= 3
	)
,
invoices as(

	select *
	from Invoice i 
	WHERE InvoiceDate between '2009-01-01' and '2010-01-01'	
)

select *
from melomaniacs m
left join invoices i on m.CustomerId = i.CustomerId
where i.CustomerId is not NULL 
;
-------------------
with melomaniacs as(

	select 
		 c.CustomerId 
		, c.FirstName
		, c.LastName
		, COUNT(DISTINCT g.GenreId) as nmb_genres
	from InvoiceLine il 
	left join Track t on il.TrackId = t.TrackId
	left join Genre g on t.GenreId = g.GenreId 
	left join Invoice i on il.InvoiceId = i.InvoiceId
	left join Customer c on i.CustomerId = c.CustomerId
	group by 1, 2, 3
	HAVING COUNT(distinct g.GenreId) >= 3
	)
,
invoices as(

	select *
	from Invoice i 
	WHERE InvoiceDate between '2009-01-01' and '2010-01-01'	
)

select *
from melomaniacs m
WHERE m.CustomerId in (select CustomerId from invoices)
;

