select distinct OrderID from [Order Details]
where Quantity between 3 and 10

select CustomerID, Country from Customers 
where Country between 'b%' and 'i%'
order by Country

select CustomerID, Country from Customers 
where Country like 'b%' 
      or Country like 'c%'
	  or Country like 'd%'
	  or Country like 'e%'
	  or Country like 'f%'
	  or Country like 'g%'
order by Country

