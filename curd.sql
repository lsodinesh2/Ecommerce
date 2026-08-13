-- CREATE DATABASE
CREATE DATABASE customer_db;
USE customer_db;


-- CREATE CUSTOMER TABLE
CREATE TABLE customer (
    cust_id INT PRIMARY KEY,
    cust_name VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    address VARCHAR(100),
    district VARCHAR(50),
    customer_type VARCHAR(20)
);


-- INSERT 15 RECORDS
INSERT INTO customer VALUES
(1, 'Arun', 25, 'Male', 'Erode Main Road', 'Erode', 'Premier'),
(2, 'Kumar', 45, 'Male', 'Perundurai', 'Erode', 'Normal'),
(3, 'Priya', 28, 'Female', 'Gandhi Nagar', 'Erode', 'Premier'),
(4, 'Divya', 35, 'Female', 'Avinashi Road', 'Thiruppur', 'Normal'),
(5, 'Ravi', 52, 'Male', 'Tiruchengode Road', 'Namakkal', 'Premier'),
(6, 'Meena', 31, 'Female', 'Kangeyam Road', 'Thiruppur', 'Normal'),
(7, 'Suresh', 67, 'Male', 'Bhavani Road', 'Erode', 'Normal'),
(8, 'Kavitha', 42, 'Female', 'Palladam Road', 'Thiruppur', 'Premier'),
(9, 'Vijay', 29, 'Male', 'Gobichettipalayam', 'Erode', 'Premier'),
(10, 'Anitha', 38, 'Female', 'Dharapuram Road', 'Thiruppur', 'Normal'),
(11, 'Manoj', 85, 'Male', 'Mettur Road', 'Salem', 'Normal'),
(12, 'Lakshmi', 90, 'Female', 'Salem Main Road', 'Salem', 'Premier'),
(13, 'Prakash', 56, 'Male', 'Sathy Road', 'Erode', 'Normal'),
(14, 'Swathi', 24, 'Female', 'Ukkadam', 'Coimbatore', 'Normal'),
(15, 'Raj', 75, 'Male', 'Perundurai Road', 'Erode', 'Premier');


-- READ / SELECT

-- 1. Select customers from Erode
SELECT * FROM customer
WHERE district = 'Erode';


-- 2. Select Premier customers
SELECT * FROM customer
WHERE customer_type = 'Premier';


-- 3. Select Male customers from Erode
SELECT * FROM customer
WHERE gender = 'Male'
AND district = 'Erode';


-- 4. Select Female + Thiruppur + Normal customers
SELECT * FROM customer
WHERE gender = 'Female'
AND district = 'Thiruppur'
AND customer_type = 'Normal';


-- UPDATE

-- 5. Update customer age to 34 where cust_id = 10
UPDATE customer
SET age = 34
WHERE cust_id = 10;


-- 6. Update customer address
UPDATE customer
SET address = 'New Address'
WHERE cust_id = 5;


-- 7. Update customer type
UPDATE customer
SET customer_type = 'Premier'
WHERE cust_id = 4;


-- DELETE

-- 8. Delete customers whose age is above 80
DELETE FROM customer
WHERE age > 80;


-- 9. Delete customer by specific ID
DELETE FROM customer
WHERE cust_id = 15;


-- 10. Delete below-average-age customers
DELETE FROM customer
WHERE age < (SELECT AVG(age) FROM customer);