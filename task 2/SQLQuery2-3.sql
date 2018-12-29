--1. Определить продавцов, которые обслуживают регион 'Western' (таблица Region).

select distinct 
    e.EmployeeID,
    e.FirstName
from Employees e
        inner join EmployeeTerritories et
            on et.EmployeeID = e.EmployeeID
        inner join Territories t
            on t.TerritoryID = et.TerritoryID
        inner join Region r
            on r.RegionID = t.RegionID
where r.RegionDescription = 'Western'


--Выдать в результатах запроса имена всех заказчиков из таблицы Customers и 
--суммарное количество их заказов из таблицы Orders.
-- Принять во внимание, что у некоторых заказчиков нет заказов, 
-- но они также должны быть выведены в результатах запроса.
--  Упорядочить результаты запроса по возрастанию количества заказов.

select c.ContactName ,COUNT(o.OrderID) as 'OrdersCount'
from Customers c
    left join Orders o
        on o.CustomerID = c.CustomerID
group by c.CustomerID, c.ContactName
order by 'OrdersCount';