USE JUMPMAN;

SELECT * FROM Category;
SELECT DISTINCT CategoryName FROM Category;
SELECT * FROM Category WHERE CategoryName LIKE 'R%';
SELECT * FROM Category ORDER BY CategoryName ASC;

SELECT ProductID, ProductName, Price FROM Product WHERE Price > 15000;
SELECT DISTINCT Category FROM Product;
SELECT ProductID, ProductName, Stock FROM Product ORDER BY Stock DESC;
SELECT ProductName, Price FROM Product WHERE Category = 3;

SELECT SellerName, ContactNo FROM Seller WHERE Address = 'Chennai';
SELECT DISTINCT Address FROM Seller;
SELECT SellerID, SellerName FROM Seller ORDER BY SellerName ASC;
SELECT * FROM Seller WHERE SellerName LIKE '%KICKS%';

SELECT ProductID, SellerID, Stock FROM Inventory WHERE AvailabilityStatus = 'AVAILABLE' AND Stock > 15;
SELECT DISTINCT AvailabilityStatus FROM Inventory;
SELECT InventoryID, ProductID, Stock FROM Inventory ORDER BY Stock ASC;
SELECT ProductID, SellerID FROM Inventory WHERE AvailabilityStatus = 'UNAVAILABLE';

SELECT OrderID, CustomerName, TotalAmount FROM Orders WHERE OrderStatus = 'Delivered';
SELECT DISTINCT OrderStatus FROM Orders;
SELECT OrderID, CustomerName, TotalAmount FROM Orders ORDER BY TotalAmount DESC;
SELECT * FROM Orders WHERE OrderDate > '2026-09-10';

SELECT DISTINCT ProductID FROM Order_Details;
SELECT OrderID, ProductID, Quantity FROM Order_Details WHERE Quantity > 1;
SELECT OrderDetailID, ProductID, UnitPrice FROM Order_Details ORDER BY UnitPrice DESC;
SELECT * FROM Order_Details WHERE OrderID = 1016;

SELECT PaymentID, OrderID, PaymentAmount FROM Payment WHERE PaymentStatus = 'Successful';
SELECT DISTINCT PaymentMode FROM Payment;
SELECT PaymentID, PaymentMode, PaymentAmount FROM Payment ORDER BY PaymentAmount DESC;
SELECT * FROM Payment WHERE PaymentMode = 'UPI' AND PaymentStatus = 'Failed';

