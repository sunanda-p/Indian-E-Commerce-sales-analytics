/* Converting the dates in date format */
SELECT
    TRY_CONVERT(date, Order_Date) AS Order_Date,
    TRY_CONVERT(date, Delivery_Date) AS Delivery_Date
FROM Sales;

/* Converting the dates in date format */
SELECT
    TRY_CONVERT(date, Date_of_Birth) AS Date_of_Birth
FROM Customers;

/*Create calculated delivery days */
SELECT
    Order_ID,
    Order_Date,
    Delivery_Date,
    DATEDIFF(
        DAY,
        TRY_CONVERT(date, Order_Date),
        TRY_CONVERT(date, Delivery_Date)
    ) AS Delivery_Days
FROM Sales;

/*Create order year & month */
SELECT
    Order_ID,
    Order_Date,
    YEAR(Order_Date) AS Order_Year,
    MONTH(Order_Date) AS Order_Month
FROM Sales;