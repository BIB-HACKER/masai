# Selecting the masai database 
USE masai;

# Getting an idea about the number of customers from different cities
SELECT Country, COUNT(*) AS Number_of_Customers
FROM Customers
GROUP BY Country;

# Getting an idea about the customers table
SELECT * 
FROM Customers;

# Window Functions 
SELECT *, COUNT(*) OVER(PARTITION BY Country) AS Number_of_People
FROM Customers;

# Getting an idea about orders table 
SELECT * 
FROM Orders;

# Getting all the details along with the number of orders that the customers made
SELECT *, COUNT(*) OVER(PARTITION BY CustomerID) AS Number_of_Orders
FROM Orders;

# Getting the first order for all the customers 
SELECT *, MIN(OrderDate) OVER(PARTITION BY CustomerID) AS First_Order_Date
FROM Orders;

# Mixing Subqueries with Window Functions 
SELECT *
FROM 
	(SELECT *, 
    MIN(OrderDate) OVER (PARTITION BY CustomerID) AS First_Order_Date
    FROM Orders)
    AS c;

SELECT CustomerID, OrderDate, COUNT(*) AS Num_Orders_on_First_Day
FROM (
	SELECT *
	FROM (
		SELECT *, 
		MIN(OrderDate) OVER (PARTITION BY CustomerID) AS First_Order_Date
		FROM Orders) AS c
	WHERE OrderDate = First_Order_Date) AS f
GROUP BY CustomerID, OrderDate
ORDER BY COUNT(*) DESC;

# Rank() Function 
SELECT *, 
RANK() OVER (PARTITION BY CustomerID ORDER BY Total_Order_Amount DESC) AS ranking
FROM Orders;

SELECT *, 
RANK() OVER (PARTITION BY CustomerID ORDER BY Total_Order_Amount ASC) AS ranking
FROM Orders;

# Getting the first order of every customer
SELECT *
FROM (
	SELECT *,
    RANK() OVER (PARTITION BY CustomerID ORDER BY OrderDate ASC) AS ranking
    FROM Orders) AS f 
WHERE ranking = 1;

# Dense_Rank() Function 
SELECT *, 
DENSE_RANK() OVER (PARTITION BY CustomerID ORDER BY Total_Order_Amount DESC) AS ranking
FROM Orders;

SELECT *, 
DENSE_RANK() OVER (PARTITION BY CustomerID ORDER BY Total_Order_Amount ASC) AS ranking
FROM Orders;

# Row_Number() 
SELECT *,
ROW_NUMBER() OVER (ORDER BY DateEntered DESC) AS serial_number
FROM Customers;

SELECT *,
ROW_NUMBER() OVER (PARTITION BY CustomerID ORDER BY DateEntered DESC) AS serial_number
FROM Customers;

# Getting an idea about YearSales
SELECT * 
FROM YearSales;

SELECT * 
FROM Students;

# Get all the columns from students table 
# along with rank given to the rows according to marks in desc order
SELECT *, RANK() OVER (ORDER BY Marks DESC) AS rank_ 
FROM Students;

# Get all the columns from students table along with
# rank given to the rows according to marks for every class in desc order
SELECT *, RANK() OVER (PARTITION BY class ORDER BY Marks DESC) AS rank_ 
FROM Students;

# Getting all the columns from students table along with 
# 2 columns, 1 for rank and 1 for dense_rank 
# according to marks for every class in desc order
SELECT *, RANK() OVER (PARTITION BY class ORDER BY Marks DESC) AS rank_,
DENSE_RANK() OVER (PARTITION BY class ORDER BY Marks DESC) AS dense_rank_
FROM Students;

# Getting the first and second ranked students from each class (Using CTE)
WITH cte AS (
	SELECT *, RANK() OVER (PARTITION BY class ORDER BY marks DESC) AS rank_
    FROM Students)

SELECT *
FROM cte
WHERE rank_ < 3;

# Allocate row_number() depending on marks in descending order
SELECT *, ROW_NUMBER() OVER (ORDER BY marks DESC) AS row_numb
FROM Students;

# Allocate row_number() depending on marks in descending order for eavery class
SELECT *, ROW_NUMBER() OVER (PARTITION BY class ORDER BY marks DESC) AS row_numb
FROM Students;















