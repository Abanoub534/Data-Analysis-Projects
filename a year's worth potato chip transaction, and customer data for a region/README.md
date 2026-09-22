# Quantium Retail Analytics – Potato Chip Sales Analysis

## Project Overview

This project is a retail analytics case study based on one year of potato chip transaction and customer data from a retail region.

The project was completed as part of the Quantium Virtual Experience and focuses on understanding customer purchasing behavior, analyzing store performance, and evaluating the results of a new store trial.

The analysis was organized into **three tasks**, covering data preparation, store comparison, and business reporting.

### Project Workflow

```text
Source Data
    │
    ├── QVI_purchase_behaviour.csv
    └── QVI_transaction_data.xlsx
    │
    ▼
Task 1 – Data Exploration & Cleaning
    │
    ├── Data exploration and data cleaning.sql
    ├── customer data.xlsx
    └── Potatp Chip sales analysis.pbix
    │
    ▼
Task 2 – Control Store Selection
    │
    ├── Querying the data to be used.sql
    ├── store_customer_monthly_data.csv
    └── trial_vs_control_store.py
    │
    ▼
Task 3 – Trial Store Evaluation
    │
    ├── 77 vs 17.png
    ├── 86 vs 138.png
    ├── 88 vs 201.png
    └── Trial Store Analysis Report.docx
```

---

## Business Objectives

The main objectives of this project were to:

- Explore and clean retail transaction and customer data.
- Understand potato chip purchasing behavior.
- Analyze customer segments and sales performance.
- Identify suitable control stores for trial-store evaluation.
- Compare trial stores with their selected control stores.
- Evaluate store performance during the trial period.
- Present business insights and recommendations to support retail decision-making.

---

## Source Data

The project uses two original datasets.

### 1. `QVI_purchase_behaviour.csv`

Contains customer purchasing behavior and demographic information.

The dataset was used to understand customer characteristics and analyze purchasing patterns.

### 2. `QVI_transaction_data.xlsx`

Contains retail transaction data for the potato chip category.

The dataset includes information such as:

- Store number.
- Customer loyalty card number.
- Transaction date.
- Product information.
- Sales values.
- Transaction counts.

These two datasets formed the foundation for the analysis across all three tasks.

---

## Task 1 – Data Exploration & Cleaning

### Objective

The first task focused on exploring the raw data, identifying data quality issues, and preparing the datasets for analysis.

The task also included the initial Power BI analysis of potato chip sales.

### Files

#### `Data exploration and data cleaning.sql`

**Tool:** Microsoft SQL Server – T-SQL

This SQL script was used to explore and clean the raw data.

The work included:

- Inspecting the structure of the source datasets.
- Reviewing available columns and data types.
- Checking data quality issues.
- Investigating missing and inconsistent values.
- Validating transaction and customer information.
- Preparing the data for further analysis.

The purpose was to create a reliable foundation for the following tasks.

#### `customer data.xlsx`

This Excel file contains customer-related data used in the analysis.

It was used to support the exploration of customer purchasing behavior and connect customer information with transaction-level data.

The customer data helped provide additional context for understanding purchasing patterns across different customer groups.

#### `Potatp Chip sales analysis.pbix`

**Tool:** Microsoft Power BI

This Power BI report was used for the initial potato chip sales analysis.

The report focused on exploring the sales data and understanding the performance of the potato chip category.

The analysis included:

- Sales performance.
- Customer purchasing behavior.
- Product-level analysis.
- Store-level analysis.
- Customer segment insights.

The Power BI report helped transform the prepared data into visual business insights.

### Outcome

By the end of Task 1, the data had been explored and prepared for the next stages of the project.

The initial Power BI analysis provided a foundation for understanding the potato chip category and identifying areas for deeper investigation.

---

## Task 2 – Control Store Selection & Statistical Analysis

### Objective

The second task focused on preparing the data required for trial-store evaluation and identifying suitable control stores.

The goal was to compare store performance and find stores with similar pre-trial characteristics to the selected trial stores.

### Files

#### `Querying the data to be used.sql`

**Tool:** Microsoft SQL Server – T-SQL

This SQL script was used to query and prepare the data required for the store comparison analysis.

The queries focused on extracting and organizing the relevant data for:

- Store-level analysis.
- Customer-level analysis.
- Monthly sales performance.
- Transaction behavior.
- Trial and control store comparison.

The output of this step was used as input for the Python analysis.

#### `store_customer_monthly_data.csv`

This CSV file contains the monthly store and customer data used in the control-store selection process.

It was prepared from the SQL queries and used to analyze store performance over time.

The dataset supported comparisons based on metrics such as:

- Monthly sales.
- Number of customers.
- Transactions per customer.

#### `trial_vs_control_store.py`

**Tool:** Python

This Python script was used to compare trial stores with potential control stores.

The trial stores analyzed were:

- Store 77.
- Store 86.
- Store 88.

The analysis included:

##### Store Performance Comparison

Comparing stores based on their historical performance before the trial period.

##### Pearson Correlation

Using Pearson Correlation to measure the similarity between store performance patterns over time.

##### Magnitude Distance

Using Magnitude Distance to compare the scale of store performance across relevant metrics.

##### Control Store Selection

Combining store performance similarity and magnitude comparisons to identify suitable control stores.

The selected control stores were:

| Trial Store | Control Store |
|---|---|
| 77 | 17 |
| 86 | 138 |
| 88 | 201 |

These store pairs were used in Task 3 to evaluate the trial-store performance.

### Outcome

By the end of Task 2, the data required for trial evaluation had been prepared, and suitable control stores had been identified for each trial store.

This created the foundation for comparing trial stores against stores with similar pre-trial performance.

---

## Task 3 – Trial Store Evaluation & Business Reporting

### Objective

The third task focused on evaluating the performance of the trial stores against their selected control stores.

The goal was to understand changes in store performance during the trial period and communicate the findings through a business-facing report.

### Files

#### `77 vs 17.png`

Comparison of Trial Store 77 against Control Store 17.

This visualization supports the evaluation of the performance relationship between the two stores.

#### `86 vs 138.png`

Comparison of Trial Store 86 against Control Store 138.

This visualization supports the evaluation of the performance relationship between the two stores.

#### `88 vs 201.png`

Comparison of Trial Store 88 against Control Store 201.

This visualization supports the evaluation of the performance relationship between the two stores.

#### `Trial Store Analysis Report.docx`

**Tool:** Microsoft Word

This report contains the business-facing analysis of the trial stores.

The report was used to communicate the findings from the trial-store evaluation in a structured and understandable format.

The analysis focused on:

- Trial-store performance.
- Control-store comparisons.
- Sales trends.
- Store-level results.
- Interpretation of the trial outcomes.
- Business recommendations.

The report translated the technical analysis into insights that could support decisions related to store layout and potato chip sales.

### Outcome

By the end of Task 3, the project produced a complete trial-store evaluation supported by visual comparisons and a written business report.

The results were used to communicate the findings and provide recommendations based on the analysis.

---

## Tools & Technologies

| Tool | Purpose |
|---|---|
| **Microsoft SQL Server – T-SQL** | Data exploration, cleaning, querying, and data preparation |
| **Microsoft Excel** | Customer data preparation and supporting analysis |
| **Python** | Store comparison and statistical analysis |
| **Pandas** | Data manipulation and analysis |
| **Power BI** | Sales analysis and business visualization |
| **Microsoft Word** | Trial-store analysis report |
| **GitHub** | Project organization and documentation |

---

## Key Analytical Areas

The project covered the following analytical areas:

### Customer Analytics

- Customer purchasing behavior.
- Customer demographic analysis.
- Customer segmentation.
- Sales contribution by customer group.

### Retail Sales Analytics

- Store-level sales performance.
- Monthly sales trends.
- Transaction behavior.
- Customer purchasing patterns.

### Statistical Store Comparison

- Pearson Correlation.
- Magnitude Distance.
- Trial-store and control-store comparison.
- Pre-trial performance analysis.

### Business Intelligence

- KPI development.
- Power BI reporting.
- Business-focused visualizations.
- Trial-store evaluation.
- Business recommendations.

---

## Skills Demonstrated

This project demonstrates my ability to:

### 1. Work with Real-World Data

Explore raw datasets, identify data quality issues, and prepare data for reliable analysis.

### 2. Use SQL for Data Preparation

Write SQL queries to clean, transform, and extract data for analytical purposes.

### 3. Apply Python to Business Analysis

Use Python and Pandas to analyze store performance and apply statistical methods to support control-store selection.

### 4. Build Business Intelligence Reports

Use Power BI to explore sales performance, develop KPIs, and communicate insights through visualizations.

### 5. Communicate Business Insights

Translate technical analysis into a structured business report with practical recommendations.

---

## Project Deliverables

The project includes:

- Original transaction and customer datasets.
- SQL data exploration and cleaning script.
- Customer data Excel file.
- Power BI potato chip sales analysis.
- SQL queries for store comparison.
- Monthly store-customer dataset.
- Python trial vs control store analysis.
- Trial-store comparison visualizations.
- Final trial-store analysis report.

---

## Author

**Abanoub Emad Nazir**

Computer Science Graduate | Data Analyst | Business Intelligence

### Technical Skills

SQL • Python • Pandas • Power BI • DAX • Excel • Data Cleaning • Retail Analytics • Statistical Analysis • Business Reporting

### GitHub

[Abanoub534 – Data Analysis Projects](https://github.com/Abanoub534/Data-Analysis-Projects)

---

## Project Summary

The Quantium Retail Analytics project demonstrates a complete data analytics workflow, starting with raw retail data and ending with business insights.

Across three tasks, I worked on data exploration and cleaning, customer and store analysis, statistical control-store selection, and trial-store evaluation.

The project highlights my ability to combine SQL, Python, Power BI, and business reporting to support data-driven retail decisions.