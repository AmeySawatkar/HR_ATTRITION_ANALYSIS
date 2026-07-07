SELECT COUNT(*) FROM hr_attrition;
-- =====================================================================================
-- =====================================================================================
--                              PROJECT TITLE BLOCK
-- =====================================================================================
--
--   PROJECT TITLE        : HR Attrition Analysis
--   COMPANY NAME          : SkillinfyTech IT Solutions Pvt. Ltd.
--   INTERN NAME           : Amey Kishor Sawatkar
--   INTERNSHIP DOMAIN      : Data Analytics
--   DATABASE NAME         : hr_attrition_analysis
--   TABLE NAME            : hr_attrition
--   TOOL USED             : MySQL 8.0 (MySQL Command Line Client)
--
-- =====================================================================================
--   PROJECT OBJECTIVE
-- =====================================================================================
--   This SQL script contains 50 business-oriented SQL queries designed to analyze
--   employee attrition trends, workforce demographics, departmental performance,
--   job role distribution, salary & compensation patterns, employee satisfaction,
--   performance ratings, and experience/tenure factors. The objective is to derive
--   actionable HR insights that support data-driven retention and workforce planning
--   strategies for the organization.
-- =====================================================================================
-- =====================================================================================


-- =====================================================================================
-- DATABASE SELECTION
-- =====================================================================================
USE hr_attrition_analysis;


-- =====================================================================================
-- SECTION 1 : EMPLOYEE OVERVIEW   (QUERY 1 - 5)
-- =====================================================================================
-- This section provides a general overview of the workforce, including headcount,
-- demographic distribution, and basic organizational composition.
-- =====================================================================================

-- ---------------------------------------------------------------------------
-- Query 1: What is the total number of employees in the organization?
-- ---------------------------------------------------------------------------
SELECT
    COUNT(*) AS Total_Employees
FROM hr_attrition;

-- ---------------------------------------------------------------------------
-- Query 2: What is the gender-wise distribution of employees?
-- ---------------------------------------------------------------------------
SELECT
    Gender,
    COUNT(*) AS Employee_Count
FROM hr_attrition
GROUP BY Gender
ORDER BY Employee_Count DESC;

-- ---------------------------------------------------------------------------
-- Query 3: What is the marital status distribution of employees?
-- ---------------------------------------------------------------------------
SELECT
    MaritalStatus,
    COUNT(*) AS Employee_Count
FROM hr_attrition
GROUP BY MaritalStatus
ORDER BY Employee_Count DESC;

-- ---------------------------------------------------------------------------
-- Query 4: What is the age-group wise distribution of employees?
-- ---------------------------------------------------------------------------
SELECT
    CASE
        WHEN Age < 25 THEN 'Below 25'
        WHEN Age BETWEEN 25 AND 34 THEN '25-34'
        WHEN Age BETWEEN 35 AND 44 THEN '35-44'
        WHEN Age BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55 and Above'
    END AS Age_Group,
    COUNT(*) AS Employee_Count
FROM hr_attrition
GROUP BY Age_Group
ORDER BY Employee_Count DESC;

-- ---------------------------------------------------------------------------
-- Query 5: What is the educational field-wise distribution of employees?
-- ---------------------------------------------------------------------------
SELECT
    EducationField,
    COUNT(*) AS Employee_Count
FROM hr_attrition
GROUP BY EducationField
ORDER BY Employee_Count DESC;


-- =====================================================================================
-- SECTION 2 : ATTRITION ANALYSIS   (QUERY 6 - 12)
-- =====================================================================================
-- This section analyzes overall attrition trends and the factors most strongly
-- associated with employees leaving the organization.
-- =====================================================================================

-- ---------------------------------------------------------------------------
-- Query 6: What is the overall attrition count and attrition rate (%)?
-- ---------------------------------------------------------------------------
SELECT
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Total_Attrition,
    COUNT(*) AS Total_Employees,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Attrition_Rate_Percent
FROM hr_attrition;

-- ---------------------------------------------------------------------------
-- Query 7: What is the gender-wise attrition rate (%)?
-- ---------------------------------------------------------------------------
SELECT
    Gender,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Attrition_Rate_Percent
FROM hr_attrition
GROUP BY Gender
ORDER BY Attrition_Rate_Percent DESC;

-- ---------------------------------------------------------------------------
-- Query 8: How does attrition vary by marital status?
-- ---------------------------------------------------------------------------
SELECT
    MaritalStatus,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Attrition_Rate_Percent
FROM hr_attrition
GROUP BY MaritalStatus
ORDER BY Attrition_Rate_Percent DESC;

-- ---------------------------------------------------------------------------
-- Query 9: Does business travel frequency impact employee attrition?
-- ---------------------------------------------------------------------------
SELECT
    BusinessTravel,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Attrition_Rate_Percent
FROM hr_attrition
GROUP BY BusinessTravel
ORDER BY Attrition_Rate_Percent DESC;

-- ---------------------------------------------------------------------------
-- Query 10: Does overtime work increase the likelihood of attrition?
-- ---------------------------------------------------------------------------
SELECT
    OverTime,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Attrition_Rate_Percent
FROM hr_attrition
GROUP BY OverTime
ORDER BY Attrition_Rate_Percent DESC;

-- ---------------------------------------------------------------------------
-- Query 11: Which age group has the highest attrition rate (%)?
-- ---------------------------------------------------------------------------
SELECT
    CASE
        WHEN Age < 25 THEN 'Below 25'
        WHEN Age BETWEEN 25 AND 34 THEN '25-34'
        WHEN Age BETWEEN 35 AND 44 THEN '35-44'
        WHEN Age BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55 and Above'
    END AS Age_Group,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Attrition_Rate_Percent
FROM hr_attrition
GROUP BY Age_Group
ORDER BY Attrition_Rate_Percent DESC;

-- ---------------------------------------------------------------------------
-- Query 12: How does distance from home affect employee attrition?
-- ---------------------------------------------------------------------------
SELECT
    CASE
        WHEN DistanceFromHome <= 5 THEN 'Near (0-5 KM)'
        WHEN DistanceFromHome BETWEEN 6 AND 15 THEN 'Moderate (6-15 KM)'
        ELSE 'Far (16+ KM)'
    END AS Distance_Category,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Attrition_Rate_Percent
FROM hr_attrition
GROUP BY Distance_Category
ORDER BY Attrition_Rate_Percent DESC;


-- =====================================================================================
-- SECTION 3 : DEPARTMENT ANALYSIS   (QUERY 13 - 18)
-- =====================================================================================
-- This section evaluates departmental headcount, attrition, salary, and satisfaction
-- levels to identify departments that require focused HR intervention.
-- =====================================================================================

-- ---------------------------------------------------------------------------
-- Query 13: What is the total number of employees in each department?
-- ---------------------------------------------------------------------------
SELECT
    Department,
    COUNT(*) AS Total_Employees
FROM hr_attrition
GROUP BY Department
ORDER BY Total_Employees DESC;

-- ---------------------------------------------------------------------------
-- Query 14: What is the attrition rate (%) for each department?
-- ---------------------------------------------------------------------------
SELECT
    Department,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Attrition_Rate_Percent
FROM hr_attrition
GROUP BY Department
ORDER BY Attrition_Rate_Percent DESC;

-- ---------------------------------------------------------------------------
-- Query 15: What is the average monthly income by department?
-- ---------------------------------------------------------------------------
SELECT
    Department,
    ROUND(AVG(MonthlyIncome), 2) AS Avg_Monthly_Income
FROM hr_attrition
GROUP BY Department
ORDER BY Avg_Monthly_Income DESC;

-- ---------------------------------------------------------------------------
-- Query 16: Which departments have an average job satisfaction below 3?
-- ---------------------------------------------------------------------------
SELECT
    Department,
    ROUND(AVG(JobSatisfaction), 2) AS Avg_Job_Satisfaction
FROM hr_attrition
GROUP BY Department
HAVING ROUND(AVG(JobSatisfaction), 2) < 3
ORDER BY Avg_Job_Satisfaction ASC;

-- ---------------------------------------------------------------------------
-- Query 17: What is the average years at company for each department?
-- ---------------------------------------------------------------------------
SELECT
    Department,
    ROUND(AVG(YearsAtCompany), 2) AS Avg_Years_At_Company
FROM hr_attrition
GROUP BY Department
ORDER BY Avg_Years_At_Company DESC;

-- ---------------------------------------------------------------------------
-- Query 18: Which department has the highest overtime percentage?
-- ---------------------------------------------------------------------------
SELECT
    Department,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN OverTime = 'Yes' THEN 1 ELSE 0 END) AS Overtime_Count,
    ROUND(SUM(CASE WHEN OverTime = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Overtime_Percent
FROM hr_attrition
GROUP BY Department
ORDER BY Overtime_Percent DESC;


-- =====================================================================================
-- SECTION 4 : JOB ROLE ANALYSIS   (QUERY 19 - 24)
-- =====================================================================================
-- This section examines job role-level attrition, compensation, and satisfaction
-- to identify high-risk roles within the organization.
-- =====================================================================================

-- ---------------------------------------------------------------------------
-- Query 19: What is the employee count for each job role?
-- ---------------------------------------------------------------------------
SELECT
    JobRole,
    COUNT(*) AS Total_Employees
FROM hr_attrition
GROUP BY JobRole
ORDER BY Total_Employees DESC;

-- ---------------------------------------------------------------------------
-- Query 20: Which job roles have the highest attrition rate (%)?
-- ---------------------------------------------------------------------------
SELECT
    JobRole,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Attrition_Rate_Percent
FROM hr_attrition
GROUP BY JobRole
ORDER BY Attrition_Rate_Percent DESC
LIMIT 5;

-- ---------------------------------------------------------------------------
-- Query 21: What is the average monthly income for each job role?
-- ---------------------------------------------------------------------------
SELECT
    JobRole,
    ROUND(AVG(MonthlyIncome), 2) AS Avg_Monthly_Income
FROM hr_attrition
GROUP BY JobRole
ORDER BY Avg_Monthly_Income DESC;

-- ---------------------------------------------------------------------------
-- Query 22: What is the average job level for each job role?
-- ---------------------------------------------------------------------------
SELECT
    JobRole,
    ROUND(AVG(JobLevel), 2) AS Avg_Job_Level
FROM hr_attrition
GROUP BY JobRole
ORDER BY Avg_Job_Level DESC;

-- ---------------------------------------------------------------------------
-- Query 23: Which job roles have the lowest average work-life balance score?
-- ---------------------------------------------------------------------------
SELECT
    JobRole,
    ROUND(AVG(WorkLifeBalance), 2) AS Avg_WorkLife_Balance
FROM hr_attrition
GROUP BY JobRole
ORDER BY Avg_WorkLife_Balance ASC
LIMIT 5;

-- ---------------------------------------------------------------------------
-- Query 24: What is the job role-wise average performance rating?
-- ---------------------------------------------------------------------------
SELECT
    JobRole,
    ROUND(AVG(PerformanceRating), 2) AS Avg_Performance_Rating
FROM hr_attrition
GROUP BY JobRole
ORDER BY Avg_Performance_Rating DESC;


-- =====================================================================================
-- SECTION 5 : SALARY & COMPENSATION ANALYSIS   (QUERY 25 - 30)
-- =====================================================================================
-- This section analyzes compensation structures, salary hikes, and income patterns
-- across the organization to assess pay competitiveness and equity.
-- =====================================================================================

-- ---------------------------------------------------------------------------
-- Query 25: What are the minimum, maximum, and average monthly incomes
--           across the organization?
-- ---------------------------------------------------------------------------
SELECT
    MIN(MonthlyIncome) AS Min_Monthly_Income,
    MAX(MonthlyIncome) AS Max_Monthly_Income,
    ROUND(AVG(MonthlyIncome), 2) AS Avg_Monthly_Income
FROM hr_attrition;

-- ---------------------------------------------------------------------------
-- Query 26: What is the average monthly income by job level?
-- ---------------------------------------------------------------------------
SELECT
    JobLevel,
    ROUND(AVG(MonthlyIncome), 2) AS Avg_Monthly_Income,
    COUNT(*) AS Total_Employees
FROM hr_attrition
GROUP BY JobLevel
ORDER BY JobLevel ASC;

-- ---------------------------------------------------------------------------
-- Query 27: Do employees who left the company earn less on average than
--           employees who stayed?
-- ---------------------------------------------------------------------------
SELECT
    Attrition,
    ROUND(AVG(MonthlyIncome), 2) AS Avg_Monthly_Income
FROM hr_attrition
GROUP BY Attrition
ORDER BY Avg_Monthly_Income DESC;

-- ---------------------------------------------------------------------------
-- Query 28: What is the average percent salary hike by department?
-- ---------------------------------------------------------------------------
SELECT
    Department,
    ROUND(AVG(PercentSalaryHike), 2) AS Avg_Salary_Hike_Percent
FROM hr_attrition
GROUP BY Department
ORDER BY Avg_Salary_Hike_Percent DESC;

-- ---------------------------------------------------------------------------
-- Query 29: How many employees fall into each stock option level category?
-- ---------------------------------------------------------------------------
SELECT
    StockOptionLevel,
    COUNT(*) AS Employee_Count,
    ROUND(AVG(MonthlyIncome), 2) AS Avg_Monthly_Income
FROM hr_attrition
GROUP BY StockOptionLevel
ORDER BY StockOptionLevel ASC;

-- ---------------------------------------------------------------------------
-- Query 30: Which employees earn a monthly income above the overall average
--           (Top 10 highest earners)?
-- ---------------------------------------------------------------------------
SELECT
    EmployeeNumber,
    JobRole,
    Department,
    MonthlyIncome
FROM hr_attrition
WHERE MonthlyIncome > (SELECT AVG(MonthlyIncome) FROM hr_attrition)
ORDER BY MonthlyIncome DESC
LIMIT 10;


-- =====================================================================================
-- SECTION 6 : SATISFACTION & PERFORMANCE ANALYSIS   (QUERY 31 - 36)
-- =====================================================================================
-- This section evaluates employee satisfaction levels (environment, job, relationship)
-- alongside performance ratings to understand engagement and productivity trends.
-- =====================================================================================

-- ---------------------------------------------------------------------------
-- Query 31: What is the overall average job satisfaction score?
-- ---------------------------------------------------------------------------
SELECT
    ROUND(AVG(JobSatisfaction), 2) AS Avg_Job_Satisfaction
FROM hr_attrition;

-- ---------------------------------------------------------------------------
-- Query 32: How does job satisfaction relate to attrition?
-- ---------------------------------------------------------------------------
SELECT
    JobSatisfaction,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Attrition_Rate_Percent
FROM hr_attrition
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction ASC;

-- ---------------------------------------------------------------------------
-- Query 33: How does environment satisfaction relate to attrition?
-- ---------------------------------------------------------------------------
SELECT
    EnvironmentSatisfaction,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Attrition_Rate_Percent
FROM hr_attrition
GROUP BY EnvironmentSatisfaction
ORDER BY EnvironmentSatisfaction ASC;

-- ---------------------------------------------------------------------------
-- Query 34: What is the average relationship satisfaction score by department?
-- ---------------------------------------------------------------------------
SELECT
    Department,
    ROUND(AVG(RelationshipSatisfaction), 2) AS Avg_Relationship_Satisfaction
FROM hr_attrition
GROUP BY Department
ORDER BY Avg_Relationship_Satisfaction DESC;

-- ---------------------------------------------------------------------------
-- Query 35: What is the distribution of employees by performance rating?
-- ---------------------------------------------------------------------------
SELECT
    PerformanceRating,
    COUNT(*) AS Employee_Count
FROM hr_attrition
GROUP BY PerformanceRating
ORDER BY PerformanceRating DESC;

-- ---------------------------------------------------------------------------
-- Query 36: Do employees with low work-life balance show higher attrition?
-- ---------------------------------------------------------------------------
SELECT
    WorkLifeBalance,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Attrition_Rate_Percent
FROM hr_attrition
GROUP BY WorkLifeBalance
ORDER BY WorkLifeBalance ASC;


-- =====================================================================================
-- SECTION 7 : EXPERIENCE & TENURE ANALYSIS   (QUERY 37 - 42)
-- =====================================================================================
-- This section analyzes employee experience, tenure, promotion history, and manager
-- relationships to assess career growth and long-term retention patterns.
-- =====================================================================================

-- ---------------------------------------------------------------------------
-- Query 37: What is the average total working years of employees?
-- ---------------------------------------------------------------------------
SELECT
    ROUND(AVG(TotalWorkingYears), 2) AS Avg_Total_Working_Years
FROM hr_attrition;

-- ---------------------------------------------------------------------------
-- Query 38: How does attrition vary based on years spent at the company?
-- ---------------------------------------------------------------------------
SELECT
    CASE
        WHEN YearsAtCompany <= 2 THEN '0-2 Years'
        WHEN YearsAtCompany BETWEEN 3 AND 5 THEN '3-5 Years'
        WHEN YearsAtCompany BETWEEN 6 AND 10 THEN '6-10 Years'
        ELSE '11+ Years'
    END AS Tenure_Group,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Attrition_Rate_Percent
FROM hr_attrition
GROUP BY Tenure_Group
ORDER BY Attrition_Rate_Percent DESC;

-- ---------------------------------------------------------------------------
-- Query 39: What is the average number of years since the last promotion,
--           grouped by department?
-- ---------------------------------------------------------------------------
SELECT
    Department,
    ROUND(AVG(YearsSinceLastPromotion), 2) AS Avg_Years_Since_Promotion
FROM hr_attrition
GROUP BY Department
ORDER BY Avg_Years_Since_Promotion DESC;

-- ---------------------------------------------------------------------------
-- Query 40: What is the average years with current manager for employees
--           who stayed versus those who left?
-- ---------------------------------------------------------------------------
SELECT
    Attrition,
    ROUND(AVG(YearsWithCurrManager), 2) AS Avg_Years_With_Manager
FROM hr_attrition
GROUP BY Attrition
ORDER BY Avg_Years_With_Manager DESC;

-- ---------------------------------------------------------------------------
-- Query 41: How does the number of companies worked at relate to attrition?
-- ---------------------------------------------------------------------------
SELECT
    NumCompaniesWorked,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Attrition_Rate_Percent
FROM hr_attrition
GROUP BY NumCompaniesWorked
ORDER BY NumCompaniesWorked ASC;

-- ---------------------------------------------------------------------------
-- Query 42: What is the average training time last year by job role?
-- ---------------------------------------------------------------------------
SELECT
    JobRole,
    ROUND(AVG(TrainingTimesLastYear), 2) AS Avg_Training_Times
FROM hr_attrition
GROUP BY JobRole
ORDER BY Avg_Training_Times DESC;


-- =====================================================================================
-- SECTION 8 : EXECUTIVE KPI QUERIES   (QUERY 43 - 50)
-- =====================================================================================
-- This section presents high-level KPIs intended for executive and leadership-level
-- reporting, summarizing critical workforce health and attrition risk indicators.
-- =====================================================================================

-- ---------------------------------------------------------------------------
-- Query 43: What is the company-wide attrition rate (%) - Headline KPI?
-- ---------------------------------------------------------------------------
SELECT
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Company_Attrition_Rate_Percent
FROM hr_attrition;

-- ---------------------------------------------------------------------------
-- Query 44: Which department contributes the highest number of attritions
--           (absolute count) to the organization?
-- ---------------------------------------------------------------------------
SELECT
    Department,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count
FROM hr_attrition
GROUP BY Department
ORDER BY Attrition_Count DESC
LIMIT 1;

-- ---------------------------------------------------------------------------
-- Query 45: What is the high-risk employee segment: employees with low job
--           satisfaction (<=2) AND who work overtime?
-- ---------------------------------------------------------------------------
SELECT
    COUNT(*) AS High_Risk_Employee_Count
FROM hr_attrition
WHERE JobSatisfaction <= 2
  AND OverTime = 'Yes';

-- ---------------------------------------------------------------------------
-- Query 46: What is the average monthly income gap between male and
--           female employees (Pay Equity KPI)?
-- ---------------------------------------------------------------------------
SELECT
    Gender,
    ROUND(AVG(MonthlyIncome), 2) AS Avg_Monthly_Income
FROM hr_attrition
GROUP BY Gender
ORDER BY Avg_Monthly_Income DESC;

-- ---------------------------------------------------------------------------
-- Query 47: What percentage of the workforce has stock option level 0
--           (low equity engagement)?
-- ---------------------------------------------------------------------------
SELECT
    ROUND(SUM(CASE WHEN StockOptionLevel = 0 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Zero_StockOption_Percent
FROM hr_attrition;

-- ---------------------------------------------------------------------------
-- Query 48: Which job roles combine high attrition rate (>15%) with
--           below-average job satisfaction - critical retention focus areas?
-- ---------------------------------------------------------------------------
SELECT
    JobRole,
    COUNT(*) AS Total_Employees,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Attrition_Rate_Percent,
    ROUND(AVG(JobSatisfaction), 2) AS Avg_Job_Satisfaction
FROM hr_attrition
GROUP BY JobRole
HAVING Attrition_Rate_Percent > 15
   AND Avg_Job_Satisfaction < (SELECT AVG(JobSatisfaction) FROM hr_attrition)
ORDER BY Attrition_Rate_Percent DESC;

-- ---------------------------------------------------------------------------
-- Query 49: What is the overall employee retention rate (%) - Executive
--           Summary KPI?
-- ---------------------------------------------------------------------------
SELECT
    ROUND(SUM(CASE WHEN Attrition = 'No' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Retention_Rate_Percent
FROM hr_attrition;

-- ---------------------------------------------------------------------------
-- Query 50: Executive Summary Dashboard - Key workforce metrics in a
--           single consolidated view.
-- ---------------------------------------------------------------------------
SELECT
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Total_Attrition,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Attrition_Rate_Percent,
    ROUND(AVG(MonthlyIncome), 2) AS Avg_Monthly_Income,
    ROUND(AVG(JobSatisfaction), 2) AS Avg_Job_Satisfaction,
    ROUND(AVG(WorkLifeBalance), 2) AS Avg_WorkLife_Balance,
    ROUND(AVG(TotalWorkingYears), 2) AS Avg_Total_Working_Years
FROM hr_attrition;


-- =====================================================================================
--                                 END OF SQL SCRIPT
-- =====================================================================================