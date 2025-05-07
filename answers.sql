-- QUESTION 1
CREATE DATABASE PRODUCTS;
USE PRODUCTS;
-- Create a new table to store the 1NF compliant data.
CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(255),
    Product VARCHAR(255)
);

-- Populate the new table by splitting the Products column from the original table.
INSERT INTO ProductDetail_1NF(OrderID, CustomerName, Product) 
VALUES
(101, 'John Doe', 'Mouse'),
(101, 'John Doe', 'Laptop'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');

SELECT *
FROM ProductDetail_1NF
ORDER BY OrderID;


-- QUESTION 2

-- MySQL code to create tables and insert data for 2NF
-- Create the Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(255)
);

-- Insert data into the Customers table
INSERT INTO Customers (CustomerID, CustomerName) VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

-- Create the Orders table
CREATE TABLE OrderDetails (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Insert data into the Orders table
INSERT INTO OrderDetails (OrderID, CustomerID) VALUES
(101, 101),
(102, 102),
(103, 103);

-- Create the OrderItemsDetails table
CREATE TABLE OrderItemsDetails (
    OrderItemID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    Product VARCHAR(255),
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES OrderDetails(OrderID)
);

-- Insert data into the OrderItemsDetails table
INSERT INTO OrderItemsDetails (OrderID, Product, Quantity) VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);

-- Optional: Select all data from the tables to verify the input
SELECT * FROM Customers;
SELECT * FROM OrderDetails;
SELECT * FROM OrderItemsDetails;

