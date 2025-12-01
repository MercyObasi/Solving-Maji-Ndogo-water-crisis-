-- Is there a difference in the water quality scores and auditor's scores?
SELECT a.location_id,
	v.record_id,
	a.true_water_source_score AS auditor_score,
    w.subjective_quality_score AS surveyor_score
FROM auditor_report AS a
JOIN visits AS v
ON a.location_id = v.location_id
JOIN water_quality AS w
ON v.record_id = w.record_id
;

-- Filter the scores that are not the same
CREATE VIEW Incorrect_records AS(
SELECT a.location_id,
	v.record_id,
    e.employee_name,
	a.true_water_source_score AS auditor_score,
    w.subjective_quality_score AS surveyor_score,
    a.statements
FROM 
	auditor_report AS a
JOIN 
	visits AS v
ON 
	a.location_id = v.location_id
JOIN
	water_quality AS w
ON 
	v.record_id = w.record_id
JOIN 
	employee AS e
ON 
	v.assigned_employee_id = e.assigned_employee_id
WHERE
	a.true_water_source_score != w.subjective_quality_score
AND v.visit_count = 1);

-- Finding corrupt surveyors
WITH error_count AS( -- This CTE calculates the number of mistakes each employee made
SELECT 
	employee_name,
	COUNT(employee_name) AS No_of_mistakes
FROM 
	Incorrect_records
		/* Incorrect_records is a view that joins the audit report to the database
			for records where the auditor and
			employees scores are different */

GROUP BY employee_name
ORDER BY No_of_mistakes DESC),


suspect_list AS( -- This CTE retrieves the data of employees who make an above-average number of mistakes
SELECT employee_name,
	no_of_mistakes
FROM
	error_count
WHERE
	no_of_mistakes > (SELECT AVG(no_of_mistakes) FROM error_count))

-- This query filters all of the records where the "corrupt" employees gathered data.
SELECT employee_name,
	location_id,
    statements
FROM  
	Incorrect_records
WHERE 
	employee_name IN (SELECT employee_name FROM suspect_list)
    AND statements LIKE '%cash%';
