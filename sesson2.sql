CREATE DATABASE ecommerce_db;
USE ecommerce_db;


-- =========================
-- 1. USER TABLE
-- =========================

CREATE TABLE User (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50),
    email VARCHAR(100),
    password VARCHAR(50),
    role VARCHAR(20)
);

INSERT INTO User (username, email, password, role)
VALUES
('Mohammed', 'mohammed@gmail.com', 'pass123', 'Customer'),
('Sana', 'sana@gmail.com', 'pass123', 'Customer'),
('Yusuf', 'yusuf@gmail.com', 'pass123', 'Customer'),
('Alisha', 'alisha@gmail.com', 'pass123', 'Seller'),
('Sameer', 'sameer@gmail.com', 'pass123', 'Seller'),
('Noor', 'noor@gmail.com', 'pass123', 'Customer'),
('Adnan', 'adnan@gmail.com', 'pass123', 'Customer'),
('Ruqaiya', 'ruqaiya@gmail.com', 'pass123', 'Customer'),
('Imran', 'imran@gmail.com', 'pass123', 'Seller'),
('Sumaiya', 'sumaiya@gmail.com', 'pass123', 'Customer');

SELECT * FROM User;
DESC User;

UPDATE User
SET email = 'mohammed123@gmail.com'
WHERE user_id = 1;

DELETE FROM User
WHERE user_id = 10;

SELECT * FROM User;


-- =========================
-- 2. CUSTOMER TABLE
-- =========================

CREATE TABLE Customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    customer_name VARCHAR(100),
    phone VARCHAR(15),
    city VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

INSERT INTO Customer (user_id, customer_name, phone, city)
VALUES
(1, 'Mohammed Ibrahim', '9876543210', 'Chennai'),
(2, 'Sana Fathima', '9876543211', 'Coimbatore'),
(3, 'Yusuf Rahman', '9876543212', 'Madurai'),
(6, 'Noor Jahan', '9876543215', 'Chennai'),
(7, 'Adnan Ahmed', '9876543216', 'Kolkata'),
(8, 'Ruqaiya Begum', '9876543217', 'Kochi'),
(9, 'Imran Khan', '9876543218', 'Bangalore'),
(10, 'Sumaiya Noor', '9876543219', 'Ahmedabad');

SELECT * FROM Customer;
DESC Customer;

UPDATE Customer
SET city = 'Salem'
WHERE customer_id = 1;

DELETE FROM Customer
WHERE customer_id = 8;

SELECT * FROM Customer;


-- =========================
-- 3. SELLER TABLE
-- =========================

CREATE TABLE Seller (
    seller_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    seller_name VARCHAR(100),
    business_name VARCHAR(100),
    city VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

INSERT INTO Seller (user_id, seller_name, business_name, city)
VALUES
(4, 'Alisha Rahman', 'Alisha Stores', 'Hyderabad'),
(5, 'Sameer Ahmed', 'Sameer Electronics', 'Bangalore'),
(9, 'Imran Khan', 'Imran Traders', 'Delhi'),
(4, 'Alisha Begum', 'AB Fashion', 'Chennai'),
(5, 'Sameer Ali', 'SA Mobiles', 'Coimbatore'),
(9, 'Imran Rahman', 'IR Accessories', 'Mumbai'),
(4, 'Alisha Noor', 'Alisha Mart', 'Pune'),
(5, 'Sameer Hussain', 'Sameer Mart', 'Salem'),
(9, 'Imran Ahmed', 'IA Shop', 'Trichy');

SELECT * FROM Seller;
DESC Seller;

UPDATE Seller
SET city = 'Chennai'
WHERE seller_id = 1;

DELETE FROM Seller
WHERE seller_id = 9;

SELECT * FROM Seller;


-- =========================
-- 4. PRODUCT TABLE
-- =========================

CREATE TABLE Product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    seller_id INT,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    stock INT,
    FOREIGN KEY (seller_id) REFERENCES Seller(seller_id)
);

INSERT INTO Product (seller_id, product_name, category, price, stock)
VALUES
(1, 'Laptop', 'Electronics', 50000, 10),
(2, 'Mobile', 'Electronics', 20000, 20),
(3, 'Headphones', 'Accessories', 2000, 50),
(1, 'Keyboard', 'Electronics', 1500, 30),
(2, 'Mouse', 'Electronics', 800, 40),
(3, 'Shirt', 'Clothing', 1200, 25),
(1, 'Jeans', 'Clothing', 2000, 15),
(2, 'Watch', 'Accessories', 3000, 10),
(3, 'Shoes', 'Footwear', 2500, 18),
(1, 'Bag', 'Accessories', 1800, 22);

SELECT * FROM Product;
DESC Product;

UPDATE Product
SET price = 48000
WHERE product_id = 1;

DELETE FROM Product
WHERE product_id = 10;

SELECT * FROM Product;


-- =========================
-- 5. ORDERS TABLE
-- =========================

CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

INSERT INTO Orders (customer_id, product_id, quantity)
VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 1),
(4, 4, 5),
(5, 5, 2),
(6, 6, 3),
(7, 7, 1);

SELECT * FROM Orders;
DESC Orders;

UPDATE Orders
SET quantity = 2
WHERE order_id = 1;

DELETE FROM Orders
WHERE order_id = 7;

SELECT * FROM Orders;


-- =========================
-- 6. REVIEW TABLE
-- =========================

CREATE TABLE Review (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    rating INT,
    comment VARCHAR(255),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

INSERT INTO Review (customer_id, product_id, rating, comment)
VALUES
(1, 1, 5, 'Excellent product'),
(2, 2, 4, 'Good'),
(3, 3, 3, 'Average'),
(4, 4, 5, 'Excellent'),
(5, 5, 2, 'Poor'),
(6, 6, 4, 'Nice'),
(7, 7, 5, 'Superb');

SELECT * FROM Review;
DESC Review;

UPDATE Review
SET rating = 5, comment = 'Very good product'
WHERE review_id = 1;

DELETE FROM Review
WHERE review_id = 7;

SELECT * FROM Review;