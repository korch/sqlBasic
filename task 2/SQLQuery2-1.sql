--Ќайти общую сумму всех заказов из таблицы Order Details с учетом количества 
--закупленных товаров и скидок по ним. –езультатом запроса должна быть одна запись
-- с одной колонкой с названием колонки 'Totals'.

select sum(Quantity * UnitPrice * (1 - Discount)) as Total
 from [Order Details]



 --ѕо таблице Orders найти количество заказов, которые еще не были доставлены (т.е. в колонке ShippedDate нет значени€ даты доставки). »спользовать при этом запросе только оператор COUNT. 
 --Ќе использовать предложени€ WHERE и GROUP.

 select count(*) - count(ShippedDate) from Orders


 --ѕо таблице Orders найти количество различных покупателей (CustomerID), 
 --сделавших заказы. »спользовать функцию COUNT и не использовать предложени€ WHERE и GROUP.

  select count(distinct CustomerID) from Orders
