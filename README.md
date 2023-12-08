# Pizza-sales-analysis

## About

In the dynamic and competitive landscape of the pizza industry, understanding key indicators and gaining insights into business performance is crucial for sustained success. This data analysis project aims to provide a comprehensive overview of pizza sales data, helping to extract valuable insights that can inform strategic decisions and enhance overall business performance. The dataset was obtained from the [Kaggle Pizza Restaurant Sales](https://www.kaggle.com/datasets/shilongzhuang/pizza-sales).


## Purposes Of The Project

The primary purpose of this project is to analyze key metrics related to pizza sales data and present them in a visually appealing and informative manner. By exploring various aspects of sales data, I aim to uncover trends, patterns, and opportunities that can guide decision-making processes and contribute to the optimization of your business strategies.

## About Data

The dataset was obtained from the [Kaggle Pizza Restaurant Sales](https://www.kaggle.com/datasets/shilongzhuang/pizza-sales). This pizza sales dataset make up 12 relevant features:
| Column                  | Description                                                                             | Data Type      |
| :---------------------- | :-------------------------------------------------------------------------------------- | :------------- |
| order_id                | Unique identifier for each order placed by a table                                      | INT            |
| order_details_id        | Unique identifier for each pizza placed within each order                               | INT            |
| pizza_id                | Unique key identifier that ties the pizza ordered to its details, like size and price   | VARCHAR(50)    |
| quantity                | Quantity ordered for each pizza of the same type and size                               | TINYINT        |
| order_date              | Date the order was placed                                                               | DATE           |
| order_time              | Time the order was placed                                                               | TIME(7)        |
| unit_price              | Price of the pizza in USD                                                               | FLOAT          |
| total_price             | Unit_price * quantity                                                                   | FLOAT          |
| pizza_size              | Size of the pizza (Small, Medium, Large, X Large, or XX Large)                          | VARCHAR(50)    |
| pizza_type              | Unique key identifier that ties the pizza ordered to its details, like size and price   | VARCHAR(50)    |
| pizza_ingredients       | Ingredients used in the pizza as shown in the menu                                      | VARCHAR(200)   |
| pizza_name              | Name of the pizza as shown in the menu                                                  | VARCHAR(50)    |


### Key Metrics to be Analyzed:

1. **Total Revenue**
   
2. **Average Order Value**
   
3. **Total Pizzas Sold**

4. **Total Orders**

5. **Average Pizzas Per Order**

### Visualizations to be Created:

1. **Hourly Trend for Total Pizzas Sold**
  
2. **Weekly Trend for Total Orders**
   
3. **Percentage of Sales by Pizza Category**

4. **Percentage of Sales by Pizza Size**

5. **Total Pizzas Sold by Pizza Category**
   
6. **Top 5 Best Sellers by Revenue, Total Quantity, and Total Orders**

7. **Bottom 5 Best Sellers by Revenue, Total Quantity, and Total Orders**

## Benefits:

- Identify peak sales periods and optimize resource allocation.
- Understand customer preferences for pizza categories and sizes.
- Uncover the most and least popular pizza options for strategic planning.
- Enhance decision-making processes through data-driven insights.

## Purpose:

This comprehensive analysis aims to empower your team with actionable insights, allowing you to make informed decisions that positively impact your pizza business.


## Approach Used

1. **Total Revenue:**
   - The sum of the total price of all pizza orders.

2. **Average Order Value:**
   - The average amount spent per order, calculated by dividing the total revenue by the total number of orders.

3. **Total Pizzas Sold:**
   - The sum of the quantities of all pizzas sold.

4. **Total Orders:**
   - The total number of orders placed.

5. **Average Pizzas Per Order:**
   - The average number of pizzas sold per order, calculated by dividing the total number of pizzas sold by the total number of orders.

## Visualizations to be Created:

1. **Hourly Trend for Total Pizzas Sold:**
   - Create a stacked bar chart that displays the hourly trend of total orders over a specific time period. This chart will help identify any patterns or fluctuations in order volumes on an hourly basis.

2. **Weekly Trend for Total Orders:**
   - Create a line chart that illustrates the weekly trend of total orders throughout the year. This chart will allow the identification of peak weeks or periods of high order activity.

3. **Percentage of Sales by Pizza Category:**
   - Create a pie chart that shows the distribution of sales across different pizza categories. This chart will provide insights into the popularity of various pizza categories and their contribution to overall sales.

4. **Percentage of Sales by Pizza Size:**
   - Generate a pie chart that represents the percentage of sales attributed to different pizza sizes. This chart will help understand customer preferences for pizza sizes and their impact on sales.

5. **Total Pizzas Sold by Pizza Category:**
   - Create a funnel chart that presents the total number of pizzas sold for each pizza category. This chart will allow the comparison of the sales performance of different pizza categories.

6. **Top 5 Best Sellers by Revenue, Total Quantity, and Total Orders:**
   - Create a bar chart highlighting the top 5 best-selling pizzas based on Revenue, Total Quantity, and Total Orders. This chart will help identify the most popular pizza options.

7. **Bottom 5 Best Sellers by Revenue, Total Quantity, and Total Orders:**
   - Create a bar chart showcasing the bottom 5 worst-selling pizzas based on Revenue, Total Quantity, and Total Orders. This chart will enable the identification of underperforming or less popular pizza options.



## Code

For the rest of the code, check the [SQLQuery.sql](https://github.com/Justin-Thomas-34/pizza-sales-analysis/blob/main/SQLQuery.sql) file

```sql
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
```
