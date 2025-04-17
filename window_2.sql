select 
i.InvoiceDate 
, i.Total 
, sum (total) over (order by i.InvoiceDate) as cum_sum
from Invoice i 
;

with cte as(
	SELECT 
		i.InvoiceId 
		, i.CustomerId 
		, i.Total 
		, row_number()  over(partition by customerid order by i.Total desc) as invoice_nmb
		, rank()		over(partition by customerid order by i.Total desc) as invoice_rank
		, dense_rank()	over(partition by customerid order by i.Total desc) as invoice_rank  
	from Invoice i 
	order by CustomerId 
)
select *
from cte
where invoice_nmb = 2
;

select 
i.InvoiceId 
, i.CustomerId 
, i.InvoiceDate 
, i.Total 
, lag(i.Total, 1) over (partition by CustomerId order by i.InvoiceDate ) as lag_total
, lag(i.InvoiceDate , 1) over (partition by CustomerId order by i.InvoiceDate ) as lag_total
, JULIANDAY(i.InvoiceDate ) - JULIANDAY(lag(i.InvoiceDate , 1) over (partition by CustomerId order by i.InvoiceDate )) as diff_in_days
, lead(i.Total, 1) over (partition by CustomerId order by i.InvoiceDate ) as lead_total
from Invoice i 
order BY CustomerId 
;

select 
i.InvoiceId 
, i.CustomerId 
, i.InvoiceDate 
, i.Total 
, first_value (i.Total ) over (partition by CustomerId order by i.InvoiceDate ) as first_amound
, last_value (i.Total ) over (partition by CustomerId order by i.InvoiceDate ) as last_amound
from Invoice i 
