/*
===============================================================================
Customer Report
===============================================================================
Purpose:
    - This report consolidates key customer metrics and behaviors

Highlights:
    1. Gathers essential fields such as names, ages, and transaction details.
	2. Segments customers into categories (VIP, Regular, New) and age groups.
    3. Aggregates customer-level metrics:
	   - total orders
	   - total sales
	   - total quantity purchased
	   - total products
	   - lifespan (in months)
    4. Calculates valuable KPIs:
	    - recency (months since last order)
		- average order value
		- average monthly spend
*/
-- =============================================================================
-- Create Report: gold.report_customers
-- =============================================================================
IF OBJECT_ID('gold.report_customers', 'V') IS NOT NULL
    DROP VIEW gold.report_customers;
GO

CREATE VIEW gold.report_customers
AS
SELECT
    sa.customer_key,
    cu.customer_number,
    CONCAT(cu.first_name,' ',cu.last_name) AS customer_name,
    DATEDIFF(YEAR,cu.birthdate,GETDATE()) as age,

    CASE
        WHEN DATEDIFF(YEAR,cu.birthdate,GETDATE()) BETWEEN 20 AND 29 THEN '20-29'
        WHEN DATEDIFF(YEAR,cu.birthdate,GETDATE()) BETWEEN 30 AND 39 THEN '30-39'
        WHEN DATEDIFF(YEAR,cu.birthdate,GETDATE()) BETWEEN 40 AND 49 THEN '40-49'
        ELSE '50 and above'
        END AS age_group,

    CASE
        WHEN DATEDIFF(MONTH,MIN(order_date),MAX(order_date)) >= 12 AND SUM(sa.sales_amount) > 5000 THEN 'VIP'
        WHEN DATEDIFF(MONTH,MIN(order_date),MAX(order_date)) >= 12 AND SUM(sa.sales_amount) <= 5000 THEN 'Regular'
        ELSE 'NEW'
        END AS customer_segment,

    MAX(order_date) AS last_order_date,
    DATEDIFF(MONTH,MAX(order_date),GETDATE()) AS recency_in_months,
    COUNT(sa.order_number) AS total_orders,
    SUM(sa.sales_amount) AS total_sales,
    SUM(sa.quantity) AS total_quantity,
    DATEDIFF(MONTH,MIN(order_date),MAX(order_date)) AS lifespan,

    -- Compuate average order value (AVO)
    CASE
        WHEN SUM(sa.sales_amount) = 0 THEN '0'
        ELSE SUM(sa.sales_amount) / COUNT(sa.order_number)
        END AS avg_order_value,

    -- Compuate average monthly spend    
    CASE
        WHEN DATEDIFF(MONTH,MIN(order_date),MAX(order_date)) = 0 THEN SUM(sa.sales_amount)
        ELSE SUM(sa.sales_amount) / DATEDIFF(MONTH,MIN(order_date),MAX(order_date))
        END AS avg_monthly_spend
FROM
    gold.fact_sales sa
    LEFT JOIN gold.dim_customers cu
    ON sa.customer_key = cu.customer_key
WHERE
    order_date IS NOT NULL
GROUP BY
    sa.customer_key,
    cu.customer_number,
    CONCAT(cu.first_name,' ',cu.last_name),
    DATEDIFF(YEAR,cu.birthdate,GETDATE()),
    CASE
    WHEN DATEDIFF(YEAR,cu.birthdate,GETDATE()) BETWEEN 20 AND 29 THEN '20-29'
    WHEN DATEDIFF(YEAR,cu.birthdate,GETDATE()) BETWEEN 30 AND 39 THEN '30-39'
    WHEN DATEDIFF(YEAR,cu.birthdate,GETDATE()) BETWEEN 40 AND 49 THEN '40-49'
    ELSE '50 and above' END;