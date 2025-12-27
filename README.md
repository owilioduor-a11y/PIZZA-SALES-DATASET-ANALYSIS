# PIZZA-SALES-DATASET-ANALYSIS
End to end project : using python(pandas, numpy, matplotlib,seaborn) for data processing and visualizations, and SQL for statistical analysis

📊 Pizza Sales Analysis: End-to-End Data Pipeline
This project demonstrates a comprehensive data analysis workflow, transforming raw pizza sales data into business intelligence. It utilizes Python for automated data cleaning and visualization, and PostgreSQL for deep-dive statistical querying.
 Tech Stack
Data Processing: Python (Pandas, NumPy)
Visualizations: Matplotlib, Seaborn
Statistical Analysis: PostgreSQL
Database Management: pgAdmin 4 / SQL Server

 Project Workflow
1. Data Cleaning & Preprocessing (Python)
The project begins with a Python-based ETL (Extract, Transform, Load) process to ensure data integrity.
Standardization: Formatting date/time columns and cleaning categorical strings.
Feature Engineering: Calculating total revenue per order and identifying peak hours.
Outlier Detection: Using NumPy to identify and handle statistical anomalies in order quantities.

2. Statistical Analysis (SQL)
Using a series of optimized PostgreSQL queries, we extract high-level KPIs and trends.
Time Intelligence: Analyzing daily and monthly sales trends (using TO_CHAR and EXTRACT).
Product Performance: Identifying the Top/Bottom 5 pizzas by revenue, quantity, and order frequency.
Market Share: Calculating the percentage of sales by pizza category and size using SQL Window Functions (OVER()).

3. Data Visualization (Seaborn/Matplotlib)
The cleaned data is visualized to reveal patterns that are difficult to spot in raw tables.
Trend Lines: Visualizing sales spikes during specific months or days of the week.
Distribution Plots: Analyzing the most popular pizza sizes and categories.
Heatmaps: Identifying peak ordering times to assist in staff scheduling.

📈 Key Insights
Peak Periods: Identified specific days of the week and hours where order volume exceeds capacity.
Menu Optimization: Discovered "low-frequency" pizzas that contribute less than 2% of total revenue, suggesting a menu consolidation.
Revenue Drivers: Quantified the impact of "Large" vs. "Classic" pizza sizes on the total bottom line.

 How to Use
SQL Scripts: Run the .sql files in your PostgreSQL environment to generate the statistical reports.
Jupyter Notebook: Open the .ipynb file to see the step-by-step Python cleaning and visualization process.



Dataset: The raw pizza_sales.csv is included for reproduction.
