DELIMITER //
CREATE PROCEDURE CalculateTotalCharges(IN customerId INT, OUT totalCharges DOUBLE)
BEGIN
    SELECT SUM(TotalCharges) INTO totalCharges
    FROM telco_churn.`telco-customer-churn`
    WHERE CustomerID = customerId;
END //
DELIMITER ;

CALL CalculateTotalCharges(72, @totalCharges);
SELECT @totalCharges;


