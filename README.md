# Marketing Campaign Analysis using SQL

A mini SQL project analyzing digital marketing campaigns using a dataset of impressions, clicks, leads, and revenue. The goal is to extract key insights like ROI, click-through rates, and time-based trends

## Dataset

The data for this project is sourced from kaggle dataset:

- **Dataset Link:** [Marketing Dataset](https://www.kaggle.com/datasets/sinderpreet/analyze-the-marketing-spending)

## Key SQL Insights

- Campaign summary and performance
- Click-through and conversion rates
- Revenue trends over time
- Campaign profitability segmentation

## Tools
- SQL Server / MySQL / PostgreSQL
- SQL Server Management Studio (SSMS)

## Schema

```
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
```

## Business problems and solutions

**Objective:** Campaign Performance

### 1 Which campaigns had the highest return on investment (ROI)?

```
SELECT
	campaign_name,
	SUM(revenue-mark_spent) AS ROI
FROM marketing
GROUP BY campaign_name
ORDER BY ROI DESC;
```

### 2 What's the total number of impressions, clicks, and leads per campaign?

```
SELECT 
	campaign_name,
	SUM(impressions) S_imp,
	SUM(clicks) S_cli,
	SUM(leads) S_lead
FROM marketing
GROUP BY campaign_name;
```

### 3 Which campaign had the highest click-through rate (CTR)?

```
SELECT
	campaign_name,
	SUM(clicks)*100.0 / NULLIF(SUM(impressions),0) CTR
FROM marketing
GROUP BY campaign_name
ORDER BY CTR DESC;
```

**Objective:** Time-Based Analysis

### 4 How did revenue trend over time (daily)?

```
SELECT 
	c_date,
	SUM(revenue) AS daily_revenue
FROM marketing
GROUP BY c_date
ORDER BY c_date;
```

### 5 Which days had the most leads generated ?

```
SELECT 
	c_date,
	SUM(leads) AS total_leads
FROM marketing
GROUP BY c_date
ORDER BY total_leads DESC;
```

### 6 What's the average marketing spend per day?

```
SELECT
	AVG(mark_spent) AS avg_daily_spend
FROM marketing;
```

**Objective:** Conversion Funnel Insights

### 7 What's the average conversion rate from clicks to orders per campaign?

```
SELECT 
	campaign_name,
	SUM(orders)*100.0 / NULLIF(SUM(clicks), 0) AS conversion_rate
FROM marketing
GROUP BY campaign_name
ORDER BY conversion_rate DESC;
```

### 8 How many leads were generated per category?

```
SELECT 
	category,
	SUM(leads) AS total_leads
FROM marketing
GROUP BY category;
```

### 9 Which category had the highest revenue per naira spent?

```
SELECT 
	category,
	SUM(revenue)/NULLIF(SUM(mark_spent), 0) AS revenue_per_naira
FROM marketing
GROUP BY category
ORDER BY revenue_per_naira DESC;
```

### 10 Which campaigns had high spending but low returns (possible underperformers)?

```
SELECT 
	campaign_name,
	SUM(mark_spent) AS total_spent,
	SUM(revenue) AS total_revenue
FROM marketing
GROUP BY campaign_name
HAVING SUM(mark_spent) > SUM(revenue)
ORDER BY total_spent DESC;
```

## Author - Boluwatife Badejoko (Dante-74)

This project is part of my portfolio, showcasing the SQL skills essential for data analyst roles. If you have any questions, feedback, or would like to collaborate, feel free to get in touch!
