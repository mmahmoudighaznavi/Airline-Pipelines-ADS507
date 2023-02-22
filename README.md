# ADS507 Airlines Project
Thank you for visiting this repository which contains code and data for analyzing select airline flights between 2018 and 2022 originating from 4 airports in the United States. 

The project was created to satisfy the requirements of a graduate-level course in Practical Data Engineering. The collaborators are:
* Vivian Do <vdo@sandiego.edu>
* Mohammad Mahmoudighaznavi <mmahmoudighaznavi@sandiego.edu>
* Stephen Reagin <sreagin@sandiego.edu>

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

## Data and Source

All data comes from the `anyflights` R package:
* GitHub https://github.com/simonpcouch/anyflights
* Documentation https://anyflights.netlify.app/

Data table files are organized by year, including:
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
If you choose option 2, you will need to change the working directory to your own local working directory for each of the SQL commands which loads the relevant local data file. For example:
```sql
LOAD DATA LOCAL INFILE 'path/2018/airlines_all2018.csv' INTO TABLE ads507airlines.airlines_all2018 
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES ;
```

### Step 2: Monitoring the Database
You can verify that your database was created correctly using the `0_audit_testing_functionality.sql` script in the MySQL workbench tool or similar. As a simple audit, running the following command should return a value of 550111 records: 
```sql 
SELECT count(*) FROM flights_all2018;
```
Selecting the count(\*) from the other tables should yield:

All flights
* `flights_all2018` - 550111 records
* `flights_all2019` - 543160 records
* `flights_all2020` - 359610 records
* `flights_all2021` - 465864 records
* `flights_all2022` - 477742 records

Weather - IAH airport
* `Weather_iah2018` - 113585 records
* `Weather_iah2019` - 113682 records
* `Weather_iah2020` - 100162 records
* `Weather_iah2021` - 112564 records
* `Weather_iah2022` - 93473 records

Weather - JFK airport
* `Weather_jfk2018` - 113249 records
* `Weather_jfk2019` - 113106 records
* `Weather_jfk2020` - 96505 records
* `Weather_jfk2021` - 111850 records
* `Weather_jfk2022` - 91867 records

Weather - SAN airport
* `Weather_san2018` - 113746 records
* `Weather_san2019` - 114179 records
* `Weather_san2020` - 100753  records
* `Weather_san2021` - 113872 records
* `Weather_san2022` - 94601 records

Weather - SEA airport
* `Weather_sea2018` - 109402 records
* `Weather_sea2019` - 101690 records
* `Weather_sea2020` - 82652 records
* `Weather_sea2021` - 102876 records
* `Weather_sea2022` - 89112 records


### Step 3: Running the Outputs

After connecting the database to MySQL server, download one of the Python notebooks and run the cells from the top. You may need to install some of the Python libraries using `pip install [package]` or `conda install [package]`:
```python
import pandas as pd
import numpy as np

import pymysql as mysql
import getpass

import matplotlib.pyplot as plt
import seaborn as sns
```


You may need to alter the following credentials to your specific configuration, which will also prompt you for your MySQL server password:
```python
conn=mysql.connect(host='localhost',
                   port=int(3306),
                   user='root',
                   passwd=getpass.getpass('Enter password: '),
                   db='ads507airlines') #this might need to be db='airlines_full_db' if you directly downloaded the full database
```

After establishing the MySQL connection, verify you are able to connect with the following Python code:
```python
tableNames = pd.read_sql("""SHOW TABLES""", conn)

tableNames
```
