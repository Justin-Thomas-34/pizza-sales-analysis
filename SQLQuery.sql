-- all rows
SELECT * FROM pizza_sales;

-- Total Revenue
SELECT 
        round(sum(total_price),2) AS total_revenue
FROM 
        pizza_sales;

-- Average Order Value
SELECT 
        round(sum(total_price)/count(distinct(order_id)),2) AS Avg_order_value
FROM 
        pizza_sales;

-- Total Pizzas Sold
SELECT 
        sum(quantity) AS Total_pizza_sold
FROM
        pizza_sales;

-- Total Orders

SELECT
        count(distinct(order_id)) AS Total_orders
FROM 
        pizza_sales;

-- Average Pizzas Per Order

SELECT 
        cast(cast(sum(quantity) AS decimal(10,2))/cast(count(distinct(order_id)) AS decimal(10,2)) AS decimal(10,2)) AS Avg_pizza_per_order
FROM 
        pizza_sales;

-- Hourly Trend for Total Pizzas Sold

SELECT 
        datepart(HOUR, order_time) AS order_hour,
        sum(quantity) AS Total_pizza_sold
FROM 
        pizza_sales
GROUP BY
        datepart(HOUR, order_time)
ORDER BY 
        datepart(HOUR, order_time);  

-- Weekly Trend for Total Orders

SELECT
        datepart(ISO_WEEK,order_date) AS week_number,
        YEAR(order_date) AS order_year,
        count(distinct order_id)  AS Total_orders
FROM
        pizza_sales
GROUP BY
        datepart(ISO_WEEK,order_date),
        YEAR(order_date)
ORDER BY
        datepart(ISO_WEEK,order_date),
        YEAR(order_date);

-- Percentage of Sales by Pizza Category

SELECT
        pizza_category,
        cast(sum(total_price) AS decimal(10,2)) AS total_sales,
        cast(sum(total_price)*100/(SELECT sum(total_price) from pizza_sales)AS decimal(10,2)) AS percentage_of_total_sales
FROM 
        pizza_sales

GROUP BY
        pizza_category;


-- for month of January use WHERE MONTH(order_date) = 1

SELECT
        pizza_category,
        cast(sum(total_price) AS decimal(10,2)) AS total_sales,
        cast(sum(total_price)*100/(SELECT sum(total_price) from pizza_sales WHERE MONTH(order_date) = 1) AS decimal(10,2)) AS percentage_of_total_sales
FROM 
        pizza_sales
WHERE
        MONTH(order_date) = 1
GROUP BY
        pizza_category;

-- for Quarter 1 use WHERE datepart(QUARTER, order_date) = 1 

SELECT
        pizza_category,
        cast(sum(total_price) AS decimal(10,2)) AS total_sales,
        cast(sum(total_price)*100/(SELECT sum(total_price) from pizza_sales WHERE datepart(QUARTER, order_date) = 1 )AS decimal(10,2)) AS percentage_of_total_sales
FROM 
        pizza_sales
WHERE
        datepart(QUARTER, order_date) = 1 
GROUP BY
        pizza_category;


-- Percentage of Sales by Pizza Size

SELECT 
        pizza_size,
        round(sum(total_price),2) AS total_sales,
        round(sum(total_price*100)/(SELECT sum(total_price) from pizza_sales),2) AS percentage_of_total_sales
FROM
        pizza_sales
GROUP BY
        pizza_size
ORDER BY
        percentage_of_total_sales DESC;

-- for month of January use MONTH(order_date) = 1

SELECT 
        pizza_size,
        round(sum(total_price),2) AS total_sales,
        round(sum(total_price*100)/(SELECT sum(total_price) from pizza_sales WHERE MONTH(order_date) = 1),2) AS percentage_of_total_sales
FROM
        pizza_sales
WHERE
        MONTH(order_date) = 1
GROUP BY
        pizza_size
ORDER BY
        percentage_of_total_sales DESC;

-- for Quarter 1 use WHERE datepart(QUARTER, order_date) = 1 

SELECT 
        pizza_size,
        round(sum(total_price),2) AS total_sales,
        round(sum(total_price*100)/(SELECT sum(total_price) from pizza_sales WHERE datepart(QUARTER, order_date) = 1),2) AS percentage_of_total_sales
FROM
        pizza_sales
WHERE
        datepart(QUARTER, order_date) = 1
GROUP BY
        pizza_size
ORDER BY
        percentage_of_total_sales DESC;

-- Total Pizzas Sold by Pizza Category:

SELECT
        pizza_category,
        sum(quantity) AS total_pizzas_sold
FROM
        pizza_sales
GROUP BY
        pizza_category
ORDER BY
        total_pizzas_sold DESC

-- Top 5 Best Sellers by Revenue, Total Quantity, and Total Orders:
-- Top 5 Best Sellers by Revenue

SELECT TOP 5
        pizza_name,
        round(sum(total_price),2) AS total_revenue
       
FROM 
        pizza_sales
GROUP BY
        pizza_name
ORDER BY
        total_revenue DESC
        
        --  ,
        --  
        -- total_quantity DESC,
        -- total_orders DESC

-- Top 5 Best Sellers by Total Quantity

SELECT TOP 5
        pizza_name,
        round(sum(quantity),2) AS total_quantity       
FROM 
        pizza_sales
GROUP BY
        pizza_name
ORDER BY
        total_quantity DESC

-- Top 5 Best Sellers by Total Orders

SELECT TOP 5
        pizza_name,
        count(distinct order_id) AS total_orders       
FROM 
        pizza_sales
GROUP BY
        pizza_name
ORDER BY
        total_orders DESC



-- Bottom 5 Sellers by Revenue, Total Quantity, and Total Orders:
-- Bottom 5 Best Sellers by Revenue

SELECT TOP 5
        pizza_name,
        round(sum(total_price),2) AS total_revenue
       
FROM 
        pizza_sales
GROUP BY
        pizza_name
ORDER BY
        total_revenue

-- Bottom 5 Sellers by Total Quantity

SELECT TOP 5
        pizza_name,
        round(sum(quantity),2) AS total_quantity       
FROM 
        pizza_sales
GROUP BY
        pizza_name
ORDER BY
        total_quantity 

-- Bottom 5 Sellers by Total Orders

SELECT TOP 5
        pizza_name,
        count(distinct order_id) AS total_orders       
FROM 
        pizza_sales
GROUP BY
        pizza_name
ORDER BY
        total_orders