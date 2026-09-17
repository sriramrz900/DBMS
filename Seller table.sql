USE JUMPMAN;


CREATE TABLE Seller
(
    SellerID INT PRIMARY KEY,
    SellerName VARCHAR(100),
    ContactNo VARCHAR(15),
    Email VARCHAR(100),
    Address VARCHAR(150)
);


INSERT INTO Seller VALUES
(201,"JORDAN OFFICIAL","9876500001","jordanofficial@gmail.com","Chennai"),
(202,"SNEAKER HUB","9876500002","sneakerhub@gmail.com","Madurai"),
(203,"FOOTWEAR WORLD","9876500003","footwearworld@gmail.com","Coimbatore"),
(204,"URBAN KICKS","9876500004","urbankicks@gmail.com","Salem"),
(205,"SOLE STREET","9876500005","solestreet@gmail.com","Trichy"),
(206,"KICKS MART","9876500006","kicksmart@gmail.com","Chennai"),
(207,"SNEAKER POINT","9876500007","sneakerpoint@gmail.com","Madurai"),
(208,"SHOE ZONE","9876500008","shoezone@gmail.com","Coimbatore"),
(209,"SOLE WORLD","9876500009","soleworld@gmail.com","Salem"),
(210,"KICKS WORLD","9876500010","kicksworld@gmail.com","Trichy"),
(211,"JORDAN STREET","9876500011","jordanstreet@gmail.com","Chennai"),
(212,"SNEAKER HOUSE","9876500012","sneakerhouse@gmail.com","Madurai"),
(213,"SOLE MART","9876500013","solemart@gmail.com","Coimbatore"),
(214,"KICK CARE","9876500014","kickcare@gmail.com","Salem"),
(215,"JORDAN STORE","9876500015","jordanstore@gmail.com","Trichy"),
(216,"FOOT MART","9876500016","footmart@gmail.com","Chennai"),
(217,"SNEAKER MART","9876500017","sneakermart@gmail.com","Madurai"),
(218,"SOLE SUPPLIERS","9876500018","solesuppliers@gmail.com","Coimbatore"),
(219,"KICKS STORE","9876500019","kicksstore@gmail.com","Salem"),
(220,"CITY KICKS","9876500020","citykicks@gmail.com","Trichy"),
(221,"PREMIUM SOLES","9876500021","premiumsoles@gmail.com","Chennai"),
(222,"ELITE KICKS","9876500022","elitekicks@gmail.com","Madurai"),
(223,"SNEAKER EXPRESS","9876500023","sneakerexpress@gmail.com","Coimbatore"),
(224,"KICKS CARE","9876500024","kickscare@gmail.com","Salem"),
(225,"BEST SOLES","9876500025","bestsoles@gmail.com","Trichy");

SELECT * FROM Seller;


CREATE TABLE Inventory
(
    InventoryID INT PRIMARY KEY,
    ProductID INT,
    SellerID INT,
    AvailabilityStatus VARCHAR(20),
    Stock INT,

    FOREIGN KEY (ProductID)
    REFERENCES Product(ProductID),

    FOREIGN KEY (SellerID)
    REFERENCES Seller(SellerID)
);


INSERT INTO Inventory VALUES
(301,101,201,"AVAILABLE",25),
(302,102,202,"AVAILABLE",15),
(303,103,203,"AVAILABLE",10),
(304,104,204,"AVAILABLE",12),
(305,105,205,"AVAILABLE",30),
(306,106,206,"AVAILABLE",20),
(307,107,207,"UNAVAILABLE",0),
(308,109,208,"AVAILABLE",18),
(309,110,209,"AVAILABLE",15),
(310,111,210,"AVAILABLE",30),
(311,112,211,"UNAVAILABLE",0),
(312,113,212,"AVAILABLE",15),
(313,114,213,"AVAILABLE",20),
(314,115,214,"UNAVAILABLE",0),
(315,116,215,"AVAILABLE",15),
(316,117,216,"AVAILABLE",12),
(317,118,217,"UNAVAILABLE",0),
(318,119,218,"AVAILABLE",10),
(319,120,219,"AVAILABLE",20),
(320,126,220,"UNAVAILABLE",0),
(321,127,221,"AVAILABLE",10),
(322,128,222,"AVAILABLE",5),
(323,129,223,"UNAVAILABLE",0),
(324,130,224,"AVAILABLE",15),
(325,101,225,"AVAILABLE",50);

SELECT * FROM Inventory;

UPDATE Inventory
SET Stock=20,
    AvailabilityStatus="AVAILABLE"
WHERE InventoryID=307;

SELECT * FROM Inventory
WHERE InventoryID=307;


UPDATE Inventory
SET Stock=0,
    AvailabilityStatus="UNAVAILABLE"
WHERE InventoryID=302;

SELECT * FROM Inventory
WHERE InventoryID=302;


UPDATE Inventory
SET Stock=15,
    AvailabilityStatus="AVAILABLE"
WHERE InventoryID=311;

SELECT * FROM Inventory
WHERE InventoryID=311;


UPDATE Seller
SET ContactNo="9876599999",
    Address="Madurai"
WHERE SellerID=201;

SELECT * FROM Seller
WHERE SellerID=201;


DELETE FROM Inventory
WHERE InventoryID=325;

SELECT * FROM Inventory;


SELECT * FROM Inventory
WHERE AvailabilityStatus="AVAILABLE";


SELECT * FROM Inventory
WHERE AvailabilityStatus="UNAVAILABLE";


SELECT COUNT(*) FROM Inventory
WHERE AvailabilityStatus="AVAILABLE";


SELECT COUNT(*) FROM Inventory
WHERE AvailabilityStatus="UNAVAILABLE";


SELECT * FROM Inventory
ORDER BY Stock DESC;


SELECT * FROM Inventory;
SELECT * FROM Seller;