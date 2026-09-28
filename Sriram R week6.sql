-- 1. Create the Review Table
CREATE TABLE Review (
    Review_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(100),
    Product_ID INT,
    Review_Text VARCHAR(255),
    Review_Date DATE
);

-- 2. Create the Rating Table
CREATE TABLE Rating (
    Rating_ID INT PRIMARY KEY,
    Review_ID INT,
    Rating INT,
    FOREIGN KEY (Review_ID) REFERENCES Review(Review_ID)
);