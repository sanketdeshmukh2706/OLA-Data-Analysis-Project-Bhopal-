-- 🚖 OLA Data Analysis Project (Bhopal)
-- Author: Sanket Deshmukh

-- 🔧 Create Database
CREATE DATABASE Ola;
USE Ola;

-- =====================================================
-- 🔍 SQL Analysis Queries
-- =====================================================

-- 1️⃣ Retrieve all successful bookings
CREATE VIEW Successful_Bookings AS
SELECT * 
FROM bookings
WHERE `Booking Status` = 'Successful';


-- 2️⃣ Average ride distance for each vehicle type
CREATE VIEW AVG_distance_for_each_vehicle AS
SELECT `Vehicle Type`, AVG(`Ride Distance`) AS avg_distance
FROM bookings
GROUP BY `Vehicle Type`;


-- 3️⃣ Total cancelled rides by customers
CREATE VIEW Cancelled_ride_by_customers AS
SELECT SUM(`Cancelled Rides by Customer`) AS total_cancelled_rides
FROM bookings;


-- 4️⃣ Top 5 customers by number of rides
CREATE VIEW top_5_customers AS
SELECT `Customer ID`, COUNT(`Booking ID`) AS total_rides
FROM bookings
GROUP BY `Customer ID`
ORDER BY total_rides DESC
LIMIT 5;


-- 5️⃣ Driver cancellations (personal & car issues)
CREATE VIEW cancelled_by_drivers_due_personal_and_car_related_issues AS
SELECT COUNT(*) AS total_cancelled
FROM bookings
WHERE `Cancelled Rides by Driver` = 'Personal & Car related issues';


-- 6️⃣ Max & Min driver ratings (Prime Sedan)
CREATE VIEW max_and_min_rating_for_prime_sedan AS
SELECT 
    MAX(`Driver Ratings`) AS max_rating,
    MIN(`Driver Ratings`) AS min_rating
FROM bookings
WHERE `Vehicle Type` = 'Prime Sedan'
AND `Driver Ratings` != 'NA';


-- 7️⃣ Retrieve all rides where payment was made using UPI
CREATE VIEW payment_by_upi AS
SELECT * 
FROM bookings
WHERE `Payment Method` = 'UPI';


-- 8️⃣ Average customer rating per vehicle type
CREATE VIEW avg_rating_per_vehicle_type AS
SELECT `Vehicle Type`, AVG(`Customer Rating`) AS avg_rating
FROM bookings
GROUP BY `Vehicle Type`;


-- 9️⃣ Total booking value of successful rides
CREATE VIEW total_ride_complete_successfully AS
SELECT SUM(`Booking Value`) AS total_booking_value
FROM bookings
WHERE `Booking Status` = 'Successful';


-- 🔟 Incomplete rides with reason
CREATE VIEW all_incomplete_rides_with_reason AS
SELECT `Booking ID`, `Incomplete Rides Reason`
FROM bookings
WHERE `Incomplete Rides` = 'Yes'
AND `Incomplete Rides Reason` != 'NA';


-- =====================================================
-- 📊 To View Results (Optional)
-- =====================================================

-- SELECT * FROM Successful_Bookings;
-- SELECT * FROM AVG_distance_for_each_vehicle;
-- SELECT * FROM Cancelled_ride_by_customers;
-- SELECT * FROM top_5_customers;
-- SELECT * FROM cancelled_by_drivers_due_personal_and_car_related_issues;
-- SELECT * FROM max_and_min_rating_for_prime_sedan;
-- SELECT * FROM payment_by_upi;
-- SELECT * FROM avg_rating_per_vehicle_type;
-- SELECT * FROM total_ride_complete_successfully;
-- SELECT * FROM all_incomplete_rides_with_reason;