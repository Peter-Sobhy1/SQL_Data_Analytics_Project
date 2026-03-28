# SQL Data Analytics Project

A comprehensive collection of **13 T-SQL scripts** covering the full spectrum of analytical workflows — from raw database exploration to advanced KPI reporting. Built on a sales data warehouse using **SQL Server**, **SSMS**, and **VS Code**.

---

## 📁 Project Structure

```
SQL_Data_Analytics_Project/
├── datasets/          # Source data used across all scripts
└── scripts/
    ├── 1_database_exploration.sql
    ├── 2_dimensions_exploration.sql
    ├── 3_date_range_exploration.sql
    ├── 4_measures_exploration.sql
    ├── 5_magnitude_analysis.sql
    ├── 6_ranking_analysis.sql
    ├── 7_change_over_time_analysis.sql
    ├── 8_cumulative_analysis.sql
    ├── 9_performance_analysis.sql
    ├── 10_data_segmentation.sql
    ├── 11_part_to_whole.sql
    ├── 12_report_customers.sql
    └── 13_report_products.sql
```

---

## 🗄️ Database Schema

The project uses a **Gold Layer** star schema from a sales data warehouse, consisting of:

| Table | Type | Description |
|---|---|---|
| `gold.fact_sales` | Fact | Orders, revenue, quantity, dates |
| `gold.dim_customers` | Dimension | Customer demographics and geography |
| `gold.dim_products` | Dimension | Product catalog with categories and cost |

---

## 📊 Scripts Overview

### 🔍 Exploration Phase

**1. Database Exploration** — Queries `INFORMATION_SCHEMA` to inventory all tables and inspect column metadata. Entry point for any unfamiliar database.

**2. Dimensions Exploration** — Audits dimension tables using `DISTINCT` to identify unique values across countries, categories, subcategories, and product names.

**3. Date Range Exploration** — Uses `MIN()`, `MAX()`, and `DATEDIFF()` to establish temporal boundaries of the data — first/last order dates and customer age range.

**4. Measures Exploration** — Calculates all core business metrics in one unified report: total sales, total quantity, average price, total orders, total products, and total customers via `UNION ALL`.

---

### 📈 Analysis Phase

**5. Magnitude Analysis** — Groups and aggregates data by key dimensions (country, gender, category) using `GROUP BY` and `JOIN` to reveal distribution patterns across customers and revenue.

**6. Ranking Analysis** — Ranks top and bottom performers using `TOP N` and `ROW_NUMBER() OVER(PARTITION BY ...)` to surface the best and worst products, countries, and subcategories by revenue.

**7. Change Over Time Analysis** — Tracks monthly and yearly revenue trends using `DATETRUNC()`, `YEAR()`, and `MONTH()` for time-series analysis and seasonality identification.

**8. Cumulative Analysis** — Computes running totals and moving averages using `SUM() OVER()` and `AVG() OVER()` window functions to track long-term growth trajectories.

**9. Performance Analysis** — Year-over-year product performance using `LAG()` to compare current vs. prior year sales, classify trends (Increase / Decrease / No Change), and benchmark against product averages.

**10. Data Segmentation** — Segments products into cost tiers (Economy / Regular / Intermediate / High) and customers into behavioral groups (VIP / Regular / New) using `CASE` logic based on spend and lifespan.

**11. Part-to-Whole Analysis** — Calculates each category's percentage contribution to total revenue using `SUM() OVER()` as a window function denominator, returning clean ratio outputs.

---

### 📋 Reporting Phase

**12. Customer Report (`gold.report_customers`)** — A reusable SQL View consolidating customer-level KPIs:
- Age & age group segmentation (20s, 30s, 40s, 50+)
- Customer segment (VIP / Regular / New)
- Total orders, sales, quantity, lifespan
- Recency in months, Average Order Value (AOV), Average Monthly Spend

**13. Product Report (`gold.report_products`)** — A reusable SQL View consolidating product-level KPIs:
- Revenue-based segmentation (High-Performer / Mid-Range / Low-Performer)
- Total orders, sales, quantity, unique customers, lifespan
- Recency in months, Average Order Revenue (AOR), Average Monthly Revenue

---

## 🛠️ SQL Skills Demonstrated

| Skill | Scripts |
|---|---|
| Aggregation (`SUM`, `COUNT`, `AVG`) | 4, 5, 7, 8 |
| Window Functions (`SUM OVER`, `AVG OVER`, `LAG`, `ROW_NUMBER`) | 6, 8, 9, 11 |
| CTEs (`WITH` clause) | 6, 8, 9, 10, 11 |
| `CASE` conditional logic | 9, 10, 12, 13 |
| `JOIN` (LEFT JOIN across fact/dim tables) | 5, 6, 7, 9, 11, 12, 13 |
| Date Functions (`DATEDIFF`, `DATETRUNC`, `YEAR`, `MONTH`, `GETDATE`) | 3, 7, 8, 12, 13 |
| `INFORMATION_SCHEMA` metadata queries | 1 |
| SQL Views (`CREATE VIEW`) | 12, 13 |
| `UNION ALL` for consolidated reporting | 4 |
| Subqueries & derived tables | 10 |

---

## ⚙️ Tools & Environment

- **Database:** Microsoft SQL Server
- **Query Tools:** SSMS (SQL Server Management Studio), VS Code
- **Language:** T-SQL (Transact-SQL)
- **Schema Layer:** Gold (curated, analytics-ready)

---

## 🚀 How to Use

1. Clone the repository:
   ```bash
   git clone https://github.com/Peter-Sobhy1/SQL_Data_Analytics_Project.git
   ```
2. Restore or connect to a SQL Server instance with the `gold` schema loaded (see `/datasets`).
3. Open scripts in SSMS or VS Code with the SQL Server extension.
4. Run scripts in order (1 → 13) for a structured analytical walkthrough, or run individual scripts independently for targeted analysis.

---

## 👤 Author

**Peter Sobhy**
[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/peter-sobhy/)
[![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Peter-Sobhy1)
