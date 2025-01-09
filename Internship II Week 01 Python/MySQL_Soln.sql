/*ALTER TABLE final_report
DROP COLUMN MyUnknownColumn;
*/

SELECT *
FROM final_report;

-- 2.17: QC1, Q1. What is the total revenue (in crores) generated from all plans across all cities? 581.48
SELECT ROUND(SUM(plan_revenue_crores),2) AS total_rev
FROM final_report;

-- 2.18: QC2, Q2. Which city (city_code) generated the highest revenue on a single day? 700001
SELECT *
FROM final_report
WHERE plan_revenue_crores = (
SELECT MAX(plan_revenue_crores)
FROM final_report
);

-- 2.19: QC3, Q3. Which plan generated the highest total revenue across all cities? p7
SELECT plans, ROUND(SUM(plan_revenue_crores), 2) AS total_rev
FROM final_report
GROUP BY plans
ORDER BY total_rev DESC;

-- 2.20: QC4, Q4. How many cities (city_code) contributed to the total revenue for the plan "p3"? 15
SELECT COUNT(DISTINCT city_code) AS cnt
FROM final_report
WHERE plans = "p3";

-- 2.21: QC5, Q5. Which city contributed the most to the total revenue across all plans? 400001
SELECT city_code, ROUND(SUM(plan_revenue_crores), 2) AS total_rev
FROM final_report
GROUP BY city_code
ORDER BY total_rev DESC;