CREATE DATABASE IF NOT EXISTS banking;
USE banking;

DROP TABLE IF EXISTS accounts;
DROP TABLE IF EXISTS customers;


CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE accounts (
    account_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    account_type VARCHAR(20),
    balance DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO customers (name, city) VALUES
('Janani','Chennai'),
('Arun','Coimbatore'),
('Priya','Madurai'),
('Karthik','Salem');

INSERT INTO accounts (customer_id, account_type, balance) VALUES
(1,'Savings',50000),
(1,'Current',20000),
(2,'Savings',30000),
(3,'Savings',15000),
(4,'Current',40000);


-- 1
SELECT * FROM accounts
WHERE balance > 20000;

-- 2
SELECT * FROM customers
WHERE city = 'Chennai';

-- 3
SELECT * FROM accounts
WHERE balance BETWEEN 20000 AND 50000;

-- 4
SELECT * FROM customers
WHERE name LIKE 'J%';

-- 5
SELECT * FROM accounts
WHERE account_type IN ('Savings','Current');

-- 6
SELECT * FROM accounts
WHERE account_type <> 'Savings';

-- 7
SELECT * FROM customers
WHERE name LIKE '%a%';

-- 8
SELECT * FROM accounts
WHERE balance <= 30000;

-- 9
SELECT * FROM customers
WHERE city <> 'Madurai';

-- 10
SELECT * FROM accounts
WHERE balance NOT BETWEEN 10000 AND 40000;

-- 11
SELECT * FROM customers
WHERE name LIKE '%i';

-- 12
SELECT * FROM accounts
WHERE balance = 50000;

-- 13
SELECT * FROM customers
WHERE city IN ('Chennai','Salem');

-- 14
SELECT * FROM accounts
WHERE balance > 10000 AND balance < 40000;

-- 15
SELECT * FROM accounts
WHERE account_type NOT IN ('Current');

-- 16
SELECT * FROM accounts
ORDER BY balance DESC;

-- 17
SELECT * FROM customers
ORDER BY name ASC;

-- 18
SELECT * FROM accounts
ORDER BY account_type ASC, balance DESC;

-- 19
SELECT SUM(balance) AS total_balance
FROM accounts;

-- 20
SELECT AVG(balance) AS average_balance
FROM accounts;

-- 21
SELECT MAX(balance) AS maximum_balance
FROM accounts;

-- 22
SELECT MIN(balance) AS minimum_balance
FROM accounts;

-- 23
SELECT COUNT(*) AS total_customers
FROM customers;

-- 24
SELECT account_type, SUM(balance) AS total_balance
FROM accounts
GROUP BY account_type;

-- 25
SELECT account_type, AVG(balance) AS average_balance
FROM accounts
GROUP BY account_type;

-- 26
SELECT account_type, AVG(balance) AS average_balance
FROM accounts
GROUP BY account_type
HAVING AVG(balance) > 20000;

-- 27
SELECT customer_id, COUNT(*) AS account_count
FROM accounts
GROUP BY customer_id;

-- 28
SELECT customer_id, COUNT(*) AS account_count
FROM accounts
GROUP BY customer_id
HAVING COUNT(*) > 1;

-- 29
SELECT c.name, a.balance
FROM customers c
JOIN accounts a
ON c.customer_id = a.customer_id;

-- 30
SELECT c.name, a.account_type, a.balance
FROM customers c
LEFT JOIN accounts a
ON c.customer_id = a.customer_id;

-- 31
SELECT a.*, c.name, c.city
FROM accounts a
JOIN customers c
ON a.customer_id = c.customer_id;

-- 32
SELECT c.name, a.account_type
FROM customers c
JOIN accounts a
ON c.customer_id = a.customer_id
WHERE a.balance > 20000;

-- 33
SELECT c.name, SUM(a.balance) AS total_balance
FROM customers c
JOIN accounts a
ON c.customer_id = a.customer_id
GROUP BY c.customer_id, c.name;

-- 34
SELECT c.name, a.balance
FROM customers c
JOIN accounts a
ON c.customer_id = a.customer_id
ORDER BY a.balance DESC;

-- 35
SELECT c.city, COUNT(a.account_id) AS account_count
FROM customers c
JOIN accounts a
ON c.customer_id = a.customer_id
GROUP BY c.city;

-- 36
SELECT *
FROM accounts
WHERE balance > (
    SELECT AVG(balance)
    FROM accounts
);

-- 37
SELECT *
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM accounts
);

-- 38
SELECT *
FROM customers
WHERE customer_id NOT IN (
    SELECT customer_id
    FROM accounts
);

-- 39
SELECT *
FROM accounts
WHERE balance = (
    SELECT MAX(balance)
    FROM accounts
);

-- 40
SELECT customer_id, SUM(balance) AS total_balance
FROM accounts
GROUP BY customer_id
HAVING SUM(balance) > 40000;