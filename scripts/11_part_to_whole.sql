/*
===============================================================================
Part-to-Whole Analysis
===============================================================================
Purpose:
    - To compare performance or metrics across dimensions or time periods.
    - To evaluate differences between categories.
    - Useful for A/B testing or regional comparisons.

SQL Functions Used:
    - SUM(), AVG(): Aggregates values for comparison.
    - Window Functions: SUM() OVER() for total calculations.
===============================================================================
*/

WITH category_sales AS (
SELECT
    pr.category,
    SUM(sa.sales_amount) AS total_sales
FROM gold.fact_sales sa
LEFT JOIN gold.dim_products pr
ON sa.product_key = pr.product_key
GROUP BY pr.category)

SELECT
    category,
    total_sales,
    SUM(total_sales) OVER() AS overall_sales,
    CONCAT(ROUND((CAST(total_sales AS float) / SUM(total_sales) OVER()) *100,2),'%') as sales_ratio
FROM
    category_sales
ORDER BY
    total_sales DESC;