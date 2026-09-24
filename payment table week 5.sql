USE JUMPMAN;

-- Drop table if it already exists to avoid errors on multiple runs
DROP TABLE IF EXISTS PAYMENT;

-- ==========================================
-- CREATE PAYMENT TABLE
-- ==========================================
CREATE TABLE PAYMENT (
    PaymentID INT PRIMARY KEY,
    OrderID INT,
    PaymentMode VARCHAR(20) NOT NULL,
    PaymentDate DATE NOT NULL,
    PaymentAmount DECIMAL(10, 2) NOT NULL,
    PaymentStatus VARCHAR(20) NOT NULL,
    
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID) ON DELETE CASCADE
);

-- ==========================================
-- TASK 1: Insert Values into the table
-- ==========================================
INSERT INTO PAYMENT (PaymentID, OrderID, PaymentMode, PaymentDate, PaymentAmount, PaymentStatus) VALUES
(6001, 1001, 'UPI', '2026-09-01', 15000.00, 'Successful'),
(6002, 1002, 'Card', '2026-09-02', 18500.00, 'Successful'),
(6003, 1003, 'Cash', '2026-09-03', 12000.00, 'Pending'),   -- Will be updated in Task 2
(6004, 1004, 'UPI', '2026-09-04', 21500.00, 'Successful'),
(6005, 1005, 'Card', '2026-09-05', 14000.00, 'Failed'),      -- Failed transaction example
(6006, 1006, 'UPI', '2026-09-06', 9500.00, 'Successful'),
(6007, 1007, 'Cash', '2026-09-07', 21000.00, 'Successful'),
(6008, 1008, 'Card', '2026-09-08', 11500.00, 'Successful'),
(6009, 1009, 'UPI', '2026-09-09', 16000.00, 'Failed'),       -- Failed transaction example
(6010, 1010, 'UPI', '2026-09-10', 13500.00, 'Successful'),
(6011, 1011, 'Card', '2026-09-11', 24000.00, 'Successful'),
(6012, 1012, 'Cash', '2026-09-12', 17000.00, 'Successful'),
(6013, 1013, 'UPI', '2026-09-13', 10500.00, 'Successful'),
(6014, 1014, 'Card', '2026-09-14', 14500.00, 'Successful'),
(6015, 1015, 'UPI', '2026-09-15', 19000.00, 'Pending'),
(6016, 1016, 'Cash', '2026-09-16', 35500.00, 'Successful'),
(6017, 1017, 'UPI', '2026-09-17', 15500.00, 'Failed'),       -- Failed transaction example
(6018, 1018, 'Card', '2026-09-18', 18000.00, 'Successful'),
(6019, 1019, 'UPI', '2026-09-19', 13000.00, 'Successful'),
(6020, 1020, 'Card', '2026-09-20', 20500.00, 'Successful');

-- Display the initial table
SELECT '--- Initial Payment Table ---' AS Step;
SELECT * FROM PAYMENT;

-- ==========================================
-- TASK 2: Use Update & change Payment Status
-- ==========================================
-- Updating PaymentID 6003 from 'Pending' to 'Successful'
UPDATE PAYMENT
SET PaymentStatus = 'Successful'
WHERE PaymentID = 6003;

-- ==========================================
-- TASK 3: Display successful payment
-- ==========================================
SELECT '--- Task 3: Successful Payments ---' AS Step;
SELECT * FROM PAYMENT
WHERE PaymentStatus = 'Successful';

-- ==========================================
-- TASK 4: Display failed transaction
-- ==========================================
SELECT '--- Task 4: Failed Payments ---' AS Step;
SELECT * FROM PAYMENT
WHERE PaymentStatus = 'Failed';

-- ==========================================
-- TASK 5: Display payment based on payment mode (UPI, Card, Cash)
-- ==========================================
-- Displaying all payments grouped/ordered by their payment mode
SELECT '--- Task 5: Payments Ordered by Mode ---' AS Step;
SELECT * FROM PAYMENT
ORDER BY FIELD(PaymentMode, 'UPI', 'Card', 'Cash');

-- ==========================================
-- TASK 6: No. of transaction (count) in each payment mode
-- ==========================================
SELECT '--- Task 6: Transaction Count per Mode ---' AS Step;
SELECT PaymentMode, COUNT(*) AS TotalTransactions
FROM PAYMENT
GROUP BY PaymentMode;

-- ==========================================
-- TASK 7: How much amt of money received in each payment mode
-- ==========================================
-- Note: Using WHERE PaymentStatus = 'Successful' because you only "receive" money on successful payments.
SELECT '--- Task 7: Total Money Received per Mode ---' AS Step;
SELECT PaymentMode, SUM(PaymentAmount) AS TotalMoneyReceived
FROM PAYMENT
WHERE PaymentStatus = 'Successful'
GROUP BY PaymentMode;