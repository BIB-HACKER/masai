USE s2d2_assignment;

-- 1. Print the name of the employee and the company he/she works for:
SELECT first_name, last_name, companyID FROM emplyees_859382 JOIN company_949904 ON emplyees_859382.companyID = company_949904.id;

-- 2. Retrieve the names and countries of all companies along with the total number of employees in each company
SELECT company, country, COUNT(*) AS total_emplyees FROM emplyees_859382 JOIN company_949904 ON emplyees_859382.companyID = company_949904.id GROUP BY company, country;

-- 3. Print the name of the company and the average salary of that company
SELECT company, AVG(salary) AS average_salary FROM emplyees_859382 JOIN company_949904 ON emplyees_859382.companyID = company_949904.id GROUP BY company;

-- 4. Print the name of the company and the highest salary of that company
SELECT company, MAX(salary) AS highest_salary FROM emplyees_859382 JOIN company_949904 ON emplyees_859382.companyID = company_949904.id GROUP BY company;

-- 5. Print all the company and all the department in that company
SELECT company, department FROM emplyees_859382 JOIN company_949904 ON emplyees_859382.companyID = company_949904.id;

-- 6. Print the name of the company and the number of employee in that company
SELECT company, COUNT(*) AS total_emplyees FROM emplyees_859382 JOIN company_949904 ON emplyees_859382.companyID = company_949904.id GROUP BY company;

-- 7. Print the name of the company and the highest salary of each department
SELECT company, department, MAX(salary) AS highest_salary FROM emplyees_859382 JOIN company_949904 ON emplyees_859382.companyID = company_949904.id GROUP BY company, department;

-- 8. Print the company name who have the highest number of employess whose name starts with the letter "S"
SELECT company FROM emplyees_859382 JOIN company_949904 ON emplyees_859382.companyID = company_949904.id WHERE first_name LIKE 'S%' GROUP BY company ORDER BY COUNT(*) DESC LIMIT 1;

-- 9. Print all departments and their average salary
SELECT department, AVG(salary) AS average_salary FROM emplyees_859382 GROUP BY department;

-- 10. Print the company name and the employes's full name.full name will be like firstName+" "+lastName
SELECT company, CONCAT(first_name, ' ', last_name) AS emplyee_name FROM emplyees_859382 JOIN company_949904 ON emplyees_859382.companyID = company_949904.id;

