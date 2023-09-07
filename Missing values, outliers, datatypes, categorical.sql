use telco_churn;

-- Remove rows with missing values in a specific column
SELECT *
FROM telco_churn.`telco-customer-churn`
WHERE customerID IS NOT NULL;

SELECT COUNT(*) AS total_missing_count
FROM telco_churn.`telco-customer-churn`
WHERE gender IS NULL
   OR SeniorCitizen IS NULL
   OR tenure IS NULL
   OR MonthlyCharges IS NULL;

-- Checking outliers using z-score
SELECT MonthlyCharges,
       (MonthlyCharges - AVG(MonthlyCharges)) / STDDEV(MonthlyCharges) AS z_score
FROM telco_churn.`telco-customer-churn`
GROUP BY MonthlyCharges
HAVING z_score > 1.96 or z_score < -1.96; -- Adjust the threshold as needed

-- checking outliers using IQR
SELECT
    MonthlyCharges,
    Q1,
    Q3,
    Q3 - Q1 AS IQR,
    CASE
        WHEN MonthlyCharges < Q1 - 1.5 * (Q3 - Q1) OR MonthlyCharges > Q3 + 1.5 * (Q3 - Q1) THEN 'Outlier'
        ELSE 'Not Outlier'
    END AS OutlierStatus
FROM (
    SELECT
        (SELECT MonthlyCharges FROM telco_churn.`telco-customer-churn` ORDER BY MonthlyCharges LIMIT CEIL(COUNT(*) * 0.25), 1) AS Q1,
        (SELECT MonthlyCharges FROM telco_churn.`telco-customer-churn` ORDER BY MonthlyCharges LIMIT CEIL(COUNT(*) * 0.75), 1) AS Q3
    FROM
        telco_churn.`telco-customer-churn`
) AS Percentiles, telco_churn.`telco-customer-churn`;


DESCRIBE telco_churn.`telco-customer-churn`;

-- checking for invalid data types 
SELECT
    MonthlyCharges,
    CASE
        WHEN MonthlyCharges IS NULL OR CAST(MonthlyCharges AS DOUBLE) IS NULL THEN 'Invalid Data Type'
        ELSE 'Valid Data Type'
    END AS DataTypeStatus
FROM telco_churn.`telco-customer-churn`;

-- Univariate analysis: Count the frequency of each category in a categorical variable
SELECT Gender, COUNT(*) AS Frequency
FROM telco_churn.`telco-customer-churn`
GROUP BY Gender;

-- Bivariate analysis: Cross-tabulation between two categorical variables
SELECT Gender, Contract, COUNT(*) AS Frequency
FROM telco_churn.`telco-customer-churn`
GROUP BY Gender, Contract;

-- Multivariate analysis: Cross-tabulation of three categorical variables
SELECT Gender, Contract, Churn, COUNT(*) AS Frequency
FROM telco_churn.`telco-customer-churn`
GROUP BY Gender, Contract, Churn;




