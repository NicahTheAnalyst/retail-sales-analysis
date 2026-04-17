DESCRIBE sales;


ALTER TABLE sales
RENAME COLUMN `Order ID` TO order_id;

ALTER TABLE sales
RENAME COLUMN `Order Date` TO order_date;
ALTER TABLE sales
RENAME COLUMN `Ship Date` TO ship_date;

ALTER TABLE sales
RENAME COLUMN `Customer Name` TO customer_name;
ALTER TABLE sales
RENAME COLUMN `Customer ID` TO customer_id;

ALTER TABLE sales
RENAME COLUMN `Product Name` TO product_name;
ALTER TABLE sales
RENAME COLUMN `Sub-Category` TO sub_category;
ALTER TABLE sales
RENAME COLUMN `Postal Code` TO postal_code;

UPDATE sales
SET order_date = TO_DATE(order_date, 'MM/DD/YYYY');

UPDATE sales
SET ship_date = TO_DATE(ship_date, 'MM/DD/YYYY');

SELECT *
FROM sales
WHERE sales IS NULL 
   OR profit IS NULL 
   OR order_id IS NULL;
  
SELECT order_id, COUNT(*)
FROM sales
GROUP BY order_id
HAVING COUNT(*) > 1;

SELECT COUNT(*) FROM sales;
SELECT MIN(order_date), MAX(order_date) FROM sales;
  
-- Core KPIs: Total Revenue, Profit, Orders
  
SELECT 
    SUM(sales) AS total_revenue,
    SUM(profit) AS total_profit,
    COUNT(DISTINCT order_id) AS total_orders
FROM sales;

-- Analysis Queries
-- Monthly Sales Trend
SELECT 
    DATE_TRUNC('month', order_date) AS month,
    SUM(sales) AS revenue
FROM sales
GROUP BY month
ORDER BY month;

-- Sales by category
SELECT 
    category,
    SUM(sales) AS revenue,
    SUM(profit) AS profit
FROM sales
GROUP BY category
ORDER BY revenue DESC;

-- Top Products
SELECT 
    product_name,
    SUM(sales) AS revenue
FROM sales
GROUP BY product_name
ORDER BY revenue DESC
LIMIT 10;

-- Top customers
SELECT 
    customer_name, SUM(sales) AS total_spent
FROM
    sales
GROUP BY customer_name
ORDER BY total_spent DESC
LIMIT 10;

-- Regional Perfomance
SELECT 
    region,
    SUM(sales) AS revenue,
    SUM(profit) AS profit
FROM sales
GROUP BY region
ORDER BY revenue DESC;


SELECT * FROM sales; --downloaded cleaned data

