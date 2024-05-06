# Selecting the masai database 
USE masai;

# NTILE -> after sorting/partitioning the data, 
# if we want to create groups/buckets

SELECT COUNT(*) AS Numb
FROM Students;

SELECT *, NTILE(2) OVER (ORDER BY Marks DESC) AS Bucket_Number
FROM Students;

SELECT *, NTILE(3) OVER (ORDER BY Marks DESC) AS Bucket_Number
FROM Students;

# If the number of rows are not divisible perfectly by the number of buckets
# then the first bucket get the maximum data points.

# Using partition by clause 
SELECT *, NTILE(2) OVER (PARTITION BY Class ORDER BY Marks DESC) AS Bucket_Number
FROM Students;

# LEAD() & LAG()
SELECT * 
FROM YearSales;

SELECT *, LAG(Sales) OVER (ORDER BY Year, Quarter) AS Previous_Sales
FROM YearSales;

# Since 2011 is the first year, we are getting NULL entry for previous sales

# Using Partition By
SELECT *, LAG(Sales) OVER (PARTITION BY Year ORDER BY Year, Quarter) AS Previous_Sales
FROM YearSales;

# Since, you have partitioned the data, you would be getting 
# the first quarter's data as NULL for every year

# LEAD()
SELECT *, LEAD(Sales) OVER (ORDER BY Year, Quarter) AS Next_Sales
FROM YearSales;

# Since 2nd quarter of 2014 is the last entry, 
# we are getting NULL entry for next sales

SELECT *, 
LEAD(Sales) OVER (PARTITION BY Year ORDER BY Year, Quarter) AS Next_Sales
FROM YearSales;

# Since, you have partitioned the data, you would be getting 
# the last quarter's data as NULL for every year

# Modifying the spacing and null entry 
SELECT *, 
LEAD(Sales, 1, 0) OVER (PARTITION BY Year ORDER BY Year, Quarter) AS Next_Sales
FROM YearSales;

# 1 -> Spacing
# 0 -> Value with which null entries are replaced

SELECT *, 
LEAD(Sales, 2, 0) OVER (PARTITION BY Year ORDER BY Year, Quarter) AS Next_Sales
FROM YearSales;

# 2 -> Spacing

# Cumulative SM, AVG using WINDOW Functions 
# ROW Manipulations in WINDOW Functions 

SELECT * 
FROM Sales;

# Query 
SELECT *, SUM(Sales) OVER() AS total_sales
FROM Sales;

SELECT MONTHNAME(Month_) AS Month, Sales,
SUM(Sales) OVER (ORDER BY Month_) AS cum_sum
FROM Sales;

SELECT *,
SUM(Total_Order_Amount) OVER (PARTITION BY CustomerID ORDER BY OrderDate) AS cum_sales_for_each_customer
FROM Orders;

# AVG() 
SELECT MONTHNAME(Month_) AS Month_Name, Sales, AVG(Sales) OVER (ORDER BY Month_) AS cum_avg
FROM Sales;

# Question 
SELECT *,
AVG(Total_Order_Amount) OVER (PARTITION BY CustomerID ORDER BY OrderDate) AS avg_sales
FROM Orders;

# 3 months rolling sum 
SELECT MONTHNAME(Month_) AS Month_Name, Sales,
SUM(Sales) OVER (ORDER BY Month_ ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS '3_Month_Rolling_Sum'
FROM Sales;

# 3 months rolling sum 
SELECT MONTHNAME(Month_) AS Month_Name, Sales,
SUM(Sales) OVER (ORDER BY Month_ ROWS 2 PRECEDING) AS '3_Month_Rolling_Sum'
FROM Sales;

# 3 months rolling avg 
SELECT MONTHNAME(Month_) AS Month_Name, Sales,
AVG(Sales) OVER (ORDER BY Month_ ROWS 2 PRECEDING) AS '3_Months_Rolling_Avg'
FROM Sales;

# 3 months future average
SELECT MONTHNAME(Month_) AS Month_Name, Sales,
AVG(Sales) OVER (ORDER BY Month_ ROWS BETWEEN 1 FOLLOWING AND 3 FOLLOWING) AS '3_Months_Rolling_Avg'
FROM Sales;

# 3 months future average
SELECT MONTHNAME(Month_) AS Month_Name, Sales,
AVG(Sales) OVER (ORDER BY Month_ ROWS BETWEEN CURRENT ROW AND 2 FOLLOWING) AS '3_Months_Rolling_Avg'
FROM Sales;

# 4 months future average (1 previous and 2 next)
SELECT MONTHNAME(Month_) AS Month_Name, Sales,
AVG(Sales) OVER (ORDER BY Month_ ROWS BETWEEN 1 PRECEDING AND 2 FOLLOWING) AS '4_Months_Rolling_Avg'
FROM Sales;

# Reverse Cumulative Sum 
SELECT MONTHNAME(Month_) AS 'Month', Sales,
COUNT(*) OVER (ORDER BY Month_ ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) 
AS 'Count',
SUM(Sales) OVER (ORDER BY Month_ ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) 
AS 'Reverse_Cum_Sum'
FROM Sales
ORDER BY MONTH(Month_);

# Cumulative Sum
SELECT MONTHNAME(Month_) AS 'Month', Sales,
COUNT(*) OVER (ORDER BY Month_ ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) 
AS 'Count',
SUM(Sales) OVER (ORDER BY Month_ ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) 
AS 'Cum_Sum'
FROM Sales
ORDER BY MONTH(Month_);

# CTE Practice Problems 
# Calculate the total amount spent by each customer on orders 
# Columns -> FirstName, LastName, Total Spent

WITH CustomerSpending AS (
	SELECT CustomerID, SUM(Total_order_amount) AS TotalSpent
    FROM Orders
    GROUP BY CustomerID
    )
SELECT c.FirstName, c.LastName, cs.TotalSpent 
FROM Customers AS c
JOIN CustomerSpending AS cs
ON c.CustomerID = cs.CustomerID;











