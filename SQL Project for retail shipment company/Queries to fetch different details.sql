--query to display list of suppliers from a particular country
select * from suppliers
where country='USA'

--query to display list of orders where quantity ordered are more than 20 and discount is greater than 2%
select * from orderdetails
where quantity>20 and discount>0.02

--query to display inventory levels by desc order with aparticular supplierId
select p.productsid, p.recorderlevel as Inventory_level
from products p
where supplierID=4
order by Inventory_level desc

--query to select shipping orders from a customer ID having customer details like ID, Name city and country
select o.order_id, o.orderdate, o.shippeddate, c.customer_id, c.city, c.contact_name, c.country
from customers c
Left Join orders o on c.customer_id=o.customer_id
