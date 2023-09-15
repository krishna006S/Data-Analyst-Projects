				--Show all data--
select * from pizza_sales


				--TOTAL_REVENUE--
SELECT CAST(SUM(total_price) AS DECIMAL(10, 3)) AS TOTAL_REVENUE FROM pizza_sales


				--AVG_ORDER_VALUE--
SELECT CAST(SUM(total_price)/COUNT(DISTINCT order_id) AS DECIMAL(10, 3)) AS AVG_ORDER_VALUE FROM pizza_sales

				--TOTAL_PIZZAS_SOLD--
SELECT SUM(quantity) AS TOTAL_PIZZAS_SOLD FROM pizza_sales


				--TOTAL_ORDERS--
SELECT COUNT(DISTINCT order_id) AS TOTAL_ORDERS FROM pizza_sales


				--AVG_PIZZAS_PER_ORDER--
SELECT (CAST( CAST( SUM( quantity ) AS DECIMAL (10, 3)) / 
CAST( COUNT( DISTINCT order_id ) AS DECIMAL (10, 3)) AS DECIMAL (10, 3))) AS AVG_PIZZAS_PER_ORDER 
FROM pizza_sales

				--Day_Trends--
SELECT DATENAME(DW, order_date) AS ORDER_DAY, COUNT(DISTINCT order_id) AS TOTAL_ORDERS 
FROM pizza_sales 
--WHERE DAY(order_date) = 1
GROUP BY DATENAME(DW, order_date)
ORDER BY ORDER_DAY


				--Hour_Trends--
SELECT DATEPART(HOUR, order_time) AS ORDER_HOUR, COUNT(DISTINCT order_id) AS TOTAL_ORDERS 
FROM pizza_sales 
GROUP BY DATEPART(HOUR, order_time) 
ORDER BY ORDER_HOUR


				--Percentage Of Pizza Sales By category--
SELECT pizza_category, SUM(quantity) AS TOTAL_SOLD, 
CAST(SUM(quantity)*100/(SELECT CAST(SUM(quantity) AS DECIMAL (10, 2)) FROM pizza_sales) AS DECIMAL (10, 2)) AS PCT 
FROM pizza_sales 
GROUP BY pizza_category
ORDER BY TOTAL_SOLD DESC


				--Percentage Of Pizza Sales By Size--
SELECT pizza_size, SUM(quantity) AS TOTAL_SOLD, 
CAST(SUM(quantity)*100/(SELECT CAST(SUM(quantity) AS DECIMAL (10, 2)) FROM pizza_sales) AS DECIMAL (10, 2)) AS PCT 
FROM pizza_sales 
GROUP BY pizza_size
ORDER BY PCT DESC


				--Number Of Pizza's Sold By it's category--
SELECT pizza_category, SUM(quantity) AS TOTAL_SOLD
FROM pizza_sales 
GROUP BY pizza_category
ORDER BY TOTAL_SOLD DESC


				--Top 5 Best Selling Pizza's--
SELECT TOP 5 pizza_name, SUM(quantity) AS TOTAL_SOLD FROM pizza_sales
GROUP BY pizza_name
ORDER BY TOTAL_SOLD DESC


				--Top 5 worse Selling Pizza's--
SELECT TOP 5 pizza_name, SUM(quantity) AS TOTAL_SOLD FROM pizza_sales
GROUP BY pizza_name
ORDER BY TOTAL_SOLD