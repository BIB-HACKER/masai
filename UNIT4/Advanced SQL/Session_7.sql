# Selecting the masai database 
USE masai;

# Getting an idea about the tables
SELECT * FROM Orders;
SELECT * FROM Shippers;
SELECT * FROM OrderDetails;

# Get the sum of quantity shipped by each shipper
# in each quarter of each year 
# Tables -> Orders, Orderdetails, Shippers
SELECT YEAR(ShipDate) AS Year,
QUARTER(ShipDate) AS Quarter, b.ShipperID,
SUM(Quantity) AS Total_Quantity
FROM Orders AS a
JOIN Shippers AS b 
ON a.ShipperID = b.ShipperID
JOIN OrderDetails AS c
ON a.orderid = c.orderID
GROUP BY YEAR(ShipDate), QUARTER(ShipDate), b.ShipperID
ORDER BY YEAR(ShipDate), QUARTER(ShipDate), b.ShipperID;

# Pivoting ShipperID 
WITH cte AS (
	SELECT YEAR(ShipDate) AS Year,
	QUARTER(ShipDate) AS Quarter, b.ShipperID,
	SUM(Quantity) AS Total_Quantity
	FROM Orders AS a
	JOIN Shippers AS b 
	ON a.ShipperID = b.ShipperID
	JOIN OrderDetails AS c
	ON a.orderid = c.orderID
	GROUP BY YEAR(ShipDate), QUARTER(ShipDate), b.ShipperID
	ORDER BY YEAR(ShipDate), QUARTER(ShipDate), b.ShipperID
    )
    
SELECT Year, Quarter, 
(CASE WHEN ShipperID = 1 THEN Total_Quantity END) AS 'ShipperID_1', 
(CASE WHEN ShipperID = 2 THEN Total_Quantity END) AS 'ShipperID_2', 
(CASE WHEN ShipperID = 3 THEN Total_Quantity END) AS 'ShipperID_3', 
(CASE WHEN ShipperID = 4 THEN Total_Quantity END) AS 'ShipperID_4', 
(CASE WHEN ShipperID = 5 THEN Total_Quantity END) AS 'ShipperID_5', 
(CASE WHEN ShipperID = 6 THEN Total_Quantity END) AS 'ShipperID_6', 
(CASE WHEN ShipperID = 7 THEN Total_Quantity END) AS 'ShipperID_7', 
(CASE WHEN ShipperID = 8 THEN Total_Quantity END) AS 'ShipperID_8'
FROM cte;

WITH cte AS (
	SELECT YEAR(ShipDate) AS Year,
	QUARTER(ShipDate) AS Quarter, b.ShipperID,
	SUM(Quantity) AS Total_Quantity
	FROM Orders AS a
	JOIN Shippers AS b 
	ON a.ShipperID = b.ShipperID
	JOIN OrderDetails AS c
	ON a.orderid = c.orderID
	GROUP BY YEAR(ShipDate), QUARTER(ShipDate), b.ShipperID
	ORDER BY YEAR(ShipDate), QUARTER(ShipDate), b.ShipperID
    )
    
SELECT Year, Quarter, 
SUM(CASE WHEN ShipperID = 1 THEN Total_Quantity END) AS 'ShipperID_1', 
SUM(CASE WHEN ShipperID = 2 THEN Total_Quantity END) AS 'ShipperID_2', 
SUM(CASE WHEN ShipperID = 3 THEN Total_Quantity END) AS 'ShipperID_3', 
SUM(CASE WHEN ShipperID = 4 THEN Total_Quantity END) AS 'ShipperID_4', 
SUM(CASE WHEN ShipperID = 5 THEN Total_Quantity END) AS 'ShipperID_5', 
SUM(CASE WHEN ShipperID = 6 THEN Total_Quantity END) AS 'ShipperID_6', 
SUM(CASE WHEN ShipperID = 7 THEN Total_Quantity END) AS 'ShipperID_7', 
SUM(CASE WHEN ShipperID = 8 THEN Total_Quantity END) AS 'ShipperID_8'
FROM cte
GROUP BY Year, Quarter
ORDER BY Year, Quarter;

# Practice Problems 

# Question 1 - 
# Print Customer Id, Full Name(FirstName LastName), Postal Code
# Sort the output in decreasing order Customer Id.
SELECT CustomerID, CONCAT(FirstName, ' ', LastName) AS Full_Name, PostalCode
FROM Customers
ORDER BY CustomerID DESC;

# Question 2 - 
# Get the Description of customer along with the Customerid and Domain of their email
# For customer with no lastname take "Web" as their last name.

# The Final output should contain this columns Customerid, Domain of their email, Description.
# Get the details of description from the below attached sample output Description_column.
# Sort the result by DateEntered desc, if date entered is same then CustomerId in ascending.

# Description Sample -
# Malcom Julian was born on 8th March 1985 has ordered 12 orders yet.

# Note- All letters are case sensetive take same case letters as given in sample output Description_. 
# Every Day value will have 'th' in front of it.

# Tables -> Customers, Orders

SELECT c.CustomerID, RIGHT(email, LENGTH(email) - POSITION('@' IN email)) AS Domain,
CONCAT(FirstName, ' ', COALESCE(LastName, 'Web'), ' was born on ', DAY(Date_of_Birth), 'th ', 
		MONTHNAME(Date_of_Birth), ' ', YEAR(Date_of_Birth), ' has ordered ', 
        COUNT(DISTINCT o.OrderID), ' orders yet.') AS Descrip
FROM Customers AS c
JOIN orders AS o
ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID
ORDER BY DateEntered DESC, CustomerID ASC;

# Question 3 - 
# The company wants to see if the shippers are delivering the orders on weekends or not.
# So for that, they want to see the number of orders delivered on a particular weekday.
# Print DayName, count of orders delivered on that day in the descending order of count of orders.

SELECT DAYNAME(DeliveryDate) AS Weekday, COUNT(OrderID) AS Ord_Cnt
FROM Orders
GROUP BY DAYNAME(DeliveryDate)
ORDER BY Ord_Cnt DESC;

SELECT DAYNAME(DeliveryDate) AS Weekday, COUNT(OrderID) AS Ord_Cnt
FROM Orders
GROUP BY DAYNAME(DeliveryDate)
HAVING Weekday IN ('Saturday', 'Sunday')
ORDER BY Ord_Cnt DESC;

# Question 4 - 
# Print ProductId, ProductName, Sub-Category for of those Products 
# which are having no Sub Category 
# and fill 'No_sub_category' in that place.
# Sort the order in ascending order of ProductId.

SELECT ProductID, product, COALESCE(Sub_Category, 'No_Sub_Category') 
AS Sub_Category
FROM Products
WHERE Sub_Category IS NULL 
ORDER BY ProductID;

# Question 5 - 
# Write a query to find the average revenue for each order whose difference between 
# the order date and ship date is 3.
# Use the total order amount to calculate the revenue. 
# Print the order ID, customer ID, average revenue, 
# and sort them in increasing order of the order ID.

SELECT OrderID, CustomerID, AVG(Total_Order_Amount) AS Avg_Total_Order_Amount
FROM Orders
WHERE DATEDIFF(ShipDate, OrderDate) = 3 
GROUP BY OrderID, CustomerID 
ORDER BY OrderID;

# Question 6 - 
# List the average market price of products supplied by each supplier
# Use Common Table Expression 

SELECT * 
FROM Suppliers;

SELECT * 
FROM Products;

SELECT * 
FROM OrderDetails;

WITH SupplierProducts AS (
	SELECT s.SupplierID, 
    p.ProductID, 
    p.Market_Price
    FROM OrderDetails AS od
    JOIN Products AS p 
    ON od.ProductID = p.ProductID
    JOIN Suppliers AS s 
    ON s.SupplierID = od.SupplierID
    )
SELECT sp.SupplierID,
AVG(sp.Market_Price) AS Average_Market_Price
FROM SupplierProducts AS sp 
GROUP BY sp.SupplierID
ORDER BY sp.SupplierID;

# Question 7 - 
# Get the details of the latest order for each customer
# Use Common Table Expression 

WITH LatestOrders AS (
	SELECT CustomerID, OrderID, OrderDate,
    RANK() OVER (PARTITION BY CustomerID ORDER BY OrderDate DESC) AS rank_
    FROM Orders
    )
SELECT lo.CustomerID, lo.OrderID, lo.OrderDate
FROM LatestOrders AS lo
WHERE lo.rank_ = 1;

# Question 8 -
# Count the number of Suppliers based out of each Country.
# Print the following sentence:
# For Example : if the number of suppliers are more than 1 then print 
# 'There are 100 Suppliers from France' else print 'There is 1 Supplier from France'
# Order the output in ascending order of country.
# Note: All characters are case sensitive.

SELECT CONCAT ('There ',
			   CASE WHEN COUNT(*) = 1 THEN 'is ' ELSE 'are ' END, COUNT(*),
               CASE WHEN COUNT(*) = 1 THEN ' supplier ' ELSE ' suppliers ' END, 
               'from ', Country) AS Supplier_Details 
FROM Suppliers
GROUP BY Country
ORDER BY Country;



