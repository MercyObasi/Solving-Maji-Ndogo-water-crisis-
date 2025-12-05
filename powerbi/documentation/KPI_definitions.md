
This document provides clear definitions, formulas, and interpretations for every KPI used in the dashboard.  It is intended to help decision-makers understand how each metric was calculated and how it should be used in planning and budgeting.

## Core Metrics Glossary

## 1. Population Served KPIs

### **1.1 Total Population Served**
**Definition:**  The total number of people who rely on the inspected water sources.

**Formula (DAX):**  See [DAX_Measures](../measures/DAX_measures.md)

**Why It Matters:**  Provides the overall scale of dependency on water sources.

**Dashboard Location:**  Main Dashboard → Total popuation province table

---

## 2. Water Access Level KPIs

### **2.1 Basic Water Access Level**
**Definition:**  Percentage of people served by water sources classified as *Basic Access*.

**Formula (DAX):**  See [DAX_Measures](../measures/DAX_measures.md)

**Why It Matters:**  Measures national progress toward reliable water supply.

**Dashboard Location:**  Main Dashboard → Population with access to basic water

---

### **2.2 Below Basic Water Access Level**
**Definition:**  Percentage of people using unsafe or unreliable water sources.

**Formula (DAX):**  See [DAX_Measures](../measures/DAX_measures.md)

**Why It Matters:**  Highlights populations at highest risk and helps prioritize interventions.

**Dashboard Location:**  Main Dashboard → Percentage improvement

---

## 3. Queue Time KPIs

### **3.1 Average Queue Time**
**Definition:**  The average time residents spend waiting at water sources.

**Formula (DAX):**  See [DAX_Measures](../measures/DAX_measures.md)

**Why It Matters:**  Long queues indicate inadequate infrastructure or high demand.

**Dashboard Location:**  Used in calcuating basic water access

---

### **3.2 % of Shared Taps Exceeding 30 Minutes**
**Definition:**  The proportion of communal taps where average queue time is more than 30 minutes.

**Why It Matters:**  
Identifies areas that urgently require additional taps or improved infrastructure.

**Dashboard Location:**  Used in calcuating basic water access

---

## 4. Infrastructure Condition KPIs

### **4.1 Non-Functional Infrastructure Rate**
**Definition:**  Number of water sources categorized as non-functional.

**Why It Matters:**  Shows the extent of breakdowns causing water scarcity.

**Dashboard Location:**  Main Dashboard → Number of improvements chart

---


## 5. Budget and Cost KPIs

### **5.1 Total Estimated Improvement Cost**
**Definition:**  Sum of all costs needed to restore or upgrade water sources.

**Formula (DAX):**  Uses `Budgeted_improvement_cost` and `Rural_adjusted_cost`. See [DAX_Measures](../measures/DAX_measures.md) for more details.

**Why It Matters:**  Shows the total financial requirement for system-wide improvements.

**Dashboard Location:**  Main Dashboard  → Improvement and Province Bookmarks

---

### **5.2 Rural vs Urban Cost Gap**
**Definition:**  Comparison of improvement costs for rural vs urban areas.

**Why It Matters:**  Rural areas require 50% more due to higher difficulty and logistics.

**Dashboard Location:**   Main Dasboard
---

### **5.3 Provincial Budget Share**
**Definition:**  Percentage of the national budget required by each province.

**Why It Matters:**  Helps leadership allocate funds fairly and strategically.

**Dashboard Location:**  Main Dashboard → Provincial Breakdown

---



## **6. Most Common Improvement Types**
**Definition:**  Top improvement categories (e.g., install taps, clean wells, repair infrastructure).

**Why It Matters:**  Shows where the greatest needs lie.

**Dashboard Location:**  Main Dashboard → Improvement Bookmark


---


# ✔ How to Use This Document

- Provincial leaders should reference this file when interpreting dashboard numbers.  
- Analysts should use the formulas when updating or maintaining the dataset.  
- Engineers can link KPIs to field activities (repairs, installations, testing).

