-- Ejercicios a la verga

-- 1 El candidato mas apto

SELECT
  candidate_id
FROM
  candidates
where skill in ('Python','Tableau','PostgreSQL')
GROUP BY candidate_id
HAVING count(skill) = 3
order by candidate_id asc;

-- 2 Cities With Completed Trades la ciudad con mas pinches ordenes completadas

-- Output the city name and the corresponding number of completed trade orders.

WITH completed as (
	select * from trades where statud = "Completed"
)

-- cte con ranked separacion logica y conceptual, y funciones de agregacion
WITH completed as (
	select *
	from trades
	where status = 'Completed'
)
city_orders AS (
    SELECT u.city, COUNT(c.order_id) AS total_orders
    FROM completed c
    JOIN users u
      ON c.user_id = u.user_id
    GROUP BY u.city
),
ranked AS (
    SELECT *,
           RANK() OVER (ORDER BY total_orders DESC) AS rnk
    FROM city_orders
)
SELECT *
FROM ranked
WHERE rnk <= 3;

--  separacion logica con completed INCREIBLE A LA VERGA
select c.city,count(order_id) as total_orders
from completed c 
JOIN users  u
	on c.user_id = u.user_id
GROUP BY c.city
order by total_orders desc
limit 3;
