(SELECT ct.city, EXTRACT(MONTH FROM p.payment_date) AS month, SUM(p.amount) AS total_payment
FROM payment p
JOIN customer c ON p.customer_id = c.customer_id
JOIN address a ON c.address_id = a.address_id
JOIN city ct ON a.city_id = ct.city_id
GROUP BY ct.city, EXTRACT(MONTH FROM p.payment_date)
ORDER BY city, month)
union
(select distinct ct.city, extract (month from p.payment_date) as month, 0 as total_payment
from city ct, payment p
where (ct.city, extract (month from p.payment_date)) not in
(select ct.city, extract (month from p.payment_date)
FROM payment p
JOIN customer c ON p.customer_id = c.customer_id
JOIN address a ON c.address_id = a.address_id
JOIN city ct ON a.city_id = ct.city_id))

-- the second code after union in the above helps in adding those onths where revene is zero. we can gonna do this with cte now

with distinct_months as (select distinct extract (month from p.payment_date) as month
						 from total_payment),
time_series_table as (

SELECT ct.city, EXTRACT(MONTH FROM p.payment_date) AS month, SUM(p.amount) AS total_payment
FROM payment p
JOIN customer c ON p.customer_id = c.customer_id
JOIN address a ON c.address_id = a.address_id
JOIN city ct ON a.city_id = ct.city_id
GROUP BY ct.city, EXTRACT(MONTH FROM p.payment_date)
ORDER BY city, month)

select*from time_Series_table
union
select ct.city, d.month, 0 as total_payment
from city ct, distinct_months d
where (ct.city, d.month) not in (select city,  month from time_Series_table)


--new code
--coalesce replaces null value with zeros.
