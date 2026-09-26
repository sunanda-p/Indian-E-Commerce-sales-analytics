/* To identify any duplicate customer IDs */
SELECT Customer_ID, COUNT(*) AS Duplicate_Count
FROM customers
GROUP BY Customer_ID
HAVING COUNT(*)>1;

/* To identify any duplicate product Ds */
SELECT Product_ID, COUNT(*) AS Duplicate_Count
FROM products
GROUP BY Product_ID
HAVING COUNT(*)>1;

/* To identify any duplicate order IDs */
SELECT Order_ID, COUNT(*) AS Duplicate_Count
FROM sales
GROUP BY Order_ID
HAVING COUNT(*)>1;