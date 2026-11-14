# CMS Medicare Inpatient Hospitals - by Provider and Service

---

# Anthony Vudis

---

# 11/12/26

---

# Description

I would like to work with real applicable data and see what I am capable of doing and I am using the dataset by CMS to practice. I am going to use Pandas for data sorting and cleaning, DuckDB SQL for answering important questions on the data, then I will use PowerBI for visualizations. I will narrow down my focus to just the midwest(states such as IL, IN, IA, KS, MI, MN, MO, NE, ND, OH, SD, WI). I plan to compare the data over 10 years to see how prices and coverage has changed. V1 will start with just a single year(2024), V2 will be incremented years such as every 2 years from 2014 to 2024, and V3 will be all 10 years from 2014 to 2024.

### Status: V1 in-progress

---

# Required Languages/packages with installation

    Python

        pip/conda install python=3.14

    Pandas

        pip/conda install pandas 

    DuckDB

        pip/conda install duckdb

---

# Running Process

In terminal run in order:

    python3 cleaning.py

    python3 SQL_Query.py

The python file `cleaning.py` will first clean the data and sort the data by region into Midwest categories. Then the `SQL_Query.py` file runs SQL queries on that data that will be in csv format named `CMS_midwest_data.csv`. The results from the SQL Queries can be seen in the output file named `V1_SQL_OUTPUT.txt`. 

---

# Dataset

CMS’s Medicare Inpatient Hospitals - by Provider and Service from 

### https://data.cms.gov/provider-summary-by-type-of-service/medicare-inpatient-hospitals/medicare-inpatient-hospitals-by-provider-and-service

---

# 2024 Single Year Questions 

    How do charges and payments vary across Midwest hospitals with the same DRG? Does payment vary much less than charges?

    Does hospital size, measured by total discharges, relate to the charge-to-payment ratio?

    How does cost or volume differ by geography, such as rural vs. urban or by city?
