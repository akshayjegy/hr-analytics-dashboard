-- ============================================
-- HR Attrition Analysis SQL Queries
-- Dataset: IBM HR Analytics (Kaggle)
-- ============================================

-- Query 1: Attrition rate by department
SELECT Department,
       COUNT(*) as total_employees,
       SUM(Attrition_Flag) as left_count,
       ROUND(SUM(Attrition_Flag) * 100.0 / COUNT(*), 1) as attrition_rate
FROM hr_data
GROUP BY Department
ORDER BY attrition_rate DESC;

-- Query 2: Attrition by age group
SELECT AgeGroup,
       COUNT(*) as total,
       SUM(Attrition_Flag) as left_count,
       ROUND(SUM(Attrition_Flag) * 100.0 / COUNT(*), 1) as attrition_rate
FROM hr_data
GROUP BY AgeGroup
ORDER BY AgeGroup;

-- Query 3: Attrition by business travel frequency
SELECT BusinessTravel,
       COUNT(*) as total,
       ROUND(SUM(Attrition_Flag) * 100.0 / COUNT(*), 1) as attrition_rate
FROM hr_data
GROUP BY BusinessTravel
ORDER BY attrition_rate DESC;

-- Query 4: Attrition by distance from home
SELECT DistanceCategory,
       COUNT(*) as total,
       ROUND(SUM(Attrition_Flag) * 100.0 / COUNT(*), 1) as attrition_rate
FROM hr_data
GROUP BY DistanceCategory
ORDER BY attrition_rate DESC;

-- Query 5: Daily rate and age comparison — leavers vs stayers
SELECT Attrition,
       ROUND(AVG(DailyRate), 0) as avg_daily_rate,
       ROUND(AVG(Age), 1) as avg_age,
       COUNT(*) as count
FROM hr_data
GROUP BY Attrition;
