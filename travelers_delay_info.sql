use ads507airlines;

-- Yearly overview for each carrier
#2018
CREATE VIEW yearly_delay2018 AS
SELECT * 
FROM (
	SELECT a.name, f.carrier, origin, count(f.carrier) AS yearly_flight_count, AVG(f.dep_delay + f.arr_delay) as total_delay
	FROM flights_all2018 f
	JOIN airlines_all2018 a
		ON f.carrier = a.carrier
	GROUP BY a.name, f.carrier, origin
    ORDER BY f.origin, count(f.carrier) desc) as year2018;

#2019
CREATE VIEW yearly_delay2019 AS
SELECT * 
FROM (
	SELECT a.name, f.carrier, origin, count(f.carrier) AS yearly_flight_count,AVG(f.dep_delay + f.arr_delay) as total_delay
	FROM flights_all2019 f
	JOIN airlines_all2019 a
		ON f.carrier = a.carrier
	GROUP BY a.name, f.carrier, origin
    ORDER BY f.origin, count(f.carrier) desc) as year2019;
    
#2020
CREATE VIEW yearly_delay2020 AS
SELECT * 
FROM (
	SELECT a.name, f.carrier, origin, count(f.carrier) AS yearly_flight_count,AVG(f.dep_delay + f.arr_delay) as total_delay
	FROM flights_all2020 f
	JOIN airlines_all2020 a
		ON f.carrier = a.carrier
	GROUP BY a.name, f.carrier, origin
    ORDER BY f.origin, count(f.carrier) desc) as year2020;

#2021
CREATE VIEW yearly_delay2021 AS
SELECT * 
FROM (
	SELECT a.name, f.carrier, origin,count(f.carrier) AS yearly_flight_count,AVG(f.dep_delay + f.arr_delay) as total_delay
	FROM flights_all2021 f
	JOIN airlines_all2021 a
		ON f.carrier = a.carrier
	GROUP BY a.name, f.carrier, origin
    ORDER BY f.origin, count(f.carrier) desc) as year2021;
    
#2022
CREATE VIEW yearly_delay2022 AS
SELECT * 
FROM (
	SELECT a.name, f.carrier, origin, count(f.carrier) AS yearly_flight_count,AVG(f.dep_delay + f.arr_delay) as total_delay
	FROM flights_all2022 f
	JOIN airlines_all2022 a
		ON f.carrier = a.carrier
	GROUP BY a.name, f.carrier, origin
    ORDER BY f.origin, count(f.carrier) desc) as year2022;

--  Average delay times for major US holidays
#2018
CREATE VIEW holidays_2018 AS
SELECT *
FROM (
		SELECT 'New Year\'s Day' AS Holiday, CONCAT(f.year,'/',f.month,'/', f.day) AS Date,  AVG(f.dep_delay) AS Ave_Depart_Delay, AVG(f.arr_delay) AS Ave_Arriv_Delay, count(*) AS Total_Flights
		FROM flights_all2018 f
		WHERE f.month = 01 AND f.day = 01
		GROUP BY f.year, f.month, f.day) AS newyears_2018
UNION ALL (
		SELECT 'Memorial Day' AS Holiday, CONCAT(f.year,'/',f.month,'/', f.day) AS Date, AVG(f.dep_delay) AS Ave_Depart_Delay, AVG(f.arr_delay) AS Ave_Arriv_Delay, count(*) AS Total_Flights
		FROM flights_all2018 f
		WHERE f.month = 05 AND f.day = 28
		GROUP BY f.year, f.month, f.day)
UNION ALL (
		SELECT 'Independence Day' AS Holiday, CONCAT(f.year,'/',f.month,'/', f.day) AS Date, AVG(f.dep_delay) AS Ave_Depart_Delay, AVG(f.arr_delay) AS Ave_Arriv_Delay, count(*) AS Total_Flights
		FROM flights_all2018 f
		WHERE f.month = 07 AND f.day = 04
		GROUP BY f.year, f.month, f.day)
UNION ALL (
		SELECT 'Veterans Day' AS Holiday, CONCAT(f.year,'/',f.month,'/', f.day) AS Date, AVG(f.dep_delay) AS Ave_Depart_Delay, AVG(f.arr_delay) AS Ave_Arriv_Delay, count(*) AS Total_Flights
		FROM flights_all2018 f
		WHERE f.month = 11 AND f.day = 11
		GROUP BY f.year, f.month, f.day)
UNION ALL (
		SELECT 'Thanksgiving Eve' AS Holiday, CONCAT(f.year,'/',f.month,'/', f.day) AS Date, AVG(f.dep_delay) AS Ave_Depart_Delay, AVG(f.arr_delay) AS Ave_Arriv_Delay, count(*) AS Total_Flights
		FROM flights_all2018 f
		WHERE f.month = 11 AND f.day = 21
		GROUP BY f.year, f.month, f.day)    
UNION ALL (
		SELECT 'Thanksgiving Day' AS Holiday, CONCAT(f.year,'/',f.month,'/', f.day) AS Date, AVG(f.dep_delay) AS Ave_Depart_Delay, AVG(f.arr_delay) AS Ave_Arriv_Delay, count(*) AS Total_Flights
		FROM flights_all2018 f
		WHERE f.month = 11 AND f.day = 22
		GROUP BY f.year, f.month, f.day)         
UNION ALL (
		SELECT 'Christmas Eve' AS Holiday, CONCAT(f.year,'/',f.month,'/', f.day) AS Date, AVG(f.dep_delay) AS Ave_Depart_Delay, AVG(f.arr_delay) AS Ave_Arriv_Delay, count(*) AS Total_Flights
		FROM flights_all2018 f
		WHERE f.month = 12 AND f.day = 24
		GROUP BY f.year, f.month, f.day)
UNION ALL (
		SELECT 'Christmas Day' AS Holiday, CONCAT(f.year,'/',f.month,'/', f.day) AS Date, AVG(f.dep_delay) AS Ave_Depart_Delay, AVG(f.arr_delay) AS Ave_Arriv_Delay, count(*) AS Total_Flights
		FROM flights_all2018 f
		WHERE f.month = 12 AND f.day = 25
		GROUP BY f.year, f.month, f.day);
        
#2019
CREATE VIEW holidays_2019 AS
SELECT *
FROM (
		SELECT 'New Year\'s Day' AS Holiday, CONCAT(f.year,'/',f.month,'/', f.day) AS Date,  AVG(f.dep_delay) AS Ave_Depart_Delay, AVG(f.arr_delay) AS Ave_Arriv_Delay, count(*) AS Total_Flights
		FROM flights_all2019 f
		WHERE f.month = 01 AND f.day = 01
		GROUP BY f.year, f.month, f.day) AS newyears_2019
UNION ALL (
		SELECT 'Memorial Day' AS Holiday, CONCAT(f.year,'/',f.month,'/', f.day) AS Date, AVG(f.dep_delay) AS Ave_Depart_Delay, AVG(f.arr_delay) AS Ave_Arriv_Delay, count(*) AS Total_Flights
		FROM flights_all2019 f
		WHERE f.month = 05 AND f.day = 27
		GROUP BY f.year, f.month, f.day)
UNION ALL (
		SELECT 'Independence Day' AS Holiday, CONCAT(f.year,'/',f.month,'/', f.day) AS Date, AVG(f.dep_delay) AS Ave_Depart_Delay, AVG(f.arr_delay) AS Ave_Arriv_Delay, count(*) AS Total_Flights
		FROM flights_all2019 f
		WHERE f.month = 07 AND f.day = 04
		GROUP BY f.year, f.month, f.day)
UNION ALL (
		SELECT 'Veterans Day' AS Holiday, CONCAT(f.year,'/',f.month,'/', f.day) AS Date, AVG(f.dep_delay) AS Ave_Depart_Delay, AVG(f.arr_delay) AS Ave_Arriv_Delay, count(*) AS Total_Flights
		FROM flights_all2019 f
		WHERE f.month = 11 AND f.day = 11
		GROUP BY f.year, f.month, f.day)
UNION ALL (
		SELECT 'Thanksgiving Eve' AS Holiday, CONCAT(f.year,'/',f.month,'/', f.day) AS Date, AVG(f.dep_delay) AS Ave_Depart_Delay, AVG(f.arr_delay) AS Ave_Arriv_Delay, count(*) AS Total_Flights
		FROM flights_all2019 f
		WHERE f.month = 11 AND f.day = 27
		GROUP BY f.year, f.month, f.day)    
UNION ALL (
		SELECT 'Thanksgiving Day' AS Holiday, CONCAT(f.year,'/',f.month,'/', f.day) AS Date, AVG(f.dep_delay) AS Ave_Depart_Delay, AVG(f.arr_delay) AS Ave_Arriv_Delay, count(*) AS Total_Flights
		FROM flights_all2019 f
		WHERE f.month = 11 AND f.day = 28
		GROUP BY f.year, f.month, f.day)         
UNION ALL (
		SELECT 'Christmas Eve' AS Holiday, CONCAT(f.year,'/',f.month,'/', f.day) AS Date, AVG(f.dep_delay) AS Ave_Depart_Delay, AVG(f.arr_delay) AS Ave_Arriv_Delay, count(*) AS Total_Flights
		FROM flights_all2019 f
		WHERE f.month = 12 AND f.day = 24
		GROUP BY f.year, f.month, f.day)
UNION ALL (
		SELECT 'Christmas Day' AS Holiday, CONCAT(f.year,'/',f.month,'/', f.day) AS Date, AVG(f.dep_delay) AS Ave_Depart_Delay, AVG(f.arr_delay) AS Ave_Arriv_Delay, count(*) AS Total_Flights
		FROM flights_all2019 f
		WHERE f.month = 12 AND f.day = 25
		GROUP BY f.year, f.month, f.day);
        
#2020
CREATE VIEW holidays_2020 AS
SELECT *
FROM (
		SELECT 'New Year\'s Day' AS Holiday, CONCAT(f.year,'/',f.month,'/', f.day) AS Date,  AVG(f.dep_delay) AS Ave_Depart_Delay, AVG(f.arr_delay) AS Ave_Arriv_Delay, count(*) AS Total_Flights
		FROM flights_all2020 f
		WHERE f.month = 01 AND f.day = 01
		GROUP BY f.year, f.month, f.day) AS newyears_2018
UNION ALL (
		SELECT 'Memorial Day' AS Holiday, CONCAT(f.year,'/',f.month,'/', f.day) AS Date, AVG(f.dep_delay) AS Ave_Depart_Delay, AVG(f.arr_delay) AS Ave_Arriv_Delay, count(*) AS Total_Flights
		FROM flights_all2020 f
		WHERE f.month = 05 AND f.day = 25
		GROUP BY f.year, f.month, f.day)
UNION ALL (
		SELECT 'Independence Day' AS Holiday, CONCAT(f.year,'/',f.month,'/', f.day) AS Date, AVG(f.dep_delay) AS Ave_Depart_Delay, AVG(f.arr_delay) AS Ave_Arriv_Delay, count(*) AS Total_Flights
		FROM flights_all2020 f
		WHERE f.month = 07 AND f.day = 04
		GROUP BY f.year, f.month, f.day)
UNION ALL (
		SELECT 'Veterans Day' AS Holiday, CONCAT(f.year,'/',f.month,'/', f.day) AS Date, AVG(f.dep_delay) AS Ave_Depart_Delay, AVG(f.arr_delay) AS Ave_Arriv_Delay, count(*) AS Total_Flights
		FROM flights_all2020 f
		WHERE f.month = 11 AND f.day = 11
		GROUP BY f.year, f.month, f.day)
UNION ALL (
		SELECT 'Thanksgiving Eve' AS Holiday, CONCAT(f.year,'/',f.month,'/', f.day) AS Date, AVG(f.dep_delay) AS Ave_Depart_Delay, AVG(f.arr_delay) AS Ave_Arriv_Delay, count(*) AS Total_Flights
		FROM flights_all2020 f
		WHERE f.month = 11 AND f.day = 25
		GROUP BY f.year, f.month, f.day)    
UNION ALL (
		SELECT 'Thanksgiving Day' AS Holiday, CONCAT(f.year,'/',f.month,'/', f.day) AS Date, AVG(f.dep_delay) AS Ave_Depart_Delay, AVG(f.arr_delay) AS Ave_Arriv_Delay, count(*) AS Total_Flights
		FROM flights_all2020 f
		WHERE f.month = 11 AND f.day = 26
		GROUP BY f.year, f.month, f.day)         
UNION ALL (
		SELECT 'Christmas Eve' AS Holiday, CONCAT(f.year,'/',f.month,'/', f.day) AS Date, AVG(f.dep_delay) AS Ave_Depart_Delay, AVG(f.arr_delay) AS Ave_Arriv_Delay, count(*) AS Total_Flights
		FROM flights_all2020 f
		WHERE f.month = 12 AND f.day = 24
		GROUP BY f.year, f.month, f.day)
UNION ALL (
		SELECT 'Christmas Day' AS Holiday, CONCAT(f.year,'/',f.month,'/', f.day) AS Date, AVG(f.dep_delay) AS Ave_Depart_Delay, AVG(f.arr_delay) AS Ave_Arriv_Delay, count(*) AS Total_Flights
		FROM flights_all2020 f
		WHERE f.month = 12 AND f.day = 25
		GROUP BY f.year, f.month, f.day);

#2021
CREATE VIEW holidays_2021 AS
SELECT *
FROM (
		SELECT 'New Year\'s Day' AS Holiday, CONCAT(f.year,'/',f.month,'/', f.day) AS Date,  AVG(f.dep_delay) AS Ave_Depart_Delay, AVG(f.arr_delay) AS Ave_Arriv_Delay, count(*) AS Total_Flights
		FROM flights_all2021 f
		WHERE f.month = 01 AND f.day = 01
		GROUP BY f.year, f.month, f.day) AS newyears_2018
UNION ALL (
		SELECT 'Memorial Day' AS Holiday, CONCAT(f.year,'/',f.month,'/', f.day) AS Date, AVG(f.dep_delay) AS Ave_Depart_Delay, AVG(f.arr_delay) AS Ave_Arriv_Delay, count(*) AS Total_Flights
		FROM flights_all2021 f
		WHERE f.month = 05 AND f.day = 31
		GROUP BY f.year, f.month, f.day)
UNION ALL (
		SELECT 'Independence Day' AS Holiday, CONCAT(f.year,'/',f.month,'/', f.day) AS Date, AVG(f.dep_delay) AS Ave_Depart_Delay, AVG(f.arr_delay) AS Ave_Arriv_Delay, count(*) AS Total_Flights
		FROM flights_all2021 f
		WHERE f.month = 07 AND f.day = 04
		GROUP BY f.year, f.month, f.day)
UNION ALL (
		SELECT 'Veterans Day' AS Holiday, CONCAT(f.year,'/',f.month,'/', f.day) AS Date, AVG(f.dep_delay) AS Ave_Depart_Delay, AVG(f.arr_delay) AS Ave_Arriv_Delay, count(*) AS Total_Flights
		FROM flights_all2021 f
		WHERE f.month = 11 AND f.day = 11
		GROUP BY f.year, f.month, f.day)
UNION ALL (
		SELECT 'Thanksgiving Eve' AS Holiday, CONCAT(f.year,'/',f.month,'/', f.day) AS Date, AVG(f.dep_delay) AS Ave_Depart_Delay, AVG(f.arr_delay) AS Ave_Arriv_Delay, count(*) AS Total_Flights
		FROM flights_all2021 f
		WHERE f.month = 11 AND f.day = 24
		GROUP BY f.year, f.month, f.day)    
UNION ALL (
		SELECT 'Thanksgiving Day' AS Holiday, CONCAT(f.year,'/',f.month,'/', f.day) AS Date, AVG(f.dep_delay) AS Ave_Depart_Delay, AVG(f.arr_delay) AS Ave_Arriv_Delay, count(*) AS Total_Flights
		FROM flights_all2021 f
		WHERE f.month = 11 AND f.day = 25
		GROUP BY f.year, f.month, f.day)         
UNION ALL (
		SELECT 'Christmas Eve' AS Holiday, CONCAT(f.year,'/',f.month,'/', f.day) AS Date, AVG(f.dep_delay) AS Ave_Depart_Delay, AVG(f.arr_delay) AS Ave_Arriv_Delay, count(*) AS Total_Flights
		FROM flights_all2021 f
		WHERE f.month = 12 AND f.day = 24
		GROUP BY f.year, f.month, f.day)
UNION ALL (
		SELECT 'Christmas Day' AS Holiday, CONCAT(f.year,'/',f.month,'/', f.day) AS Date, AVG(f.dep_delay) AS Ave_Depart_Delay, AVG(f.arr_delay) AS Ave_Arriv_Delay, count(*) AS Total_Flights
		FROM flights_all2021 f
		WHERE f.month = 12 AND f.day = 25
		GROUP BY f.year, f.month, f.day);

#2022
CREATE VIEW holidays_2022 AS
SELECT *
FROM (
		SELECT 'New Year\'s Day' AS Holiday, CONCAT(f.year,'/',f.month,'/', f.day) AS Date,  AVG(f.dep_delay) AS Ave_Depart_Delay, AVG(f.arr_delay) AS Ave_Arriv_Delay, count(*) AS Total_Flights
		FROM flights_all2022 f
		WHERE f.month = 01 AND f.day = 01
		GROUP BY f.year, f.month, f.day) AS newyears_2018
UNION ALL (
		SELECT 'Memorial Day' AS Holiday, CONCAT(f.year,'/',f.month,'/', f.day) AS Date, AVG(f.dep_delay) AS Ave_Depart_Delay, AVG(f.arr_delay) AS Ave_Arriv_Delay, count(*) AS Total_Flights
		FROM flights_all2022 f
		WHERE f.month = 05 AND f.day = 30
		GROUP BY f.year, f.month, f.day)
UNION ALL (
		SELECT 'Independence Day' AS Holiday, CONCAT(f.year,'/',f.month,'/', f.day) AS Date, AVG(f.dep_delay) AS Ave_Depart_Delay, AVG(f.arr_delay) AS Ave_Arriv_Delay, count(*) AS Total_Flights
		FROM flights_all2022 f
		WHERE f.month = 07 AND f.day = 04
		GROUP BY f.year, f.month, f.day)
UNION ALL (
		SELECT 'Veterans Day' AS Holiday, CONCAT(f.year,'/',f.month,'/', f.day) AS Date, AVG(f.dep_delay) AS Ave_Depart_Delay, AVG(f.arr_delay) AS Ave_Arriv_Delay, count(*) AS Total_Flights
		FROM flights_all2022 f
		WHERE f.month = 11 AND f.day = 11
		GROUP BY f.year, f.month, f.day)
UNION ALL (
		SELECT 'Thanksgiving Eve' AS Holiday, CONCAT(f.year,'/',f.month,'/', f.day) AS Date, AVG(f.dep_delay) AS Ave_Depart_Delay, AVG(f.arr_delay) AS Ave_Arriv_Delay, count(*) AS Total_Flights
		FROM flights_all2022 f
		WHERE f.month = 11 AND f.day = 23
		GROUP BY f.year, f.month, f.day)    
UNION ALL (
		SELECT 'Thanksgiving Day' AS Holiday, CONCAT(f.year,'/',f.month,'/', f.day) AS Date, AVG(f.dep_delay) AS Ave_Depart_Delay, AVG(f.arr_delay) AS Ave_Arriv_Delay, count(*) AS Total_Flights
		FROM flights_all2022 f
		WHERE f.month = 11 AND f.day = 24
		GROUP BY f.year, f.month, f.day)         
UNION ALL (
		SELECT 'Christmas Eve' AS Holiday, CONCAT(f.year,'/',f.month,'/', f.day) AS Date, AVG(f.dep_delay) AS Ave_Depart_Delay, AVG(f.arr_delay) AS Ave_Arriv_Delay, count(*) AS Total_Flights
		FROM flights_all2022 f
		WHERE f.month = 12 AND f.day = 24
		GROUP BY f.year, f.month, f.day)
UNION ALL (
		SELECT 'Christmas Day' AS Holiday, CONCAT(f.year,'/',f.month,'/', f.day) AS Date, AVG(f.dep_delay) AS Ave_Depart_Delay, AVG(f.arr_delay) AS Ave_Arriv_Delay, count(*) AS Total_Flights
		FROM flights_all2022 f
		WHERE f.month = 12 AND f.day = 25
		GROUP BY f.year, f.month, f.day);

-- List of destinations from each airport and total annual delays
#2018
CREATE VIEW destinations_2018 AS
SELECT * 
FROM (
SELECT DISTINCT f.dest AS List_of_Destinations, f.origin, AVG(f.dep_delay + f.arr_delay) AS Total_Delay
FROM flights_all2018 f
WHERE f.origin = 'IAH'
GROUP BY List_of_Destinations) iah18
UNION ALL (
SELECT DISTINCT f.dest AS List_of_Destinations, f.origin, AVG(f.dep_delay + f.arr_delay) AS Total_Delay
FROM flights_all2018 f
WHERE f.origin = 'JFK'
GROUP BY List_of_Destinations)
UNION ALL (
SELECT DISTINCT f.dest AS List_of_Destinations, f.origin, AVG(f.dep_delay + f.arr_delay) AS Total_Delay
FROM flights_all2018 f
WHERE f.origin = 'SAN'
GROUP BY List_of_Destinations)
UNION ALL (
SELECT DISTINCT f.dest AS List_of_Destinations, f.origin, AVG(f.dep_delay + f.arr_delay) AS Total_Delay
FROM flights_all2018 f
WHERE f.origin = 'SEA'
GROUP BY List_of_Destinations); 

#2019
CREATE VIEW destinations_2019 AS
SELECT * 
FROM (
SELECT DISTINCT f.dest AS List_of_Destinations, f.origin, AVG(f.dep_delay + f.arr_delay) AS Total_Delay
FROM flights_all2019 f
WHERE f.origin = 'IAH'
GROUP BY List_of_Destinations) iah18
UNION ALL (
SELECT DISTINCT f.dest AS List_of_Destinations, f.origin, AVG(f.dep_delay + f.arr_delay) AS Total_Delay
FROM flights_all2019 f
WHERE f.origin = 'JFK'
GROUP BY List_of_Destinations)
UNION ALL (
SELECT DISTINCT f.dest AS List_of_Destinations, f.origin, AVG(f.dep_delay + f.arr_delay) AS Total_Delay
FROM flights_all2019 f
WHERE f.origin = 'SAN'
GROUP BY List_of_Destinations)
UNION ALL (
SELECT DISTINCT f.dest AS List_of_Destinations, f.origin, AVG(f.dep_delay + f.arr_delay) AS Total_Delay
FROM flights_all2019 f
WHERE f.origin = 'SEA'
GROUP BY List_of_Destinations); 

#2020
CREATE VIEW destinations_2020 AS
SELECT * 
FROM (
SELECT DISTINCT f.dest AS List_of_Destinations, f.origin, AVG(f.dep_delay + f.arr_delay) AS Total_Delay
FROM flights_all2020 f
WHERE f.origin = 'IAH'
GROUP BY List_of_Destinations) iah18
UNION ALL (
SELECT DISTINCT f.dest AS List_of_Destinations, f.origin, AVG(f.dep_delay + f.arr_delay) AS Total_Delay
FROM flights_all2020 f
WHERE f.origin = 'JFK'
GROUP BY List_of_Destinations)
UNION ALL (
SELECT DISTINCT f.dest AS List_of_Destinations, f.origin, AVG(f.dep_delay + f.arr_delay) AS Total_Delay
FROM flights_all2020 f
WHERE f.origin = 'SAN'
GROUP BY List_of_Destinations)
UNION ALL (
SELECT DISTINCT f.dest AS List_of_Destinations, f.origin, AVG(f.dep_delay + f.arr_delay) AS Total_Delay
FROM flights_all2020 f
WHERE f.origin = 'SEA'
GROUP BY List_of_Destinations); 

#2021
CREATE VIEW destinations_2021 AS
SELECT * 
FROM (
SELECT DISTINCT f.dest AS List_of_Destinations, f.origin, AVG(f.dep_delay + f.arr_delay) AS Total_Delay
FROM flights_all2021 f
WHERE f.origin = 'IAH'
GROUP BY List_of_Destinations) iah18
UNION ALL (
SELECT DISTINCT f.dest AS List_of_Destinations, f.origin, AVG(f.dep_delay + f.arr_delay) AS Total_Delay
FROM flights_all2021 f
WHERE f.origin = 'JFK'
GROUP BY List_of_Destinations)
UNION ALL (
SELECT DISTINCT f.dest AS List_of_Destinations, f.origin, AVG(f.dep_delay + f.arr_delay) AS Total_Delay
FROM flights_all2021 f
WHERE f.origin = 'SAN'
GROUP BY List_of_Destinations)
UNION ALL (
SELECT DISTINCT f.dest AS List_of_Destinations, f.origin, AVG(f.dep_delay + f.arr_delay) AS Total_Delay
FROM flights_all2021 f
WHERE f.origin = 'SEA'
GROUP BY List_of_Destinations); 

#2022
CREATE VIEW destinations_2022 AS
SELECT * 
FROM (
SELECT DISTINCT f.dest AS List_of_Destinations, f.origin, AVG(f.dep_delay + f.arr_delay) AS Total_Delay
FROM flights_all2022 f
WHERE f.origin = 'IAH'
GROUP BY List_of_Destinations) iah18
UNION ALL (
SELECT DISTINCT f.dest AS List_of_Destinations, f.origin, AVG(f.dep_delay + f.arr_delay) AS Total_Delay
FROM flights_all2022 f
WHERE f.origin = 'JFK'
GROUP BY List_of_Destinations)
UNION ALL (
SELECT DISTINCT f.dest AS List_of_Destinations, f.origin, AVG(f.dep_delay + f.arr_delay) AS Total_Delay
FROM flights_all2022 f
WHERE f.origin = 'SAN'
GROUP BY List_of_Destinations)
UNION ALL (
SELECT DISTINCT f.dest AS List_of_Destinations, f.origin, AVG(f.dep_delay + f.arr_delay) AS Total_Delay
FROM flights_all2022 f
WHERE f.origin = 'SEA'
GROUP BY List_of_Destinations); 

-- Seasonal flight counts
-- Seasons are defined as follows: Winter (Dec01-February29), Spring (Mar01-May31), Summer (June01-August31), Fall (Sep01-Nov31)

#2018
CREATE VIEW seasonal2018 AS
SELECT *
FROM (
	SELECT origin, 'Winter' AS season, count(*) AS Scheduled_Flights_Count, AVG(dep_delay + arr_delay) AS Total_Delay
	FROM flights_all2018
	WHERE month IN (12, 1, 2)
    GROUP BY origin, season) AS count
UNION ALL (
	SELECT origin, 'Spring' AS season, count(*) AS Scheduled_Flights_Count, AVG(dep_delay + arr_delay) AS Total_Delay
	FROM flights_all2018
	WHERE month BETWEEN 03 AND 05
    GROUP BY origin, season)
UNION ALL (
	SELECT origin, 'Summer' AS season, count(*) AS Scheduled_Flights_Count, AVG(dep_delay + arr_delay) AS Total_Delay
	FROM flights_all2018
	WHERE month BETWEEN 06 AND 08
    GROUP BY origin, season)
UNION ALL (
	SELECT origin, 'Autumn' AS season, count(*) AS Scheduled_Flights_Count, AVG(dep_delay + arr_delay) AS Total_Delay
	FROM flights_all2018
	WHERE month BETWEEN 09 AND 11
    GROUP BY origin, season);

#2019
CREATE VIEW seasonal2019 AS
SELECT *
FROM (
	SELECT origin, 'Winter' AS season, count(*) AS Scheduled_Flights_Count, AVG(dep_delay + arr_delay) AS Total_Delay
	FROM flights_all2019
	WHERE month IN (12, 1, 2)
    GROUP BY origin, season) AS count
UNION ALL (
	SELECT origin, 'Spring' AS season, count(*) AS Scheduled_Flights_Count, AVG(dep_delay + arr_delay) AS Total_Delay
	FROM flights_all2019
	WHERE month BETWEEN 03 AND 05
    GROUP BY origin, season)
UNION ALL (
	SELECT origin, 'Summer' AS season, count(*) AS Scheduled_Flights_Count, AVG(dep_delay + arr_delay) AS Total_Delay
	FROM flights_all2019
	WHERE month BETWEEN 06 AND 08
    GROUP BY origin, season)
UNION ALL (
	SELECT origin, 'Autumn' AS season, count(*) AS Scheduled_Flights_Count, AVG(dep_delay + arr_delay) AS Total_Delay
	FROM flights_all2019
	WHERE month BETWEEN 09 AND 11
    GROUP BY origin, season);
    
#2020
CREATE VIEW seasonal2020 AS
SELECT *
FROM (
	SELECT origin, 'Winter' AS season, count(*) AS Scheduled_Flights_Count, AVG(dep_delay + arr_delay) AS Total_Delay
	FROM flights_all2020
	WHERE month IN (12, 1, 2)
    GROUP BY origin, season) AS count
UNION ALL (
	SELECT origin, 'Spring' AS season, count(*) AS Scheduled_Flights_Count, AVG(dep_delay + arr_delay) AS Total_Delay
	FROM flights_all2020
	WHERE month BETWEEN 03 AND 05
    GROUP BY origin, season)
UNION ALL (
	SELECT origin, 'Summer' AS season, count(*) AS Scheduled_Flights_Count, AVG(dep_delay + arr_delay) AS Total_Delay
	FROM flights_all2020
	WHERE month BETWEEN 06 AND 08
    GROUP BY origin, season)
UNION ALL (
	SELECT origin, 'Autumn' AS season, count(*) AS Scheduled_Flights_Count, AVG(dep_delay + arr_delay) AS Total_Delay
	FROM flights_all2020
	WHERE month BETWEEN 09 AND 11
    GROUP BY origin, season);
    
#2021
CREATE VIEW seasonal2021 AS
SELECT *
FROM (
	SELECT origin, 'Winter' AS season, count(*) AS Scheduled_Flights_Count, AVG(dep_delay + arr_delay) AS Total_Delay
	FROM flights_all2021
	WHERE month IN (12, 1, 2)
    GROUP BY origin, season) AS count
UNION ALL (
	SELECT origin, 'Spring' AS season, count(*) AS Scheduled_Flights_Count, AVG(dep_delay + arr_delay) AS Total_Delay
	FROM flights_all2021
	WHERE month BETWEEN 03 AND 05
    GROUP BY origin, season)
UNION ALL (
	SELECT origin, 'Summer' AS season, count(*) AS Scheduled_Flights_Count, AVG(dep_delay + arr_delay) AS Total_Delay
	FROM flights_all2021
	WHERE month BETWEEN 06 AND 08
    GROUP BY origin, season)
UNION ALL (
	SELECT origin, 'Autumn' AS season, count(*) AS Scheduled_Flights_Count, AVG(dep_delay + arr_delay) AS Total_Delay
	FROM flights_all2021
	WHERE month BETWEEN 09 AND 11
    GROUP BY origin, season);
    
#2022
CREATE VIEW seasonal2022 AS
SELECT *
FROM (
	SELECT origin, 'Winter' AS season, count(*) AS Scheduled_Flights_Count, AVG(dep_delay + arr_delay) AS Total_Delay
	FROM flights_all2022
	WHERE month IN (12, 1, 2)
    GROUP BY origin, season) AS count
UNION ALL (
	SELECT origin, 'Spring' AS season, count(*) AS Scheduled_Flights_Count, AVG(dep_delay + arr_delay) AS Total_Delay
	FROM flights_all2022
	WHERE month BETWEEN 03 AND 05
    GROUP BY origin, season)
UNION ALL (
	SELECT origin, 'Summer' AS season, count(*) AS Scheduled_Flights_Count, AVG(dep_delay + arr_delay) AS Total_Delay
	FROM flights_all2022
	WHERE month BETWEEN 06 AND 08
    GROUP BY origin, season)
UNION ALL (
	SELECT origin, 'Autumn' AS season, count(*) AS Scheduled_Flights_Count, AVG(dep_delay + arr_delay) AS Total_Delay
	FROM flights_all2022
	WHERE month BETWEEN 09 AND 11
    GROUP BY origin, season);
    
-- Scheduled flights count by time of day (broken down in 6 hour increments) and average delays
-- Time of day is defined as follows: Early morning (0000-0559), Mid-morning (0600-1159), Afternoon (1200-1759), Night (1800-2359) 
-- Uses the scheduled departure time, not actual departure time
    
#2018
CREATE VIEW time_of_day2018 AS
SELECT *
FROM (
	SELECT origin, 'Early_Morning' AS Time_of_Day, count(*) AS Scheduled_Flights_Count, AVG(dep_delay + arr_delay) AS Total_Delay
	FROM flights_all2018
	WHERE sched_dep_time BETWEEN '0000' AND '0559'
    GROUP BY origin, time_of_day) AS count
UNION ALL (
	SELECT origin, 'Midmorning' AS Time_of_Day, count(*) AS Scheduled_Flights_Count, AVG(dep_delay + arr_delay) AS Total_Delay
	FROM flights_all2018
	WHERE sched_dep_time BETWEEN '0600' AND '1159'
    GROUP BY origin, time_of_day)
UNION ALL (
	SELECT origin,'Afternoon' AS Time_of_Day, count(*) AS Scheduled_Flights_Count, AVG(dep_delay + arr_delay) AS Total_Delay
	FROM flights_all2018
	WHERE sched_dep_time BETWEEN '1200' AND '1759'
    GROUP BY origin, time_of_day)
UNION ALL (
	SELECT origin,'Night' AS Time_of_Day,count(*) AS Scheduled_Flights_Count, AVG(dep_delay + arr_delay) AS Total_Delay
	FROM flights_all2018
	WHERE sched_dep_time BETWEEN '1800' AND '2359'
    GROUP BY origin, time_of_day);
    
#2019
CREATE VIEW time_of_day2019 AS
SELECT *
FROM (
	SELECT origin, 'Early_Morning' AS Time_of_Day, count(*) AS Scheduled_Flights_Count, AVG(dep_delay + arr_delay) AS Total_Delay
	FROM flights_all2019
	WHERE sched_dep_time BETWEEN '0000' AND '0559'
    GROUP BY origin, time_of_day) AS count
UNION ALL (
	SELECT origin, 'Midmorning' AS Time_of_Day, count(*) AS Scheduled_Flights_Count, AVG(dep_delay + arr_delay) AS Total_Delay
	FROM flights_all2019
	WHERE sched_dep_time BETWEEN '0600' AND '1159'
    GROUP BY origin, time_of_day)
UNION ALL (
	SELECT origin,'Afternoon' AS Time_of_Day, count(*) AS Scheduled_Flights_Count, AVG(dep_delay + arr_delay) AS Total_Delay
	FROM flights_all2019
	WHERE sched_dep_time BETWEEN '1200' AND '1759'
    GROUP BY origin, time_of_day)
UNION ALL (
	SELECT origin,'Night' AS Time_of_Day,count(*) AS Scheduled_Flights_Count, AVG(dep_delay + arr_delay) AS Total_Delay
	FROM flights_all2019
	WHERE sched_dep_time BETWEEN '1800' AND '2359'
    GROUP BY origin, time_of_day);
    
#2020
CREATE VIEW time_of_day2020 AS
SELECT *
FROM (
	SELECT origin, 'Early_Morning' AS Time_of_Day, count(*) AS Scheduled_Flights_Count, AVG(dep_delay + arr_delay) AS Total_Delay
	FROM flights_all2020
	WHERE sched_dep_time BETWEEN '0000' AND '0559'
    GROUP BY origin, time_of_day) AS count
UNION ALL (
	SELECT origin, 'Midmorning' AS Time_of_Day, count(*) AS Scheduled_Flights_Count, AVG(dep_delay + arr_delay) AS Total_Delay
	FROM flights_all2020
	WHERE sched_dep_time BETWEEN '0600' AND '1159'
    GROUP BY origin, time_of_day)
UNION ALL (
	SELECT origin,'Afternoon' AS Time_of_Day, count(*) AS Scheduled_Flights_Count, AVG(dep_delay + arr_delay) AS Total_Delay
	FROM flights_all2020
	WHERE sched_dep_time BETWEEN '1200' AND '1759'
    GROUP BY origin, time_of_day)
UNION ALL (
	SELECT origin,'Night' AS Time_of_Day,count(*) AS Scheduled_Flights_Count, AVG(dep_delay + arr_delay) AS Total_Delay
	FROM flights_all2020
	WHERE sched_dep_time BETWEEN '1800' AND '2359'
    GROUP BY origin, time_of_day);

#2021
CREATE VIEW time_of_day2021 AS
SELECT *
FROM (
	SELECT origin, 'Early_Morning' AS Time_of_Day, count(*) AS Scheduled_Flights_Count, AVG(dep_delay + arr_delay) AS Total_Delay
	FROM flights_all2021
	WHERE sched_dep_time BETWEEN '0000' AND '0559'
    GROUP BY origin, time_of_day) AS count
UNION ALL (
	SELECT origin, 'Midmorning' AS Time_of_Day, count(*) AS Scheduled_Flights_Count, AVG(dep_delay + arr_delay) AS Total_Delay
	FROM flights_all2021
	WHERE sched_dep_time BETWEEN '0600' AND '1159'
    GROUP BY origin, time_of_day)
UNION ALL (
	SELECT origin,'Afternoon' AS Time_of_Day, count(*) AS Scheduled_Flights_Count, AVG(dep_delay + arr_delay) AS Total_Delay
	FROM flights_all2021
	WHERE sched_dep_time BETWEEN '1200' AND '1759'
    GROUP BY origin, time_of_day)
UNION ALL (
	SELECT origin,'Night' AS Time_of_Day,count(*) AS Scheduled_Flights_Count, AVG(dep_delay + arr_delay) AS Total_Delay
	FROM flights_all2021
	WHERE sched_dep_time BETWEEN '1800' AND '2359'
    GROUP BY origin, time_of_day);

#2022
CREATE VIEW time_of_day2022 AS
SELECT *
FROM (
	SELECT origin, 'Early_Morning' AS Time_of_Day, count(*) AS Scheduled_Flights_Count, AVG(dep_delay + arr_delay) AS Total_Delay
	FROM flights_all2022
	WHERE sched_dep_time BETWEEN '0000' AND '0559'
    GROUP BY origin, time_of_day) AS count
UNION ALL (
	SELECT origin, 'Midmorning' AS Time_of_Day, count(*) AS Scheduled_Flights_Count, AVG(dep_delay + arr_delay) AS Total_Delay
	FROM flights_all2022
	WHERE sched_dep_time BETWEEN '0600' AND '1159'
    GROUP BY origin, time_of_day)
UNION ALL (
	SELECT origin,'Afternoon' AS Time_of_Day, count(*) AS Scheduled_Flights_Count, AVG(dep_delay + arr_delay) AS Total_Delay
	FROM flights_all2022
	WHERE sched_dep_time BETWEEN '1200' AND '1759'
    GROUP BY origin, time_of_day)
UNION ALL (
	SELECT origin,'Night' AS Time_of_Day,count(*) AS Scheduled_Flights_Count, AVG(dep_delay + arr_delay) AS Total_Delay
	FROM flights_all2022
	WHERE sched_dep_time BETWEEN '1800' AND '2359'
    GROUP BY origin, time_of_day);
    



    





