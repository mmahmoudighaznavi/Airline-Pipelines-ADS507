################################################
#ADS 507 project practice
options(timeout = 1000)

setwd('C:/Users/reagins/Desktop/USD/ADS_507_practical_data_engineering/project_practice_files')

###############################
# exploring this package https://github.com/simonpcouch/anyflights
# and its documentation here: https://anyflights.netlify.app/

#install.packages("anyflights")
#install.packages("readr")

#I also need to update my "lifecycle" package
#install.packages("lifecycle")

#readr library for problems() function
library(readr)

library(anyflights)


# flights data
flights_all2018 <- get_flights(c("IAH","SAN","SEA","JFK"), 2018, 1:12)
flights_all2019 <- get_flights(c("IAH","SAN","SEA","JFK"), 2019, 1:12)
flights_all2020 <- get_flights(c("IAH","SAN","SEA","JFK"), 2020, 1:12)
flights_all2021 <- get_flights(c("IAH","SAN","SEA","JFK"), 2021, 1:12)
flights_all2022 <- get_flights(c("IAH","SAN","SEA","JFK"), 2022, 1:10)

write.csv(flights_all2018,'C:/Users/reagins/Desktop/USD/ADS_507_practical_data_engineering/project_practice_files/2018/flights_all2018.csv')
write.csv(flights_all2019,'C:/Users/reagins/Desktop/USD/ADS_507_practical_data_engineering/project_practice_files/2019/flights_all2019.csv')
write.csv(flights_all2020,'C:/Users/reagins/Desktop/USD/ADS_507_practical_data_engineering/project_practice_files/2020/flights_all2020.csv')
write.csv(flights_all2021,'C:/Users/reagins/Desktop/USD/ADS_507_practical_data_engineering/project_practice_files/2021/flights_all2021.csv')
write.csv(flights_all2022,'C:/Users/reagins/Desktop/USD/ADS_507_practical_data_engineering/project_practice_files/2022/flights_all2022.csv')


# weather data
weather_all2018 <- get_weather(c("IAH","SAN","SEA","JFK"), 2018, 1:12,
              dir = 'C:/Users/reagins/Desktop/USD/ADS_507_practical_data_engineering/project_practice_files/2018/')
weather_all2019 <- get_weather(c("IAH","SAN","SEA","JFK"), 2019, 1:12,
              dir = 'C:/Users/reagins/Desktop/USD/ADS_507_practical_data_engineering/project_practice_files/2019/')
weather_all2020 <- get_weather(c("IAH","SAN","SEA","JFK"), 2020, 1:12,
                               dir = 'C:/Users/reagins/Desktop/USD/ADS_507_practical_data_engineering/project_practice_files/2020/')
weather_all2021 <- get_weather(c("IAH","SAN","SEA","JFK"), 2021, 1:12,
                               dir = 'C:/Users/reagins/Desktop/USD/ADS_507_practical_data_engineering/project_practice_files/2021/')
weather_all2022 <- get_weather(c("IAH","SAN","SEA","JFK"), 2022, 1:10,
                               dir = 'C:/Users/reagins/Desktop/USD/ADS_507_practical_data_engineering/project_practice_files/2022/')

#airlines data
airlines_all2018 <- get_airlines(flights_data = get_flights(c("IAH","SAN","SEA","JFK"), 2018, 1:12))
airlines_all2019 <- get_airlines(flights_data = get_flights(c("IAH","SAN","SEA","JFK"), 2019, 1:12))
airlines_all2020 <- get_airlines(flights_data = get_flights(c("IAH","SAN","SEA","JFK"), 2020, 1:12))
airlines_all2021 <- get_airlines(flights_data = get_flights(c("IAH","SAN","SEA","JFK"), 2021, 1:12))
airlines_all2022 <- get_airlines(flights_data = get_flights(c("IAH","SAN","SEA","JFK"), 2022, 1:10))

write.csv(airlines_all2018,'C:/Users/reagins/Desktop/USD/ADS_507_practical_data_engineering/project_practice_files/2018/airlines_all2018.csv')
write.csv(airlines_all2019,'C:/Users/reagins/Desktop/USD/ADS_507_practical_data_engineering/project_practice_files/2019/airlines_all2019.csv')
write.csv(airlines_all2020,'C:/Users/reagins/Desktop/USD/ADS_507_practical_data_engineering/project_practice_files/2020/airlines_all2020.csv')
write.csv(airlines_all2021,'C:/Users/reagins/Desktop/USD/ADS_507_practical_data_engineering/project_practice_files/2021/airlines_all2021.csv')
write.csv(airlines_all2022,'C:/Users/reagins/Desktop/USD/ADS_507_practical_data_engineering/project_practice_files/2022/airlines_all2022.csv')
