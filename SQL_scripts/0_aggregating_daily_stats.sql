use ads507airlines;

select * from airlines_all2018;
select * from flights_all2018 limit 100;
select * from weather_iah2018 limit 100;

show columns from weather_iah2018;

################################################################
#### How many flights did each airline have from each airport?

### 2018
select name, origin, month, count(*) as "2018 flights"
from flights_all2018 a left join airlines_all2018 b on 
a.carrier = b.carrier
group by origin, name, month
order by origin, month, name asc;


### 2019
select name, origin, month, count(*) as "2019 flights"
from flights_all2019 a left join airlines_all2019 b on 
a.carrier = b.carrier
group by origin, name, month
order by origin, month, name asc;

### 2020
select name, origin, month, count(*) as "2020 flights"
from flights_all2020 a left join airlines_all2020 b on 
a.carrier = b.carrier
group by origin, name, month
order by origin, month, name asc;

### 2021
select name, origin, month, count(*) as "2021 flights"
from flights_all2021 a left join airlines_all2021 b on 
a.carrier = b.carrier
group by origin, name, month
order by origin, month, name asc;

### 2022
select name, origin, month, count(*) as "2022 flights"
from flights_all2022 a left join airlines_all2022 b on 
a.carrier = b.carrier
group by origin, name, month
order by origin, month, name asc;


################################################################
#### Aggregate rain by day

##############################
# 2018 - IAH
select my_date, station, max(hourly_temp) as max_temp, sum(hourly_rain) as daily_rain from
	(select station, cast(valid as date) as "my_date", hour(valid) as "my_hour", max(0+tmpf) as hourly_temp, max(0+p01i) as hourly_rain 
	from weather_iah2018
	group by station, my_date, my_hour) sub
group by my_date, station;

# 2019 - IAH
select my_date, station, max(hourly_temp) as max_temp, sum(hourly_rain) as daily_rain from
	(select station, cast(valid as date) as "my_date", hour(valid) as "my_hour", max(0+tmpf) as hourly_temp, max(0+p01i) as hourly_rain 
	from weather_iah2019
	group by station, my_date, my_hour) sub
group by my_date, station;

# 2020 - IAH
select my_date, station, max(hourly_temp) as max_temp, sum(hourly_rain) as daily_rain from
	(select station, cast(valid as date) as "my_date", hour(valid) as "my_hour", max(0+tmpf) as hourly_temp, max(0+p01i) as hourly_rain 
	from weather_iah2020
	group by station, my_date, my_hour) sub
group by my_date, station;

# 2021 - IAH
select my_date, station, max(hourly_temp) as max_temp, sum(hourly_rain) as daily_rain from
	(select station, cast(valid as date) as "my_date", hour(valid) as "my_hour", max(0+tmpf) as hourly_temp, max(0+p01i) as hourly_rain 
	from weather_iah2021
	group by station, my_date, my_hour) sub
group by my_date, station;

# 2022 - IAH
select my_date, station, max(hourly_temp) as max_temp, sum(hourly_rain) as daily_rain from
	(select station, cast(valid as date) as "my_date", hour(valid) as "my_hour", max(0+tmpf) as hourly_temp, max(0+p01i) as hourly_rain 
	from weather_iah2022
	group by station, my_date, my_hour) sub
group by my_date, station;

