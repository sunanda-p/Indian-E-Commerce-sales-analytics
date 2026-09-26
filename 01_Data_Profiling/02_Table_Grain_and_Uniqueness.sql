/* To understand the grain of each table*/
SELECT 
COUNT(*) AS Total_Customers,
COUNT(DISTINCT Customer_ID) AS Unique_Customers
FROM customers;

SELECT 
COUNT(*) AS Total_Customers,
COUNT(DISTINCT Product_ID) AS Unique_Products
FROM products;

SELECT 
COUNT(*) AS Total_Customers,
COUNT(DISTINCT Order_ID) AS Unique_Sales
FROM sales;