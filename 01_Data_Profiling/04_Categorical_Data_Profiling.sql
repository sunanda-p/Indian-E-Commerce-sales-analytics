/* To understand categorical columns */
SELECT Gender, COUNT(*) AS Customer_Count
FROM customers
GROUP BY Gender
ORDER BY Customer_Count;

/* To understand categorical columns in customer table  */
SELECT Gender, COUNT(*) AS Customer_Count
FROM customers
GROUP BY Gender
ORDER BY Customer_Count;

SELECT Age_Group, COUNT(*) AS Customer_Count
FROM customers
GROUP BY Age_Group
ORDER BY Customer_Count;

SELECT City, COUNT(*) AS Customer_Count
FROM customers
GROUP BY City
ORDER BY Customer_Count;

SELECT Customer_Tier, COUNT(*) AS Customer_Count
FROM customers
GROUP BY Customer_Tier
ORDER BY Customer_Count;

/* To understand categorical columns in products table  */
SELECT Category, COUNT(*) AS Customer_Count
FROM products
GROUP BY Category
ORDER BY Customer_Count;

SELECT Brand, COUNT(*) AS Customer_Count
FROM products
GROUP BY Brand
ORDER BY Customer_Count;

/* To understand categorical columns in sales table  */
SELECT Payment_Mode, COUNT(*) AS Customer_Count
FROM sales
GROUP BY Payment_Mode
ORDER BY Customer_Count;

SELECT Order_Status, COUNT(*) AS Customer_Count
FROM sales
GROUP BY Order_Status
ORDER BY Customer_Count;