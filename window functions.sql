-- running total 
SELECT
    CustomerID,
    MonthlyCharges,
    SUM(MonthlyCharges) OVER (ORDER BY CustomerID) AS RunningTotal
FROM
    telco_churn.`telco-customer-churn`;

-- ranking customers by tenure 
SELECT
    CustomerID,
    tenure,
    RANK() OVER (ORDER BY tenure DESC) AS TenureRank
FROM
    telco_churn.`telco-customer-churn`;
    
-- commu;ative sum of monthly charges
SELECT
    CustomerID,
    MonthlyCharges,
    SUM(MonthlyCharges) OVER (PARTITION BY CustomerID ORDER BY tenure) AS CumulativeMonthlyCharges
FROM
    telco_churn.`telco-customer-churn`;

-- rolling average of total charges
SELECT
    CustomerID,
    TotalCharges,
    AVG(TotalCharges) OVER (ORDER BY tenure ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS RollingAvgTotalCharges
FROM
    telco_churn.`telco-customer-churn`;

-- percent of total charges 
SELECT
    CustomerID,
    TotalCharges,
    TotalCharges / SUM(TotalCharges) OVER () * 100 AS PercentOfTotalCharges
FROM
    telco_churn.`telco-customer-churn`;


