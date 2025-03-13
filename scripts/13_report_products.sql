/*
-- ===============================================================================
-- Create Report: gold.report_products
-- ===============================================================================
Purpose:
    - This report consolidates key product metrics and behaviors.

Highlights:
    1. Gathers essential fields such as product name, category, subcategory, and cost.
    2. Segments products by revenue to identify High-Performers, Mid-Range, or Low-Performers.
    3. Aggregates product-level metrics:
       - total orders
       - total sales
       - total quantity sold
       - total customers (unique)
       - lifespan (in months)
    4. Calculates valuable KPIs:
       - recency (months since last sale)
       - average order revenue (AOR)
       - average monthly revenue
*/

IF OBJECT_ID('gold.report_products', 'V') IS NOT NULL
    DROP VIEW gold.report_products;
GO

CREATE VIEW gold.report_products AS
SELECT
    pr.product_key,
    pr.product_name,
    pr.category,
    pr.subcategory,
    cost,
    MAX(order_date) AS last_order_date,
    DATEDIFF(MONTH,MAX(order_date),GETDATE()) AS recency_in_months,
    CASE
        WHEN SUM(sa.sales_amount) > 50000 THEN 'High-Perfomer'
        WHEN SUM(sa.sales_amount) >= 10000 THEN 'Mid-Range'
        ELSE 'Low-Perfomer'
        END AS product_segment,
    DATEDIFF(MONTH,MIN(order_date),MAX(order_date)) AS lifespan,
    COUNT(sa.order_number) AS total_orders,
    SUM(sa.sales_amount) AS total_sales,
    SUM(sa.quantity) AS total_quantity,
    COUNT(sa.customer_key) AS total_customers,
    -- Average Order Revenue (AOR)
    CASE
        WHEN COUNT(sa.order_number) = 0 THEN '0'
        ELSE SUM(sa.sales_amount) / COUNT(sa.order_number)
        END AS avg_order_revenue,

    -- Average Monthly Revenue  
    CASE
        WHEN DATEDIFF(MONTH,MIN(order_date),MAX(order_date)) = 0 THEN SUM(sa.sales_amount)
        ELSE SUM(sa.sales_amount) / DATEDIFF(MONTH,MIN(order_date),MAX(order_date))
        END AS avg_monthly_revenue
FROM
    gold.fact_sales sa
    LEFT JOIN gold.dim_products pr
    ON sa.product_key = pr.product_key
WHERE
    order_date IS NOT NULL
GROUP BY
    pr.product_key,
    pr.product_name,
    pr.category,
    pr.subcategory,
    cost;