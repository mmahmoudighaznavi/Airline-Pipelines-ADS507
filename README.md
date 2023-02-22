# ADS507 Airlines Project
Thank you for visiting this repository which contains code and data for analyzing select airline flights between 2018 and 2022 originating from 4 airports in the United States. 

The project was created to satisfy the requirements of a graduate-level course in Practical Data Engineering. The collaborators are:
* Vivian Do
* Mohammad Mahmoudighaznavi
* Stephen Reagin

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
    * `daily_weather_delays.sql`
    * `tables.moh.sql`
    * `travelers_delay_info.sql`
    
We also have the following files in the main view:
* `airlines_full_db.sql` (and `.gitattributes`)
  * The entire persistent store SQL database, approximately 710MB
  * `.gitattributes` is necessary for Git Large File Storage (see documentation [here](https://docs.github.com/en/repositories/working-with-files/managing-large-files/configuring-git-large-file-storage))
* `architecture_diagram.mwb`
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

### Step 1: Setting up the Database
There are three ways set up the database:
1. [easiest] Download the `airlines_full_db.sql` file provided in this repository
   - If using MySQL client, run the command `mysql> source path/to/airlines_full_db.sql` to connect the database to MySQL server, replacing `path/to` with the actual local filepath
2. [more involved] Download the CSV files under **data_files** in this directory and build the database for option (1) above using the SQL scripts under **SQL_scripts/table_creation_scripts**
   - Each of the table creation scripts is almost identical with minor differences. Recommend to start with `ads507_airlines_schema_SFRcopy.sql` and switch to a different one if you encounter errors (assuming you follow Note 2 below)
4. [build from scratch] Start from the `R_anyflights_data_pull.R` file under **data_files** to call the API directly using R, perform some light manual editing of the CSV files, then follow option (2) above

##### Note 1
If you choose option 3, you will need to change the working directory in the R file to your own local working directory. You may also need to manually edit the CSV files using a tool like Microsoft Excel or similar, specifically:
* deleting the first several rows from each *weather_XXX.csv* which only contain commented lines prefixed by "#", causing import errors in MySQL and Python
* reformatting the datetime objects in each *flights20xx.csv* file

##### Note 2
If you choose option 2, you will need to change the working directory to your own local working directory for each of the SQL commands
* `load data local infile 'path/airlines_all2018.csv' into table ads507airlines.airlines_all2018 fields terminated by ',' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES ;`

### Step 2: Running the Outputs

After connecting the database to MySQL server, download one of the Python notebooks and run the cells from the top. You may need to alter the following credentials to your specific configuration, which will also prompt you for your MySQL server password:
```{sql}
conn=mysql.connect(host='localhost',
                   port=int(3306),
                   user='root',
                   passwd=getpass.getpass('Enter password: '),
                   db='ads507airlines')
```

You may also need to install some of the Python packages using `pip install [package]` or `conda install [package]`:
```{python}
import pandas as pd
import numpy as np

import pymysql as mysql
import getpass

import matplotlib.pyplot as plt
import seaborn as sns
```
