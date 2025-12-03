## Project Overview

This dashboard tells a hopeful story for the people of Maji Ndogo. Using data gathered from field surveys, it shows where water is flowing, where it has stopped, and what needs to be done to restore access.
It breaks down the survey findings so anyone can quickly understand the state of water access across the country, as well as within each province. Because most residents live in either rural or urban communities, the dashboard also separates their results, making it easier to see the unique challenges each group faces.
It highlights how many people are struggling with limited or unreliable water supply and groups these challenges into clear categories. Just as importantly, it shows the estimated cost required to fix these issues and identifies where funds need to be directed.
The proposed budgets and upgrade costs are summarized at the national level, by province, and across rural and urban areas, giving a full picture of what it will take to improve water access in Maji Ndogo.

## Dataset used

| Dataset / File Name         | Description                                                                                                                                         |
| ------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Md_water_services_data.xlsx | Main database containing all tables used in the report.                                                                                             |
| Well_pollution              | Provides additional details on some water sources, specifically wells. It identifies which wells are polluted and the type of pollution affecting them. |
| Water_source                | Contains information on each water point visited, including the type of water source and the number of people depending on it in different locations.  |
| Visits                      | The fact table, capturing thousands of field inspections across Maji Ndogo. Each row represents a visit by a field officer to a water source.       |
| Queue_composition           | Records what was observed at each location’s queue: the average waiting time and the gender distribution of people queuing.                             |
| Project_progress            | Details the water sources that require improvements, the type of upgrade needed, and the associated unit costs.                                         |
| Location                    | Contains the geographic information of each visit, linking water sources to their respective areas across Maji Ndogo.                                   |
| Infrastructure_cost         | Lists the types of infrastructure improvements and their unit costs. Used to calculate project budgets.                                                 |

## Data Model
![Screenshot of data model](../screenshots/Data_model.png)

The data model for the Maji Ndogo project is a multi-star schema. This is because the database doesn’t revolve around a single central fact table. Instead, it contains multiple tables that record different types of events, each supported by its own set of dimensions.

The visits table is the primary fact table. It contains thousands of inspection records collected across different water sources. Each row represents one site visit, with columns that include time spent in queue, assigned employee, the location of the visit, and the water source inspected. Dimension tables linked to the visits table include location, water_source, well_pollution, and queue_composition, with mostly 1-to-many relationships.

The project_progress table gives details on the improvements planned or completed at each water source, including costs, improvement type, and completion dates. It serves as another fact table, linking to the infrastructure_cost and Improvement_Table through 1-to-many relationships. These tables describe events or metrics not tied to visits. Their granularity is different from the visits table.

Overall, because the dataset contains multiple independent processes (inspections, pollution testing, crime records, improvement projects), the model naturally forms a multi-star schema. Each fact table shares some common dimensions, most importantly water_source and location, which act as the central hubs that connect the different stars.

