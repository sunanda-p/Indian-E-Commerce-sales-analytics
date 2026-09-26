/* To check referential integrity of Sales -> Customers */
SELECT COUNT(*) AS Invalid_Customer_References
FROM sales s
LEFT JOIN customers c
ON s.Customer_ID=c.Customer_ID
WHERE c.Customer_ID IS NULL;

/* To check referential integrity of Sales -> Products */
SELECT COUNT(*) AS Invalid_Customer_References
FROM sales s
LEFT JOIN products p
ON s.Product_ID=p.Product_ID
WHERE p.Product_ID IS NULL;