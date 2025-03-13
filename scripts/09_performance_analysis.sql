/*
===============================================================================
Performance Analysis (Year-over-Year, Month-over-Month)
===============================================================================
Purpose:
    - To measure the performance of products, customers, or regions over time.
    - For benchmarking and identifying high-performing entities.
    - To track yearly trends and growth.

SQL Functions Used:
    - LAG(): Accesses data from previous rows.
    - AVG() OVER(): Computes average values within partitions.
    - CASE: Defines conditional logic for trend analysis.
===============================================================================
*/

WITH yearly_product_sales AS
(
SELECT
    YEAR(sa.order_date) as order_year,
    pr.product_name,
    SUM(sa.sales_amount) as current_sales
FROM 
    gold.fact_sales sa
    LEFT JOIN gold.dim_products pr
    ON        sa.product_key = pr.product_key
WHERE
    sa.order_date is not null
GROUP BY
    YEAR(sa.order_date),
    pr.product_name
)
SELECT
    order_year,
    product_name,
    current_sales,
    LAG(current_sales) OVER (PARTITION BY product_name ORDER BY order_year) as previous_sales,
    current_sales - LAG(current_sales) OVER (PARTITION BY product_name ORDER BY order_year) as sales_change,
    CASE
        WHEN current_sales - LAG(current_sales) OVER (PARTITION BY product_name ORDER BY order_year) > 0 THEN 'Increase'
        WHEN current_sales - LAG(current_sales) OVER (PARTITION BY product_name ORDER BY order_year) < 0 THEN 'Decrease'
        ELSE 'No Change'
    END AS sales_change_type,
    AVG(current_sales) OVER (PARTITION BY product_name) avg_sales,
    current_sales - AVG(current_sales) OVER (PARTITION BY product_name) as avg_diff,
    CASE
        WHEN current_sales - AVG(current_sales) OVER (PARTITION BY product_name) > 0 THEN 'Above Average'
        WHEN current_sales - AVG(current_sales) OVER (PARTITION BY product_name) < 0 THEN 'Below Average'
        ELSE 'Average'
    END AS avg_change
FROM
yearly_product_sales;
