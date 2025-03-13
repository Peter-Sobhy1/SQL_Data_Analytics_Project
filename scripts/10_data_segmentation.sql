/*
Segment products into cost ranges and 
count how many products fall into each segment
*/

WITH product_segment AS(
SELECT
    product_key,
    product_name,
    cost,
    CASE
        WHEN cost < 100 THEN 'economy'
        WHEN cost BETWEEN 100 AND 500 THEN 'regular'
        WHEN cost BETWEEN 500 AND 1000 THEN 'intermediate'
        ELSE 'high'
        END AS cost_range
FROM
gold.dim_products)

SELECT
    cost_range,
    COUNT(product_key) AS total_products
FROM product_segment
GROUP BY
    cost_range
ORDER BY 2 DESC;



/*Group customers into three segments based on their spending behavior:
	- VIP: Customers with at least 12 months of history and spending more than €5,000.
	- Regular: Customers with at least 12 months of history but spending €5,000 or less.
	- New: Customers with a lifespan less than 12 months.
And find the total number of customers by each group
*/
WITH customer_spending AS
(
    SELECT
        cu.customer_key,
        CONCAT(cu.first_name,' ',cu.last_name) AS customer_name,
        SUM(sa.sales_amount) total_spending,
        DATEDIFF(MONTH,MIN(sa.order_date),MAX(sa.order_date)) life_span,
        CASE
            WHEN DATEDIFF(MONTH,MIN(sa.order_date),MAX(sa.order_date)) >= 12 AND SUM(sa.sales_amount) > 5000 THEN 'VIP'
            WHEN DATEDIFF(MONTH,MIN(sa.order_date),MAX(sa.order_date)) >= 12 AND SUM(sa.sales_amount) <= 5000 THEN 'Regular'
            ELSE 'NEW'
            END AS customer_segment
    FROM 
        gold.fact_sales sa
        LEFT JOIN gold.dim_customers cu
        ON sa.customer_key = cu.customer_key
    GROUP BY
        cu.customer_key,
        CONCAT(cu.first_name,' ',cu.last_name)
)
SELECT
   customer_segment,
   COUNT(customer_key) total_customers
FROM
    customer_spending
GROUP BY
    customer_segment;