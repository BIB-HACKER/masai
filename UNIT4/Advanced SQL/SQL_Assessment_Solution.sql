
# Question 1 : Airport City Abbreviation 
SELECT airport_id, LEFT(City, 3) AS "abbreviation" 
FROM airports 
ORDER BY abbreviation, airport_id;

SELECT airport_id, SUBSTRING(City, 1, 3) AS "abbreviation" 
FROM airports 
ORDER BY abbreviation, airport_id;

# Question 2 : Passenger Full Name
SELECT PassengerId, CONCAT(FirstName, ' ', LastName) AS Full_Name
FROM Passengers
ORDER BY Full_Name, PassengerId;

# Question 3 : Passengers Email Report 
SELECT PassengerId, 
REPLACE(Email, 'gmail.com', 'airmail.com') AS Updated_Email
FROM Passengers 
ORDER BY Updated_Email, PasssengerId;

# Question 4 : Airline Name Anonymization
SELECT name, REPEAT('*', LENGTH(name)) AS StarredName
FROM Airlines
ORDER BY name;

# Question 5 : Flights Departing On Fridays
SELECT flight_id, departure_time
FROM flights
WHERE DAYNAME(departure_time) = 'Friday'
ORDER BY flight_id ASC;

# Question 6 : June Flights By Airline
SELECT flight_id, UPPER(a.Name) AS Airline_Name,
MONTHNAME(f.departure_time) AS Departure_Month
FROM flights AS f
JOIN Airlines AS a 
ON f.airline_id = a.Airline_Code
WHERE MONTHNAME(f.departure_time) = 'June'
ORDER BY Airline_Name DESC, flight_id;

# Question 7 : Airline ICAO Code Report
SELECT Name AS Airline_Name, 
LOWER(ICAO_Code) AS Lower_Case_ICAO_Code
FROM Airlines
ORDER BY ICAO_Code, Airline_Name;

# Question 8 : 
SELECT a.Name AS AirlineName,
GROUP_CONCAT(DISTINCT ap.name ORDER BY ap.name ASC SEPARATOR ', ') AS Airports_Operated,
GROUP_CONCAT(DISTINCT ac.name ORDER BY ac.name ASC SEPARATOR ', ') AS Aircrafts_Used
FROM Airlines AS a
JOIN Flights AS f
ON a.Airline_Code = f.airline_id
JOIN Airports AS ap 
ON f.departure_airport_id = ap.Airport_id
JOIN Aircrafts AS ac 
ON f.airplane_id = ac.Airplane_id
GROUP BY a.Name
ORDER BY a.Name;

# Try CONCAT_WS() as your homework.

# Question 9 : Weekly Flight Activity By Airline
SELECT a1.Name AS Airline_Name,
DAYNAME(f.departure_time) AS Day_of_Week,
COUNT(f.flight_id) AS Flights_Count
FROM Airlines AS al
JOIN Flights AS f 
ON al.Airline_Code = f.airline_id
GROUP BY Airline_Name,
DAYNAME(f.departure_time) 
ORDER BY Flights_Count DESC;

# Question 10 : Average Flight Duration By Aircraft Model And Month
SELECT ac.name AS AircraftModel,
MONTHNAME(f.departure_time) AS Month_,
YEAR(f.departure_time) AS Year_,
AVG(TIMESTAMPDIFF(MINUTE, f.departure_time, f.arrival_time)) AS Avg_Duration
FROM Aircrafts AS ac
JOIN Flights AS f
ON ac.Airplane_Id = f.airplane_id
GROUP BY ac.name, MONTHNAME(f.departure_time), YEAR(f.departure_time)
ORDER BY ac.name, YEAR(f.departure_time), MONTH(f.departure_time), Avg_Duration;

# Question 11 : Monthly Passenger Arrivals By Airport
SELECT a.name AS Aircraft_Model,
MONTHNAME(f.arrival_time) AS Month_,
YEAR(f.arrival_time) AS Year_,
COUNT(DISTINCT p.passenger_id) AS Number_of_Passengers 
FROM Airports AS a
JOIN Flights AS f 
ON a.Airplane_id = f.airplane_id
JOIN bookings AS b 
on f.flight_id = b.flight_id 
JOIN passengers AS p 
ON b.PassengerId = p.Passenger_Id
GROUP BY a.name, MONTHNAME(f.arrival_time), YEAR(f.arrival_time)
ORDER BY a.name, MONTH(f.arrival_time);

# Question 12 : Weekly Revenue By Airline And Departure Day
SELECT a1.Name AS AirlineName,
DAYNAME(f.departure_time) AS Day_of_Week,
SUM(f.ticket_price) AS Total_Revenue
FROM Airlines AS al
JOIN Flights AS f 
ON al.Airline_Code = f.airline_id
GROUP BY a1.Name, DAYNAME(f.departure_time)
ORDER BY Total_Revenue DESC, al.Name, DAYNAME(f.departure_time);

# Question 13 : December Flight Activity And Pricing By Airport
SELECT ap.name AS Airport_Name, 
COUNT(f.flight_id) AS Total_Flights,
AVG(f.ticket_price) AS Avg_Ticket_Price
FROM Airports AS ap 
JOIN Flights AS f
ON ap.Airport_id = f.Departure_airport_id
WHERE MONTHNAME(f.departure_time) = 'December'
GROUP BY ap.name
ORDER BY Avg_Ticket_Price DESC, Total_Flights DESC;

# Question 14 : Sequential Flight Paths And Timings 
WITH FlightPaths AS (
	SELECT f.flight_id,
    ap1.name AS Current_Airport,
    ap2.name AS Next_Airport,
    LEAD(f.departure_time) OVER (PARTITION BY f.airplane_id ORDER BY f.departure_time) AS Next_Flight_Time
    FROM Flights AS f
    JOIN Airports AS ap1
    ON f.departure_airport_id = ap1.airport_id
    JOIN Airports AS ap2
    ON f.arrival_airport_id = ap2.Airport_id
    )

SELECT flight_id, Current_Airport, Next_Airport, Next_Flight_Time
FROM FlightPaths
WHERE Next_Flight_Time IS NOT NULL
ORDER BY flight_id;

# Question 15 : Tracking Fare Increases For Bookings

WITH Ranked_Bookings AS (
	SELECT b.Passengerid,
    b.total_fare,
    LAG(b.total_fare) OVER (PARTITION BY b.Passengerid ORDER BY b.Booking_date) AS Previous_Fare
    FROM Bookings AS b
    )
    
SELECT Passengerid, total_fare AS Latest_Fare, Previous_Fare
FROM Ranked_Bookings
WHERE total_fare > Previous_Fare
ORDER BY Previous_Fare ASC, Latest_Fare ASC, Passengerid;






















