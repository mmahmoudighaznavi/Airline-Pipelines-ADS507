show databases;
use ads507airlines;
show tables;
select * from weather_iah2018;
select * from flights_all2018;
SELECT MIN(dep_time), MAX(dep_time) FROM flights_all2018;




#monthly carriers flight table from Houston(IAH) airport with average dep delay (2018)
create view monthly_flights_iah2018 as
select carrier, origin, COUNT(carrier) as flightcounts, month , year, ROUND(AVG(dep_delay), 2) as AVGdepdelay, ROUND(AVG(arr_delay), 2) as AVGarrdelay
from flights_all2018
WHERE origin='IAH'
GROUP BY 1,4, 5
ORDER BY 4,6;

#monthly airlines flight table from JFK airport with average delay (2018)
create view monthly_flights_jfk2018 as
select carrier, origin, COUNT(carrier) as flightcounts, month , year, ROUND(AVG(dep_delay), 2) as AVGdelay, ROUND(AVG(arr_delay), 2) as AVGarrdelay
from flights_all2018
WHERE origin='JFK'
GROUP BY 1,4, 5
ORDER BY 4,6;

#monthly airlines flight table from San Diego airport with average delay (2018)
create view monthly_flights_san2018 as
select carrier, origin, COUNT(carrier) as flightcounts, month , year, ROUND(AVG(dep_delay), 2) as AVGdelay, ROUND(AVG(arr_delay), 2) as AVGarrdelay
from flights_all2018
WHERE origin='SAN'
GROUP BY 1,4, 5
ORDER BY 4,6;

#monthly airlines flight table from Seatle airport with average delay (2018)
create view monthly_flights_sea2018 as
select carrier, origin, COUNT(carrier) as flightcounts, month , year, ROUND(AVG(dep_delay), 2) as AVGdelay, ROUND(AVG(arr_delay), 2) as AVGarrdelay
from flights_all2018
WHERE origin='SEA'
GROUP BY 1,4,5
ORDER BY 4,6;

#monthly carriers flight table from Houston(IAH) airport with average dep delay (2019)
create view monthly_flights_iah2019 as
select carrier, origin, COUNT(carrier) as flightcounts, month , year, ROUND(AVG(dep_delay), 2) as AVGdelay, ROUND(AVG(arr_delay), 2) as AVGarrdelay
from flights_all2019
WHERE origin='IAH'
GROUP BY 1,4,5
ORDER BY 4,6;

#monthly airlines flight table from JFK airport with average delay (2019)
create view monthly_flights_jfk2019 as
select carrier, origin, COUNT(carrier) as flightcounts, month , year, ROUND(AVG(dep_delay), 2) as AVGdelay, ROUND(AVG(arr_delay), 2) as AVGarrdelay
from flights_all2019
WHERE origin='JFK'
GROUP BY 1,4,5
ORDER BY 4,6;

#monthly airlines flight table from San Diego airport with average delay (2019)
create view monthly_flights_san2019 as
select carrier, origin, COUNT(carrier) as flightcounts, month , year, ROUND(AVG(dep_delay), 2) as AVGdelay, ROUND(AVG(arr_delay), 2) as AVGarrdelay
from flights_all2019
WHERE origin='SAN'
GROUP BY 1,4,5
ORDER BY 4,6;

#monthly airlines flight table from Seatle airport with average delay (2019)
create view monthly_flights_sea2019 as
select carrier, origin, COUNT(carrier) as flightcounts, month , year, ROUND(AVG(dep_delay), 2) as AVGdelay, ROUND(AVG(arr_delay), 2) as AVGarrdelay
from flights_all2019
WHERE origin='SEA'
GROUP BY 1,4,5
ORDER BY 4,6;

#monthly carriers flight table from Houston(IAH) airport with average dep delay (2020)
create view monthly_flights_iah2020 as
select carrier, origin, COUNT(carrier) as flightcounts, month , year, ROUND(AVG(dep_delay), 2) as AVGdelay, ROUND(AVG(arr_delay), 2) as AVGarrdelay
from flights_all2020
WHERE origin='IAH'
GROUP BY 1,4,5
ORDER BY 4,6;

#monthly airlines flight table from JFK airport with average delay (2020)
create view monthly_flights_jfk2020 as
select carrier, origin, COUNT(carrier) as flightcounts, month , year, ROUND(AVG(dep_delay), 2) as AVGdelay, ROUND(AVG(arr_delay), 2) as AVGarrdelay
from flights_all2020
WHERE origin='JFK'
GROUP BY 1,4,5
ORDER BY 4,6;

#monthly airlines flight table from San Diego airport with average delay (2020)
create view monthly_flights_san2020 as
select carrier, origin, COUNT(carrier) as flightcounts, month , year, ROUND(AVG(dep_delay), 2) as AVGdelay, ROUND(AVG(arr_delay), 2) as AVGarrdelay
from flights_all2020
WHERE origin='SAN'
GROUP BY 1,4,5
ORDER BY 4,6;

#monthly airlines flight table from Seatle airport with average delay (2020)
create view monthly_flights_sea2020 as
select carrier, origin, COUNT(carrier) as flightcounts, month , year, ROUND(AVG(dep_delay), 2) as AVGdelay, ROUND(AVG(arr_delay), 2) as AVGarrdelay
from flights_all2020
WHERE origin='SEA'
GROUP BY 1,4,5
ORDER BY 4,6;

#monthly carriers flight table from Houston(IAH) airport with average dep delay (2021)
create view monthly_flights_iah2021 as
select carrier, origin, COUNT(carrier) as flightcounts, month , year, ROUND(AVG(dep_delay), 2) as AVGdelay, ROUND(AVG(arr_delay), 2) as AVGarrdelay
from flights_all2021
WHERE origin='IAH'
GROUP BY 1,4,5
ORDER BY 4,6;

#monthly airlines flight table from JFK airport with average delay (2021)
create view monthly_flights_jfk2021 as
select carrier, origin, COUNT(carrier) as flightcounts, month , year, ROUND(AVG(dep_delay), 2) as AVGdelay, ROUND(AVG(arr_delay), 2) as AVGarrdelay
from flights_all2021
WHERE origin='JFK'
GROUP BY 1,4,5
ORDER BY 4,6;

#monthly airlines flight table from San Diego airport with average delay (2021)
create view monthly_flights_san2021 as
select carrier, origin, COUNT(carrier) as flightcounts, month , year, ROUND(AVG(dep_delay), 2) as AVGdelay, ROUND(AVG(arr_delay), 2) as AVGarrdelay
from flights_all2021
WHERE origin='SAN'
GROUP BY 1,4,5
ORDER BY 4,6;

#monthly airlines flight table from Seatle airport with average delay (2021)
create view monthly_flights_sea2021 as
select carrier, origin, COUNT(carrier) as flightcounts, month , year, ROUND(AVG(dep_delay), 2) as AVGdelay, ROUND(AVG(arr_delay), 2) as AVGarrdelay
from flights_all2021
WHERE origin='SEA'
GROUP BY 1,4,5
ORDER BY 4,6;

#monthly carriers flight table from Houston(IAH) airport with average dep delay (2022)
create view monthly_flights_iah2022 as
select carrier, origin, COUNT(carrier) as flightcounts, month , year, ROUND(AVG(dep_delay), 2) as AVGdelay, ROUND(AVG(arr_delay), 2) as AVGarrdelay
from flights_all2022
WHERE origin='IAH'
GROUP BY 1,4,5
ORDER BY 4,6;

#monthly airlines flight table from JFK airport with average delay (2022)
create view monthly_flights_jfk2022 as
select carrier, origin, COUNT(carrier) as flightcounts, month , year, ROUND(AVG(dep_delay), 2) as AVGdelay, ROUND(AVG(arr_delay), 2) as AVGarrdelay
from flights_all2022
WHERE origin='JFK'
GROUP BY 1,4,5
ORDER BY 4,6;

#monthly airlines flight table from San Diego airport with average delay (2022)
create view monthly_flights_san2022 as
select carrier, origin, COUNT(carrier) as flightcounts, month , year, ROUND(AVG(dep_delay), 2) as AVGdelay, ROUND(AVG(arr_delay), 2) as AVGarrdelay
from flights_all2022
WHERE origin='SAN'
GROUP BY 1,4,5
ORDER BY 4,6;

#monthly carriers flight table from Seatle airport with average delay group by carrier (2022)
create view monthly_flights_sea2022 as
select carrier, origin, COUNT(carrier) as flightcounts, month , year, ROUND(AVG(dep_delay), 2) as AVGdelay, ROUND(AVG(arr_delay), 2) as AVGarrdelay
from flights_all2022
WHERE origin='SEA'
GROUP BY 1,4,5
ORDER BY 4,6;

#Yearly total flights group by destination with total delay time.(2018)
create view yearly_delay_2018 as
select origin, dest, COUNT(carrier) as flightcounts, year, ROUND(SUM(dep_delay), 2) as TOTdepdelay, ROUND(SUM(arr_delay), 2) as TOTarrdelay
from flights_all2018
WHERE year='2018'
GROUP BY 2, 1
ORDER BY 3 DESC;

#Yearly total flights group by destination with total delay time.(2019)
create view yearly_delay_2019 as
select origin, dest, COUNT(carrier) as flightcounts, year, ROUND(SUM(dep_delay), 2) as TOTdepdelay, ROUND(SUM(arr_delay), 2) as TOTarrdelay
from flights_all2019
WHERE year='2019'
GROUP BY 2, 1
ORDER BY 3 DESC;

#Yearly total flights group by destination with total delay time.(2020)
create view yearly_delay_2020 as
select origin, dest, COUNT(carrier) as flightcounts, year, ROUND(SUM(dep_delay), 2) as TOTdepdelay, ROUND(SUM(arr_delay), 2) as TOTarrdelay
from flights_all2020
WHERE year='2020'
GROUP BY 2, 1
ORDER BY 3 DESC;

#Yearly total flights group by destination with total delay time.(2021)
create view yearly_delay_2021 as
select origin, dest, COUNT(carrier) as flightcounts, year, ROUND(SUM(dep_delay), 2) as TOTdepdelay, ROUND(SUM(arr_delay), 2) as TOTarrdelay
from flights_all2021
WHERE year='2021'
GROUP BY 2, 1
ORDER BY 3 DESC;

#Yearly total flights group by destination with total delay time.(2022)
create view yearly_delay_2022 as
select origin, dest, COUNT(carrier) as flightcounts, year, ROUND(SUM(dep_delay), 2) as TOTdepdelay, ROUND(SUM(arr_delay), 2) as TOTarrdelay
from flights_all2022
WHERE year='2022'
GROUP BY 2, 1
ORDER BY 3 DESC;

#carrier delays based on time of flights(2018)
create view yearly_Timedelay_2018 as
select carrier, origin, dest, year, ROUND(AVG(dep_delay), 2) as AVGdepdelay, ROUND(AVG(arr_delay), 2) as AVGarrdelay, 
  CASE
   WHEN dep_time BETWEEN '601' AND '900'
     THEN 'Early Morning'
   WHEN dep_time BETWEEN '901' AND '1200'
     THEN 'Morning' 
   WHEN dep_time BETWEEN '1201' AND '1500'
     THEN 'Afternoon'  
   WHEN dep_time BETWEEN '1501' AND '1800'
     THEN 'Evening'
   ELSE 'Night'
  END Flight_Time  
from flights_all2018
WHERE year='2018'
GROUP BY 1,2,3, 7
ORDER BY 5 DESC;

#carrier delays based on time of flights(2019)
create view yearly_Timedelay_2019 as
select carrier, origin, dest, year, ROUND(AVG(dep_delay), 2) as AVGdepdelay, ROUND(AVG(arr_delay), 2) as AVGarrdelay,
  CASE
   WHEN dep_time BETWEEN '601' AND '900'
     THEN 'Early Morning'
   WHEN dep_time BETWEEN '901' AND '1200'
     THEN 'Morning' 
   WHEN dep_time BETWEEN '1201' AND '1500'
     THEN 'Afternoon'  
   WHEN dep_time BETWEEN '1501' AND '1800'
     THEN 'Evening'
   ELSE 'Night'
  END Flight_Time  
from flights_all2019
WHERE year='2019'
GROUP BY 1,2,3, 7
ORDER BY 5 DESC;


#carrier delays based on time of flights(2020)
create view yearly_Timedelay_2020 as
select carrier, origin, dest, year, ROUND(AVG(dep_delay), 2) as AVGdepdelay, ROUND(AVG(arr_delay), 2) as AVGarrdelay,
  CASE
   WHEN dep_time BETWEEN '601' AND '900'
     THEN 'Early Morning'
   WHEN dep_time BETWEEN '901' AND '1200'
     THEN 'Morning' 
   WHEN dep_time BETWEEN '1201' AND '1500'
     THEN 'Afternoon'  
   WHEN dep_time BETWEEN '1501' AND '1800'
     THEN 'Evening'
   ELSE 'Night'
  END Flight_Time  
from flights_all2020
WHERE year='2020'
GROUP BY 1,2,3, 7
ORDER BY 5 DESC;

#carrier delays based on time of flights(2021)
create view yearly_Timedelay_2021 as
select carrier, origin, dest, year, ROUND(AVG(dep_delay), 2) as AVGdepdelay, ROUND(AVG(arr_delay), 2) as AVGarrdelay,
  CASE
   WHEN dep_time BETWEEN '601' AND '900'
     THEN 'Early Morning'
   WHEN dep_time BETWEEN '901' AND '1200'
     THEN 'Morning' 
   WHEN dep_time BETWEEN '1201' AND '1500'
     THEN 'Afternoon'  
   WHEN dep_time BETWEEN '1501' AND '1800'
     THEN 'Evening'
   ELSE 'Night'
  END Flight_Time  
from flights_all2021
WHERE year='2021'
GROUP BY 1,2,3,7 
ORDER BY 5 DESC;

#carrier delays based on time of flights(2022)
create view yearly_Timedelay_2022 as
select carrier, origin, dest, year, ROUND(AVG(dep_delay), 2) as AVGdepdelay, ROUND(AVG(arr_delay), 2) as AVGarrdelay,
  CASE
   WHEN dep_time BETWEEN '601' AND '900'
     THEN 'Early Morning'
   WHEN dep_time BETWEEN '901' AND '1200'
     THEN 'Morning' 
   WHEN dep_time BETWEEN '1201' AND '1500'
     THEN 'Afternoon'  
   WHEN dep_time BETWEEN '1501' AND '1800'
     THEN 'Evening'
   ELSE 'Night'
  END Flight_Time  
from flights_all2022
WHERE year='2022'
GROUP BY 1,2,3,7
ORDER BY 5 DESC;
