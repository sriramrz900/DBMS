USE JUMPMAN;

-- 1. Drop existing tables in the correct reverse order to avoid Foreign Key constraint errors
DROP TABLE IF EXISTS Order_Details;
DROP TABLE IF EXISTS Orders;

-- 2. Create the Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL,
    OrderDate DATE NOT NULL,
    OrderStatus VARCHAR(30) NOT NULL,
    TotalAmount DECIMAL(10, 2) NOT NULL
);

-- 3. Create the Order_Details table
CREATE TABLE Order_Details (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    SellerID INT,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(10, 2) NOT NULL,
    
    -- Foreign Key constraints linking to your existing tables
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID) ON DELETE CASCADE,
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
    FOREIGN KEY (SellerID) REFERENCES Seller(SellerID)
);

-- 4. Insert 20 unique and realistic records into Orders
INSERT INTO Orders (OrderID, CustomerName, OrderDate, OrderStatus, TotalAmount) VALUES
(1001, 'Arjun Kumar', '2026-09-01', 'Delivered', 15000.00),
(1002, 'Priya Rajan', '2026-09-02', 'Shipped', 18500.00),
(1003, 'Sanjay Singh', '2026-09-03', 'Pending', 12000.00),
(1004, 'Karthik Natarajan', '2026-09-04', 'Delivered', 21500.00),
(1005, 'Meera Reddy', '2026-09-05', 'Shipped', 14000.00),
(1006, 'Rahul Sharma', '2026-09-06', 'Processing', 9500.00),
(1007, 'Anita Desai', '2026-09-07', 'Delivered', 21000.00),
(1008, 'Vikram Chola', '2026-09-08', 'Shipped', 11500.00),
(1009, 'Neha Gupta', '2026-09-09', 'Delivered', 16000.00),
(1010, 'Vijay Kumar', '2026-09-10', 'Pending', 13500.00),
(1011, 'Sneha Patel', '2026-09-11', 'Delivered', 24000.00),
(1012, 'Arun Prakash', '2026-09-12', 'Shipped', 17000.00),
(1013, 'Ravi Teja', '2026-09-13', 'Delivered', 10500.00),
(1014, 'Kavya Menon', '2026-09-14', 'Pending', 14500.00),
(1015, 'Manoj Kumar', '2026-09-15', 'Shipped', 19000.00),
(1016, 'Deepa Iyer', '2026-09-16', 'Delivered', 35500.00),
(1017, 'Naveen Raj', '2026-09-17', 'Processing', 15500.00),
(1018, 'Pooja Hegde', '2026-09-18', 'Delivered', 18000.00),
(1019, 'Ajith Kumar', '2026-09-19', 'Shipped', 13000.00),
(1020, 'Surya Sivakumar', '2026-09-20', 'Delivered', 20500.00);

-- 5. Insert 24 unique records into Order_Details matching your Inventory & Seller tables
-- Note: Mapped strictly based on your previous 'Inventory' data pairs (e.g., Seller 201 has Product 101)
INSERT INTO Order_Details (OrderDetailID, OrderID, ProductID, SellerID, Quantity, UnitPrice) VALUES
(5001, 1001, 101, 201, 1, 15000.00),
(5002, 1002, 102, 202, 1, 18500.00),
(5003, 1003, 103, 203, 1, 12000.00),
(5004, 1004, 104, 204, 1, 12000.00),
(5005, 1004, 106, 206, 1, 9500.00),   -- Additional item for Order 1004
(5006, 1005, 105, 205, 1, 14000.00),
(5007, 1006, 106, 206, 1, 9500.00),
(5008, 1007, 109, 208, 2, 10500.00),
(5009, 1008, 110, 209, 1, 11500.00),
(5010, 1009, 111, 210, 1, 16000.00),
(5011, 1010, 113, 212, 1, 13500.00),
(5012, 1011, 114, 213, 1, 12500.00),
(5013, 1011, 110, 209, 1, 11500.00),  -- Additional item for Order 1011
(5014, 1012, 116, 215, 1, 17000.00),
(5015, 1013, 117, 216, 1, 10500.00),
(5016, 1014, 119, 218, 1, 14500.00),
(5017, 1015, 120, 219, 1, 19000.00),
(5018, 1016, 127, 221, 2, 11000.00),
(5019, 1016, 113, 212, 1, 13500.00),  -- Additional item for Order 1016
(5020, 1017, 128, 222, 1, 15500.00),
(5021, 1018, 130, 224, 1, 18000.00),
(5022, 1019, 101, 201, 1, 13000.00),
(5023, 1020, 105, 205, 1, 20500.00),
(5024, 1020, 128, 222, 2, 15500.00);  -- Additional item for Order 1020

-- View the successfully created tables
SELECT * FROM Orders;
SELECT * FROM Order_Details;