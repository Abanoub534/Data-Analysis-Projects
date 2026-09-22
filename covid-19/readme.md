# COVID-19 Global Analysis

## Project Overview

This project looks at the global impact of COVID-19 between **January 1,
2020 and April 30, 2021**.

The analysis covers **219 countries across 6 continents** and focuses on
cases, deaths, case fatality rates, vaccination, transmission, and data
quality.

The goal was to turn the raw COVID-19 data into a clear view of how the
pandemic affected different regions and countries, while also
highlighting some of the limitations in the available data.

## What I Analyzed

The project covers several main areas:

-   Global COVID-19 cases and deaths
-   Differences between continents
-   Countries with the highest death tolls
-   Case fatality rates
-   Vaccination progress
-   Transmission dynamics using R-values
-   Missing and inconsistent data
-   Key findings that can be useful for public-health decision making

## Key Findings

### Global Impact

By the end of April 2021, the dataset showed more than **150 million
confirmed cases** and more than **3.2 million deaths** worldwide.

### Continental Comparison

  ----------------------------------------------------------------------------
  Continent          Cases       Deaths   Death Rate      Cases /     Deaths /
                                                          Million      Million
  ----------- ------------ ------------ ------------ ------------ ------------
  North America      32.3M         576K        1.78%       97,724        1,741

  South America      14.7M         404K        2.75%       68,964        1,900

  Asia               19.2M         212K        1.11%       13,315          147

  Europe              5.7M         128K        2.25%       38,907          876

  Africa              1.6M          54K        3.44%        7,671          264

  Oceania              30K          910        3.05%        1,169           36
  ----------------------------------------------------------------------------

The report highlights two notable differences:

-   **Africa** had the highest death-to-case ratio at **3.44%**, while
    having relatively few cases per capita. The report links this to
    factors such as limited testing capacity and healthcare
    infrastructure.
-   **South America** had the highest reported death toll per million
    people at **1,900 deaths per million**.

These points are presented as part of the report's analysis and should
be interpreted alongside the data-quality limitations discussed later.

### Country-Level Analysis

The report also looks at countries with the highest total death counts.

The **United States, Brazil, India, Mexico, and the United Kingdom**
accounted for more than half of the global deaths in the dataset.

For countries with more than 100,000 reported cases, the highest case
fatality rates in the report were:

  Country     Case Fatality Rate
  --------- --------------------
  Mexico                   9.25%
  Egypt                    5.86%
  Ecuador                  4.88%
  China                    4.73%
  Bosnia                   4.31%

The report also notes that case fatality rates can be strongly affected
by testing levels and other data limitations, so these figures should
not be treated as a direct measure of healthcare performance.

## Vaccination Analysis

The report compares vaccination progress across several countries.

Some of the reported figures for fully vaccinated people were:

  Country            Fully Vaccinated   Share of Population
  ---------------- ------------------ ---------------------
  Israel                         5.1M                58.84%
  United States                101.4M                30.64%
  United Kingdom                ~15M                 ~22%
  Serbia                         1.5M                21.87%
  Hungary                        1.9M                20.17%
  Russia                         7.5M                 5.16%
  Canada                         1.1M                 2.89%
  Indonesia                      7.6M                 2.80%
  India                         26.6M                 1.93%

The report discusses the relationship between vaccination access and
economic conditions, while also pointing out that vaccination data was
still limited during parts of the analyzed period.

## Transmission Dynamics

The analysis also looks at the **R-value**, which was used to understand
transmission patterns.

Some of the higher R-values reported were:

-   Nepal: **1.99**
-   Sri Lanka: **1.79**
-   Cambodia: **1.57**

The report also found that many island nations had R-values close to
zero, while several large economies had R-values around or below 1
during the analyzed period.

The report highlights higher R-values in parts of Asia as an early
warning signal for later transmission waves.

## Data Quality

One important part of the project was looking at the quality and
completeness of the dataset.

The report identified several issues:

-   Around **90% of ICU data was missing**
-   Around **89% of vaccination data was missing**
-   Around **50% of testing data was missing**
-   **4,111 rows** had null continent values
-   Aggregate entries were mixed with country-level data

These issues matter because missing data can affect comparisons between
countries and regions.

## Methodology

The analysis was based on the **WHO COVID-19 Dashboard through Our World
in Data**.

### Dataset

-   Period: January 1, 2020 -- April 30, 2021
-   Coverage: 219 locations
-   Observations: 85,171
-   Variables: 59

### Workflow

``` text
COVID-19 Dataset
       ↓
SQL ETL & Data Preparation
       ↓
Python Data Analysis
       ↓
Power BI Visualization
       ↓
Executive Analysis & Recommendations
```

### Tools Used

  Tool       Purpose
  ---------- -------------------------------------------
  SQL        Data preparation, cleaning, and ETL
  Python     Data analysis and exploration
  Power BI   Visualization and reporting
  GitHub     Project version control and documentation

## Strategic Takeaways

Based on the report's analysis, several areas stood out:

-   **Testing capacity matters:** Case numbers are difficult to
    interpret without considering how much testing was being done.
-   **Vaccination is also an epidemiological factor:** Differences in
    vaccine access affected the situation across countries.
-   **Deaths are a lagging indicator:** Death figures need to be
    considered alongside cases and transmission trends.
-   **Data infrastructure matters:** Missing or inconsistent reporting
    can make international comparisons less reliable.

## Recommendations from the Report

The report recommends:

1.  Strengthening ICU and hospitalization reporting.
2.  Tracking death rates alongside case rates.
3.  Monitoring R-values at the regional level.
4.  Prioritizing vaccine delivery to countries with high transmission
    rates.

## Limitations

There are several limitations to keep in mind when interpreting the
analysis:

-   Case fatality rates are sensitive to differences in testing.
-   Some anomalies were found in the July 2020 data.
-   Vaccination data was relatively sparse during early 2021.
-   A large amount of ICU, testing, and vaccination data was missing.

Because of these limitations, the findings are best viewed in the
context of the available data rather than as a complete picture of the
pandemic.

## Project Deliverables

The project includes:

-   SQL data preparation and ETL
-   Python analysis
-   Power BI visualizations
-   Country and continental comparisons
-   Vaccination analysis
-   R-value analysis
-   Data-quality analysis
-   Executive report with findings and recommendations

## What This Project Shows

This project combines **SQL, Python, and Power BI** to take a large
real-world dataset from raw data preparation through analysis and
visualization.

More importantly, it focuses not only on producing charts, but also on
understanding **what the data can actually tell us, where the data has
limitations, and how those limitations affect the analysis**.

## Author

**Abanoub Emad Nazir**\
Computer Science Graduate \| Data Analyst \| Business Intelligence

Skills used in this project:

-   SQL
-   Python
-   Power BI
-   Data Cleaning
-   Data Analysis
-   Data Visualization
-   Statistical Analysis
-   Business Reporting

GitHub: [Abanoub534](https://github.com/Abanoub534)

## Project Summary

A global COVID-19 analysis covering **219 countries from January 2020 to
April 2021**, using SQL, Python, and Power BI to explore the pandemic's
impact, vaccination progress, transmission patterns, and data quality.
