# 🚲 Google Trends - Canada (BigQuery + Tableau Dashboard)

This project analyzes and visualizes **Google Search Term Trends for the year 2020-2025** using 
**Google BigQuery for data extraction and transformation**, and **Tableau** 
for interactive dashboards. The analysis combines trip data, geographic 
details, and weather data to uncover urban mobility patterns.

🔗 **[View Tableau Dashboard](https://public.tableau.com/app/profile/usman.khalid4491/viz/GoogleTrend-Canada2020-2024/Dashboard1)**

---

## 🧰 Tools & Technologies Used

- **Google BigQuery** – SQL-based data extraction, aggregation and transformation
  - Query available in the SQL file named: 'Google Trends Canada.sql'
- **Public Datasets**:
  - `bigquery-public-data.google_trends.international_top_terms`
- **Tableau** – Dashboard creation, interactive filtering, mapping
- **Mapbox** – Used within Tableau for geo-boundary mapping

---

## 🧠 Project Overview

The project simply explores top most searched terms on google in Canada.
These terms can be aggregated over specific years, months, and provinces of Canada.
The original dataset by google only provides the weekly rank of a specific term per week across multiple regions.
In order to rank them from top to bottom, I used the average weekly rank to sort them.

---

## 🔍 Process Thinking

### 1. **Data Aggregation via SQL in BigQuery**

A complex SQL query was written to:
- Join **citibike trips** with **ZIP code geographies** using `ST_WITHIN`
- Enrich trips with **weather data** from Central Park (`wban = 94728`)
- Map coordinates to **boroughs and neighborhoods**
- Round trip durations to 10-minute bins for aggregation

> Resulting dataset from the query was exported from BigQuery and imported into Tableau.   

---

### 2. **Data Modeling & Calculations**
- Created **trip_count**, **trip_minutes**, and **aggregated KPIs**  
- Weather fields used: `temp`, `wdsp`, `prcp`  
- All aggregations done in SQL to reduce Tableau load

---

### 3. **Dashboard Design in Tableau**
- Used filters for `Usertype`, `Neighborhood`, and `Time`  
- Enabled map-driven interactivity  
- Used clean, color-coded layouts with consistent labeling

---

## 📊 Key Dashboards

### 📈 Summer Trend Analysis
- Monthly stacked bars comparing user types

### 🔥 Trip Count Heatmap
- Heatmap of ZIPs by month, colored by trip volume

### 🧭 Start-End Dive Table
- Matrix of start/end neighborhoods with average trip time

### 🗺️ Borough Mapping
- Map of boroughs and their activity volume

---

## 🧑‍💻 Author

Built by [Usman Khalid](https://public.tableau.com/app/profile/usman.khalid4491/vizzes)  
This project is part of the **Google BI Specialization** – Data Visualization Capstone

## 🔖 Tags

`#BigQuery` `#SQL` `#Tableau` `#CitiBike` `#NYC` `#UrbanMobility`  
`#GeospatialAnalysis` `#PublicDatasets` `#GoogleBISpecialization` `#DataVisualization`
