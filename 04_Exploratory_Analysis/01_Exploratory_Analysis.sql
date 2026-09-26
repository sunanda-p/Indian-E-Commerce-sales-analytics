/* REVENUE BY CUSTOMER AGE GROUP
 Purpose: Explore revenue contribution across customer age groups.*/
SELECT 
Customer_Age_Group,
SUM(Total_Amount) AS Revenue,
COUNT(DISTINCT Customer_ID) AS Customers
FROM vw_Valid_Sales
GROUP BY Customer_Age_Group
ORDER BY Customer_Age_Group DESC;

/* Discount Band Analysis 
Purpose: Understand how products are distributed across different discount levels.*/
SELECT
CASE
WHEN Discount_Percent < 10 THEN '0-9%'
WHEN Discount_Percent < 20 THEN '10-19%'
WHEN Discount_Percent < 30 THEN '20-29%'
WHEN Discount_Percent < 40 THEN '30-39%'
ELSE '40%+'
END AS Discount_Band,
COUNT(*) AS Products
FROM Products
GROUP BY
CASE
WHEN Discount_Percent < 10 THEN '0-9%'
WHEN Discount_Percent < 20 THEN '10-19%'
WHEN Discount_Percent < 30 THEN '20-29%'
WHEN Discount_Percent < 40 THEN '30-39%'
ELSE '40%+'
END;

