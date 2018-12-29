select OrderID, ShippedDate, ShipVia 
from Orders
where ShippedDate > '1997-05-06 23:59.000' and ShipVia >= 2


select OrderID, 
     case when ShippedDate is null then 'Not Shipped'
	 end as Shipped
from Orders
where ShippedDate is null


select OrderID as 'Order Number',
    case when ShippedDate is null
        then 'Not Shipped'
	    else convert(nvarchar(20), ShippedDate, 120)
	end as 'Shipped Date'
from Orders
where ShippedDate > '1997-05-05 23:59.000' or ShippedDate is null
