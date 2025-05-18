# DataAnalyst_portfolio
Tech Layoffs Data Cleaning & Analysis (SQL Project)
Tech Layoffs Data Cleaning & Analysis (SQL Project)
Project Overview
This project involved cleaning and analyzing a real-world dataset of tech company layoffs using SQL. The goal was to prepare messy data for analysis and derive valuable insights regarding layoffs by company, industry, country, and over time.

Objectives
Identify and remove duplicate records.

Standardize inconsistent values across key fields such as industry and country.

Handle missing or null data appropriately.

Format and convert date fields for time-based analysis.

Conduct exploratory data analysis (EDA) to uncover patterns and trends in layoffs.

Tools Used
SQL (MySQL)

**MySQL Workbench (or any SQL-based environment)**

*Data Cleaning Process
*Duplicate Removal
*Duplicate rows were detected using SQL window functions and removed to ensure the dataset had only unique records.

**Standardization of Data**

Industry and country names were standardized (e.g., variations of “Crypto” and formatting inconsistencies in “United States”).

Blank fields were converted to NULL to improve query accuracy and maintain consistency.

**Null Handling**
Where possible, missing values (especially in the industry field) were filled by referencing existing values for the same company. Records with entirely missing key data (such as both total and percentage laid off) were removed as they provided no analytical value.

**Date Formatting**
All date values were converted from string format to SQL’s native DATE type to allow for chronological analysis.

**Exploratory Data Analysis (EDA)**
Once the data was cleaned, I conducted an analysis to answer key business questions, such as:

Which companies had the highest number of layoffs?

Which industries and countries were most affected?

What is the trend of layoffs over the years and months?

How many companies laid off 100% of their workforce?

What is the correlation between funds raised and layoffs?

Which stages of funding were most impacted by layoffs?

**Key Insights**
Several companies experienced complete workforce reductions.

The tech industry faced its highest layoffs in recent years, especially during economic downturns and shifts in venture capital funding.

Layoffs were concentrated in a few countries and industries, with the United States, FinTech, and Crypto sectors particularly impacted.

Companies in early and late-stage funding rounds were more prone to large-scale layoffs.
