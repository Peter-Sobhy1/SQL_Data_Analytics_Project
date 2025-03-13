
/*
===============================================================================
Dimensions Exploration
===============================================================================
Purpose:
    - To explore the structure of dimension tables.
	
SQL Functions Used:
    - DISTINCT
    - ORDER BY
===============================================================================
*/

SELECT DISTINCT country
FROM gold.dim_customers


SELECT DISTINCT category,subcategory,product_name
FROM gold.dim_products
ORDER BY 1,2,3
