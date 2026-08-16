USE [Covid-19]
-- Starting to look at the data
SELECT * 
FROM Covid_Deaths_Copy;

--looking at nulls for all coulmns
SELECT * 
FROM Covid_Deaths_Copy
WHERE continent IS NULL;

-- when continent is null the country have the continent info,
-- that moostly mean that its a pre-aggregated data and its make it easily to analysis
-- let me check

SELECT continent, location, MAX(population)
FROM Covid_Deaths_Copy
GROUP BY continent, location
ORDER BY continent;

-- yes as we expected its a pre-aggregated data so we can directly go to the EDA proccess

-- Rate of increase in the number of infections each month in each country
SELECT YEAR(date), MAX(total_cases)
FROM Covid_Deaths_Copy
GROUP BY YEAR(date)
ORDER BY YEAR(date);


WITH monthly_date AS(
SELECT 
location,
continent,
MONTH(date) AS month,
SUM(new_cases) AS monthly_cases
FROM Covid_Deaths_Copy
WHERE YEAR(date) = 2020
GROUP BY continent, location, MONTH(date)
),
lagged AS(
SELECT *, 
LAG(monthly_cases) OVER (PARTITION BY location ORDER BY month) AS lagged_monthly_cases
FROM monthly_date
)

SELECT
location,
month,
monthly_cases, 
CASE
WHEN lagged_monthly_cases IS NULL OR lagged_monthly_cases = 0 THEN NULL
ELSE (((monthly_cases - lagged_monthly_cases) / lagged_monthly_cases) *100) 
END AS percenteges_of_increses_of_infection_each_month
FROM lagged
WHERE continent IS NOT NULL AND 
location LIKE '%state%'
ORDER BY location, month;

-- now you can see your country increase percentege

-- thanks for the dataset we can easly look at the continent numbers with a small changes in where function in the end 
WITH monthly_date AS(
SELECT 
location,
continent,
MONTH(date) AS month,
SUM(new_cases) AS monthly_cases
FROM Covid_Deaths_Copy
WHERE YEAR(date) = 2020
GROUP BY continent, location, MONTH(date)
),
lagged AS(
SELECT *, 
LAG(monthly_cases) OVER (PARTITION BY location ORDER BY month) AS lagged_monthly_cases
FROM monthly_date
)

SELECT
location,
month,
monthly_cases, 
CASE
WHEN lagged_monthly_cases IS NULL OR lagged_monthly_cases = 0 THEN NULL
ELSE (((monthly_cases - lagged_monthly_cases) / lagged_monthly_cases) *100) 
END AS percenteges_of_increses_of_infection_each_month
FROM lagged
WHERE continent IS NULL
ORDER BY location, month;

-- and with a small changes in monthly_date func you can see 2021 numbers 

WITH monthly_date AS(
SELECT 
location,
continent,
MONTH(date) AS month,
SUM(new_cases) AS monthly_cases
FROM Covid_Deaths_Copy
WHERE YEAR(date) = 2021
GROUP BY continent, location, MONTH(date)
),
lagged AS(
SELECT *, 
LAG(monthly_cases) OVER (PARTITION BY location ORDER BY month) AS lagged_monthly_cases
FROM monthly_date
)

SELECT
location,
month,
monthly_cases, 
CASE
WHEN lagged_monthly_cases IS NULL OR lagged_monthly_cases = 0 THEN NULL
ELSE (((monthly_cases - lagged_monthly_cases) / lagged_monthly_cases) *100) 
END AS percenteges_of_increses_of_infection_each_month
FROM lagged
WHERE continent IS NOT NULL AND 
location LIKE '%state%'
ORDER BY location, month;


-- the same idea for any percentege comparison based on date 


-- lets go to some small comparisons 
-- infection rate
SELECT continent, location, MAX(population) AS population,
MAX(total_cases) max_cases,
MAX((total_cases / population) * 100) total_cases_per_based_on_population
FROM Covid_Deaths_Copy
WHERE continent IS NOT NULL
GROUP BY continent, location;


-- there is alot of things that we can do with this data, alot of insight

-- all this insight can be done in Covid_vaccinations$

-- The aim of the project is to demonstrate my abilities in using SQL, so i will stop here 

-- who read this words have a good day 
