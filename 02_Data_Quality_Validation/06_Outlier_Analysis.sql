/* Outlier Analysis by highest amount */
SELECT TOP 20
Order_ID,
Customer_ID,
Product_ID,
Quantity,
Unit_Price,
Total_Amount
FROM sales
ORDER BY Total_Amount DESC;

/*Outlier Analysis by highest quantity */
SELECT TOP 20
Order_ID,
Customer_ID,
Product_ID,
Quantity,
Unit_Price,
Total_Amount
FROM sales
ORDER BY Quantity DESC;

/*Outlier Analysis by highest discounts */
SELECT TOP 20
Order_ID,
Customer_ID,
Product_ID,
Quantity,
Unit_Price,
Coupon_Discount,
Total_Amount
FROM sales
ORDER BY Coupon_Discount DESC;

/* Outlier Analysis by highest product prices */
SELECT TOP 20
Product_ID,
selling_price
FROM products
ORDER BY selling_price DESC;

