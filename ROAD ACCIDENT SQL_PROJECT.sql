-- create database sql_project;

use sql_project;

desc sql_project;

select * from sql_project;

SELECT *
FROM sql_project
WHERE Number_of_Casualties BETWEEN 5 AND 10;

SELECT *
FROM sql_project
WHERE "Accident Date" BETWEEN '2024-02-22' AND '2024-02-28';
select count(*) from sql_project where Road_Type ="Single carriageway" or Junction_Detail="Crossroads";

select  count(*) from sql_project;

select * from sql_project limit 100;

-- Count the number of accidents for each severity level
SELECT Accident_Severity, COUNT(*) AS Accident_Count
FROM sql_project
GROUP BY Accident_Severity;

-- Calculate the average number of casualties and vehicles involved in accidents
SELECT 
    AVG(Number_of_Casualties) AS Avg_Casualties,
    AVG(Number_of_Vehicles) AS Avg_Vehicles
FROM sql_project;

-- Analyze accidents based on the day of the week
SELECT Day_of_Week, COUNT(*) AS Accident_Count
FROM sql_project
GROUP BY Day_of_Week
ORDER BY Day_of_Week;

-- Count accidents in urban and rural areas
SELECT Urban_or_Rural_Area, COUNT(*) AS Accident_Count
FROM sql_project
GROUP BY Urban_or_Rural_Area;

-- Count accidents based on different weather conditions
SELECT Weather_Conditions, COUNT(*) AS Accident_Count
FROM sql_project
GROUP BY Weather_Conditions;

-- Analyze accidents and their speed limits
SELECT Speed_limit, COUNT(*) AS Accident_Count
FROM sql_project
GROUP BY Speed_limit
ORDER BY Speed_limit;

-- Analyze accidents at junctions with control
SELECT Junction_Control, COUNT(*) AS Accident_Count
FROM  sql_project
WHERE Junction_Control IS NOT NULL
GROUP BY Junction_Control;

-- Analyze accidents by different light conditions
SELECT Light_Conditions, COUNT(*) AS Accident_Count
FROM sql_project
GROUP BY Light_Conditions;

-- Retrieve accidents on a specific day of the week:
SELECT * FROM sql_project WHERE Day_of_Week = 'Monday';

-- Sort accidents by severity in descending order:
SELECT * FROM sql_project ORDER BY Accident_Severity DESC;

-- Sort accidents by severity in Asc order:
SELECT * FROM sql_project ORDER BY Speed_limit Asc;

-- Count the number of accidents for each weather condition
SELECT Weather_Conditions, COUNT(*) AS Accident_Count FROM sql_project GROUP BY Weather_Conditions;

-- Calculate the average number of casualties for each road type:
SELECT Road_Type, AVG(Number_of_Casualties) AS Avg_Casualties FROM sql_project GROUP BY Road_Type;

-- Identify accidents that occurred during nighttime:
SELECT * FROM sql_project WHERE Time >= '18:00:00' AND Time <= '06:00:00';

-- Find accidents involving a specific vehicle type:
SELECT * FROM sql_project WHERE Vehicle_Type IN (SELECT Vehicle_Type FROM sql_project);

-- Identify accidents with casualties exceeding the average:
SELECT * FROM sql_project WHERE Number_of_Casualties > (SELECT AVG(Number_of_Casualties) FROM sql_project);

-- Calculate the percentage of accidents in urban areas:
SELECT Urban_or_Rural_Area, COUNT(*) AS Accident_Count,
       (COUNT(*) / (SELECT COUNT(*) FROM sql_project)) * 100 AS Percentage
FROM sql_project
GROUP BY Urban_or_Rural_Area;


SELECT *
FROM sql_project
WHERE Vehicle_Type LIKE '%bike';

SELECT *
FROM sql_project
WHERE Vehicle_Type LIKE '%bus%';

SELECT *
FROM sql_project
WHERE Vehicle_Type LIKE '%car%van%';
SELECT DISTINCT Police_Force FROM sql_project;
SELECT DISTINCT Road_Surface_Conditions  FROM sql_project;
SELECT DISTINCT Road_Type  FROM sql_project;
SELECT DISTINCT Weather_Conditions  FROM sql_project;
SELECT * FROM sql_project
WHERE NOT Light_Conditions = 'Daylight';

SELECT * FROM sql_project
WHERE  Junction_Detail LIKE 'C%';

SELECT Police_Force, Vehicle_Type, COUNT("ï»¿Accident_Index") AS Accident_Count
FROM sql_project
GROUP BY Police_Force, Vehicle_Type
HAVING COUNT(Speed_limit) > 100
LIMIT 1000;

SELECT
    MIN(Number_of_Casualties) AS Min_Casualties,
    MAX(Number_of_Casualties) AS Max_Casualties,
    MIN(Speed_limit) AS Min_Speed_limit,
    MAX(Speed_limit) AS Max_Speed_limit
FROM sql_project;
-- data cleaning
SELECT * FROM sql_project WHERE "i»¿Accident_Index"IS NULL;

SELECT * FROM sql_project where "Accident Date"is Null;

SELECT * FROM sql_project where "Day_of_Week"is Null;

SELECT * FROM sql_project where "Junction_Detail"is Null;

-- Statistical Analysis
SELECT STDDEV(Latitude), stddev(Longitude),avg(Speed_limit)FROM sql_project;

select avg(Number_of_Casualties),stddev(Number_of_Casualties),variance(Number_of_Casualties) From sql_project;

select avg(Number_of_Vehicles),stddev(Number_of_Vehicles),variance(Number_of_Vehicles) from sql_project;

select avg(Speed_limit) ,stddev(Speed_limit), variance(Speed_limit) from sql_project;


-- INSIGHTS
-- Analyzing road accidents data reveals patterns such as higher casualties and vehicles involved 
-- on single carriageways or crossroads, accidents peaking on Mondays, and a notable proportion occurring in urban areas.
--  Additionally, accidents are more frequent during the night, and specific vehicle types like bikes or buses are associated with distinct incidents. Further examination
--  of factors like weather conditions, light conditions, and junction details provides a comprehensive understanding of road safety.


