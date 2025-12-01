--  How many of our employees live in each town. 
SELECT town_name,
	COUNT(employee_name) AS Employee_count
FROM employee
GROUP BY town_name
ORDER BY town_name;

-- Top 3 assigned_employee_id and employee's info
WITH highest_no_visits AS (SELECT assigned_employee_id,
	COUNT(visit_count) as No_of_visits
FROM visits
GROUP BY assigned_employee_id
LIMIT 3
)

SELECT e.employee_name, 
	e.email,
	e.phone_number
FROM employee AS e
WHERE e.assigned_employee_id IN (
    SELECT assigned_employee_id FROM highest_no_visits
);

-- How many records per town
SELECT COUNT(location_id) AS No_of_records,
	town_name
FROM location
GROUP BY town_name
ORDER BY no_of_records DESC;

-- records per province
SELECT COUNT(location_id) AS No_of_records,
	province_name
FROM location
GROUP BY province_name
ORDER BY no_of_records DESC;

-- records per province per town
SELECT province_name,
	town_name,
    COUNT(location_id) AS records_per_town
FROM location
GROUP BY province_name, town_name
ORDER BY
	province_name ASC,
	records_per_town DESC;
;

-- records per location type
SELECT COUNT(location_id) AS No_of_records,
	location_type
FROM location
GROUP BY location_type
;

-- How many people did we survey?
SELECT SUM(number_of_people_served) 
FROM water_source;

-- How many wells, taps and rivers are there?
SELECT COUNT(source_id) AS No_of_source_type,
	type_of_water_source
FROM water_source
GROUP BY type_of_water_source
ORDER BY No_of_source_type DESC;

-- How many people share particular types of water sources on average?
SELECT ROUND(AVG(number_of_people_served)) AS Avg_no_people_served,
	type_of_water_source
FROM water_source
GROUP BY type_of_water_source;

-- How many people are getting water from each type of source?
SELECT type_of_water_source,
	SUM(number_of_people_served) AS Total_no_people_served
FROM water_source
GROUP BY type_of_water_source;

-- Converting to Percentage
SELECT 
    type_of_water_source,
    ROUND((SUM(number_of_people_served) * 100.0 / 
        (SELECT SUM(number_of_people_served) FROM water_source)
    )) AS Percent_total_no_people_served
FROM water_source
GROUP BY type_of_water_source
ORDER BY Percent_total_no_people_served DESC;

-- By RANK
SELECT type_of_water_source,
	SUM(number_of_people_served) AS Total_no_people_served,
    RANK() OVER(ORDER BY SUM(number_of_people_served) DESC) AS rank_by_population
FROM water_source
GROUP BY type_of_water_source
HAVING type_of_water_source != 'tap_in_home';

-- Which shared taps or wells should be fixed first?
SELECT source_id,
	type_of_water_source,
    number_of_people_served,
    ROW_NUMBER() OVER(PARTITION BY type_of_water_source ORDER BY number_of_people_served DESC) AS priority_rank
FROM water_source
WHERE type_of_water_source != 'tap_in_home'
ORDER BY priority_rank;

-- How long did the survey take?
SELECT 
    DATEDIFF(MAX(time_of_record), MIN(time_of_record)) AS duration_days
FROM visits;

-- What is the average total queue time for water?
SELECT 
    AVG(NULLIF(time_in_queue, 0)) AS avg_time_in_queue
FROM visits;

-- What is the average queue time on different days?
SELECT DAYNAME(time_of_record) AS Day_of_week,
	ROUND(AVG(NULLIF(time_in_queue, 0))) AS avg_time_in_queue
FROM visits
GROUP BY Day_of_week;

--  What time during the day people collect water?
SELECT TIME_FORMAT(TIME(time_of_record), '%H:00') AS Hour_of_day,
	ROUND(AVG(NULLIF(time_in_queue, 0))) AS avg_time_in_queue
FROM visits
GROUP BY Hour_of_day
ORDER BY Hour_of_day;

-- Aggregate by the hour_of_day and day of the week
SELECT 
TIME_FORMAT(TIME(time_of_record), '%H:00') AS hour_of_day,
-- Sunday
ROUND(AVG(
CASE
WHEN DAYNAME(time_of_record) = 'Sunday' THEN time_in_queue
ELSE NULL
END
),0) AS Sunday,
-- Monday
ROUND(AVG(
CASE
WHEN DAYNAME(time_of_record) = 'Monday' THEN time_in_queue
ELSE NULL
END
),0) AS Monday,
-- Tuesday
ROUND(AVG(
CASE
WHEN DAYNAME(time_of_record) = 'Tuesday' THEN time_in_queue
ELSE NULL
END
),0) AS Tuesday,
-- Wednesday
ROUND(AVG(
CASE
WHEN DAYNAME(time_of_record) = 'Wednesday' THEN time_in_queue
ELSE NULL
END
),0) AS Wednesday,
-- Thursday
ROUND(AVG(
CASE
WHEN DAYNAME(time_of_record) = 'Thursday' THEN time_in_queue
ELSE NULL
END
),0) AS Thursday,
-- Friday
ROUND(AVG(
CASE
WHEN DAYNAME(time_of_record) = 'Friday' THEN time_in_queue
ELSE NULL
END
),0) AS Friday,
-- Saturday
ROUND(AVG(
CASE
WHEN DAYNAME(time_of_record) = 'Saturday' THEN time_in_queue
ELSE NULL
END
),0) AS Saturday

FROM
visits
WHERE time_in_queue != 0
GROUP BY hour_of_day
ORDER BY hour_of_day;

