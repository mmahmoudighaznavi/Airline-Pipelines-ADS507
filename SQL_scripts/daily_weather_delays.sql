use ads507airlines;

################################################################################################################################
# creating views for the daily weather and flight delay aggregate stats
# For every airport, and for every year, each "part" in this code creates a separate view for the following:
# 1) aggregate daily sum of rainfall and daily peak temperature (weather view)
# 2) take a total count of flights per day
# 3) find the number of flights delayed by at least 30min, 60min, and 120min
# 4) join each of the 3 flight delay views into a single view
# 5) join the weather view with the combined flight delays
################################################################################################################################

################################################################
# part 1a - IAH airport 2018
################################################################

create view daily_weather_iah2018 as
select daily_date, station, max(hourly_temp) as max_temp, sum(hourly_rain) as daily_rain from
	(select station, cast(valid as date) as "daily_date", hour(valid) as "my_hour", max(0+tmpf) as hourly_temp, max(0+p01i) as hourly_rain 
	from weather_iah2018
	group by station, daily_date, my_hour) sub
group by daily_date, station;

create view daily_flights_iah2018 as
select origin, cast(time_hour as date) as daily_date, count(*) as total_flights from flights_all2018
where origin = 'IAH'
group by daily_date;

create view iah2018_delays30 as
select origin, cast(time_hour as date) as daily_date, count(*) as delays_30 from flights_all2018
where (dep_delay > 30) and origin = 'IAH'
group by daily_date;

create view iah2018_delays60 as
select origin, cast(time_hour as date) as daily_date, count(*) as delays_60 from flights_all2018
where (dep_delay > 60) and origin = 'IAH'
group by daily_date;

create view iah2018_delays120 as
select origin, cast(time_hour as date) as daily_date, count(*) as delays_120 from flights_all2018
where (dep_delay > 120) and origin = 'IAH'
group by daily_date;

select * from daily_flights_iah2018;
select * from iah2018_delays30;
select * from iah2018_delays60;
select * from iah2018_delays120;

create view daily_delays_iah2018 as
select a.*, b.delays_30, c.delays_60, d.delays_120 from daily_flights_iah2018 a
left join iah2018_delays30 b on a.daily_date = b.daily_date
left join iah2018_delays60 c on b.daily_date = c.daily_date
left join iah2018_delays120 d on b.daily_date = d.daily_date;

create view delays_weather_iah2018 as 
select a.*, b.total_flights, delays_30, delays_60, delays_120
from daily_weather_iah2018 a
left join daily_delays_iah2018 b on a.daily_date = b.daily_date;

################################################################
# part 1b - IAH airport 2019
################################################################

create view daily_weather_iah2019 as
select daily_date, station, max(hourly_temp) as max_temp, sum(hourly_rain) as daily_rain from
	(select station, cast(valid as date) as "daily_date", hour(valid) as "my_hour", max(0+tmpf) as hourly_temp, max(0+p01i) as hourly_rain 
	from weather_iah2019
	group by station, daily_date, my_hour) sub
group by daily_date, station;

create view daily_flights_iah2019 as
select origin, cast(time_hour as date) as daily_date, count(*) as total_flights from flights_all2019
where origin = 'IAH'
group by daily_date;

create view iah2019_delays30 as
select origin, cast(time_hour as date) as daily_date, count(*) as delays_30 from flights_all2019
where (dep_delay > 30) and origin = 'IAH'
group by daily_date;

create view iah2019_delays60 as
select origin, cast(time_hour as date) as daily_date, count(*) as delays_60 from flights_all2019
where (dep_delay > 60) and origin = 'IAH'
group by daily_date;

create view iah2019_delays120 as
select origin, cast(time_hour as date) as daily_date, count(*) as delays_120 from flights_all2019
where (dep_delay > 120) and origin = 'IAH'
group by daily_date;

#### pit stop to check our views
#select * from daily_flights_iah2019;
#select * from iah2019_delays30;
#select * from iah2019_delays60;
#select * from iah2019_delays120;

create view daily_delays_iah2019 as
select a.*, b.delays_30, c.delays_60, d.delays_120 from daily_flights_iah2019 a
left join iah2019_delays30 b on a.daily_date = b.daily_date
left join iah2019_delays60 c on b.daily_date = c.daily_date
left join iah2019_delays120 d on b.daily_date = d.daily_date;

create view delays_weather_iah2019 as 
select a.*, b.total_flights, delays_30, delays_60, delays_120
from daily_weather_iah2019 a
left join daily_delays_iah2019 b on a.daily_date = b.daily_date;

################################################################
# part 1c - IAH airport 2020
################################################################

create view daily_weather_iah2020 as
select daily_date, station, max(hourly_temp) as max_temp, sum(hourly_rain) as daily_rain from
	(select station, cast(valid as date) as "daily_date", hour(valid) as "my_hour", max(0+tmpf) as hourly_temp, max(0+p01i) as hourly_rain 
	from weather_iah2020
	group by station, daily_date, my_hour) sub
group by daily_date, station;

create view daily_flights_iah2020 as
select origin, cast(time_hour as date) as daily_date, count(*) as total_flights from flights_all2020
where origin = 'IAH'
group by daily_date;

create view iah2020_delays30 as
select origin, cast(time_hour as date) as daily_date, count(*) as delays_30 from flights_all2020
where (dep_delay > 30) and origin = 'IAH'
group by daily_date;

create view iah2020_delays60 as
select origin, cast(time_hour as date) as daily_date, count(*) as delays_60 from flights_all2020
where (dep_delay > 60) and origin = 'IAH'
group by daily_date;

create view iah2020_delays120 as
select origin, cast(time_hour as date) as daily_date, count(*) as delays_120 from flights_all2020
where (dep_delay > 120) and origin = 'IAH'
group by daily_date;

#### pit stop to check our views
#select * from daily_flights_iah2020;
#select * from iah2020_delays30;
#select * from iah2020_delays60;
#select * from iah2020_delays120;

create view daily_delays_iah2020 as
select a.*, b.delays_30, c.delays_60, d.delays_120 from daily_flights_iah2020 a
left join iah2020_delays30 b on a.daily_date = b.daily_date
left join iah2020_delays60 c on b.daily_date = c.daily_date
left join iah2020_delays120 d on b.daily_date = d.daily_date;

create view delays_weather_iah2020 as 
select a.*, b.total_flights, delays_30, delays_60, delays_120
from daily_weather_iah2020 a
left join daily_delays_iah2020 b on a.daily_date = b.daily_date;

################################################################
# part 1d - IAH airport 2021
################################################################

create view daily_weather_iah2021 as
select daily_date, station, max(hourly_temp) as max_temp, sum(hourly_rain) as daily_rain from
	(select station, cast(valid as date) as "daily_date", hour(valid) as "my_hour", max(0+tmpf) as hourly_temp, max(0+p01i) as hourly_rain 
	from weather_iah2021
	group by station, daily_date, my_hour) sub
group by daily_date, station;

create view daily_flights_iah2021 as
select origin, cast(time_hour as date) as daily_date, count(*) as total_flights from flights_all2021
where origin = 'IAH'
group by daily_date;

create view iah2021_delays30 as
select origin, cast(time_hour as date) as daily_date, count(*) as delays_30 from flights_all2021
where (dep_delay > 30) and origin = 'IAH'
group by daily_date;

create view iah2021_delays60 as
select origin, cast(time_hour as date) as daily_date, count(*) as delays_60 from flights_all2021
where (dep_delay > 60) and origin = 'IAH'
group by daily_date;

create view iah2021_delays120 as
select origin, cast(time_hour as date) as daily_date, count(*) as delays_120 from flights_all2021
where (dep_delay > 120) and origin = 'IAH'
group by daily_date;

#### pit stop to check our views
#select * from daily_flights_iah2021;
#select * from iah2021_delays30;
#select * from iah2021_delays60;
#select * from iah2021_delays120;

create view daily_delays_iah2021 as
select a.*, b.delays_30, c.delays_60, d.delays_120 from daily_flights_iah2021 a
left join iah2021_delays30 b on a.daily_date = b.daily_date
left join iah2021_delays60 c on b.daily_date = c.daily_date
left join iah2021_delays120 d on b.daily_date = d.daily_date;

create view delays_weather_iah2021 as 
select a.*, b.total_flights, delays_30, delays_60, delays_120
from daily_weather_iah2021 a
left join daily_delays_iah2021 b on a.daily_date = b.daily_date;

################################################################
# part 1e - IAH airport 2022
################################################################

create view daily_weather_iah2022 as
select daily_date, station, max(hourly_temp) as max_temp, sum(hourly_rain) as daily_rain from
	(select station, cast(valid as date) as "daily_date", hour(valid) as "my_hour", max(0+tmpf) as hourly_temp, max(0+p01i) as hourly_rain 
	from weather_iah2022
	group by station, daily_date, my_hour) sub
group by daily_date, station;

create view daily_flights_iah2022 as
select origin, cast(time_hour as date) as daily_date, count(*) as total_flights from flights_all2022
where origin = 'IAH'
group by daily_date;

create view iah2022_delays30 as
select origin, cast(time_hour as date) as daily_date, count(*) as delays_30 from flights_all2022
where (dep_delay > 30) and origin = 'IAH'
group by daily_date;

create view iah2022_delays60 as
select origin, cast(time_hour as date) as daily_date, count(*) as delays_60 from flights_all2022
where (dep_delay > 60) and origin = 'IAH'
group by daily_date;

create view iah2022_delays120 as
select origin, cast(time_hour as date) as daily_date, count(*) as delays_120 from flights_all2022
where (dep_delay > 120) and origin = 'IAH'
group by daily_date;

#### pit stop to check our views
#select * from daily_flights_iah2022;
#select * from iah2022_delays30;
#select * from iah2022_delays60;
#select * from iah2022_delays120;

create view daily_delays_iah2022 as
select a.*, b.delays_30, c.delays_60, d.delays_120 from daily_flights_iah2022 a
left join iah2022_delays30 b on a.daily_date = b.daily_date
left join iah2022_delays60 c on b.daily_date = c.daily_date
left join iah2022_delays120 d on b.daily_date = d.daily_date;

create view delays_weather_iah2022 as 
select a.*, b.total_flights, delays_30, delays_60, delays_120
from daily_weather_iah2022 a
left join daily_delays_iah2022 b on a.daily_date = b.daily_date;

##############################################
select * from delays_weather_iah2018;
select * from delays_weather_iah2019;
select * from delays_weather_iah2020;
select * from delays_weather_iah2021;
select * from delays_weather_iah2022;
##############################################


################################################################
# part 2a - JFK airport
################################################################

create view daily_weather_jfk2018 as
select daily_date, station, max(hourly_temp) as max_temp, sum(hourly_rain) as daily_rain from
	(select station, cast(valid as date) as "daily_date", hour(valid) as "my_hour", max(0+tmpf) as hourly_temp, max(0+p01i) as hourly_rain 
	from weather_jfk2018
	group by station, daily_date, my_hour) sub
group by daily_date, station;

create view daily_flights_jfk2018 as
select origin, cast(time_hour as date) as daily_date, count(*) as total_flights from flights_all2018
where origin = 'jfk'
group by daily_date;

create view jfk2018_delays30 as
select origin, cast(time_hour as date) as daily_date, count(*) as delays_30 from flights_all2018
where (dep_delay > 30) and origin = 'jfk'
group by daily_date;

create view jfk2018_delays60 as
select origin, cast(time_hour as date) as daily_date, count(*) as delays_60 from flights_all2018
where (dep_delay > 60) and origin = 'jfk'
group by daily_date;

create view jfk2018_delays120 as
select origin, cast(time_hour as date) as daily_date, count(*) as delays_120 from flights_all2018
where (dep_delay > 120) and origin = 'jfk'
group by daily_date;

#select * from daily_flights_jfk2018;
#select * from jfk2018_delays30;
#select * from jfk2018_delays60;
#select * from jfk2018_delays120;

create view daily_delays_jfk2018 as
select a.*, b.delays_30, c.delays_60, d.delays_120 from daily_flights_jfk2018 a
left join jfk2018_delays30 b on a.daily_date = b.daily_date
left join jfk2018_delays60 c on b.daily_date = c.daily_date
left join jfk2018_delays120 d on b.daily_date = d.daily_date;

create view delays_weather_jfk2018 as 
select a.*, b.total_flights, delays_30, delays_60, delays_120
from daily_weather_jfk2018 a
left join daily_delays_jfk2018 b on a.daily_date = b.daily_date;

################################################################
# part 2b - jfk airport 2019
################################################################

create view daily_weather_jfk2019 as
select daily_date, station, max(hourly_temp) as max_temp, sum(hourly_rain) as daily_rain from
	(select station, cast(valid as date) as "daily_date", hour(valid) as "my_hour", max(0+tmpf) as hourly_temp, max(0+p01i) as hourly_rain 
	from weather_jfk2019
	group by station, daily_date, my_hour) sub
group by daily_date, station;

create view daily_flights_jfk2019 as
select origin, cast(time_hour as date) as daily_date, count(*) as total_flights from flights_all2019
where origin = 'jfk'
group by daily_date;

create view jfk2019_delays30 as
select origin, cast(time_hour as date) as daily_date, count(*) as delays_30 from flights_all2019
where (dep_delay > 30) and origin = 'jfk'
group by daily_date;

create view jfk2019_delays60 as
select origin, cast(time_hour as date) as daily_date, count(*) as delays_60 from flights_all2019
where (dep_delay > 60) and origin = 'jfk'
group by daily_date;

create view jfk2019_delays120 as
select origin, cast(time_hour as date) as daily_date, count(*) as delays_120 from flights_all2019
where (dep_delay > 120) and origin = 'jfk'
group by daily_date;

#### pit stop to check our views
#select * from daily_flights_jfk2019;
#select * from jfk2019_delays30;
#select * from jfk2019_delays60;
#select * from jfk2019_delays120;

create view daily_delays_jfk2019 as
select a.*, b.delays_30, c.delays_60, d.delays_120 from daily_flights_jfk2019 a
left join jfk2019_delays30 b on a.daily_date = b.daily_date
left join jfk2019_delays60 c on b.daily_date = c.daily_date
left join jfk2019_delays120 d on b.daily_date = d.daily_date;

create view delays_weather_jfk2019 as 
select a.*, b.total_flights, delays_30, delays_60, delays_120
from daily_weather_jfk2019 a
left join daily_delays_jfk2019 b on a.daily_date = b.daily_date;

################################################################
# part 2c - jfk airport 2020
################################################################

create view daily_weather_jfk2020 as
select daily_date, station, max(hourly_temp) as max_temp, sum(hourly_rain) as daily_rain from
	(select station, cast(valid as date) as "daily_date", hour(valid) as "my_hour", max(0+tmpf) as hourly_temp, max(0+p01i) as hourly_rain 
	from weather_jfk2020
	group by station, daily_date, my_hour) sub
group by daily_date, station;

create view daily_flights_jfk2020 as
select origin, cast(time_hour as date) as daily_date, count(*) as total_flights from flights_all2020
where origin = 'jfk'
group by daily_date;

create view jfk2020_delays30 as
select origin, cast(time_hour as date) as daily_date, count(*) as delays_30 from flights_all2020
where (dep_delay > 30) and origin = 'jfk'
group by daily_date;

create view jfk2020_delays60 as
select origin, cast(time_hour as date) as daily_date, count(*) as delays_60 from flights_all2020
where (dep_delay > 60) and origin = 'jfk'
group by daily_date;

create view jfk2020_delays120 as
select origin, cast(time_hour as date) as daily_date, count(*) as delays_120 from flights_all2020
where (dep_delay > 120) and origin = 'jfk'
group by daily_date;

#### pit stop to check our views
#select * from daily_flights_jfk2020;
#select * from jfk2020_delays30;
#select * from jfk2020_delays60;
#select * from jfk2020_delays120;

create view daily_delays_jfk2020 as
select a.*, b.delays_30, c.delays_60, d.delays_120 from daily_flights_jfk2020 a
left join jfk2020_delays30 b on a.daily_date = b.daily_date
left join jfk2020_delays60 c on b.daily_date = c.daily_date
left join jfk2020_delays120 d on b.daily_date = d.daily_date;

create view delays_weather_jfk2020 as 
select a.*, b.total_flights, delays_30, delays_60, delays_120
from daily_weather_jfk2020 a
left join daily_delays_jfk2020 b on a.daily_date = b.daily_date;

################################################################
# part 2d - jfk airport 2021
################################################################

create view daily_weather_jfk2021 as
select daily_date, station, max(hourly_temp) as max_temp, sum(hourly_rain) as daily_rain from
	(select station, cast(valid as date) as "daily_date", hour(valid) as "my_hour", max(0+tmpf) as hourly_temp, max(0+p01i) as hourly_rain 
	from weather_jfk2021
	group by station, daily_date, my_hour) sub
group by daily_date, station;

create view daily_flights_jfk2021 as
select origin, cast(time_hour as date) as daily_date, count(*) as total_flights from flights_all2021
where origin = 'jfk'
group by daily_date;

create view jfk2021_delays30 as
select origin, cast(time_hour as date) as daily_date, count(*) as delays_30 from flights_all2021
where (dep_delay > 30) and origin = 'jfk'
group by daily_date;

create view jfk2021_delays60 as
select origin, cast(time_hour as date) as daily_date, count(*) as delays_60 from flights_all2021
where (dep_delay > 60) and origin = 'jfk'
group by daily_date;

create view jfk2021_delays120 as
select origin, cast(time_hour as date) as daily_date, count(*) as delays_120 from flights_all2021
where (dep_delay > 120) and origin = 'jfk'
group by daily_date;

#### pit stop to check our views
#select * from daily_flights_jfk2021;
#select * from jfk2021_delays30;
#select * from jfk2021_delays60;
#select * from jfk2021_delays120;

create view daily_delays_jfk2021 as
select a.*, b.delays_30, c.delays_60, d.delays_120 from daily_flights_jfk2021 a
left join jfk2021_delays30 b on a.daily_date = b.daily_date
left join jfk2021_delays60 c on b.daily_date = c.daily_date
left join jfk2021_delays120 d on b.daily_date = d.daily_date;

create view delays_weather_jfk2021 as 
select a.*, b.total_flights, delays_30, delays_60, delays_120
from daily_weather_jfk2021 a
left join daily_delays_jfk2021 b on a.daily_date = b.daily_date;

################################################################
# part 2e - jfk airport 2022
################################################################

create view daily_weather_jfk2022 as
select daily_date, station, max(hourly_temp) as max_temp, sum(hourly_rain) as daily_rain from
	(select station, cast(valid as date) as "daily_date", hour(valid) as "my_hour", max(0+tmpf) as hourly_temp, max(0+p01i) as hourly_rain 
	from weather_jfk2022
	group by station, daily_date, my_hour) sub
group by daily_date, station;

create view daily_flights_jfk2022 as
select origin, cast(time_hour as date) as daily_date, count(*) as total_flights from flights_all2022
where origin = 'jfk'
group by daily_date;

create view jfk2022_delays30 as
select origin, cast(time_hour as date) as daily_date, count(*) as delays_30 from flights_all2022
where (dep_delay > 30) and origin = 'jfk'
group by daily_date;

create view jfk2022_delays60 as
select origin, cast(time_hour as date) as daily_date, count(*) as delays_60 from flights_all2022
where (dep_delay > 60) and origin = 'jfk'
group by daily_date;

create view jfk2022_delays120 as
select origin, cast(time_hour as date) as daily_date, count(*) as delays_120 from flights_all2022
where (dep_delay > 120) and origin = 'jfk'
group by daily_date;

#### pit stop to check our views
#select * from daily_flights_jfk2022;
#select * from jfk2022_delays30;
#select * from jfk2022_delays60;
#select * from jfk2022_delays120;

create view daily_delays_jfk2022 as
select a.*, b.delays_30, c.delays_60, d.delays_120 from daily_flights_jfk2022 a
left join jfk2022_delays30 b on a.daily_date = b.daily_date
left join jfk2022_delays60 c on b.daily_date = c.daily_date
left join jfk2022_delays120 d on b.daily_date = d.daily_date;

create view delays_weather_jfk2022 as 
select a.*, b.total_flights, delays_30, delays_60, delays_120
from daily_weather_jfk2022 a
left join daily_delays_jfk2022 b on a.daily_date = b.daily_date;

##############################################
select * from delays_weather_jfk2018;
select * from delays_weather_jfk2019;
select * from delays_weather_jfk2020;
select * from delays_weather_jfk2021;
select * from delays_weather_jfk2022;
##############################################


################################################################
# part 3a - san airport
################################################################

create view daily_weather_san2018 as
select daily_date, station, max(hourly_temp) as max_temp, sum(hourly_rain) as daily_rain from
	(select station, cast(valid as date) as "daily_date", hour(valid) as "my_hour", max(0+tmpf) as hourly_temp, max(0+p01i) as hourly_rain 
	from weather_san2018
	group by station, daily_date, my_hour) sub
group by daily_date, station;

create view daily_flights_san2018 as
select origin, cast(time_hour as date) as daily_date, count(*) as total_flights from flights_all2018
where origin = 'san'
group by daily_date;

create view san2018_delays30 as
select origin, cast(time_hour as date) as daily_date, count(*) as delays_30 from flights_all2018
where (dep_delay > 30) and origin = 'san'
group by daily_date;

create view san2018_delays60 as
select origin, cast(time_hour as date) as daily_date, count(*) as delays_60 from flights_all2018
where (dep_delay > 60) and origin = 'san'
group by daily_date;

create view san2018_delays120 as
select origin, cast(time_hour as date) as daily_date, count(*) as delays_120 from flights_all2018
where (dep_delay > 120) and origin = 'san'
group by daily_date;

#select * from daily_flights_san2018;
#select * from san2018_delays30;
#select * from san2018_delays60;
#select * from san2018_delays120;

create view daily_delays_san2018 as
select a.*, b.delays_30, c.delays_60, d.delays_120 from daily_flights_san2018 a
left join san2018_delays30 b on a.daily_date = b.daily_date
left join san2018_delays60 c on b.daily_date = c.daily_date
left join san2018_delays120 d on b.daily_date = d.daily_date;

create view delays_weather_san2018 as 
select a.*, b.total_flights, delays_30, delays_60, delays_120
from daily_weather_san2018 a
left join daily_delays_san2018 b on a.daily_date = b.daily_date;

################################################################
# part 3b - san airport 2019
################################################################

create view daily_weather_san2019 as
select daily_date, station, max(hourly_temp) as max_temp, sum(hourly_rain) as daily_rain from
	(select station, cast(valid as date) as "daily_date", hour(valid) as "my_hour", max(0+tmpf) as hourly_temp, max(0+p01i) as hourly_rain 
	from weather_san2019
	group by station, daily_date, my_hour) sub
group by daily_date, station;

create view daily_flights_san2019 as
select origin, cast(time_hour as date) as daily_date, count(*) as total_flights from flights_all2019
where origin = 'san'
group by daily_date;

create view san2019_delays30 as
select origin, cast(time_hour as date) as daily_date, count(*) as delays_30 from flights_all2019
where (dep_delay > 30) and origin = 'san'
group by daily_date;

create view san2019_delays60 as
select origin, cast(time_hour as date) as daily_date, count(*) as delays_60 from flights_all2019
where (dep_delay > 60) and origin = 'san'
group by daily_date;

create view san2019_delays120 as
select origin, cast(time_hour as date) as daily_date, count(*) as delays_120 from flights_all2019
where (dep_delay > 120) and origin = 'san'
group by daily_date;

#### pit stop to check our views
#select * from daily_flights_san2019;
#select * from san2019_delays30;
#select * from san2019_delays60;
#select * from san2019_delays120;

create view daily_delays_san2019 as
select a.*, b.delays_30, c.delays_60, d.delays_120 from daily_flights_san2019 a
left join san2019_delays30 b on a.daily_date = b.daily_date
left join san2019_delays60 c on b.daily_date = c.daily_date
left join san2019_delays120 d on b.daily_date = d.daily_date;

create view delays_weather_san2019 as 
select a.*, b.total_flights, delays_30, delays_60, delays_120
from daily_weather_san2019 a
left join daily_delays_san2019 b on a.daily_date = b.daily_date;

################################################################
# part 3c - san airport 2020
################################################################

create view daily_weather_san2020 as
select daily_date, station, max(hourly_temp) as max_temp, sum(hourly_rain) as daily_rain from
	(select station, cast(valid as date) as "daily_date", hour(valid) as "my_hour", max(0+tmpf) as hourly_temp, max(0+p01i) as hourly_rain 
	from weather_san2020
	group by station, daily_date, my_hour) sub
group by daily_date, station;

create view daily_flights_san2020 as
select origin, cast(time_hour as date) as daily_date, count(*) as total_flights from flights_all2020
where origin = 'san'
group by daily_date;

create view san2020_delays30 as
select origin, cast(time_hour as date) as daily_date, count(*) as delays_30 from flights_all2020
where (dep_delay > 30) and origin = 'san'
group by daily_date;

create view san2020_delays60 as
select origin, cast(time_hour as date) as daily_date, count(*) as delays_60 from flights_all2020
where (dep_delay > 60) and origin = 'san'
group by daily_date;

create view san2020_delays120 as
select origin, cast(time_hour as date) as daily_date, count(*) as delays_120 from flights_all2020
where (dep_delay > 120) and origin = 'san'
group by daily_date;

#### pit stop to check our views
#select * from daily_flights_san2020;
#select * from san2020_delays30;
#select * from san2020_delays60;
#select * from san2020_delays120;

create view daily_delays_san2020 as
select a.*, b.delays_30, c.delays_60, d.delays_120 from daily_flights_san2020 a
left join san2020_delays30 b on a.daily_date = b.daily_date
left join san2020_delays60 c on b.daily_date = c.daily_date
left join san2020_delays120 d on b.daily_date = d.daily_date;

create view delays_weather_san2020 as 
select a.*, b.total_flights, delays_30, delays_60, delays_120
from daily_weather_san2020 a
left join daily_delays_san2020 b on a.daily_date = b.daily_date;

################################################################
# part 3d - san airport 2021
################################################################

create view daily_weather_san2021 as
select daily_date, station, max(hourly_temp) as max_temp, sum(hourly_rain) as daily_rain from
	(select station, cast(valid as date) as "daily_date", hour(valid) as "my_hour", max(0+tmpf) as hourly_temp, max(0+p01i) as hourly_rain 
	from weather_san2021
	group by station, daily_date, my_hour) sub
group by daily_date, station;

create view daily_flights_san2021 as
select origin, cast(time_hour as date) as daily_date, count(*) as total_flights from flights_all2021
where origin = 'san'
group by daily_date;

create view san2021_delays30 as
select origin, cast(time_hour as date) as daily_date, count(*) as delays_30 from flights_all2021
where (dep_delay > 30) and origin = 'san'
group by daily_date;

create view san2021_delays60 as
select origin, cast(time_hour as date) as daily_date, count(*) as delays_60 from flights_all2021
where (dep_delay > 60) and origin = 'san'
group by daily_date;

create view san2021_delays120 as
select origin, cast(time_hour as date) as daily_date, count(*) as delays_120 from flights_all2021
where (dep_delay > 120) and origin = 'san'
group by daily_date;

#### pit stop to check our views
#select * from daily_flights_san2021;
#select * from san2021_delays30;
#select * from san2021_delays60;
#select * from san2021_delays120;

create view daily_delays_san2021 as
select a.*, b.delays_30, c.delays_60, d.delays_120 from daily_flights_san2021 a
left join san2021_delays30 b on a.daily_date = b.daily_date
left join san2021_delays60 c on b.daily_date = c.daily_date
left join san2021_delays120 d on b.daily_date = d.daily_date;

create view delays_weather_san2021 as 
select a.*, b.total_flights, delays_30, delays_60, delays_120
from daily_weather_san2021 a
left join daily_delays_san2021 b on a.daily_date = b.daily_date;

################################################################
# part 1e - san airport 2022
################################################################

create view daily_weather_san2022 as
select daily_date, station, max(hourly_temp) as max_temp, sum(hourly_rain) as daily_rain from
	(select station, cast(valid as date) as "daily_date", hour(valid) as "my_hour", max(0+tmpf) as hourly_temp, max(0+p01i) as hourly_rain 
	from weather_san2022
	group by station, daily_date, my_hour) sub
group by daily_date, station;

create view daily_flights_san2022 as
select origin, cast(time_hour as date) as daily_date, count(*) as total_flights from flights_all2022
where origin = 'san'
group by daily_date;

create view san2022_delays30 as
select origin, cast(time_hour as date) as daily_date, count(*) as delays_30 from flights_all2022
where (dep_delay > 30) and origin = 'san'
group by daily_date;

create view san2022_delays60 as
select origin, cast(time_hour as date) as daily_date, count(*) as delays_60 from flights_all2022
where (dep_delay > 60) and origin = 'san'
group by daily_date;

create view san2022_delays120 as
select origin, cast(time_hour as date) as daily_date, count(*) as delays_120 from flights_all2022
where (dep_delay > 120) and origin = 'san'
group by daily_date;

#### pit stop to check our views
#select * from daily_flights_san2022;
#select * from san2022_delays30;
#select * from san2022_delays60;
#select * from san2022_delays120;

create view daily_delays_san2022 as
select a.*, b.delays_30, c.delays_60, d.delays_120 from daily_flights_san2022 a
left join san2022_delays30 b on a.daily_date = b.daily_date
left join san2022_delays60 c on b.daily_date = c.daily_date
left join san2022_delays120 d on b.daily_date = d.daily_date;

create view delays_weather_san2022 as 
select a.*, b.total_flights, delays_30, delays_60, delays_120
from daily_weather_san2022 a
left join daily_delays_san2022 b on a.daily_date = b.daily_date;

##############################################
select * from delays_weather_san2018;
select * from delays_weather_san2019;
select * from delays_weather_san2020;
select * from delays_weather_san2021;
select * from delays_weather_san2022;
##############################################


################################################################
# part 4a - sea airport
################################################################

create view daily_weather_sea2018 as
select daily_date, station, max(hourly_temp) as max_temp, sum(hourly_rain) as daily_rain from
	(select station, cast(valid as date) as "daily_date", hour(valid) as "my_hour", max(0+tmpf) as hourly_temp, max(0+p01i) as hourly_rain 
	from weather_sea2018
	group by station, daily_date, my_hour) sub
group by daily_date, station;

create view daily_flights_sea2018 as
select origin, cast(time_hour as date) as daily_date, count(*) as total_flights from flights_all2018
where origin = 'sea'
group by daily_date;

create view sea2018_delays30 as
select origin, cast(time_hour as date) as daily_date, count(*) as delays_30 from flights_all2018
where (dep_delay > 30) and origin = 'sea'
group by daily_date;

create view sea2018_delays60 as
select origin, cast(time_hour as date) as daily_date, count(*) as delays_60 from flights_all2018
where (dep_delay > 60) and origin = 'sea'
group by daily_date;

create view sea2018_delays120 as
select origin, cast(time_hour as date) as daily_date, count(*) as delays_120 from flights_all2018
where (dep_delay > 120) and origin = 'sea'
group by daily_date;

#select * from daily_flights_sea2018;
#select * from sea2018_delays30;
#select * from sea2018_delays60;
#select * from sea2018_delays120;

create view daily_delays_sea2018 as
select a.*, b.delays_30, c.delays_60, d.delays_120 from daily_flights_sea2018 a
left join sea2018_delays30 b on a.daily_date = b.daily_date
left join sea2018_delays60 c on b.daily_date = c.daily_date
left join sea2018_delays120 d on b.daily_date = d.daily_date;

create view delays_weather_sea2018 as 
select a.*, b.total_flights, delays_30, delays_60, delays_120
from daily_weather_sea2018 a
left join daily_delays_sea2018 b on a.daily_date = b.daily_date;

################################################################
# part 4b - sea airport 2019
################################################################

create view daily_weather_sea2019 as
select daily_date, station, max(hourly_temp) as max_temp, sum(hourly_rain) as daily_rain from
	(select station, cast(valid as date) as "daily_date", hour(valid) as "my_hour", max(0+tmpf) as hourly_temp, max(0+p01i) as hourly_rain 
	from weather_sea2019
	group by station, daily_date, my_hour) sub
group by daily_date, station;

create view daily_flights_sea2019 as
select origin, cast(time_hour as date) as daily_date, count(*) as total_flights from flights_all2019
where origin = 'sea'
group by daily_date;

create view sea2019_delays30 as
select origin, cast(time_hour as date) as daily_date, count(*) as delays_30 from flights_all2019
where (dep_delay > 30) and origin = 'sea'
group by daily_date;

create view sea2019_delays60 as
select origin, cast(time_hour as date) as daily_date, count(*) as delays_60 from flights_all2019
where (dep_delay > 60) and origin = 'sea'
group by daily_date;

create view sea2019_delays120 as
select origin, cast(time_hour as date) as daily_date, count(*) as delays_120 from flights_all2019
where (dep_delay > 120) and origin = 'sea'
group by daily_date;

#### pit stop to check our views
#select * from daily_flights_sea2019;
#select * from sea2019_delays30;
#select * from sea2019_delays60;
#select * from sea2019_delays120;

create view daily_delays_sea2019 as
select a.*, b.delays_30, c.delays_60, d.delays_120 from daily_flights_sea2019 a
left join sea2019_delays30 b on a.daily_date = b.daily_date
left join sea2019_delays60 c on b.daily_date = c.daily_date
left join sea2019_delays120 d on b.daily_date = d.daily_date;

create view delays_weather_sea2019 as 
select a.*, b.total_flights, delays_30, delays_60, delays_120
from daily_weather_sea2019 a
left join daily_delays_sea2019 b on a.daily_date = b.daily_date;

################################################################
# part 4c - sea airport 2020
################################################################

create view daily_weather_sea2020 as
select daily_date, station, max(hourly_temp) as max_temp, sum(hourly_rain) as daily_rain from
	(select station, cast(valid as date) as "daily_date", hour(valid) as "my_hour", max(0+tmpf) as hourly_temp, max(0+p01i) as hourly_rain 
	from weather_sea2020
	group by station, daily_date, my_hour) sub
group by daily_date, station;

create view daily_flights_sea2020 as
select origin, cast(time_hour as date) as daily_date, count(*) as total_flights from flights_all2020
where origin = 'sea'
group by daily_date;

create view sea2020_delays30 as
select origin, cast(time_hour as date) as daily_date, count(*) as delays_30 from flights_all2020
where (dep_delay > 30) and origin = 'sea'
group by daily_date;

create view sea2020_delays60 as
select origin, cast(time_hour as date) as daily_date, count(*) as delays_60 from flights_all2020
where (dep_delay > 60) and origin = 'sea'
group by daily_date;

create view sea2020_delays120 as
select origin, cast(time_hour as date) as daily_date, count(*) as delays_120 from flights_all2020
where (dep_delay > 120) and origin = 'sea'
group by daily_date;

#### pit stop to check our views
#select * from daily_flights_sea2020;
#select * from sea2020_delays30;
#select * from sea2020_delays60;
#select * from sea2020_delays120;

create view daily_delays_sea2020 as
select a.*, b.delays_30, c.delays_60, d.delays_120 from daily_flights_sea2020 a
left join sea2020_delays30 b on a.daily_date = b.daily_date
left join sea2020_delays60 c on b.daily_date = c.daily_date
left join sea2020_delays120 d on b.daily_date = d.daily_date;

create view delays_weather_sea2020 as 
select a.*, b.total_flights, delays_30, delays_60, delays_120
from daily_weather_sea2020 a
left join daily_delays_sea2020 b on a.daily_date = b.daily_date;

################################################################
# part 4d - sea airport 2021
################################################################

create view daily_weather_sea2021 as
select daily_date, station, max(hourly_temp) as max_temp, sum(hourly_rain) as daily_rain from
	(select station, cast(valid as date) as "daily_date", hour(valid) as "my_hour", max(0+tmpf) as hourly_temp, max(0+p01i) as hourly_rain 
	from weather_sea2021
	group by station, daily_date, my_hour) sub
group by daily_date, station;

create view daily_flights_sea2021 as
select origin, cast(time_hour as date) as daily_date, count(*) as total_flights from flights_all2021
where origin = 'sea'
group by daily_date;

create view sea2021_delays30 as
select origin, cast(time_hour as date) as daily_date, count(*) as delays_30 from flights_all2021
where (dep_delay > 30) and origin = 'sea'
group by daily_date;

create view sea2021_delays60 as
select origin, cast(time_hour as date) as daily_date, count(*) as delays_60 from flights_all2021
where (dep_delay > 60) and origin = 'sea'
group by daily_date;

create view sea2021_delays120 as
select origin, cast(time_hour as date) as daily_date, count(*) as delays_120 from flights_all2021
where (dep_delay > 120) and origin = 'sea'
group by daily_date;

#### pit stop to check our views
#select * from daily_flights_sea2021;
#select * from sea2021_delays30;
#select * from sea2021_delays60;
#select * from sea2021_delays120;

create view daily_delays_sea2021 as
select a.*, b.delays_30, c.delays_60, d.delays_120 from daily_flights_sea2021 a
left join sea2021_delays30 b on a.daily_date = b.daily_date
left join sea2021_delays60 c on b.daily_date = c.daily_date
left join sea2021_delays120 d on b.daily_date = d.daily_date;

create view delays_weather_sea2021 as 
select a.*, b.total_flights, delays_30, delays_60, delays_120
from daily_weather_sea2021 a
left join daily_delays_sea2021 b on a.daily_date = b.daily_date;

################################################################
# part 4e - sea airport 2022
################################################################

create view daily_weather_sea2022 as
select daily_date, station, max(hourly_temp) as max_temp, sum(hourly_rain) as daily_rain from
	(select station, cast(valid as date) as "daily_date", hour(valid) as "my_hour", max(0+tmpf) as hourly_temp, max(0+p01i) as hourly_rain 
	from weather_sea2022
	group by station, daily_date, my_hour) sub
group by daily_date, station;

create view daily_flights_sea2022 as
select origin, cast(time_hour as date) as daily_date, count(*) as total_flights from flights_all2022
where origin = 'sea'
group by daily_date;

create view sea2022_delays30 as
select origin, cast(time_hour as date) as daily_date, count(*) as delays_30 from flights_all2022
where (dep_delay > 30) and origin = 'sea'
group by daily_date;

create view sea2022_delays60 as
select origin, cast(time_hour as date) as daily_date, count(*) as delays_60 from flights_all2022
where (dep_delay > 60) and origin = 'sea'
group by daily_date;

create view sea2022_delays120 as
select origin, cast(time_hour as date) as daily_date, count(*) as delays_120 from flights_all2022
where (dep_delay > 120) and origin = 'sea'
group by daily_date;

#### pit stop to check our views
#select * from daily_flights_sea2022;
#select * from sea2022_delays30;
#select * from sea2022_delays60;
#select * from sea2022_delays120;

create view daily_delays_sea2022 as
select a.*, b.delays_30, c.delays_60, d.delays_120 from daily_flights_sea2022 a
left join sea2022_delays30 b on a.daily_date = b.daily_date
left join sea2022_delays60 c on b.daily_date = c.daily_date
left join sea2022_delays120 d on b.daily_date = d.daily_date;

create view delays_weather_sea2022 as 
select a.*, b.total_flights, delays_30, delays_60, delays_120
from daily_weather_sea2022 a
left join daily_delays_sea2022 b on a.daily_date = b.daily_date;

##############################################
select * from delays_weather_sea2018;
select * from delays_weather_sea2019;
select * from delays_weather_sea2020;
select * from delays_weather_sea2021;
select *  from delays_weather_sea2022;
##############################################

###########################################################
# creating a union of all years, per airport

create view delays_weather_iah_ALLYEARS as
select * from delays_weather_iah2018
union select * from delays_weather_iah2019
union select * from delays_weather_iah2020
union select * from delays_weather_iah2021
union select * from delays_weather_iah2022;

create view delays_weather_jfk_ALLYEARS as
select * from delays_weather_jfk2018
union select * from delays_weather_jfk2019
union select * from delays_weather_jfk2020
union select * from delays_weather_jfk2021
union select * from delays_weather_jfk2022;

create view delays_weather_sea_ALLYEARS as
select * from delays_weather_sea2018
union select * from delays_weather_sea2019
union select * from delays_weather_sea2020
union select * from delays_weather_sea2021
union select * from delays_weather_sea2022;

create view delays_weather_san_ALLYEARS as
select * from delays_weather_san2018
union select * from delays_weather_san2019
union select * from delays_weather_san2020
union select * from delays_weather_san2021
union select * from delays_weather_san2022;

#######################################################
select * from delays_weather_iah_ALLYEARS;
select * from delays_weather_jfk_ALLYEARS;
select * from delays_weather_sea_ALLYEARS;
select * from delays_weather_san_ALLYEARS;
#######################################################