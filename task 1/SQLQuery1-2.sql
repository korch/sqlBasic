select *
from Customers
where Country in ('USA', 'Canada')
order by CompanyName, City


select *
from Customers
where Country not in ('USA', 'Canada')
order by CompanyName

select distinct Country from Customers
where Country is not null
order by Country desc