select 
'Customer' as type
, c.Email 
from Customer c 

union all

select 
'Emploee' as type
, e.Email 
from Employee e 
;
---
select 
'Customer' as type
, c.Email 
from Customer c 

except

select 
'Emploee' as type
, e.Email 
from Employee e 
;
---

select 
 c.CustomerId 
, c.FirstName
, c.LastName
, COUNT(DISTINCT g.GenreId) as nmb_genres
from invoiceLine il
left join Track t on il.TrackId = t.TrackId
left join Genre g on t.GenreId = g.GenreId 
left join Invoice i on il.InvoiceId = i.InvoiceId
left join Customer c on i.CustomerId = c.CustomerId
group by 1, 2, 3
HAVING COUNT(distinct g.GenreId) >= 3
;





