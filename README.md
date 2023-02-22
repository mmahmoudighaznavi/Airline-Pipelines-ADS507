# ADS507 Airlines Project

## Contents of the Repository 
This repository is organized under the following sub-directories:

* **data_files**
  * This contains an R script for calling the **anyflights** API and generating CSV tables, plus the CSV files we generated, organized by year
  * Each year folder contains:
    * 1 file for airlines data
    * 1 file for all 20xx flights from IAH, JFK, SAN, SEA airports
    * 4 files covering weather outputs in 5-minute intervals for the entire year, one for each airport
* **python_outputs**
  * Potential deliverables that an end-consumer may want to use or build from
* **SQL_scripts**
  * Files for creating the database are located under the table_creation_scripts sub-directory
  * Files beginning in 0_xxxxx were used to verify working functionality
  * The other files were for ETL, cleanup, and generating views for multiple endpoint consumers
    * daily_weather_delays.sql
    * tables.moh.sql
    * travelers_delay_info.sql
    
We also have the following files in the main view:
* **airlines_full_db.sql** (and **.gitattributes**)
  * The entire persistent store SQL database, approximately 710MB
  * **.gitattributes** is necessary for Git Large File Storage (see documentation [here](https://docs.github.com/en/repositories/working-with-files/managing-large-files/configuring-git-large-file-storage))
* architecture_diagram.mwb
  * Architecture diagram of the database

## Data

All data comes from the `anyflights` R package:
* GitHub https://github.com/simonpcouch/anyflights
* Documentation https://anyflights.netlify.app/

Data CSV files are organized by year, and includes:
* Flight data for IAH, JFK, SAN, SEA (one file per year)
* Weather data for IAH, JFK, SAN, SEA (one file per airport per year)
* Planes data for IAH, JFK, SAN, SEA (one file per year)

## Deploying the Pipeline

There are three ways set up the database:
1. Download the **airlines_full_db.sql** file provided in this repository (easiest)
2. Download the CSV files under **data_files** in this directory and build the database for option (1) above using the SQL scripts under **SQL_scripts/table_creation_scripts** (intermediate)
3. Start from the R file under **data_files** to download files, perform some light manual editing, then follow option (2) above
