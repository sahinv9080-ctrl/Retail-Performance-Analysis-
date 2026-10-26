use retail_db;

SHOW TABLES;
DESC retail_sales_cleaned;

select * from   retail_sales_cleaned;

-- changing data types 

ALTER TABLE retail_sales_cleaned
MODIFY order_date DATE;

ALTER TABLE retail_sales_cleaned
MODIFY ship_date DATE;

ALTER TABLE retail_sales_cleaned
MODIFY order_id VARCHAR(20),
MODIFY ship_mode VARCHAR(30),
MODIFY customer_id VARCHAR(20),
MODIFY customer_name VARCHAR(100),
MODIFY segment VARCHAR(30),
MODIFY country VARCHAR(50),
MODIFY city VARCHAR(50),
MODIFY state VARCHAR(50),
MODIFY postal_code VARCHAR(10),
MODIFY region VARCHAR(20),
MODIFY product_id VARCHAR(30),
MODIFY categories VARCHAR(30),
MODIFY sub_category VARCHAR(50),
MODIFY product_name VARCHAR(255),
MODIFY sales DECIMAL(10,2),
MODIFY quantity INT,
MODIFY discount DECIMAL(4,2),
MODIFY profit DECIMAL(10,2);


-- count
SELECT COUNT(*) AS total_rows
FROM retail_sales_cleaned;
-- sum 
SELECT ROUND(SUM(sales),2) AS Total_Sales
FROM retail_sales_cleaned;
-- profit
SELECT ROUND(SUM(profit),2) AS Total_Sales
FROM retail_sales_cleaned;
-- c order
SELECT COUNT(DISTINCT order_id) AS Total_Orders
FROM retail_sales_cleaned;
-- c cust_id
SELECT COUNT(DISTINCT customer_id) AS Total_Customers
FROM retail_sales_cleaned;
-- avg sal per order
SELECT ROUND(SUM(sales) / COUNT(DISTINCT order_id),2) AS Avg_Order_Value
FROM retail_sales_cleaned; 
-- quantity
SELECT SUM(quantity) AS Total_Quantity
FROM retail_sales_cleaned;


-- Sales by Category
SELECT categories,ROUND(SUM(sales),2) AS total_sales
FROM retail_sales_cleaned GROUP BY categories
ORDER BY total_sales DESC;

-- profit by Category
SELECT category,ROUND(SUM(profit),2) AS total_profit
FROM retail_sales_cleaned GROUP BY category
ORDER BY total_profit DESC;

-- Sales by Sub-Category
SELECT sub_category,ROUND(SUM(sales),2) AS total_sales
FROM retail_sales_cleaned GROUP BY sub_category
ORDER BY total_sales DESC;

-- Top 10 Selling Products
SELECT product_name,ROUND(SUM(sales),2) AS total_sales
FROM retail_sales_cleaned GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 10;

-- Bottom 10 Products by Sales
SELECT product_name,ROUND(SUM(sales),2) AS total_sales
FROM retail_sales_cleaned GROUP BY product_name
ORDER BY total_sales ASC
LIMIT 10;

-- Sales by State
SELECT state,ROUND(SUM(sales),2) AS total_sales
FROM retail_sales_cleaned GROUP BY state
ORDER BY total_sales DESC;

-- Sales by Region
SELECT region,ROUND(SUM(sales),2) AS total_sales
FROM retail_sales_cleaned GROUP BY region 
ORDER BY total_sales DESC;

-- Sales by Customer Segment
SELECT segment,ROUND(SUM(sales),2) AS total_sales
FROM retail_sales_cleaned GROUP BY segment
ORDER BY total_sales DESC;

-- Top 10 Customers by Sales
SELECT customer_name,ROUND(SUM(sales),2) AS total_sales
FROM retail_sales_cleaned GROUP BY customer_name
ORDER BY total_sales DESC
LIMIT 10;

-- Bottom 10 Products by Sales
SELECT product_name,ROUND(SUM(sales),2) AS total_sales
FROM retail_sales_cleaned GROUP BY product_name
ORDER BY total_sales ASC
LIMIT 10;

-- Sales by State
SELECT state,ROUND(SUM(sales),2) AS total_sales
FROM retail_sales_cleaned GROUP BY state
ORDER BY total_sales DESC;

-- Sales by Region
SELECT region,ROUND(SUM(sales),2) AS total_sales
FROM retail_sales_cleaned GROUP BY region 
ORDER BY total_sales DESC;

-- Sales by Customer Segment
SELECT segment,ROUND(SUM(sales),2) AS total_sales
FROM retail_sales_cleaned GROUP BY segment
ORDER BY total_sales DESC;


-- Top 10 Customers by Sales
SELECT customer_name,ROUND(SUM(sales),2) AS total_sales
FROM retail_sales_cleaned GROUP BY customer_name
ORDER BY total_sales DESC
LIMIT 10;


-- Shipping Mode Analysis
SELECT ship_mode,
    COUNT(*) AS total_orders,
    ROUND(SUM(sales),2) AS total_sales,
    ROUND(AVG(sales),2) AS avg_sales
FROM retail_sales_cleaned
GROUP BY ship_mode
ORDER BY total_sales DESC;

-- Monthly Sales Trend
SELECT YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    ROUND(SUM(sales),2) AS total_sales
FROM retail_sales_cleaned
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY year, month;
 
-- Yearly Sales Trend
SELECT YEAR(order_date) AS year,
    ROUND(SUM(sales),2) AS total_sales
FROM retail_sales_cleaned GROUP BY YEAR(order_date)
ORDER BY year;

-- Quarterly Sales Trend
SELECT YEAR(order_date) AS year,
    QUARTER(order_date) AS quarter,
    ROUND(SUM(sales),2) AS total_sales
FROM retail_sales_cleaned
GROUP BY YEAR(order_date), QUARTER(order_date)
ORDER BY year, quarter;

-- Monthly Profit Trend
SELECT YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    ROUND(SUM(profit),2) AS total_profit
FROM retail_sales_cleaned
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY year, month;

-- Average Discount by Category
SELECT categories,
    ROUND(AVG(discount),2) AS average_discount
FROM retail_sales_cleaned
GROUP BY categories
ORDER BY average_discount DESC;

-- Profit Margin by Category
SELECT categories,
    ROUND(SUM(profit),2) AS total_profit,
    ROUND(SUM(sales),2) AS total_sales,
    ROUND((SUM(profit)/SUM(sales))*100,2) AS profit_margin_percentage
FROM retail_sales_cleaned
GROUP BY categories
ORDER BY profit_margin_percentage DESC;


--  done for importing the data 
SHOW VARIABLES LIKE 'local_infile'; --  on method




SET GLOBAL local_infile = 0;   -- off method


SET GLOBAL local_infile = 1; --  on method

SELECT * FROM retail_sales_cleaned;
 
