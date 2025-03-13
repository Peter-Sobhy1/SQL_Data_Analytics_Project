/*
===============================================================================
Magnitude Analysis
===============================================================================
Purpose:
    - To quantify data and group results by specific dimensions.
    - For understanding data distribution across categories.

SQL Functions Used:
    - Aggregate Functions: SUM(), COUNT(), AVG()
    - GROUP BY, ORDER BY
    - CONCAT
===============================================================================
*/

--find total customers by country
SELECT country, COUNT(customer_key) as total_customers
FROM gold.dim_customers
group by country
order by total_customers DESC;


--find total customers by gender
SELECT gender, COUNT(customer_key) as total_customers
FROM gold.dim_customers
GROUP BY gender
ORDER BY total_customers DESC;


--find total products by category
SELECT category, COUNT(product_key) as total_products
FROM gold.dim_products
GROUP BY category
ORDER BY total_products DESC;


--find the average price of products by category
SELECT category, AVG(cost) as average_price
FROM gold.dim_products
GROUP BY category
ORDER BY average_price DESC;


--what is the total revenue by category
SELECT pr.category, SUM(sa.sales_amount) as total_revenue
FROM gold.dim_products pr
LEFT JOIN gold.fact_sales sa
ON pr.product_key = sa.product_key
GROUP BY pr.category
HAVING pr.category IS NOT NULL
ORDER BY total_revenue DESC;


--find the total revenue by each customer
SELECT cu.customer_key, CONCAT(cu.first_name,' ',cu.last_name) as customer_name, SUM(sa.sales_amount) as total_revenue
FROM gold.fact_sales sa
LEFT JOIN gold.dim_customers cu
ON sa.customer_key = cu.customer_key
GROUP BY cu.customer_key,CONCAT(cu.first_name,' ',cu.last_name)
ORDER BY total_revenue DESC;


--what is the distribution of items sold across countries
SELECT cu.country,SUM(sa.quantity) as total_items_sold
FROM gold.fact_sales sa
LEFT JOIN gold.dim_customers cu
ON sa.customer_key = cu.customer_key
GROUP BY cu.country
ORDER BY total_items_sold DESC;
