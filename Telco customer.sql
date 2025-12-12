use telcocustomer;

SELECT COUNT(CustomerID) AS TotalCustomers
FROM TelcoChurn;


SELECT DISTINCT Gender
FROM TelcoChurn;


SELECT *
FROM TelcoChurn
WHERE TotalCharges IS NULL
   OR TotalCharges = '';
   
DESCRIBE TelcoChurn;

SELECT
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS ChurnedCustomers,
    SUM(CASE WHEN Churn = 'No' THEN 1 ELSE 0 END) AS RetainedCustomers
FROM TelcoChurn;

   SELECT
    ROUND(100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2)
    AS ChurnRatePercent
FROM TelcoChurn;


SELECT Gender,
       COUNT(*) AS TotalCustomers,
       SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS ChurnedCustomers,
       ROUND(100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),2) AS ChurnRate
FROM TelcoChurn
GROUP BY Gender;

SELECT Contract,
       COUNT(*) AS TotalCustomers,
       SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned,
       ROUND(100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),2) AS ChurnRate
FROM TelcoChurn
GROUP BY Contract
ORDER BY ChurnRate DESC;

SELECT SeniorCitizen,
       COUNT(*) AS TotalCustomers,
       SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned,
       ROUND(100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),2) AS ChurnRate
FROM TelcoChurn
GROUP BY SeniorCitizen;


SELECT SUM(MonthlyCharges) AS MonthlyRevenueLoss
FROM TelcoChurn
WHERE Churn = 'Yes';

SELECT CustomerID, TotalCharges, MonthlyCharges, tenure, Contract
FROM TelcoChurn
WHERE Churn = 'Yes'
ORDER BY TotalCharges DESC
LIMIT 20;


SELECT PaymentMethod,
       COUNT(*) AS TotalCustomers,
       SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS ChurnedCustomers
FROM TelcoChurn
GROUP BY PaymentMethod;

SELECT *
FROM TelcoChurn
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/telco_clean.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';

