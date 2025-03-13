/*
===============================================================================
Measures Exploration (Key Metrics)
===============================================================================
Purpose:
    - To calculate aggregated metrics (e.g., totals, averages) for quick insights.
    - To identify overall trends or spot anomalies.

SQL Functions Used:
    - COUNT(), SUM(), AVG()
===============================================================================
*/

--find the total sales
SELECT SUM(sales_amount) AS total_sales
FROM gold.fact_sales

--find how many items were sold
SELECT SUM(quantity) AS total_quantity
FROM gold.fact_sales

--find the average selling price
SELECT AVG(price) AS avg_price
FROM gold.fact_sales

--find the total numbers of orders
SELECT COUNT(DISTINCT order_number) AS total_orders
FROM gold.fact_sales

--find the total number of prducts
SELECT COUNT(DISTINCT product_key ) AS total_products
FROM gold.dim_products


--find the total number of customers
SELECT COUNT(DISTINCT customer_key) AS total_customers
FROM gold.dim_customers

--find total number of customers who made an order
SELECT COUNT(DISTINCT customer_key) AS total_customers
FROM gold.fact_sales


--generate a report that shows all key metrics
SELECT 'Total Sales' AS measure_name, SUM(sales_amount) AS measure_value from gold.fact_sales
UNION ALL
SELECT 'Total Quantity', SUM(quantity) from gold.fact_sales
UNION ALL
SELECT 'Average Price', AVG(price) from gold.fact_sales
UNION ALL
SELECT 'Total Orders', COUNT(DISTINCT order_number) from gold.fact_sales
UNION ALL
SELECT 'Total Products', COUNT(DISTINCT product_key) from gold.dim_products
UNION ALL
SELECT 'Total Customers', COUNT(DISTINCT customer_key) from gold.dim_customers