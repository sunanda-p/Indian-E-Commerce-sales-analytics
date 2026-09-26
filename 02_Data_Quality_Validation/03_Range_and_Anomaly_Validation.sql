/* To check any anomaliges in customers age */
SELECT 
MIn(Age) AS Minimum_age,
MAX(Age) AS Maximum_age
FROM customers;

/* To check any anomaliges in product price */
SELECT 
MIn(Original_Price) AS Minimum_Price,
MAX(Original_Price) AS Maximum_Price
FROM products;

/* To check any anomaliges in various price of the products */
SELECT *
FROM products
WHERE Original_Price<=0
OR Selling_price<=0
OR Discount_Percent>=100
OR Selling_Price<=0
OR Stock_Quantity<=0
OR Weight_kg<=0;

/* To check any anomaliges in various price of the sales */
SELECT *
FROM sales
WHERE Total_Amount<=0
OR Quantity<=0;

/* To check the date range in the sales */
SELECT 
MIN(Order_Date) AS First_Order_Date,
MAX(Order_Date) AS Last_Order_Date,
MIN(Delivery_Date) AS First_Delivery_Date,
MAX(Delivery_Date) AS Last_Delivery_Date
FROM sales

