# Selecting the masai database 
USE masai;

# Getting an idea about the orders table
SELECT *
FROM Orders;

# Getitng the number of delivery days 
SELECT *, TIMESTAMPDIFF(DAY, OrderDate, DeliveryDate) AS numb_days
FROM Orders;

# Getitng the number of delivery days 
SELECT *, TIMESTAMPDIFF(WEEK, OrderDate, DeliveryDate) AS numb_week
FROM Orders;

# unit of time can be day, week, month, quarter, year

# Getting the average number of days for delivery
SELECT a.CustomerID, a.FirstName, 
AVG(TIMESTAMPDIFF(DAY, OrderDate, DeliveryDate)) AS avg_delivery_days
FROM Customers AS a
JOIN Orders AS b 
ON a.CustomerID = b.CustomerID
GROUP BY a.CustomerID, a.FirstName
ORDER BY avg_delivery_days DESC;

# Casting the datatype
SELECT CAST('1' AS UNSIGNED) AS output;
SELECT CAST('-1' AS SIGNED) AS output;

SELECT *, 
CAST(TIMESTAMPDIFF(DAY, OrderDate, DeliveryDate) AS SIGNED) AS Num_of_days
FROM Orders; 

SELECT *, 
CAST(TIMESTAMPDIFF(DAY, OrderDate, DeliveryDate) AS UNSIGNED) AS Num_of_days
FROM Orders; 

# Getting an idea about he Customers table 
SELECT * 
FROM Customers;

SELECT CustomerID, FirstName, LastName, 
Date_of_Birth, CAST(Date_of_Birth AS DATE) AS DOB
FROM Customers;

# CONCAT(), CONVERT()
SELECT CONCAT(CAST(1 AS NCHAR), ' plus ', CAST(2 AS NCHAR), ' is three.')
AS output;

SELECT CONCAT(CONVERT(1, NCHAR), ' plus ', CONVERT(2, NCHAR), ' is three.')
AS output;

# Write a statement for every customer - 
# Syntax -> 'The total amount spent by Customer A is 1000.'

SELECT a.CustomerID, CONCAT(a.FirstName, ' ', a.LastName) AS Full_Name,
SUM(total_order_amount) AS total_amount 
FROM Customers AS a
JOIN Orders AS b 
ON a.CustomerID = b.CustomerID 
GROUP BY a.CustomerID, CONCAT(a.FirstName, ' ', a.LastName);

SELECT CONCAT('The total amount spent by ', Full_Name, ' is ', total_amount) 
AS output
FROM (
	SELECT a.CustomerID, CONCAT(a.FirstName, ' ', a.LastName) AS Full_Name,
	SUM(total_order_amount) AS total_amount 
	FROM Customers AS a
	JOIN Orders AS b 
	ON a.CustomerID = b.CustomerID 
	GROUP BY a.CustomerID, CONCAT(a.FirstName, ' ', a.LastName)) AS t;

# Filtering based on CAST/CONVERT
SELECT a.CustomerID, CONCAT(a.FirstName, ' ', a.LastName) AS Full_Name,
SUM(total_order_amount) AS total_amount 
FROM Customers AS a
JOIN Orders AS b 
ON a.CustomerID = b.CustomerID 
GROUP BY a.CustomerID, CONCAT(a.FirstName, ' ', a.LastName)
HAVING CAST(SUM(total_order_amount) AS NCHAR) LIKE '30%';

# IFNULL, COALESCE -> Dealing with NULL values 
SELECT COALESCE(NULL, NULL, 2, 'MySQL') AS output;
SELECT IFNULL(NULL, 2) AS output;
SELECT IFNULL(1, 2) AS output;

# COALESCE -> Returns the first non-null entry (Selection)
# IFNULL -> Replaces the null value with the given entry (Replacement)

# Getting an idea about customers table
SELECT * FROM Customers;

# Insertign the data into Customers table
INSERT INTO Customers (CustomerID, FirstName, City)
VALUES 
(1, 'Prateek', 'Bangalore');

# Getting an idea about customers table
SELECT * FROM Customers;

# Query 
SELECT CONCAT(FirstName, ' ', LastName) AS Full_Name 
FROM Customers;

SELECT CONCAT(FirstName, ' ', COALESCE(LastName, '')) AS Full_Name 
FROM Customers;

SELECT CONCAT(FirstName, ' ', IFNULL(LastName, '')) AS Full_Name 
FROM Customers;

# String Functions 

# Substring 
SELECT CONCAT('The first 3 letters in the name of ',
FirstName, ' are ', SUBSTRING(FirstName, 1, 3)) AS output 
FROM Customers;

# Length Function
SELECT FirstName, LENGTH(FirstName) AS numb_characters 
FROM Customers;

# Question -> Sort the data according to 3 right most characters of the firstname.
SELECT FirstName
FROM Customers
ORDER BY SUBSTRING(FirstName, LENGTH(FirstName)-2, LENGTH(FirstName));

# RIGHT 
SELECT FirstName
FROM Customers
ORDER BY RIGHT(FirstName, 3);

# LEFT 
SELECT FirstName
FROM Customers
ORDER BY LEFT(FirstName, 3);

# REPLACE() 
SELECT REPLACE(FirstName, 'a', 'A') AS output
FROM Customers;

SELECT REPLACE('Hello World!', 'Hello ', '') AS output;

# TRIM() 
SELECT TRIM('		There are a lot of empty spaces.		') AS output;
SELECT LTRIM('		There are a lot of empty spaces.		') AS output;
SELECT RTRIM('		There are a lot of empty spaces.		') AS output;

# UPPER() and LOWER() 
SELECT LOWER(FirstName) AS FirstName, UPPER(LastName) AS LastName
FROM Customers;

# REVERSE() -> Palindromes
SELECT FirstName 
FROM Customers 
WHERE FirstName = REVERSE(FirstName);

# REPEAT() 
SELECT REPEAT('0', 5) AS output;

SELECT CONCAT(REPEAT('0', 5), SUBSTRING(FirstName, 1, 3),
CAST(CustomerID AS NCHAR),
SUBSTRING(LastName, 1, 4), REPEAT('1', 3)) AS output
FROM Customers;

# POSITION() 
SELECT POSITION('Hello' IN 'This is a Hello World program') AS output;
SELECT POSITION('hi' IN 'This is a Hello World program') AS output;



