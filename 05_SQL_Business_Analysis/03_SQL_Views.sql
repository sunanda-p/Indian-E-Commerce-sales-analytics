-----------------------------------
VIEW 1: Total revenue
-----------------------------------
CREATE OR ALTER VIEW vw_TotalRevenue AS
SELECT
ROUND(SUM(Total_Amount),0) AS Total_Revenue
FROM vw_Valid_Sales;
GO


-------------------------------------
VIEW 2: Monthly Revenue/Sales 
-------------------------------------
CREATE OR ALTER VIEW vw_Monthy_Sales AS
SELECT 
YEAR(Order_Date) AS Order_Year,
MONTH(Order_Date) AS Order_Month,
COUNT(DISTINCT Order_ID) AS Total_Orders,
SUM(Quantity) AS Units_Sold,
ROUND(SUM(Total_Amount),0) AS REVENUE
FROM vw_Valid_Sales
GROUP BY 
YEAR(Order_Date),
MONTH(Order_Date);
GO

-------------------------------------
VIEW 3: Valid Sales 
-------------------------------------
CREATE OR ALTER VIEW vw_Valid_Sales AS
SELECT *
FROM sales
WHERE Order_Status NOT IN ('Cancelled','Returned');
GO
