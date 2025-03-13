/*
===============================================================================
Ranking Analysis
===============================================================================
Purpose:
    - To rank items (e.g., products, customers) based on performance or other metrics.
    - To identify top performers or laggards.

SQL Functions Used:
    - Window Ranking Functions: ROW_NUMBER(), TOP
    - Clauses: GROUP BY, ORDER BY
===============================================================================
*/

--top 3 country by revenue
SELECT top 3 cu.country, SUM(sa.sales_amount) AS total_revenue
FROM gold.fact_sales sa
LEFT JOIN gold.dim_customers cu
ON sa.customer_key = cu.customer_key
GROUP BY cu.country
ORDER BY total_revenue DESC;


--top 5 product by revenue
SELECT top 5 pr.product_name, SUM(sa.sales_amount) AS total_revenue
FROM gold.fact_sales sa
LEFT JOIN gold.dim_products pr
ON sa.product_key = pr.product_key
GROUP BY pr.product_name
order by total_revenue DESC;

--wrost 5 product by revenue
SELECT top 5 pr.product_name, SUM(sa.sales_amount) AS total_revenue
FROM gold.fact_sales sa
LEFT JOIN gold.dim_products pr
ON sa.product_key = pr.product_key
GROUP BY pr.product_name
order by total_revenue;

--top subcategory by revenue in each category

WITH cte AS
    (
    SELECT
        pr.category, pr.subcategory,
        SUM(sa.sales_amount) AS total_revenue,
        ROW_NUMBER() OVER(PARTITION BY pr.category ORDER BY SUM(sa.sales_amount) DESC) AS rank
    FROM
        gold.fact_sales sa
        LEFT JOIN gold.dim_products pr
        ON sa.product_key = pr.product_key
    GROUP BY 
        pr.category,
        pr.subcategory
    )
SELECT
    cte.category,
    cte.subcategory,
    cte.total_revenue
FROM
    cte
WHERE
    cte.rank = 1;
