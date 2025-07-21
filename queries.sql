-- STEP 1: Create a partitioned table for Canadian trends (2020–2024)
CREATE OR REPLACE TABLE `nodal-fountain-466123-h6.google_trends.canada_2020_2024`
PARTITION BY week AS
SELECT
  week,
  country_name AS country,
  term,
  region_name,
  rank,
  score
FROM
  `bigquery-public-data.google_trends.international_top_terms`
WHERE
  country_name = "Canada"
  AND EXTRACT(YEAR FROM week) >= 2020;

-- STEP 2: Aggregate and rank top 10 terms per province/month/year
CREATE OR REPLACE TABLE `nodal-fountain-466123-h6.google_trends.canada_top10terms_2020_2024` AS
WITH summed_terms AS (
  SELECT
    region_name,
    EXTRACT(YEAR FROM week) AS year,
    EXTRACT(MONTH FROM week) AS month,
    term,
    AVG(rank) AS avg_rank
  FROM
    `nodal-fountain-466123-h6.google_trends.canada_2020_2024`
  WHERE rank <= 10
  GROUP BY region_name, year, month, term
),
ranked_terms AS (
  SELECT *,
    ROW_NUMBER() OVER (
      PARTITION BY region_name, year, month
      ORDER BY avg_rank ASC
    ) AS row_num
  FROM summed_terms
)
SELECT
  region_name,
  year,
  month,
  term,
  avg_rank,
  row_num AS rank
FROM ranked_terms
WHERE row_num <= 10
ORDER BY region_name, year, month, row_num;

-- STEP 3: Clean region names for Tableau compatibility
SELECT
  CASE region_name
    WHEN "Québec" THEN "Quebec"
    WHEN "Yukon Territory" THEN "Yukon"
    ELSE region_name
  END AS region_name_clean,
  year,
  month,
  term,
  rank
FROM `nodal-fountain-466123-h6.google_trends.canada_top10terms_2020_2024`;
