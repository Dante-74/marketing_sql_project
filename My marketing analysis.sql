--Marketing practice
DROP TABLE IF EXISTS marketing;
CREATE TABLE marketing
(
	id INT PRIMARY KEY,	
	c_date DATE,
	campaign_name VARCHAR (25),	
	category VARCHAR (15),	
	campaign_id	INT,
	impressions	INT,
	mark_spent DECIMAL(10,2),	
	clicks INT,	
	leads INT,	
	orders INT,	
	revenue DECIMAL(10,2)
);

SELECT * FROM marketing;


SELECT 
	COUNT(*) total_content
FROM marketing;


-- 1 Which campaigns had the highest return on investment (ROI)?

SELECT
	campaign_name,
	SUM(revenue-mark_spent) AS ROI
FROM marketing
GROUP BY campaign_name
ORDER BY ROI DESC;

-- 2 What's the total number of impressions, clicks, and leads per campaign?

SELECT 
	campaign_name,
	SUM(impressions) S_imp,
	SUM(clicks) S_cli,
	SUM(leads) S_lead
FROM marketing
GROUP BY campaign_name;

-- 3 Which campaign had the highest click-through rate (CTR)?

SELECT
	campaign_name,
	SUM(clicks)*100.0 / NULLIF(SUM(impressions),0) CTR
FROM marketing
GROUP BY campaign_name
ORDER BY CTR DESC;

-- 4 How did revenue trend over time (daily)?

SELECT 
	c_date,
	SUM(revenue) AS daily_revenue
FROM marketing
GROUP BY c_date
ORDER BY c_date;

-- 5 Which days had the most leads generated ?

SELECT 
	c_date,
	SUM(leads) AS total_leads
FROM marketing
GROUP BY c_date
ORDER BY total_leads DESC;

-- 6 What's the average marketing spend per day?

SELECT
	AVG(mark_spent) AS avg_daily_spend
FROM marketing;

-- 7 What's the average conversion rate from clicks to orders per campaign?

SELECT 
	campaign_name,
	SUM(orders)*100.0 / NULLIF(SUM(clicks), 0) AS conversion_rate
FROM marketing
GROUP BY campaign_name
ORDER BY conversion_rate DESC;

-- 8 How many leads were generated per category?

SELECT 
	category,
	SUM(leads) AS total_leads
FROM marketing
GROUP BY category;

-- 9 Which category had the highest revenue per naira spent?

SELECT 
	category,
	SUM(revenue)/NULLIF(SUM(mark_spent), 0) AS revenue_per_naira
FROM marketing
GROUP BY category
ORDER BY revenue_per_naira DESC;

-- 10 Which campaigns had high spending but low returns (possible underperformers)?

SELECT 
	campaign_name,
	SUM(mark_spent) AS total_spent,
	SUM(revenue) AS total_revenue
FROM marketing
GROUP BY campaign_name
HAVING SUM(mark_spent) > SUM(revenue)
ORDER BY total_spent DESC;

