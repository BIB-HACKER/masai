# Selecting the given database 
USE masai;

# Doubt 
SELECT CustomerID, MAX(OrderDate) AS recent_order_date
FROM Orders
GROUP BY CustomerID
ORDER BY CustomerID;

# Datetime Functions 
SELECT CURRENT_DATE() AS date_today;
SELECT NOW() AS datetime_today;

SELECT DAY(CURRENT_DATE()) AS day_today,
WEEK(CURRENT_DATE()) AS week_today,
MONTH(CURRENT_DATE()) AS month_today,
QUARTER(CURRENT_DATE()) AS quarter_today,
YEAR(CURRENT_DATE()) AS year_today,
DAYNAME(CURRENT_DATE()) AS dayname_today,
MONTHNAME(CURRENT_DATE()) AS monthname_today;

SELECT FirstName, Date_of_Birth,
DAY(Date_of_Birth) AS day_of_Birth,
WEEK(Date_of_Birth) AS week_of_Birth,
MONTH(Date_of_Birth) AS month_of_Birth,
QUARTER(Date_of_Birth) AS quarter_of_Birth,
YEAR(Date_of_Birth) AS year_of_Birth,
DAYNAME(Date_of_Birth) AS dayname_of_Birth,
MONTHNAME(Date_of_Birth) AS monthname_of_Birth
FROM Customers;

# Getting the count of people born on different days 
SELECT DAYNAME(Date_of_Birth) AS DayName, COUNT(*) AS Numb_People
FROM Customers
GROUP BY DAYNAME(Date_of_Birth)
ORDER BY Numb_People DESC;

# Getting the count of people born in different months 
SELECT MONTHNAME(Date_of_Birth) AS MonthName, COUNT(*) AS Numb_People
FROM Customers
GROUP BY MONTHNAME(Date_of_Birth)
ORDER BY Numb_People DESC;

# Getting the count of people born in May nad OCtober 
SELECT MONTHNAME(Date_of_Birth) AS DayName, COUNT(*) AS Numb_People
FROM Customers
GROUP BY MONTHNAME(Date_of_Birth)
HAVING DayName IN ('May', 'October')
ORDER BY Numb_People DESC;

# Getting the yearwise, quarterwise total sales (Use Orders table)
SELECT YEAR(OrderDate) AS Year_, QUARTER(OrderDate) AS Quarter_,
SUM(total_order_amount) AS total_amount 
FROM Orders
GROUP BY Year_, Quarter_
ORDER BY YEAR(OrderDate), QUARTER(OrderDate);

# DATEDIFF
SELECT DATEDIFF('2022-04-30', '2022-03-31') AS output;

# Getting the delivery time 
SELECT *, DATEDIFF(DeliveryDate, OrderDate) AS Num_Days
FROM Orders;

# Getting the first order date for every customer
SELECT CustomerID, MIN(OrderDate) AS Min_order_date
FROM Orders
GROUP BY CustomerID
ORDER BY CustomerID;

# Getting the most recent order date for every customer
SELECT CustomerID, MAX(OrderDate) AS Recent_order_date
FROM Orders
GROUP BY CustomerID
ORDER BY CustomerID;

# Join()
SELECT b.CustomerID, FirstName, LastName, MAX(OrderDate) AS Recent_Order_Date
FROM Orders AS a
JOIN Customers AS b 
ON a.CustomerID = b.CustomerID 
GROUP BY b.CustomerID, FirstName, LastName 
ORDER BY b.CustomerID;

# Self Join Example  
# Getting a unique combination of customers from same cities
SELECT a.FirstName AS Customer_A_First_Name,
a.LastName AS Customer_A_Last_Name,
b.FirstName AS Customer_B_First_Name,
b.LastName AS Customer_B_Last_Name,
a.city AS City_of_Customer_A,
b.city AS City_of_Customer_B
FROM Customers AS a
JOIN Customers AS b 
ON a.city = b.city 
WHERE a.FirstName <> b.FirstName AND a.LastName <> b.LastName;

# Self Join Example  
# Getting a unique combination of customers from same cities
SELECT a.FirstName AS Customer_A_First_Name,
a.LastName AS Customer_A_Last_Name,
b.FirstName AS Customer_B_First_Name,
b.LastName AS Customer_B_Last_Name,
a.city AS City_of_Customer_A,
b.city AS City_of_Customer_B
FROM Customers AS a
JOIN Customers AS b 
ON a.city = b.city 
WHERE a.FirstName <> b.FirstName AND a.LastName <> b.LastName 
AND a.city IN ('New York', 'Belfast', 'Dublin');

# Common Table Expression
SELECT * FROM Orders;
SELECT * FROM Payments;

# Joining prders, payments and customers 
SELECT a.OrderID, c.FirstName, c.LastName, b.PaymentID,
a.CustomerID, Total_Order_amount, b.PaymentType
FROM Orders AS a
JOIN Payments AS b
ON a.PaymentID = b.PaymentID
JOIN Customers AS c
ON a.CustomerID = c.CustomerID;

# CTE 
WITH Orders_Payments_Info AS (
SELECT a.OrderID, b.PaymentID, a.CustomerID,
Total_Order_Amount, b.PaymentType
FROM Orders AS a
JOIN Payments AS b 
ON a.PaymentID = b.PaymentID
)

SELECT d.*, e.FirstName, e.LastName
FROM Customers AS e 
JOIN Orders_Payments_Info AS d
ON e.CustomerID = d.CustomerID;

# Benifits of CTE -> Complex Problems, Easy to integrate, Memory Efficient

# Views -> Virtual Table 

# Query to get the weekend orders 
SELECT *, DAYNAME(OrderDate) AS Week_Day_of_Order
FROM Orders
WHERE DAYNAME(OrderDate) IN ('Saturday', 'Sunday');

# Creating a view 
CREATE VIEW weekend_orders AS 
SELECT *, DAYNAME(OrderDate) AS Week_Day_of_Order
FROM Orders
WHERE DAYNAME(OrderDate) IN ('Saturday', 'Sunday');

SELECT * FROM weekend_orders;

# Filtering the data in a view
SELECT * FROM weekend_orders
WHERE PaymentID = 2;

# Join 
SELECT a.*, b.PaymentType 
FROM weekend_orders AS a
JOIN Payments AS b
ON a.PaymentId = b.paymentID;

# Altering the view 
ALTER VIEW weekend_orders AS 
SELECT *, DAYNAME(OrderDate) AS Week_Day_of_Order
FROM Orders
WHERE DAYNAME(OrderDate) IN ('Saturday', 'Sunday')
AND Total_Order_Amount > 20000;

SELECT * 
FROM weekend_orders;

# Renaming a view 
RENAME TABLE weekend_orders 
TO newView;

SELECT * 
FROM weekend_orders;

SELECT * 
FROM newView;

# Dropping a view 
DROP VIEW newView;























