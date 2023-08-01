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

----------------------------------------------------------------------------------------------------------------------------
-- 9. Find customers who have never ordered from a specific cuisine
SELECT u.*
FROM Users u
LEFT JOIN Orders o ON u.user_id = o.user_id
LEFT JOIN restaurant r ON o.r_id = r.r_id AND r.cuisine = 'Italian' -- Change 'Italian' to the desired cuisine
WHERE o.order_id IS NULL;


-- 10. Find the most frequently ordered pair of dishes
SELECT f1.f_name AS dish1, f2.f_name AS dish2, COUNT(*) AS order_count
FROM Food f1
JOIN order_details od1 ON f1.f_id = od1.f_id
JOIN order_details od2 ON od1.order_id = od2.order_id AND od1.f_id < od2.f_id
JOIN Food f2 ON f2.f_id = od2.f_id
GROUP BY f1.f_name, f2.f_name
ORDER BY order_count DESC
LIMIT 1;


-- 11. Find the longest chain of food items in the menu (recursive query)      (no res)
WITH RECURSIVE MenuChain AS (
    SELECT f_id, f_name, 1 AS chain_length
    FROM Food
    WHERE NOT EXISTS (
        SELECT 1
        FROM Menu m
        WHERE m.f_id = Food.f_id
    )
    UNION ALL
    SELECT f.f_id, f.f_name, mc.chain_length + 1
    FROM MenuChain mc
    JOIN Menu m ON mc.f_id = m.f_id
    JOIN Food f ON m.r_id = f.f_id
)
SELECT *
FROM MenuChain
ORDER BY chain_length DESC
LIMIT 1;


-- 12. Find the top delivery partner by the number of deliveries made in a particular month
SELECT dp.*, COUNT(o.order_id) AS delivery_count
FROM delivery_partners dp
JOIN Orders o ON dp.partner_id = o.partner_id
WHERE DATE_FORMAT(o.date, '%m') = '07' -- Change '07' to the desired month (July in this example)
GROUP BY dp.partner_id, dp.partner_name
ORDER BY delivery_count DESC
LIMIT 1;


-- 13 Find customers who have placed consecutive orders on consecutive days    (no res)
SELECT DISTINCT u.*
FROM Users u
JOIN Orders o1 ON u.user_id = o1.user_id
JOIN Orders o2 ON u.user_id = o2.user_id AND o1.order_id <> o2.order_id
WHERE DATE(o2.date) = DATE_ADD(DATE(o1.date), INTERVAL 1 DAY);



-- 14 Calculate the revenue share of each restaurant compared to the total revenue
SELECT r.r_id, r.r_name, SUM(o.amount) AS revenue,
       SUM(o.amount) / (SELECT SUM(amount) FROM Orders) * 100 AS revenue_share_percentage
FROM restaurant r
LEFT JOIN Orders o ON r.r_id = o.r_id
GROUP BY r.r_id, r.r_name
ORDER BY revenue DESC;


-- 15 Find the top 5 customers who have spent the most on food orders in the last 3 months.   (no res)
SELECT u.user_id, u.name, SUM(o.amount) AS total_spent
FROM Users u
JOIN Orders o ON u.user_id = o.user_id
WHERE DATEDIFF(CURRENT_DATE(), DATE(o.date)) <= 90 -- 90 days represent 3 months
GROUP BY u.user_id, u.name
ORDER BY total_spent DESC
LIMIT 5;


-- 16 Find the most popular food pairings ordered together by different customers
SELECT f1.f_name AS dish1, f2.f_name AS dish2, COUNT(DISTINCT o.user_id) AS unique_customers
FROM Food f1
JOIN order_details od1 ON f1.f_id = od1.f_id
JOIN order_details od2 ON od1.order_id = od2.order_id AND od1.f_id < od2.f_id
JOIN Food f2 ON f2.f_id = od2.f_id
JOIN Orders o ON od1.order_id = o.order_id
GROUP BY f1.f_name, f2.f_name
ORDER BY unique_customers DESC;

-- 17 Implement a stored procedure that automatically assigns a delivery partner to an order based on their previous delivery performance.The stored procedure 
-- should take an order ID as input and assign the delivery partner who has the least average delivery time and highest average delivery rating for previous orders.
DELIMITER //
CREATE PROCEDURE AssignDeliveryPartner(IN orderID INT)
BEGIN
    DECLARE partnerID INT;
    SELECT dp.partner_id INTO partnerID
    FROM delivery_partners dp
    WHERE dp.partner_id NOT IN (
        SELECT DISTINCT partner_id
        FROM Orders o2
        WHERE o2.order_id = orderID
    )
    GROUP BY dp.partner_id
    ORDER BY AVG(
        CASE WHEN dp.partner_id = o.partner_id THEN o.delivery_time END
    ) ASC, 
    AVG(
        CASE WHEN dp.partner_id = o.partner_id THEN o.delivery_rating END
    ) DESC
    LIMIT 1;

    UPDATE Orders
    SET partner_id = partnerID
    WHERE order_id = orderID;
END;
//
DELIMITER ;
