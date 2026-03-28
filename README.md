# SQL Data Analytics Project

## 🚀 Overview
This project is a collection of **13 T-SQL scripts** that demonstrate an end-to-end **SQL-based data analytics workflow** built on a sales data warehouse. It covers the full analytical lifecycle — from raw data exploration to advanced reporting and business insights.

Using **T-SQL**, I analyzed transactional sales data to uncover trends in revenue, customer behavior, and product performance.

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

## 📊 Dataset & Scale
- **$29.4M+ total revenue**
- **27,659 orders**
- **18,484 customers**
- **295 products**
- Data spanning **37 months (Dec 2010 – Jan 2014)**

---

## 🧠 Key Objectives
- Explore and understand the underlying data structure  
- Build core business metrics and KPIs  
- Perform deep-dive analysis across multiple dimensions  
- Generate reusable reporting datasets for stakeholders  

---

## 🔍 Analytical Workflow

### 1. Data Exploration
- Analyzed database structure using `INFORMATION_SCHEMA`
- Explored key dimensions (country, category, product hierarchy)
- Identified data quality issues (e.g., missing categories, unrealistic customer ages)

---

### 2. Core Metrics & Aggregation
- Calculated KPIs including total revenue, orders, customers, and average price
- Aggregated data across dimensions such as country, gender, and product category

---

### 3. Advanced Analysis

#### 📈 Time-Series Analysis
- Tracked monthly and yearly revenue trends
- Identified growth patterns and seasonality

#### 🏆 Ranking Analysis
- Identified top and bottom-performing products and regions by revenue

#### 🔄 Performance Analysis
- Used `LAG()` to compare year-over-year product performance
- Classified trends as Increase, Decrease, or No Change

#### 📊 Cumulative Analysis
- Calculated running totals and moving averages using window functions

#### 🧩 Segmentation
- Segmented:
  - Customers → VIP, Regular, New  
  - Products → Economy, Regular, Intermediate, High  
- Enabled targeted analysis of behavior and value

#### 📉 Part-to-Whole Analysis
- Measured each category’s contribution to total revenue
- Found **Bikes generate ~96% of total sales**

---

## 📋 Reporting Layer

### 👤 Customer Report
Built a reusable SQL view providing:
- Customer segmentation (VIP / Regular / New)
- Recency, lifespan, total orders, total spend
- Average order value & monthly spend

### 📦 Product Report
Built a reusable SQL view providing:
- Product performance segmentation
- Revenue, orders, customers, and lifecycle metrics
- High-performing products driving overall revenue

---

## 🛠️ SQL Techniques Used
- Aggregations (`SUM`, `COUNT`, `AVG`)
- Window functions (`LAG`, `SUM OVER`, `AVG OVER`)
- CTEs (`WITH`)
- Joins across fact & dimension tables
- CASE statements for segmentation
- Time-based analysis (`DATEDIFF`, `YEAR`, `MONTH`)
- Ranking functions (`ROW_NUMBER`)
- View creation for reporting

---

## 💡 Key Insights
- Revenue is heavily concentrated in **Bikes (~96%)**, indicating strong product dependency  
- The **United States and Australia** are the top revenue-generating markets  
- A small group of products contributes disproportionately to total revenue  
- Customer segmentation reveals a clear distinction between **high-value (VIP)** and low-engagement customers  

---

## ⚙️ Tools & Technologies
- SQL Server  
- SSMS (SQL Server Management Studio)  
- T-SQL  

---

## 🎯 Conclusion
This project showcases strong proficiency in **SQL for data analysis**, including advanced querying, analytical thinking, and transforming raw data into actionable insights.

It reflects real-world analytics workflows used in business environments — from exploration to reporting.

---

## 👤 Author
**Peter Sobhy**
- LinkedIn: https://www.linkedin.com/in/peter-sobhy/
- GitHub: https://github.com/Peter-Sobhy1
---

## 👤 Author

**Peter Sobhy**
[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/peter-sobhy/)
[![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Peter-Sobhy1)
