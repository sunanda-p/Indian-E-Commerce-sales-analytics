/*To understand the size/rows in the dateset - Total_Customers table*/
SELECT COUNT(*) AS Total_Customers
FROM customers;

/*To understand the size/rows in the dateset - Total_Products table*/
SELECT COUNT(*) AS Total_Products
FROM products;

/*To understand the size/rows in the dateset - Total_Sales table*/
SELECT COUNT(*) AS Total_Sales
FROM sales;

/*Quick view of the datset*/
SELECT TOP 10*
FROM customers;

SELECT TOP 10*
FROM products;

SELECT TOP 10*
FROM sales;
