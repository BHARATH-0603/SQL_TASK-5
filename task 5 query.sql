
CREATE TABLE customer (
  customer_id INT PRIMARY KEY,
  name VARCHAR(100),
  email VARCHAR(100),
  city VARCHAR(50)
);

INSERT INTO Customer (customer_id, name, email, city) VALUES
(1, 'Bharath Kumar', 'bharath@gmail.com', 'Chennai'),
(2, 'Aarav Patel', 'aaravp@yahoo.com', 'Coimbatore'),
(3, 'Sneha Reddy', 'sneha.r@gmail.com', 'Hyderabad'),
(4, 'Kiran Das', 'kiran.das@gmail.com', 'Delhi'),
(5, 'Lakshmi Menon', 'lakshmi.menon@outlook.com', 'Bangalore'),
(6, 'Ravi Teja', 'ravi@gmail.com', 'Mumbai');

select * from customer;
select * from orderss;


CREATE TABLE Orderss (
  order_id INT PRIMARY KEY,
  customer_id INT,
  product VARCHAR(50),
  order_date DATE,
  FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

INSERT INTO Orderss (order_id, customer_id, product, order_date) VALUES
(101, 1, 'Bluetooth Headset', '2024-03-21'),
(102, 2, 'Wireless Mouse', '2024-03-22'),
(103, 2, 'Keyboard', '2024-03-25'),
(104, 3, 'Laptop Stand', '2024-04-01'),
(105, 1, 'Webcam', '2024-04-05'),
(106, 6, 'Smartwatch', '2024-04-06'); 


-- INNER JOIN – matching rows in both tables
SELECT c.name, o.product, o.order_date
FROM Customer c
INNER JOIN Orderss o ON c.customer_id = o.customer_id;

-- LEFT JOIN – all customers, even if they didn't order
SELECT c.name, o.product
FROM Customer c
LEFT JOIN Orderss o ON c.customer_id = o.customer_id;

-- RIGHT JOIN – all orders, even if customer not found
SELECT c.name, o.product
FROM Customer c
RIGHT JOIN Orderss o ON c.customer_id = o.customer_id;

--  Customers with No Orders
SELECT c.name
FROM Customer c
LEFT JOIN Orderss o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

--  Number of Orders Per CustomerSELECT c.name, COUNT(o.order_id) AS order_count
SELECT c.name, COUNT(o.order_id) AS order_count
FROM Customer c
LEFT JOIN Orderss o ON c.customer_id = o.customer_id
GROUP BY c.name;

-- Latest Order Per Customer
SELECT c.name, MAX(o.order_date) AS last_order
FROM Customer c
LEFT JOIN Orderss o ON c.customer_id = o.customer_id
GROUP BY c.name;

-- Join More Than 2 Tables Example (add Payments)
SELECT c.name, o.product, p.amount
FROM Customer c
JOIN Orderss o ON c.customer_id = o.customer_id
JOIN Payments p ON o.order_id = p.order_id;



