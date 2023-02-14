#this file is generated to perform database audits comparing differences (if any) between local machines

use ads507airlines;

show tables;

select * from airlines_all2018;
select * from airlines_all2019;
select * from airlines_all2020;
select * from airlines_all2021;
select * from airlines_all2022;


select count(*) from flights_all2018;
select count(*) from flights_all2019;
select count(*) from flights_all2020;
select count(*) from flights_all2021;
select count(*) from flights_all2022;

select count(*) from weather_iah2018;
select count(*) from weather_iah2019;
select count(*) from weather_iah2020;
select count(*) from weather_iah2021;
select count(*) from weather_iah2022;

select count(*) from weather_iah2018;
select count(*) from weather_iah2019;
select count(*) from weather_iah2020;
select count(*) from weather_iah2021;
select count(*) from weather_iah2022;

select count(*) from weather_jfk2018;
select count(*) from weather_jfk2019;
select count(*) from weather_jfk2020;
select count(*) from weather_jfk2021;
select count(*) from weather_jfk2022;

select * from weather_san2018;
select count(*) from weather_san2019;
select count(*) from weather_san2020;
select count(*) from weather_san2021;
select count(*) from weather_san2022;

select count(*) from weather_sea2019;
select count(*) from weather_sea2020;
select count(*) from weather_sea2021;
select count(*) from weather_sea2022;
