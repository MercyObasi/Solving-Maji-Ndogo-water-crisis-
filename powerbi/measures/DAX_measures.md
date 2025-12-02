1. Summarized Improvement Categories
This column groups and standardizes the improvement actions.

		Aggregated_improvements =
		IF(
		    CONTAINSSTRING('project_progress'[improvement], "taps"),
		    "Install public tap(s)*",
		    IF(
		        'project_progress'[improvement] = "Diagnose local infrastructure",
		        "Repair infrastructure",
		        'project_progress'[improvement]
		    )
		)

2. Rural Cost Adjustment
Rural improvements require more effort, so we add 50% to their cost.

		Rural_adjusted_cost =
		infrastructure_cost[unit_cost_USD] * 1.5

2.2 Budgeted Improvement Cost
Uses rural-adjusted cost for rural projects; otherwise uses normal cost.

		Budgeted_improvement_cost =
		IF(
		    'project_progress'[town] = "Rural",
		    RELATED('infrastructure_cost'[Rural_adjusted_cost]),
		    RELATED('infrastructure_cost'[unit_cost_USD])
		)

3. Average Queue Time per Water Source
Calculates the average queue time from visits related to each water source.

		Average_queue_time =
		CALCULATE(
		    AVERAGE('visits'[time_in_queue]),
		    FILTER(
		        'visits',
		        'visits'[source_id] = 'water_source'[source_id]
		    )
		)

4. Basic Water Access Classification
Rules:
   	- Rivers are excluded.
	- Wells count only if clean.
	- Shared taps count only when queue < 30 min.
	- Broken taps are excluded.
	- Home taps are always at least basic.

			Basic_water_access =
			IF(
			    AND(
			        water_source[type_of_water_source] = "well",
			        RELATED(well_pollution[results]) = "clean"
			    ),
			    "Basic Access",
			    IF(
			        water_source[type_of_water_source] = "tap_in_home",
			        "Basic Access",
			        IF(
			            AND(
			                water_source[type_of_water_source] = "shared_tap",
			                water_source[Average_queue_time] < 30
			            ),
			            "Basic Access",
			            "Below Basic Access"
			        )
			    )
			)


5. Basic Water Access Level
Percentage of people served by sources classified as "Basic Access."

		Basic_water_access_level =
		DIVIDE(
		    CALCULATE(
		        SUM(water_source[number_of_people_served]),
		        water_source[Basic_water_access] = "Basic Access"
		    ),
		    CALCULATE(
		        SUM(water_source[number_of_people_served])
		    )
		)


6. Below-Basic Water Access Level
Percentage of people without basic access.

		Below_basic_access_level =
		1 - [Basic_water_access_level]
