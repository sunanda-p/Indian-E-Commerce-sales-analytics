/* To identify the Top customers */
SELECT
TOP 20
c.Customer_ID,
c.Customer_Name,
SUM(s.Total_Amount) AS Total_Reveune
FROM vw_Valid_Sales s
JOIN customers c
ON s.Customer_ID=c.Customer_ID
GROUP BY c.Customer_ID,
c.Customer_Name
ORDER BY Total_Reveune;

/* Customers with no orders */
SELECT
c.Customer_ID,
c.Customer_Name
FROM Customers c
left JOIN vw_Valid_Sales s
ON c.Customer_ID=s.Customer_ID
WHERE S.Customer_ID IS NULL;


/* Category by Revenue & Customers */
SELECT
p.Category,
SUM(s.Quantity) AS Units_sold,
COUNT(DISTINCT s.Customer_ID) as Customers,
SUM(s.Total_Amount) AS Revenue
FROM vw_Valid_Sales s
JOIN products p
ON s.Product_ID=p.Product_ID
GROUP BY p.Category
ORDER BY Customers;


/* Top 3 products within every category */

WITH ProductRevenue AS
(
SELECT
p.Product_Name,
p.Category,
SUM(s.Total_Amount) AS Revenue
FROM vw_Valid_Sales s
INNER JOIN Products p
ON s.Product_ID = p.Product_ID
GROUP BY
p.Product_Name,
p.Category
),
RankedProducts AS
(
SELECT
Product_Name,
Category,
Revenue,
ROW_NUMBER() OVER
(
PARTITION BY Category
ORDER BY Revenue DESC
) AS Product_Rank
FROM ProductRevenue
)
SELECT *
FROM RankedProducts
WHERE Product_Rank <= 3
ORDER BY
Category,
Product_Rank;

/* What percentage of the company's total revenue was generated in each month?*/
SELECT
m.Order_Month,
m.Total_Orders,
m.Units_Sold,
m.REVENUE,
t.Total_Revenue,
CAST(100.0 * m.REVENUE/ NULLIF(t.Total_Revenue, 0)AS DECIMAL(10,2)) AS Monthly_Revenue_Percent
FROM vw_Monthy_Sales m
CROSS JOIN vw_TotalRevenue t
ORDER BY
m.Order_Month;