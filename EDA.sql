SELECT * FROM telco_churn.`telco-customer-churn`;

-- Distribution of Gender in the Dataset
SELECT
    gender,
    COUNT(*) AS count,
    ROUND(COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS proportion
FROM
    telco_churn.`telco-customer-churn`
GROUP BY
    gender;
    
-- Distribution of Senior Citizen Status
SELECT
    SeniorCitizen,
    COUNT(*) AS count,
    ROUND(COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS proportion
FROM
    telco_churn.`telco-customer-churn`
GROUP BY
    SeniorCitizen;

-- Distribution of Senior Citizen Status
SELECT
    SeniorCitizen,
    COUNT(*) AS count,
    ROUND(COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS proportion
FROM
    telco_churn.`telco-customer-churn`
GROUP BY
    SeniorCitizen;

-- Proportion of Customers with Partners vs. Without Partners
SELECT
    Partner,
    COUNT(*) AS count,
    ROUND(COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS proportion
FROM
    telco_churn.`telco-customer-churn`
GROUP BY
    Partner;

-- Correlation Between Partnership Status and Other Services Subscribed
SELECT
    Partner,
    AVG(OnlineSecurity) AS avg_online_security,
    AVG(OnlineBackup) AS avg_online_backup,
    AVG(DeviceProtection) AS avg_device_protection,
    AVG(TechSupport) AS avg_tech_support
FROM
    telco_churn.`telco-customer-churn`
GROUP BY
    Partner;

-- Distribution of Customers with and Without Dependents
SELECT
    Dependents,
    COUNT(*) AS count,
    ROUND(COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS proportion
FROM
    telco_churn.`telco-customer-churn`
GROUP BY
    Dependents;

-- Correlation Between Dependency Status and Services Subscribed
SELECT
    Dependents,
    AVG(OnlineSecurity) AS avg_online_security,
    AVG(OnlineBackup) AS avg_online_backup,
    AVG(DeviceProtection) AS avg_device_protection,
    AVG(TechSupport) AS avg_tech_support
FROM
    telco_churn.`telco-customer-churn`
GROUP BY
    Dependents;
    
-- Percentage of Customers with Phone Service
SELECT
    PhoneService,
    COUNT(*) AS count,
    ROUND(COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS percentage
FROM
    telco_churn.`telco-customer-churn`
GROUP BY
    PhoneService;

-- Number of Customers with Multiple Phone Lines
SELECT
    MultipleLines,
    COUNT(*) AS count
FROM
    telco_churn.`telco-customer-churn`
WHERE
    MultipleLines = 'Yes'
GROUP BY
    MultipleLines;

-- Connection Between Multiple Lines and Contract Types
SELECT
    MultipleLines,
    Contract,
    COUNT(*) AS count
FROM
    telco_churn.`telco-customer-churn`
WHERE
    MultipleLines = 'Yes'
GROUP BY
    MultipleLines, Contract;

-- Distribution of Different Internet Service Types
SELECT
    InternetService,
    COUNT(*) AS count,
    ROUND(COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS proportion
FROM
    telco_churn.`telco-customer-churn`
GROUP BY
    InternetService;

-- Differences in Streaming Habits Based on Internet Service Type
SELECT
    InternetService,
    AVG(StreamingTV) AS avg_streaming_tv,
    AVG(StreamingMovies) AS avg_streaming_movies
FROM
    telco_churn.`telco-customer-churn`
GROUP BY
    InternetService;
    
-- Number of Customers with Online Security
SELECT
    OnlineSecurity,
    COUNT(*) AS count
FROM
    telco_churn.`telco-customer-churn`
WHERE
    OnlineSecurity = 'Yes'
GROUP BY
    OnlineSecurity;

-- Relationship Between Online Security and Contract Types
SELECT
    OnlineSecurity,
    Contract,
    COUNT(*) AS count
FROM
    telco_churn.`telco-customer-churn`
WHERE
    OnlineSecurity = 'Yes'
GROUP BY
    OnlineSecurity, Contract;

-- Percentage of Customers with Online Backup
SELECT
    OnlineBackup,
    COUNT(*) AS count,
    ROUND(COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS percentage
FROM
    telco_churn.`telco-customer-churn`
GROUP BY
    OnlineBackup;

-- Number of Customers with Device Protection
SELECT
    DeviceProtection,
    COUNT(*) AS count
FROM
    telco_churn.`telco-customer-churn`
GROUP BY
    DeviceProtection;

-- Distribution of Customers with Tech Support
SELECT
    TechSupport,
    COUNT(*) AS count,
    ROUND(COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS proportion
FROM
    telco_churn.`telco-customer-churn`
GROUP BY
    TechSupport;

-- Connection Between Tech Support and Contract Lengths
SELECT
    TechSupport,
    Contract,
    COUNT(*) AS count
FROM
    telco_churn.`telco-customer-churn`
GROUP BY
    TechSupport, Contract;

-- Distribution of Contract Types
SELECT
    Contract,
    COUNT(*) AS count,
    ROUND(COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS proportion
FROM
    telco_churn.`telco-customer-churn`
GROUP BY
    Contract;

-- Impact of Contract Type on Churn Rates
SELECT
    Contract,
    Churn,
    COUNT(*) AS count
FROM
    telco_churn.`telco-customer-churn`
GROUP BY
    Contract, Churn;

-- Proportions of Different Payment Methods
SELECT
    PaymentMethod,
    COUNT(*) AS count,
    ROUND(COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS proportion
FROM
    telco_churn.`telco-customer-churn`
GROUP BY
    PaymentMethod;

-- Remove rows with missing values in a specific column
SELECT *
FROM telco_churn.`telco-customer-churn`
WHERE Churn IS NOT NULL;

