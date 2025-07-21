# 🇨🇦 Google Trends Dashboard: What Canadians Googled (2020–2024)

This project analyzes and visualizes the **top most Googled search terms in Canada** between 2020 and 2024 using the **Google Trends public dataset on BigQuery**. The results are visualized in Tableau through an interactive dashboard.

---

## 🔍 Objective

- Extract search interest data from Google's BigQuery public dataset.
- Identify top 10 most Googled terms by **province**, **month**, and **year**.

---

## 🧰 Tools & Technologies

- **Google BigQuery** – SQL-based data extraction and aggregation  
- **Google Trends Public Dataset** – `bigquery-public-data.google_trends.international_top_terms`
- **Tableau Public** – Interactive map and bar chart visualization  
- **Data Source Region**: Canada only

---

## 📦 Dataset & Query Steps

### Step 1: Create Main Table Partitioned by Week
Extract Canadian search data from the international top terms table.

### Step 2: Aggregate Top 10 Terms by Region, Year, and Month
Use `AVG(rank)` and `ROW_NUMBER()` to determine most relevant searches per region/month.

### Step 3: Clean Region Names for Tableau
Standardize province/territory names for Tableau geolocation compatibility.

Full SQL queries are included in the [`sql/queries.sql`](sql/queries.sql) file.

---

## 📊 Dashboard Features (in Tableau)

- **Top 25 terms** overall (by avg. rank)
- **Province-level maps** showing regional trends
- **Filter controls** for year and month
- **Dynamic top 10 search terms** per province
- Exportable **PDF snapshot** for offline reports

---

## ✅ Insights Uncovered

- Sports events, national holidays, and public disruptions are frequently top-ranked.
- Certain terms show **seasonal or local interest** patterns.
- Regional differences in search behavior reflect local culture and current events.
- 

---

## 📌 Author

**Usman Khalid**  
Data Analyst | Visual Analytics | Data Storytelling  
📧 ukajk@live.com
