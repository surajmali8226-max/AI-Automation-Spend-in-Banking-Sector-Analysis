-- 1. Create Database
CREATE DATABASE IF NOT EXISTS ai_automation_banking;

-- 2. Use Database
USE ai_automation_banking;

-- 3. Create Table
CREATE TABLE IF NOT EXISTS ai_automation_spend (
    id INT AUTO_INCREMENT PRIMARY KEY,
    Year INT,
    Region VARCHAR(100),
    Country VARCHAR(100),
    Bank VARCHAR(150),
    AI_Use_Case VARCHAR(150),
    Technology VARCHAR(100),
    AI_Spend_USD_Million DECIMAL(15,2),
    Estimated_Cost_Savings_USD_Million DECIMAL(15,2),
    ROI_Multiple DECIMAL(10,2),
    Automation_Rate_Percent DECIMAL(10,2),
    FTE_Hours_Saved_Monthly DECIMAL(15,2),
    AI_Projects INT,
    Maturity VARCHAR(50)
);

-- 4. Show Tables
SHOW TABLES;

-- 5. Check Table Structure
DESC ai_automation_spend;

-- 6. Total Records
SELECT COUNT(*) AS Total_Records
FROM ai_automation_spend;

-- 7. Display First 10 Records
SELECT *
FROM ai_automation_spend
LIMIT 10;

-- 8. Total AI Spend
SELECT SUM(AI_Spend_USD_Million) AS Total_AI_Spend
FROM ai_automation_spend;

-- 9. Total Cost Savings
SELECT SUM(Estimated_Cost_Savings_USD_Million) AS Total_Cost_Savings
FROM ai_automation_spend;

-- 10. Average ROI
SELECT ROUND(AVG(ROI_Multiple), 2) AS Average_ROI
FROM ai_automation_spend;

-- 11. Average Automation Rate
SELECT ROUND(AVG(Automation_Rate_Percent), 2) AS Average_Automation_Rate
FROM ai_automation_spend;

-- 12. Total AI Projects
SELECT SUM(AI_Projects) AS Total_AI_Projects
FROM ai_automation_spend;

-- 13. Country-wise AI Spend
SELECT 
    Country,
    SUM(AI_Spend_USD_Million) AS Total_AI_Spend
FROM ai_automation_spend
GROUP BY Country
ORDER BY Total_AI_Spend DESC;

-- 14. Region-wise AI Spend
SELECT 
    Region,
    SUM(AI_Spend_USD_Million) AS Total_AI_Spend
FROM ai_automation_spend
GROUP BY Region
ORDER BY Total_AI_Spend DESC;

-- 15. Year-wise AI Spend
SELECT 
    Year,
    SUM(AI_Spend_USD_Million) AS Total_AI_Spend
FROM ai_automation_spend
GROUP BY Year
ORDER BY Year;

-- 16. Bank-wise AI Spend
SELECT 
    Bank,
    SUM(AI_Spend_USD_Million) AS Total_AI_Spend
FROM ai_automation_spend
GROUP BY Bank
ORDER BY Total_AI_Spend DESC;

-- 17. AI Use Case Analysis
SELECT 
    AI_Use_Case,
    SUM(AI_Spend_USD_Million) AS Total_Spend,
    ROUND(AVG(ROI_Multiple), 2) AS Average_ROI
FROM ai_automation_spend
GROUP BY AI_Use_Case
ORDER BY Total_Spend DESC;

-- 18. Technology-wise Analysis
SELECT 
    Technology,
    SUM(AI_Spend_USD_Million) AS Total_Spend,
    ROUND(AVG(Automation_Rate_Percent), 2) AS Avg_Automation_Rate
FROM ai_automation_spend
GROUP BY Technology
ORDER BY Total_Spend DESC;

-- 19. Maturity-wise Analysis
SELECT 
    Maturity,
    COUNT(*) AS Total_Projects,
    ROUND(AVG(ROI_Multiple), 2) AS Average_ROI,
    ROUND(AVG(Automation_Rate_Percent), 2) AS Avg_Automation_Rate
FROM ai_automation_spend
GROUP BY Maturity;

-- 20. Highest ROI Projects
SELECT 
    Bank,
    Country,
    AI_Use_Case,
    AI_Spend_USD_Million,
    ROI_Multiple
FROM ai_automation_spend
ORDER BY ROI_Multiple DESC
LIMIT 10;