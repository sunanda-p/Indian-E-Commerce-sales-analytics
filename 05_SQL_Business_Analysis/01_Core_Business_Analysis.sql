/* Total revenue */
SELECT
ROUND(SUM(Total_Amount),0) AS Total_Revenue
FROM vw_Valid_Sales;

/* Total orders */
SELECT COUNT(DISTINCT Order_ID) AS Total_orders
FROM vw_Valid_Sales;

/* Total Quantity */
SELECT
SUM(Quantity) AS Total_Quantity
FROM vw_Valid_Sales;

/* Total Customers */
SELECT COUNT(DISTINCT Customer_ID) AS Total_Customers
FROM vw_Valid_Sales;

/* Total Customers */
SELECT SUM(Quantity) AS Unis_sold
FROM vw_Valid_Sales;

/* Total Customers */
SELECT COUNT(DISTINCT Product_ID) AS Products
FROM vw_Valid_Sales;

/* Average Order Value */
SELECT 
AVG(Total_Amount) AS Average_Order_Value
FROM vw_Valid_Sales;

/* Revenue by Category */
SELECT 
p.Category,
SUM(s.Total_Amount) AS Total_Revenue
FROM vw_Valid_Sales s
JOIN products p
ON s.Product_ID=p.Product_ID
GROUP BY p.Category
ORDER BY Total_Revenue DESC;


/* Revenue by Product */
SELECT 
p.Product_Name,
p.Category,
ROUND(SUM(s.Total_Amount),0) AS REVENUE,
SUM(Quantity) AS Units_sold
FROM vw_Valid_Sales s
INNER JOIN products p
ON s.Product_ID=p.Product_ID
GROUP BY p.Product_Name,
p.Category
ORDER BY REVENUE DESC;


/* Customer Tier by Revenue, Customers */
SELECT
c.Customer_Tier,
COUNT(Total_orders) AS Customers,
ROUND(SUM(s.Total_Amount),0) AS REVENUE
FROM vw_Valid_Sales s
INNER JOIN customers c
ON s.Customer_ID=c.customer_ID
GROUP BY Customer_Tier
ORDER BY REVENUE DESC;

/* Revenue by Age group*/
SELECT
c.Age_Group,
ROUND(SUM(s.Total_Amount),0) AS REVENUE
FROM vw_Valid_Sales s
INNER JOIN customers c
ON s.Customer_ID=c.customer_ID
GROUP BY Age_Group
ORDER BY REVENUE DESC;

/* Revenue by state */
SELECT
State,
ROUND(SUM(Total_Amount),0) AS REVENUE
FROM vw_Valid_Sales 
GROUP BY State
ORDER BY REVENUE DESC;

/* Monthly Revenue/Sales */
SELECT 
YEAR(Order_Date) AS Order_Year,
MONTH(Order_Date) AS Order_Month,
COUNT(DISTINCT Order_ID) AS Total_Orders,
SUM(Quantity) AS Units_Sold,
ROUND(SUM(Total_Amount),0) AS REVENUE
FROM vw_Valid_Sales 
GROUP BY 
YEAR(Order_Date),
MONTH(Order_Date)
ORDER BY Order_Year, Order_Month ASC;


/* Order status by Revenue Analysis */
SELECT
Order_Status,
ROUND(SUM(Total_Amount),0) AS REVENUE,
COUNT(DISTINCT Order_ID) AS Total_Orders
FROM Sales 
GROUP BY Order_Status
ORDER BY REVENUE DESC;

/* Payment & Total Orders by Revenue Analysis */
SELECT
Payment_Mode,
COUNT(Order_ID) AS Total_Orders,
ROUND(SUM(Total_Amount),0) AS REVENUE
FROM vw_Valid_Sales 
GROUP BY Payment_Mode
ORDER BY REVENUE DESC;

/* Customers by Age group and Gender */
SELECT 
c.Age_Group,
c.Gender,
COUNT(DISTINCT s.Customer_ID) AS Total_Customers
FROM vw_Valid_Sales s
INNER JOIN customers c
ON s.Customer_ID=c.Customer_ID
GROUP BY 
c.Age_Group,
c.Gender
ORDER BY  
c.Age_Group,
c.Gender;

/* Calculation of returned orders */
SELECT
CAST(100*SUM(CASE WHEN Order_Status='Returned' THEN 1 ELSE 0 END)/COUNT(*) AS DECIMAL(10,2)) AS RETURN_RATE
FROM sales;

/* Calaculate the cancellation rate */
SELECT
CAST(100*SUM(CASE WHEN Order_Status='Cancelled' THEN 1 ELSE 0 END)/COUNT(Order_ID) AS DECIMAL(10,2)) AS RETURN_RATE
FROM sales;

/* Cancelled and Returned Orders by State */
SELECT
State,
SUM (CASE WHEN Order_Status = 'Cancelled' THEN 1 ELSE 0 END) AS Cancelled_Orders,
SUM (CASE WHEN Order_Status = 'Returned' THEN 1 ELSE 0 END) AS Returned_Orders
FROM sales
GROUP BY State;


/* Average delivery time */
SELECT
AVG(DATEDIFF(DAY,Order_Date,Delivery_Date)*1.0) AS Average_Delivery_Days
FROM vw_Valid_Sales
WHERE Delivery_Date IS NOT NULL;