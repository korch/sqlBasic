--Выдать всех поставщиков (колонка CompanyName в таблице Suppliers), 
--у которых нет хотя бы одного продукта на складе
-- (UnitsInStock в таблице Products равно 0). 
-- Использовать вложенный SELECT для этого запроса с использованием оператора IN.

select * from Suppliers where SupplierID in (select SupplierID from Products
where UnitsInStock = 0)


--Выдать всех продавцов, которые имеют более 150 заказов.
-- Использовать вложенный SELECT.


select * from Employees e
where (select count(o.OrderID) from Orders o
where o.EmployeeID = e.EmployeeID) > 150

--Выдать всех заказчиков (таблица Customers), 
--которые не имеют ни одного заказа (подзапрос по таблице Orders). 
--Использовать оператор EXISTS.


select * from Customers c
where not exists(select o.CustomerID from Orders o
where o.CustomerID = c.CustomerID)
