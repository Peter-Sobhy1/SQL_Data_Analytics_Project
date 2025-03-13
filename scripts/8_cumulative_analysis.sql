/*
===============================================================================
Cumulative Analysis
===============================================================================
Purpose:
    - To calculate running totals or moving averages for key metrics.
    - To track performance over time cumulatively.
    - Useful for growth analysis or identifying long-term trends.

SQL Functions Used:
    - Window Functions: SUM() OVER(), AVG() OVER()
===============================================================================
*/

WITH t AS(
SELECT
    YEAR(order_date) AS year,
    SUM(sales_amount) AS total_sales,
    AVG(price) AS avg_price
FROM
    gold.fact_sales
WHERE
    order_date IS NOT NULL
GROUP BY
    YEAR(order_date)
)

SELECT
    YEAR,
    total_sales,
    SUM(total_sales) OVER(ORDER BY year) AS running_total,
    AVG(avg_price) OVER(ORDER BY year) AS moving_avg_price
FROM
    t;