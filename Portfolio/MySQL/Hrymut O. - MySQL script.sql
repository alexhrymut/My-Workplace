CREATE DATABASE HomeWork;
USE HomeWork;
CREATE TABLE Shopping_List (
ID int,
Product_Name varchar(255),
Price int,
Quantity int,
PRIMARY KEY (ID)
);
INSERT INTO Shopping_List VALUES (
1, 'Egg', 3, 10),
(2, 'Apple', 1, 5),
(3, 'Bread', 5, 2),
(4, 'Tomato', 4, 10),
(5, 'Potato', 10, 3),
(6, 'Butter', 1, 12),
(7, 'Cucumber', 5, 4),
(8, 'Milk', 2, 10),
(9, 'Onion', 3, 2),
(10, 'Chocolate', 2, 11);


CREATE TABLE Fridge (
Item_ID int,
Product_ID int,
Product_Name varchar(255),
Quantity int,
Expiration_Date timestamp(6),
PRIMARY KEY (Item_ID)
);
INSERT INTO Fridge VALUES (
1, 10, 'Egg', 10, 221016),
(8, 11, 'Milk', 2, 221026),
(2, 12,'Apple', 10, 221008),
(6, 13, 'Butter', 1, 221010),
(4, 14, 'Tomato', 4, 221010),
(11, 20, 'Cheese', 10, 221016),
(12, 21, 'Cream', 2, 221026),
(13, 22,'Joghurt', 10, 221008),
(14, 23, 'Avocado', 1, 221010),
(15, 24, 'Soda', 2, 221010);

ALTER TABLE Shopping_List ADD COLUMN Item_ID INT;
ALTER TABLE Shopping_List 
ADD CONSTRAINT Products
FOREIGN KEY (Item_ID)
REFERENCES Fridge (Item_ID);

SELECT
Shopping_List.ID,
Shopping_List.Product_Name,
Shopping_List.Price,
Shopping_List.Quantity,
Fridge.Item_ID
FROM Shopping_List
INNER JOIN Fridge on Fridge.Item_ID=Shopping_List.ID

SELECT * from Fridge

SELECT * from Shopping_List

SELECT Product_Name FROM Fridge 
WHERE Product_Name NOT IN (SELECT Product_Name FROM Shopping_List)

SELECT Product_Name, Price AS Highest_Price FROM Shopping_List
WHERE Price = (SELECT MAX(Price) FROM Shopping_List)

SELECT Product_Name, Price AS Lowest_Price FROM Shopping_List
WHERE Price = (SELECT MIN(Price) FROM Shopping_List)

SELECT AVG(Price) AS Average_Product_Price FROM Shopping_List

SELECT COUNT(*) AS Available_products FROM Fridge

SELECT COUNT(*) AS Available_products FROM Shopping_List

SELECT Product_Name, Quantity FROM Shopping_List
UNION
SELECT Product_Name, Quantity FROM Fridge

SELECT Product_Name, SUM(Quantity) AS Product_Quantity, Expiration_Date FROM Fridge
GROUP BY Product_Name, Expiration_Date
ORDER BY Expiration_Date

-- Lesson 23

SELECT * FROM Shopping_List
WHERE Product_Name LIKE 'A%'

SELECT Shopping_List.ID, Fridge.Product_Name
FROM Shopping_List
INNER JOIN Fridge ON Shopping_List.ID=Fridge.Item_ID

SELECT Shopping_List.ID, Shopping_List.Product_Name FROM Shopping_List 
LEFT JOIN Fridge ON Shopping_List.ID=Fridge.Item_ID
WHERE Fridge.Item_ID IS NULL

CREATE TABLE `Order` (
Order_ID int,
Product_ID int,
Item_ID int,
`Date` timestamp(6),
Quantity int,
PRIMARY KEY (Item_ID)
);
INSERT INTO `Order` VALUES (
1, 10, 1, 221023, 3),
(2, 11, 2, 221023, 2),
(3, 12, 3, 221023, 4),
(4, 13, 4, 221026, 3),
(5, 14, 5, 221026, 5),
(6, 15, 6, 221012, 6),
(7, 16, 7, 221012, 2),
(8, 17, 8, 221012, 3),
(9, 18, 9, 221011, 1),
(10, 19, 10, 221011, 5),
(11, 20, 11, 221016, 3),
(12, 21, 12, 221026, 5),
(13, 22, 13, 221008, 2),
(14, 23, 14, 221010, 3),
(15, 24, 15, 221010, 1);

ALTER TABLE Shopping_List 
ADD CONSTRAINT Orders
FOREIGN KEY (Item_ID)
REFERENCES `Order` (Item_ID);

ALTER TABLE Fridge 
ADD CONSTRAINT Orders2
FOREIGN KEY (Item_ID)
REFERENCES `Order` (Item_ID);

SELECT Shopping_List.ID, Shopping_List.Product_Name, `Order`.`Date` AS Expired
FROM Shopping_List
INNER JOIN `Order` ON Shopping_List.ID=`Order`.Item_ID
AND `Order`.`Date` <= CURRENT_TIMESTAMP(6)

SELECT * FROM `Order`












DROP DATABASE HomeWork