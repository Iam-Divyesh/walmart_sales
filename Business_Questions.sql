-- Walmart Project Queries

SELECT * FROM walmart;

-- DROP TABLE walmart;

-- DROP TABLE walmart;

-- 
SELECT COUNT(*) FROM walmart;

SELECT 
	 payment_method,
	 COUNT(*)
FROM walmart
GROUP BY payment_method

SELECT 
	COUNT(DISTINCT branch) 
FROM walmart;

SELECT MIN(quantity) FROM walmart;

-- Business Problems
--Q.1 Find different payment method and number of transactions, number of qty sold


SELECT 
	 payment_method,
	 COUNT(*) as no_payments,
	 SUM(quantity) as no_qty_sold
FROM walmart
GROUP BY payment_method


-- Project Question #2
-- Identify the highest-rated category in each branch, displaying the branch, category
-- AVG RATING

SELECT * 
FROM
(	SELECT 
		branch,
		category,
		AVG(rating) as avg_rating,
		RANK() OVER(PARTITION BY branch ORDER BY AVG(rating) DESC) as rank
	FROM walmart
	GROUP BY 1, 2
)
WHERE rank = 1

-- Q.3 Identify the busiest day for each branch based 
-- on the number of transactions

SELECT * FROM 
(SELECT 
	branch,
	TO_CHAR(TO_DATE(date , 'DD-MM-YY') , 'Day') AS Day,
	COUNT(*) as no_transactions,
	RANK() OVER(PARTITION BY branch  ORDER BY COUNT(*)) as rank
FROM walmart
GROUP BY 1,2)
WHERE rank = 1;


-- Q. 4 
-- Calculate the total quantity of items sold per payment method.
-- List payment_method and total_quantity.


SELECT 
	 payment_method,
	 -- COUNT(*) as no_payments,
	 SUM(quantity) as no_qty_sold
FROM walmart
GROUP BY payment_method;


-- Q.5
-- Determine the average, minimum, and maximum rating of category for each city. 
-- List the city, average_rating, min_rating, and max_rating.

SELECT 
	city,
	category , 
	MAX(rating) as MAXIMUM , 
	MIN(rating) AS MINIMUM ,
	ROUND(AVG(rating)::"numeric" , 2) AS AVERAGE 
FROM walmart
GROUP BY category , city;


-- Q.6
-- Calculate the total profit for each category by considering total_profit as
-- (unit_price * quantity * profit_margin). 
-- List category and total_profit, ordered from highest to lowest profit.

SELECT 
	category,
	ROUND(SUM(total * profit_margin)::"numeric",2) AS total_profit
FROM walmart
GROUP BY category
ORDER BY total_profit DESC;


-- Q.7
-- Determine the most common payment method for each Branch. 
-- Display Branch and the preferred_payment_method.

SELECT * FROM
(SELECT 
	branch ,
	payment_method,
	COUNT(*) AS total_tans,
	RANK() OVER(PARTITION BY branch  ORDER BY COUNT(*) DESC )
FROM walmart
GROUP BY 1,2
ORDER BY 1)
WHERE rank = 1;



-- Second METHOD

WITH cte
AS
(SELECT 
	branch ,
	payment_method,
	COUNT(*) AS total_tans,
	RANK() OVER(PARTITION BY branch  ORDER BY COUNT(*) DESC )
FROM walmart
GROUP BY 1,2
ORDER BY 1)
SELECT * FROM cte
WHERE rank = 1;


-- Q.8
-- Categorize sales into 3 group MORNING, AFTERNOON, EVENING 
-- Find out each of the shift and number of invoices

SELECT 
	branch,
CASE 
		WHEN EXTRACT(HOUR FROM (time::time)) < 12 THEN 'Morning'
		WHEN EXTRACT(HOUR FROM (time::time)) BETWEEN 12 AND 17 THEN 'Afternoon'
		ELSE 'Evening'
	END day_time,
	COUNT(*)	
FROM walmart
GROUP BY 1,2
ORDER BY 1, 3 DESC;
	


-- 
-- #9 Identify 5 branch with highest decrese ratio in 
-- revevenue compare to last year(current year 2023 and last year 2022)

SELECT * ,
EXTRACT(YEAR FROM TO_DATE(date , 'DD-MM-YY')) AS fromated_date
FROM walmart

WITH revenue_2022 AS(
	SELECT
		branch,
		SUM(total) as revenue
	FROM walmart
	WHERE EXTRACT(YEAR FROM TO_DATE(date, 'DD/MM/YY')) = 2022
	GROUP BY 1
),

revenue_2023
AS(
	SELECT
		branch,
		SUM(total) as revenue
	FROM walmart
	WHERE EXTRACT(YEAR FROM TO_DATE(date, 'DD/MM/YY')) = 2023
	GROUP BY 1
)

SELECT
	ls.branch,
	ls.revenue AS last_year_revenue,
	cs.revenue AS cr_year_revenue,
	ROUND((ls.revenue - cs.revenue)::"numeric"/
	ls.revenue::"numeric" *100,
	2) AS rev_dec_ratio
FROM revenue_2022 AS ls
JOIN revenue_2023 AS cs
ON cs.branch = ls.branch
WHERE 
	ls.revenue > cs.revenue
ORDER BY 4 DESC
LIMIT 5













