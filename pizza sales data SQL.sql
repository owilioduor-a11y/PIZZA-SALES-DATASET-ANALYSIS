--THE DATASET OVERVIEW IN SQL
SELECT* FROM pizza_sales_dataset
LIMIT 10

--HERE ARE BUSINESS QUESTIONS AND QUERY TO ANSWER THEM:

--Q1. Total Revenue:(calculation of total revenue)
SELECT ROUND(SUM(total_price)::numeric,2) AS Total_Revenue 
FROM pizza_sales_dataset;


--Q2.Average Order Value

SELECT ROUND((SUM(total_price) / COUNT(DISTINCT order_id))::numeric,2) 
AS Avg_order_Value 
FROM pizza_sales_dataset


--Q3. Total Pizzas Sold(total amount of pizzas sold)

SELECT SUM(quantity) AS Total_pizza_sold 
FROM pizza_sales_dataset

--Q4. Total Orders

SELECT COUNT(DISTINCT order_id) AS Total_Orders 
FROM pizza_sales_dataset


--Q5. Average Pizzas Per Order

SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS Avg_Pizzas_per_order
FROM pizza_sales_dataset


--Q6. Daily Trend for Total Orders

SELECT 
    TO_CHAR(order_date, 'Day') AS order_day,
    COUNT(DISTINCT order_id) AS total_orders 
FROM pizza_sales_dataset
GROUP BY TO_CHAR(order_date, 'Day'), EXTRACT(DOW FROM order_date)
ORDER BY EXTRACT(DOW FROM order_date);


--Q7. Monthly Trend for Orders(total order per months)

SELECT 
    TO_CHAR(order_date, 'Month') AS month_name,
    COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales_dataset
GROUP BY month_name, EXTRACT(MONTH FROM order_date)
ORDER BY EXTRACT(MONTH FROM order_date);

--Q8.Percentage Sales by Pizza Category

SELECT 
    pizza_category, 
    CAST(SUM(total_price) AS DECIMAL(10,2)) AS total_revenue,
    CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales_dataset) AS DECIMAL(10,2)) AS percentage
FROM pizza_sales_dataset
GROUP BY pizza_category;

--Q9.Percentage Sales by Pizza Size

SELECT 
    pizza_category, 
    CAST(SUM(total_price) AS DECIMAL(10,2)) AS total_revenue,
    CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales_dataset) AS DECIMAL(10,2)) AS percentage
FROM pizza_sales_dataset
GROUP BY pizza_category;

--Q10.Amount of pizza solder by pizza category

SELECT 
    pizza_category, 
    SUM(quantity) AS total_quantity_sold
FROM pizza_sales_dataset
WHERE EXTRACT(MONTH FROM order_date) = 2
GROUP BY pizza_category
ORDER BY total_quantity_sold DESC;

--11. First five pizzas with highest Revenue

SELECT 
    pizza_name, 
    CAST(SUM(total_price) AS DECIMAL(10,2)) AS total_revenue
FROM pizza_sales_dataset
GROUP BY pizza_name
ORDER BY total_revenue DESC
LIMIT 5;

--OR use this to handle any ties if possible

SELECT pizza_name, SUM(total_price) as total_revenue
FROM pizza_sales_dataset
GROUP BY pizza_name
ORDER BY total_revenue DESC
FETCH FIRST 5 ROWS WITH TIES;

--12. Bottom 5 Pizzas by Revenue

SELECT 
    pizza_name, 
    CAST(SUM(total_price) AS DECIMAL(10,2)) AS total_revenue
FROM pizza_sales_dataset
GROUP BY pizza_name
ORDER BY total_revenue ASC
LIMIT 5;

--13. Top 5 Pizzas by Quantity

SELECT 
    pizza_name, 
    SUM(quantity) AS total_pizza_sold
FROM pizza_sales_dataset
GROUP BY pizza_name
ORDER BY total_pizza_sold DESC
LIMIT 5;

--14.Bottom 5 Pizzas by Quantity

SELECT pizza_name, 
    SUM(quantity) AS total_pizza_sold
FROM pizza_sales_dataset
GROUP BY pizza_name
ORDER BY total_pizza_sold ASC
LIMIT 5;

--15. Top 5 Pizzas by Total Orders

SELECT 
    pizza_name, 
    COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales_dataset
GROUP BY pizza_name
ORDER BY total_orders DESC
LIMIT 5;







--L. Borrom 5 Pizzas by Total Orders
SELECT 
    pizza_name, 
    COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales_dataset
GROUP BY pizza_name
ORDER BY total_orders ASC
LIMIT 5;






