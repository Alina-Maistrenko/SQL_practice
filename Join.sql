select * from Invoice i limit 100;
select * from InvoiceLine il limit 100;
SELECT * from Track t limit 100;
SELECT * from Album a limit 100;
SELECT * from Artist art limit 100; 

--Add columns from another table

select 
	t.TrackId
	, t.Name
	, a.Title 
	, a.ArtistId
	, art.Name
from Track t 
JOIN Album a    ON t.AlbumId = a.AlbumId
join Artist art on a.ArtistId = art.ArtistId
where art.Name like "A%"
LIMIT 100;


--Group the data after joins 

select 
	 art.Name
	 , count(t.TrackId)
from Track t 
JOIN Album a    ON t.AlbumId = a.AlbumId
join Artist art on a.ArtistId = art.ArtistId
where art.Name like "A%"
group by 1
ORDER by 2 desc
LIMIT 100;