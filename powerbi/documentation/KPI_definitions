
This document provides clear definitions, formulas, and interpretations for every KPI used in the dashboard.  It is intended to help decision-makers understand how each metric was calculated and how it should be used in planning and budgeting.

## Core Metrics Glossary

## 1. Population Served KPIs

### **1.1 Total Population Served**
**Definition:**  The total number of people who rely on the inspected water sources.

**Formula (DAX):**  See [DAX_Measures](../measures/DAX_measures.md)

**Why It Matters:**  Provides the overall scale of dependency on water sources.

**Dashboard Location:**  Main Dashboard → Population with access to basic water


## 2. Water Access Level KPIs

### **2.1 Basic Water Access Level**
**Definition:**  Percentage of people served by water sources classified as *Basic Access*.

**Formula (DAX):**  See [DAX_Measures](../measures/DAX_measures.md)

**Why It Matters:**  
Measures national progress toward reliable water supply.

**Dashboard Location:**  
Main Dashboard → Access Overview

---

### **2.2 Below Basic Water Access Level**
**Definition:**  
Percentage of people using unsafe or unreliable water sources.

**Formula (DAX):**  
`Below_basic_access_level = 1 - [Basic_water_access_level]`

**Why It Matters:**  
Highlights populations at highest risk and helps prioritize interventions.

**Dashboard Location:**  
Main Dashboard → Access Overview

---

## 3. Queue Time KPIs

### **3.1 Average Queue Time**
**Definition:**  
The average time residents spend waiting at water sources.

**Formula (DAX):**  
Uses the calculated column `Average_queue_time`.

**Why It Matters:**  
Long queues indicate inadequate infrastructure or high demand.

**Dashboard Location:**  
Queue Analysis Page

---

### **3.2 % of Shared Taps Exceeding 30 Minutes**
**Definition:**  
The proportion of communal taps where average queue time is more than 30 minutes.

**Why It Matters:**  
Identifies areas that urgently require additional taps or improved infrastructure.

**Dashboard Location:**  
Queue Analysis Page

---

## 4. Infrastructure Condition KPIs

### **4.1 Non-Functional Infrastructure Rate**
**Definition:**  
Percentage of water sources categorized as non-functional (broken pipes, pumps, reservoirs).

**Why It Matters:**  
Shows the extent of breakdowns causing water scarcity.

**Dashboard Location:**  
Infrastructure Status Page

---

### **4.2 Contaminated Wells Percentage**
**Definition:**  
Share of wells that tested positive for pollution.

**Why It Matters:**  
Helps identify health risks and areas requiring urgent water treatment.

**Dashboard Location:**  
Water Quality Page

---

## 5. Budget & Cost KPIs

### **5.1 Total Estimated Improvement Cost**
**Definition:**  
Sum of all costs needed to restore or upgrade water sources.

**Formula (DAX):**  
Uses `Budgeted_improvement_cost` and `Rural_adjusted_cost`.

**Why It Matters:**  
Shows the total financial requirement for system-wide improvements.

**Dashboard Location:**  
Budget Overview Page

---

### **5.2 Rural vs Urban Cost Gap**
**Definition:**  
Comparison of improvement costs for rural vs urban areas.

**Why It Matters:**  
Rural areas require 50% more due to higher difficulty and logistics.

**Dashboard Location:**  
Budget Overview Page → Rural/Urban Breakdown

---

### **5.3 Provincial Budget Share**
**Definition:**  
Percentage of the national budget required by each province.

**Why It Matters:**  
Helps leadership allocate funds fairly and strategically.

**Dashboard Location:**  
Budget Overview → Provincial Breakdown

---

## 6. Project Progress KPIs

### **6.1 % of Completed Projects**
**Definition:**  
Share of water sources whose improvement project is marked “complete.”

**Why It Matters:**  
Tracks implementation progress.

**Dashboard Location:**  
Project Progress Page

---

### **6.2 Most Common Improvement Types**
**Definition:**  
Top improvement categories (e.g., install taps, clean wells, repair infrastructure).

**Why It Matters:**  
Shows where the greatest needs lie.

**Dashboard Location:**  
Project Progress Page

---

## 7. High-Priority Problem KPIs

### **7.1 Locations With All Three Major Issues**
- Non-functional source  
- Long queues  
- Rural disadvantages  

**Why It Matters:**  
These areas represent the “highest urgency” and should be addressed first.

**Dashboard Location:**  
High Priority Analysis

---

# ✔ How to Use This Document

- Provincial leaders should reference this file when interpreting dashboard numbers.  
- Analysts should use the formulas when updating or maintaining the dataset.  
- Engineers can link KPIs to field activities (repairs, installations, testing).

---

Let me know if you want me to **auto-generate this file into a full `KPI_definitions.md` with formatting, icons, sections, and hyperlinks**.
