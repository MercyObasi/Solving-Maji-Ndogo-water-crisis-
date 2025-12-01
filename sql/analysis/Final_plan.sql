-- Final_plan

/* We have a plan to improve the water access in Maji Ndogo, so we need to think it through, and as our final task, create a table where our teams
have the information they need to fix, upgrade and repair water sources. They will need the addresses of the places they should visit (street
address, town, province), the type of water source they should improve, and what should be done to improve it.
We should also make space for them in the database to update us on their progress. We need to know if the repair is complete, and the date it was
completed, and give them space to upgrade the sources. Let's call this table Project_progress.*/

CREATE TABLE Project_progress (
Project_id SERIAL PRIMARY KEY,
/* Project_id −− Unique key for sources in case we visit the same
					source more than once in the future.
*/
source_id VARCHAR(20) NOT NULL REFERENCES water_source(source_id) ON DELETE CASCADE ON UPDATE CASCADE,
/* source_id −− Each of the sources we want to improve should exist,
					and should refer to the source table. This ensures data integrity.
*/
Address VARCHAR(50), -- Street address
Town VARCHAR(30),
Province VARCHAR(30),
Source_type VARCHAR(50),
Improvement VARCHAR(50), -- What the engineers should do at that place
Source_status VARCHAR(50) DEFAULT 'Backlog' CHECK (Source_status IN ('Backlog', 'In progress', 'Complete')),
/* Source_status −− We want to limit the type of information engineers can give us, so we
limit Source_status.
− By DEFAULT all projects are in the "Backlog" which is like a TODO list.
− CHECK() ensures only those three options will be accepted. This helps to maintain clean data.
*/
Date_of_completion DATE, -- Engineers will add this the day the source has been upgraded.
Comments TEXT -- Engineers can leave comments. We use a TEXT type that has no limit on char length
);

-- Data to be added to the progress_project table

SELECT
location.address,
location.town_name,
location.province_name,
water_source.source_id,
water_source.type_of_water_source,
well_pollution.results,
CASE
	WHEN results LIKE '%Chemical%' THEN 'Install RO filter'
	WHEN results LIKE '%Biological%' THEN 'Install UV filter and RO filter'
    WHEN type_of_water_source = 'river' THEN 'Drill Well'
    WHEN type_of_water_source = 'shared_tap' AND time_in_queue >=30 THEN CONCAT("Install ", FLOOR(time_in_queue/30), " taps nearby")
    WHEN type_of_water_source = 'tap_in_home_broken' THEN 'Diagnose local infrastructure'
    ELSE NULL
END AS Improvement
FROM
water_source
LEFT JOIN
well_pollution ON water_source.source_id = well_pollution.source_id
INNER JOIN
visits ON water_source.source_id = visits.source_id
INNER JOIN
location ON location.location_id = visits.location_id
WHERE
	visits.visit_count = 1 
    AND (results != 'Clean' 
		OR type_of_water_source = 'river' 
        OR type_of_water_source = 'tap_in_home_broken' 
        OR (type_of_water_source = 'shared_tap' AND time_in_queue >=30)
    )
;

-- Add data to project_progress

INSERT INTO Project_progress (
    source_id,
    Address,
    Town,
    Province,
    Source_type,
    Improvement
)
SELECT
water_source.source_id,
location.address,
location.town_name,
location.province_name,
water_source.type_of_water_source,
CASE
	WHEN results LIKE '%Chemical%' THEN 'Install RO filter'
	WHEN results LIKE '%Biological%' THEN 'Install UV filter and RO filter'
    WHEN type_of_water_source = 'river' THEN 'Drill Well'
    WHEN type_of_water_source = 'shared_tap' AND time_in_queue >=30 THEN CONCAT("Install ", FLOOR(time_in_queue/30), " taps nearby")
    WHEN type_of_water_source = 'tap_in_home_broken' THEN 'Diagnose local infrastructure'
    ELSE NULL
END AS Improvement
FROM
water_source
LEFT JOIN
well_pollution ON water_source.source_id = well_pollution.source_id
INNER JOIN
visits ON water_source.source_id = visits.source_id
INNER JOIN
location ON location.location_id = visits.location_id
WHERE
	visits.visit_count = 1 
    AND (results != 'Clean' 
		OR type_of_water_source = 'river' 
        OR type_of_water_source = 'tap_in_home_broken' 
        OR (type_of_water_source = 'shared_tap' AND time_in_queue >=30)
    )
;

SELECT * FROM project_progress;
