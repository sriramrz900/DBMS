USE JUMPMAN;

SELECT Orders.OrderID,
       Order_Details.ProductID,
       Order_Details.Quantity
FROM Orders
INNER JOIN Order_Details
ON Orders.OrderID = Order_Details.OrderID;

SELECT Orders.OrderID,
       Order_Details.ProductID,
       Order_Details.Quantity
FROM Orders
LEFT JOIN Order_Details
ON Orders.OrderID = Order_Details.OrderID;

SELECT Orders.OrderID,
       Orders.CustomerName,
       Order_Details.ProductID,
       Order_Details.Quantity
FROM Orders
RIGHT JOIN Order_Details
ON Orders.OrderID = Order_Details.OrderID;

SELECT Orders.OrderID,
       Orders.TotalAmount,
       Payment.PaymentMode,
       Payment.PaymentAmount
FROM Orders
INNER JOIN Payment
ON Orders.OrderID = Payment.OrderID;

SELECT Products.ProductName,
       Category.CategoryName
FROM Products
INNER JOIN Category
ON Products.Category = Category.Category;

SELECT Orders.OrderID,
       Products.ProductName,
       Order_Details.Quantity,
       Payment.PaymentStatus
FROM Orders
INNER JOIN Order_Details
ON Orders.OrderID = Order_Details.OrderID
INNER JOIN Products
ON Order_Details.ProductID = Products.ProductID
LEFT JOIN Payment
ON Orders.OrderID = Payment.OrderID;

SELECT Products.ProductName,
       Seller.SellerName,
       Inventory.Stock
FROM Inventory
INNER JOIN Products
ON Inventory.ProductID = Products.ProductID
INNER JOIN Seller
ON Inventory.SellerID = Seller.SellerID;

SELECT Review.Customer_Name,
       Review.Review_Text,
       Rating.Rating
FROM Review
INNER JOIN Rating
ON Review.Review_ID = Rating.Review_ID;

SELECT Products.ProductName,
       Review.Customer_Name,
       Rating.Rating
FROM Review
INNER JOIN Rating
ON Review.Review_ID = Rating.Review_ID
INNER JOIN Products
ON Review.Product_ID = Products.ProductID;

SELECT Orders.OrderID,
       Orders.CustomerName,
       Products.ProductName,
       Order_Details.Quantity,
       Payment.PaymentMode,
       Payment.PaymentStatus,
       Payment.PaymentAmount
FROM Orders
INNER JOIN Order_Details
ON Orders.OrderID = Order_Details.OrderID
INNER JOIN Products
ON Order_Details.ProductID = Products.ProductID
INNER JOIN Payment
ON Orders.OrderID = Payment.OrderID;