-- Description
-- Find the airports where the total number of flights arriving is higher than the total number of flights departing.
-- Include the airport name and the difference in flight counts. Sort the Output in descending order of flight_count_difference.
-- For the same number of flight counts sort the output in the alphabetical order of airport name Print airport_name, flight-count_difference


SELECT 
    A.name AS name,
    (AF.ArrivingFlights - DF.DepartingFlights) AS flight_count_difference
FROM 
    (
        SELECT 
            arrival_airport_id,
            COUNT(*) AS ArrivingFlights
        FROM 
            Flights
        GROUP BY 
            arrival_airport_id
    ) AS AF
JOIN
    (
        SELECT 
            departure_airport_id,
            COUNT(*) AS DepartingFlights
        FROM 
            Flights
        GROUP BY 
            departure_airport_id
    ) AS DF ON AF.arrival_airport_id = DF.departure_airport_id
JOIN
    Airports A ON A.Airport_id = AF.arrival_airport_id
WHERE 
    AF.ArrivingFlights > DF.DepartingFlights
ORDER BY 
    flight_count_difference DESC,
    A.name;

