--По таблице Orders найти количество заказов с группировкой по годам. В результатах запроса надо возвращать две колонки c 
--названиями Year и Total. Написать проверочный запрос, который вычисляет количество всех заказов.

select year(OrderDate) as 'Year', count(OrderID) as 'Orders count' from Orders
group by year(OrderDate)


--По таблице Orders найти количество заказов, cделанных каждым продавцом.
-- Заказ для указанного продавца – это любая запись в таблице Orders, 
-- где в колонке EmployeeID задано значение для данного продавца.
--  В результатах запроса надо возвращать колонку с именем продавца 
--  (Должно высвечиваться имя полученное конкатенацией LastName & FirstName.
--   Эта строка LastName & FirstName должна быть получена отдельным запросом 
--   в колонке основного запроса. Также основной запрос должен использовать 
--   группировку по EmployeeID.) с названием колонки ‘Seller’ и колонку
--    c количеством заказов возвращать с названием 'Amount'. 
--	Результаты запроса должны быть упорядочены по убыванию количества заказов.


select 
   (select concat(e.LastName, ' ', e.FirstName) from Employees e
where e.EmployeeID = o.EmployeeID) as 'Seller',
    count(o.OrderID) as 'Amount'
from Orders o
group by o.EmployeeID
Order by 'Amount' desc


--По таблице Orders найти количество заказов, сделанных каждым продавцом 
--и для каждого покупателя. Необходимо определить это только для заказов,
-- сделанных в 1998 году.

select EmployeeID, CustomerID,  Count(OrderID) as 'Amount'
from Orders
where YEAR(OrderDate) = 1998
group by EmployeeID, CustomerID


--Найти покупателей и продавцов, которые живут в одном городе. 
--Если в городе живут только один или несколько продавцов, или 
--только один или несколько покупателей, то информация о таких покупателя
-- и продавцах не должна попадать в результирующий набор. 
-- Не использовать конструкцию JOIN.


select CustomerID, EmployeeID, City        
from Customers c
cross apply (select EmployeeID 
from Employees e
where e.City = c.City) Employees;


--Найти всех покупателей, которые живут в одном городе.

select distinct c1.CustomerID, c1.City from Customers c1
inner join Customers c2 on c2.City = c1.City and c1.CustomerID != c2.CustomerID
order by c1.City

--По таблице Employees найти для каждого продавца его руководителя

select e1.EmployeeID, concat(e1.FirstName, ' ', e1.LastName) as 'Employee',
concat(e2.FirstName, ' ', e2.LastName) as 'Manager'
from Employees e1
inner join Employees e2 on e2.EmployeeID = e1.ReportsTo
where e1.ReportsTo is not null
