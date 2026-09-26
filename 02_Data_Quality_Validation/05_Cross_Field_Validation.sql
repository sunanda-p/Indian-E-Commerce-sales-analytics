/* To identify incorrect or inconsistent sales records - Order value */
SELECT *
FROM sales
WHERE ABS(Order_Value-(Quantity*Unit_Price))>0.1;

/* To identify incorrect or inconsistent sales records - Total Amount */
SELECT *
FROM sales
WHERE ABS(Total_Amount-(Order_Value+Shipping_Cost-Coupon_Discount))>0.1;

/* To identify incorrect or inconsistent product records - Selling Price */
SELECT *
FROM products
WHERE ABS(Selling_Price-(Original_Price-Discount_Amount))>0.1;

/* To identify incorrect or inconsistent product records - Discount Amount */
SELECT *
FROM products
WHERE ABS(Discount_Amount-(Original_Price*discount_percent/100))>0.1;

/*Customer data against Sales*/
SELECT
    c.Customer_ID,
    c.Total_Orders,
    COUNT(s.Order_ID) AS Calculated_Orders,
    c.Total_Orders - COUNT(s.Order_ID) AS Orders_Difference,
    c.Total_Spent,
    COALESCE(SUM(s.Total_Amount), 0) AS Calculated_Spent,
    ROUND(c.Total_Spent - COALESCE(SUM(s.Total_Amount), 0),2) AS Spent_Difference,
    STRING_AGG(s.Order_Status, ', ') AS Order_Statuses
FROM Customers AS c
LEFT JOIN Sales AS s
    ON c.Customer_ID = s.Customer_ID
GROUP BY
    c.Customer_ID,
    c.Total_Orders,
    c.Total_Spent
HAVING
    c.Total_Orders <> COUNT(s.Order_ID)
    OR c.Total_Spent <> COALESCE(SUM(s.Total_Amount), 0);