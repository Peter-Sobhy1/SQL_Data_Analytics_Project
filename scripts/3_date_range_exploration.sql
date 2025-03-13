/*
===============================================================================
Date Range Exploration 
===============================================================================
Purpose:
    - To determine the temporal boundaries of key data points.
    - To understand the range of historical data.

SQL Functions Used:
    - MIN(), MAX(), DATEDIFF()
===============================================================================
*/


--find the date of the first and last order and the number of months between them
SELECT MIN(order_date) AS min_order_date,
       MAX(order_date) AS max_order_date,
       DATEDIFF(month, MIN(order_date), MAX(order_date)) AS order_range_months  
FROM gold.fact_sales;


--find the youngest and the oldest customer
SELECT MIN(birthdate) AS oldest_customer,
       DATEDIFF(YEAR,MIN(birthdate),GETDATE()) AS oldest_age,
       MAX(birthdate) AS youngest_customer,
       DATEDIFF(YEAR,MAX(birthdate),GETDATE()) AS youngest_age
FROM gold.dim_customers;