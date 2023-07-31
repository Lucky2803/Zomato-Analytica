-- 1. Find customers who have never ordered
SELECT u.user_id, u.name
FROM Users u
LEFT JOIN Orders o ON u.user_id = o.user_id
WHERE o.order_id IS NULL;



-- 2. Average Price/dish
SELECT f.f_id, f.f_name, f.type, AVG(m.price) AS average_price
FROM Food f
LEFT JOIN Menu m ON f.f_id = m.f_id
GROUP BY f.f_id, f.f_name, f.type;

-- 3. Find the top restaurant in terms of the number of orders for a given month
SELECT f.f_id, f.f_name, f.type, AVG(m.price) AS average_price
FROM Food f
LEFT JOIN Menu m ON f.f_id = m.f_id
GROUP BY f.f_id, f.f_name, f.type;

-- 4. restaurants with monthly sales greater than x 
SELECT r.r_id, r.r_name, DATE_FORMAT(o.date, '%m') AS month,
       SUM(o.amount) AS monthly_sales
FROM restaurant r
JOIN Orders o ON r.r_id = o.r_id
GROUP BY r.r_id, r.r_name, DATE_FORMAT(o.date, '%m')
HAVING SUM(o.amount) > 1000; -- Change 1000 to the desired monthly sales value (X in this example)

-- 5. Show all orders with order details for a particular customer in a particular date range
SELECT o.order_id, o.user_id, o.r_id, o.amount, o.date, od.f_id
FROM Orders o
JOIN order_details od ON o.order_id = od.order_id
WHERE o.user_id = 1 -- Change 101 to the desired customer ID
  AND o.date BETWEEN '2022-05-01' AND '2022-08-31'; -- Change the date range as required

-- 6. Find restaurants with max repeated customers 
SELECT r.r_id, r.r_name, COUNT(DISTINCT o.user_id) AS num_customers
FROM restaurant r
JOIN Orders o ON r.r_id = o.r_id
GROUP BY r.r_id, r.r_name
ORDER BY num_customers DESC
LIMIT 1;

-- 7. Month over month revenue growth of zomato
SELECT DATE_FORMAT(date, '%m') AS month,
       DATE_FORMAT(date, '%Y') AS year,
       SUM(amount) AS monthly_revenue
FROM Orders
GROUP BY month, year
ORDER BY year, month;


-- 8. Customer - favorite food
SELECT u.user_id, u.name, f.f_name AS favorite_food
FROM Users u
JOIN (
    SELECT o.user_id, od.f_id, COUNT(od.f_id) AS food_count,
           RANK() OVER (PARTITION BY o.user_id ORDER BY COUNT(od.f_id) DESC) AS food_rank
    FROM Orders o
    JOIN order_details od ON o.order_id = od.order_id
    GROUP BY o.user_id, od.f_id
) AS ranked_foods ON u.user_id = ranked_foods.user_id AND ranked_foods.food_rank = 1
JOIN Food f ON ranked_foods.f_id = f.f_id;
