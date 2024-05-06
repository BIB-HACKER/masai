# Selecting the masai database 
USE masai;

# Getting an idea about the sales data
SELECT * 
FROM Sales;

# Get the maximum out of 2 previous, current and 1 following month
SELECT MONTHNAME(Month_) AS Month_Name, Sales,
MAX(Sales) OVER (ORDER BY Month_ ROWS BETWEEN 2 PRECEDING AND 1 FOLLOWING) AS Max_Sales
FROM Sales;

# Get the minimum out of 2 previous, current and 1 following month
SELECT MONTHNAME(Month_) AS Month_Name, Sales,
MIN(Sales) OVER (ORDER BY Month_ ROWS BETWEEN 2 PRECEDING AND 1 FOLLOWING) AS Min_Sales
FROM Sales;

# Get all the columns from Orders Table along with 
# the average order amount for every customer sorted by order date among 4 previous and 1 next date and
# the number of orders for every customer sorted by order date among 4 previous and 1 next date

SELECT *
FROM Orders;

SELECT *, AVG(Total_order_amount) OVER (PARTITION BY CustomerID ORDER BY OrderDate
ROWS BETWEEN 4 PRECEDING AND 1 FOLLOWING) AS 'avg_order_amount',
COUNT(*) OVER (PARTITION BY CustomerID ORDER BY OrderDate
ROWS BETWEEN 4 PRECEDING AND 1 FOLLOWING) AS 'orders_count'
FROM Orders;

# Stored Procedures 

SELECT * 
FROM Customers
WHERE City LIKE 'New York';

SELECT * 
FROM Customers
WHERE City LIKE 'Berlin';

# Creating a stored procedure
DELIMITER $$
CREATE PROCEDURE procedure_1 (IN CityName VARCHAR(30))
BEGIN 
SELECT * 
FROM Customers 
WHERE City LIKE CityName;
END$$

DELIMITER ;

# Creating a stored procedure
DELIMITER //
CREATE PROCEDURE procedure_2 (IN CityName VARCHAR(30))
BEGIN 
SELECT * 
FROM Customers 
WHERE City LIKE CityName;
END//

DELIMITER ;

# Using a stored procedure
CALL procedure_1('New York');
CALL procedure_2('Berlin');
CALL procedure_2('Melbourne');

# Create a stored procedure 
# Input -> order_amount, weekday 

DELIMITER $$ 
CREATE PROCEDURE Orders_Weekday_Proc 
(IN order_amount FLOAT, weekday VARCHAR(30))
BEGIN 
SELECT *, DAYNAME(OrderDate) AS week_day 
FROM Orders
WHERE Total_order_amount > order_amount AND 
DAYNAME(OrderDate) LIKE weekday;
END $$

DELIMITER ;

# Calling the procedure 
CALL Orders_Weekday_Proc(9000, 'Sunday');
CALL Orders_Weekday_Proc(5000, 'Thursday');

# Getting an idea about the tables 
SELECT * 
FROM products_prices;

SELECT * 
FROM products_owned;

# CASE WHEN Statements 
SELECT Product,
(CASE WHEN Year = 2012 THEN Price END) AS '2012',
(CASE WHEN Year = 2013 THEN Price END) AS '2013',
(CASE WHEN Year = 2014 THEN Price END) AS '2014',
(CASE WHEN Year = 2015 THEN Price END) AS '2015',
(CASE WHEN Year = 2016 THEN Price END) AS '2016'
FROM products_prices;

SELECT Product,
(CASE WHEN Year = 2012 THEN Price END) AS '2012',
(CASE WHEN Year = 2013 THEN Price END) AS '2013',
(CASE WHEN Year = 2014 THEN Price END) AS '2014',
(CASE WHEN Year = 2015 THEN Price END) AS '2015',
(CASE WHEN Year = 2016 THEN Price END) AS '2016'
FROM products_prices
ORDER BY product;

SELECT Product,
(CASE WHEN Year = 2012 THEN Price END) AS '2012',
(CASE WHEN Year = 2013 THEN Price END) AS '2013',
(CASE WHEN Year = 2014 THEN Price END) AS '2014',
(CASE WHEN Year = 2015 THEN Price END) AS '2015',
(CASE WHEN Year = 2016 THEN Price END) AS '2016'
FROM products_prices
WHERE Product = 'Apple IPhone'
ORDER BY product;

# Aggregating with SUM() 
SELECT Product,
SUM(CASE WHEN Year = 2012 THEN Price END) AS '2012',
SUM(CASE WHEN Year = 2013 THEN Price END) AS '2013',
SUM(CASE WHEN Year = 2014 THEN Price END) AS '2014',
SUM(CASE WHEN Year = 2015 THEN Price END) AS '2015',
SUM(CASE WHEN Year = 2016 THEN Price END) AS '2016'
FROM products_prices
GROUP BY product
ORDER BY product;

# Aggregating with MAX() 
SELECT Product,
MAX(CASE WHEN Year = 2012 THEN Price END) AS '2012',
MAX(CASE WHEN Year = 2013 THEN Price END) AS '2013',
MAX(CASE WHEN Year = 2014 THEN Price END) AS '2014',
MAX(CASE WHEN Year = 2015 THEN Price END) AS '2015',
MAX(CASE WHEN Year = 2016 THEN Price END) AS '2016'
FROM products_prices
GROUP BY product
ORDER BY product;

# CASE WHEN Statement 
SELECT Year,
(CASE WHEN Product = 'Apple IPhone' THEN Price END) AS 'Apple IPhone',
(CASE WHEN Product = 'Samsung Note 3' THEN Price END) AS 'Samsung Note 3',
(CASE WHEN Product = 'One Plus 5' THEN Price END) AS 'One Plus 5',
(CASE WHEN Product = 'Sony Xperia Z' THEN Price END) AS 'Sony Xperia Z'
FROM products_prices
ORDER BY Year;

SELECT Year,
SUM(CASE WHEN Product = 'Apple IPhone' THEN Price END) AS 'Apple IPhone',
SUM(CASE WHEN Product = 'Samsung Note 3' THEN Price END) AS 'Samsung Note 3',
SUM(CASE WHEN Product = 'One Plus 5' THEN Price END) AS 'One Plus 5',
SUM(CASE WHEN Product = 'Sony Xperia Z' THEN Price END) AS 'Sony Xperia Z'
FROM products_prices
GROUP BY Year
ORDER BY Year;

# Getting an idea about the table 
SELECT * 
FROM products_owned;

SELECT Name, Phone_Number,
(CASE WHEN Product_Owned = 'iPhone' THEN Price END) AS 'iPhone',
(CASE WHEN Product_Owned = 'Gshock' THEN Price END) AS 'Gshock',
(CASE WHEN Product_Owned = 'Rolex' THEN Price END) AS 'Rolex',
(CASE WHEN Product_Owned = 'S22 Ultra' THEN Price END) AS 'S22 Ultra',
(CASE WHEN Product_Owned = 'Pixel 4' THEN Price END) AS 'Pixel 4',
(CASE WHEN Product_Owned = 'Galaxy Watch' THEN Price END) AS 'Galaxy Watch'
FROM Products_Owned;

SELECT Name, Phone_Number,
SUM(CASE WHEN Product_Owned = 'iPhone' THEN Price END) AS 'iPhone',
SUM(CASE WHEN Product_Owned = 'Gshock' THEN Price END) AS 'Gshock',
SUM(CASE WHEN Product_Owned = 'Rolex' THEN Price END) AS 'Rolex',
SUM(CASE WHEN Product_Owned = 'S22 Ultra' THEN Price END) AS 'S22 Ultra',
SUM(CASE WHEN Product_Owned = 'Pixel 4' THEN Price END) AS 'Pixel 4',
SUM(CASE WHEN Product_Owned = 'Galaxy Watch' THEN Price END) AS 'Galaxy Watch'
FROM Products_Owned
GROUP BY Name, Phone_Number
ORDER BY Name;

# CTE Practice Problems 
# Find all products that have never been ordered and are from inactive category
# Tables -> Category, Products, OrderDetails

SELECT * 
FROM Category;

SELECT * 
FROM Products;

SELECT * 
FROM OrderDetails;

WITH InactiveCategories AS (
	SELECT CategoryID
    FROM Category 
    WHERE Active LIKE '%No%'
    ),
    UnorderedProducts AS (
    SELECT ProductID 
    FROM Products 
    WHERE ProductID NOT IN (SELECT ProductID FROM OrderDetails)
    )
SELECT p.ProductID, p.Product
FROM Products AS p 
JOIN InactiveCategories AS ic On p.Category_ID = ic.CategoryID
JOIN UnorderedProducts AS up ON up.ProductID = p.ProductID;

# List the average market price of products supplied by each supplier
# Tables - Suppliers, Products

SELECT * 
FROM Products;

WITH SupplierProducts AS (
	SELECT s.SupplierID,
    p.ProductID, p.Market_Price
    FROM Suppliers AS s
    JOIN OrderDetails AS od
    ON s.SupplierID = od.SupplierID
    JOIN Products AS p
    ON od.ProductID = p.ProductID
    )
    
SELECT sp.SupplierID, AVG(sp.Market_Price) AS avg_market_price
FROM SupplierProducts AS sp
GROUP BY sp.SupplierID
ORDER BY sp.SupplierID;











