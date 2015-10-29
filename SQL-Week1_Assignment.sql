-- Question 1: Which destination in the flights database is the furthest distance away, based on the information in the flights table?
-- Version 1: Furthest flight in distance (general)
-- SELECT
-- 	origin,
-- 	dest,
-- 	distance
-- FROM flights
-- ORDER BY distance DESC
-- LIMIT 1

-- Version 2: Furthest flight in avg distance
-- SELECT
-- 	AVG(distance) AS 'Avg distance',
-- 	origin,
-- 	dest
-- FROM flights
-- GROUP BY origin, dest
-- ORDER BY distance DESC
-- LIMIT 1



-- Question 2:
-- Part 1: What are the different numbers of engines in the planes table? 
-- SELECT
-- DISTINCT(engines) AS 'Number of engines'
-- FROM planes
-- ORDER BY engines DESC

-- Part 2: For each number of engines, which aircraft have the most number of seats?
-- SELECT
-- engines AS 'Number of engines',
-- manufacturer AS 'Manufacturer',
-- model AS 'Model',
-- MAX(seats) AS 'Number of seats'
-- FROM planes
-- GROUP BY engines
-- ORDER BY engines, seats, manufacturer, model DESC



-- Question 3: Show the total number of flights.
-- SELECT
-- COUNT(flight) AS 'Number of flights'
-- FROM flights



-- Question 4: Show the total number of flights by airline (carrier).
-- SELECT
-- DISTINCT(carrier) AS 'Carrier',
-- COUNT(flight) AS 'Number of flights'
-- FROM flights
-- GROUP BY carrier
-- ORDER BY COUNT(flight) DESC



-- Question 5: Show all of the airlines, ordered by number of flights in descending order.
-- SELECT
-- DISTINCT(carrier) AS 'Carrier',
-- COUNT(flight) AS 'Number of flights'
-- FROM flights
-- GROUP BY carrier
-- ORDER BY COUNT(flight) DESC



-- Question 6: Show only the top 5 airlines, by number of flights, ordered by number of flights in descending order.
-- SELECT
-- DISTINCT(carrier) AS 'Carrier',
-- COUNT(flight) AS 'Number of flights'
-- FROM flights
-- GROUP BY carrier
-- ORDER BY COUNT(flight) DESC
-- LIMIT 5



-- Question 7: Show only the top 5 airlines, by number of flights of distance 1,000 miles or greater, ordered by the number of flights in descending order.
-- SELECT
-- DISTINCT(carrier) AS 'Carrier',
-- COUNT(flight) AS 'Number of flights travelled with >= 1000 miles'
-- FROM flights
-- WHERE distance >= 1000
-- GROUP BY carrier
-- ORDER BY COUNT(flight) DESC
-- LIMIT 5



-- Question 8: Create a question that (a) uses data from the flights database and (b) requires aggregation to answer it, and write down both the question and the query that answers the question.
-- Part 1: How many flights and how far did United Airlines flight 1545 fly?
-- Part 2: Query
SELECT
carrier AS 'Carrier',
COUNT(flight) AS 'Number of flights flown',
SUM(distance) AS 'Miles flown'
FROM flights
WHERE
flight = 1545
AND carrier = 'UA'