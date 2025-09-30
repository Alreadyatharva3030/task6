

SELECT passenger_name,
    (SELECT COUNT(*) 
     FROM Bookings b 
     WHERE b.passenger_id = p.passenger_id) AS total_bookings
FROM Passengers p;


SELECT passenger_name
FROM Passengers
WHERE passenger_id IN (
    SELECT passenger_id
    FROM Bookings b
    JOIN Flights f ON b.flight_id = f.flight_id
    WHERE f.departure_year = 2023
);


SELECT passenger_name
FROM Passengers p
WHERE (SELECT COUNT(*) 
       FROM Bookings b 
       WHERE b.passenger_id = p.passenger_id) > 1;
       
       
       SELECT passenger_name
FROM Passengers p
WHERE EXISTS (
    SELECT 1
    FROM Bookings b
    WHERE b.passenger_id = p.passenger_id
);



SELECT f.flight_name, booking_count
FROM (SELECT flight_id, COUNT(*) AS booking_count
    FROM Bookings
    GROUP BY flight_id) AS sub
JOIN Flights f ON f.flight_id = sub.flight_id
ORDER BY booking_count DESC
LIMIT 1;


