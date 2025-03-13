/*
===============================================================================
Change Over Time Analysis
===============================================================================
Purpose:
    - To track trends, growth, and changes in key metrics over time.
    - For time-series analysis and identifying seasonality.
    - To measure growth or decline over specific periods.

SQL Functions Used:
    - Date Functions: YEAR(), MONTH(), DATETRUNC()
    - Aggregate Functions: SUM()
===============================================================================
*/

SELECT DATETRUNC(MONTH,order_date) as month, SUM(sales_amount) as total_sales
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY DATETRUNC(MONTH,order_date)
ORDER BY 1;


SELECT YEAR(order_date) as year, MONTH(order_date) as month, SUM(sales_amount) as total_sales
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY 1,2;
