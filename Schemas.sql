--Schemas of marketing

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
