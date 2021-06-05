CREATE TABLE Manufacturers (
  Code INTEGER,
  Name VARCHAR(255) NOT NULL,
  PRIMARY KEY (Code)   
);

CREATE TABLE Products (
  Code INTEGER,
  Name VARCHAR(255) NOT NULL ,
  Price DECIMAL NOT NULL ,
  Manufacturer INTEGER NOT NULL,
  PRIMARY KEY (Code), 
  FOREIGN KEY (Manufacturer) REFERENCES Manufacturers(Code)
) ENGINE=INNODB;

INSERT INTO Manufacturers(Code,Name) VALUES(1,'Sony');
INSERT INTO Manufacturers(Code,Name) VALUES(2,'Creative Labs');
INSERT INTO Manufacturers(Code,Name) VALUES(3,'Hewlett-Packard');
INSERT INTO Manufacturers(Code,Name) VALUES(4,'Iomega');
INSERT INTO Manufacturers(Code,Name) VALUES(5,'Fujitsu');
INSERT INTO Manufacturers(Code,Name) VALUES(6,'Winchester');

INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(1,'Hard drive',240,5);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(2,'Memory',120,6);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(3,'ZIP drive',150,4);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(4,'Floppy disk',5,6);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(5,'Monitor',240,1);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(6,'DVD drive',180,2);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(7,'CD drive',90,2);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(8,'Printer',270,3);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(9,'Toner cartridge',66,3);
INSERT INTO Products(Code,Name,Price,Manufacturer) VALUES(10,'DVD burner',180,2);


#SELECT THE NAMES OF ALL THE PRODUCTS IN STORE
SELECT NAME
FROM PRODUCTS;

#SELECT THE NAMES AND PRICES OF ALL THE PRODUCTS IN STORE
SELECT NAME, PRICE
FROM PRODUCTS;

#Select the name of the products with a price greater than or equal to $100
SELECT NAME
FROM PRODUCTS
WHERE PRICE >=100;

#SELECT ALL THE PRODUCTS WITH A PRICE BETWEEN 100 AND 200
SELECT NAME
FROM PRODUCTS
WHERE PRICE BETWEEN 100 AND 200;

#Select the name and price in cents (i.e., the price must be multiplied by 100)

SELECT NAME, PRICE*100 AS PRICE
FROM PRODUCTS;

#AVERAGE PRICE OF ALL THE PRODUCTS
SELECT round(avg(price),2) AS AVG_PRICE
FROM PRODUCTS;

#Compute the average price of all products with manufacturer code equal to 2.
SELECT AVG(PRICE) AS PRICE
FROM PRODUCTS
WHERE MANUFACTURER =2;

#Compute the number of products with a price larger than or equal to $180

SELECT COUNT(*) AS TOTAL
FROM PRODUCTS
WHERE PRICE >=180;

#Select the name and price of all products with a price larger than or equal to $180, 
#and sort first by price (in descending order), and then by name (in ascending order).
SELECT NAME, PRICE
FROM PRODUCTS
WHERE PRICE >= 180
ORDER BY PRICE DESC, NAME;

#Select all the data from the products, including all the data for each product's manufacturer.

SELECT *
FROM PRODUCTS P JOIN MANUFACTURERS M
WHERE P.Manufacturer = M.CODE;
## TRY AGAIN WITH RENAMING THE CODE COLUMN FROM BOTH TABLES


#Select the product name, price, and manufacturer name of all the products.

SELECT P.NAME AS PRODUCT , P.PRICE, M.NAME AS COMPANY
FROM PRODUCTS P JOIN MANUFACTURERS M
WHERE P.Manufacturer = M.CODE;

#Select the average price of each manufacturer's products, showing only the manufacturer's code.
SELECT ROUND(AVG(P.PRICE),2) AS AVG_PRICE, P.Manufacturer, M.NAME
FROM PRODUCTS P JOIN MANUFACTURERS M
WHERE P.Manufacturer = M.CODE
GROUP BY P.Manufacturer
ORDER BY P.Manufacturer;

#Select the names of manufacturer whose products have an average price larger than or equal to $150

SELECT M.NAME
FROM PRODUCTS P JOIN MANUFACTURERS M
WHERE P.Manufacturer = M.CODE
GROUP BY M.NAME
HAVING AVG(PRICE)>=150;

#Select the name and price of the cheapest product

SELECT NAME, PRICE
FROM PRODUCTS
ORDER BY PRICE LIMIT 1;


## MORE WAYS IF YOU WANT TO PLAY AROUND
SELECT NAME, PRICE
FROM PRODUCTS
WHERE PRICE = (SELECT MIN(PRICE) FROM PRODUCTS);

SELECT NAME, PRICE
FROM PRODUCTS
WHERE PRICE = (SELECT PRICE FROM PRODUCTS ORDER BY PRICE LIMIT 1);

#Select the name of each manufacturer along with the name and price of its most expensive product.
SELECT M.NAME AS COMPANY, P.NAME AS PRODUCT, MAX(P.PRICE) AS PRICE
FROM PRODUCTS P JOIN MANUFACTURERS M
WHERE P.Manufacturer = M.CODE
GROUP BY M.NAME;




#APPLY A 15% DISCOUNT TO ALL PRODUCTS

SELECT *, price - price*0.15 as discounted
from products;

#Apply a 10% discount to all products with a price larger than or equal to $120
SELECT *, price - price*0.15 as discounted
from products
where price >=120;




