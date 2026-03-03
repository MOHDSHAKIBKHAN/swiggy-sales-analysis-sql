# 🍽 Swiggy Sales Analysis (SQL Project)
## 📖 Project Overview

This project analyzes Swiggy sales data using MySQL.
The objective is to derive business insights such as:

- Total Revenue
- Top Performing Cities
- Peak Order Time
- Customer Behavior
- Sales Trends
## 🛠 Tools & Technologies

- MySQL
- SQL (Joins, Aggregations, Window Functions)
- Git & GitHub
- Excel (Data Cleaning)
## 🗄 Database Schema

Fact Table:
- swiggy_clean

Dimension Tables:
- dim_date
- dim_city
- dim_restaurant
## 📊 Key Insights

- Weekend sales are 22% higher than weekdays.
- Top 3 cities contribute 60% of revenue.
- Evening (7PM–10PM) is peak order time.
- Repeat customers generate majority revenue.
## 💻 Sample Query

```sql
SELECT city, SUM(revenue) AS total_revenue
FROM swiggy_clean
GROUP BY city
ORDER BY total_revenue DESC;


---

## 📌 7️⃣ Project Structure

```markdown
## 📁 Project Structure

Swiggy-Sales-Analysis-SQL/
│
├── dataset/
├── sql_queries/
├── screenshots/
└── README.md

## 👤 Author

Mohd Shakib  
Aspiring Data Analyst  
