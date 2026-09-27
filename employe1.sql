CREATE DATABASE IF NOT EXISTS employee_db;
USE employee_db;

DROP TABLE IF EXISTS Employee;


CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    salary DECIMAL(10,2),
    city VARCHAR(30),
    joining_date DATE
);

INSERT INTO Employee VALUES
(101,'John','IT',60000,'Chennai','2022-01-15'),
(102,'David','HR',45000,'Bangalore','2021-03-10'),
(103,'Smith','IT',70000,'Chennai','2020-07-12'),
(104,'Mary','Finance',55000,'Mumbai','2023-01-20'),
(105,'James','HR',48000,'Delhi','2022-05-05'),
(106,'Linda','Finance',65000,'Mumbai','2021-08-18');


-- 1
SELECT department, COUNT(*) AS employee_count
FROM Employee
GROUP BY department;

-- 2
SELECT department, AVG(salary) AS average_salary
FROM Employee
GROUP BY department;

-- 3
SELECT department, COUNT(*) AS employee_count
FROM Employee
GROUP BY department
HAVING COUNT(*) > 1;

-- 4
SELECT department, MAX(salary) AS highest_salary
FROM Employee
GROUP BY department;

-- 5
SELECT department, MIN(salary) AS lowest_salary
FROM Employee
GROUP BY department;

-- 6
SELECT department, AVG(salary) AS average_salary
FROM Employee
GROUP BY department
HAVING AVG(salary) > 50000;

-- 7
SELECT department, SUM(salary) AS total_salary
FROM Employee
GROUP BY department;

-- 8
SELECT * FROM Employee
ORDER BY salary DESC;

-- 9
SELECT * FROM Employee
ORDER BY department, salary DESC;

-- 10
SELECT city, COUNT(*) AS employee_count
FROM Employee
GROUP BY city
HAVING COUNT(*) > 1;

-- 11
SELECT city, SUM(salary) AS total_salary
FROM Employee
GROUP BY city;

-- 12
SELECT department, SUM(salary) AS total_salary
FROM Employee
GROUP BY department
ORDER BY total_salary DESC;

-- 13
SELECT department, COUNT(*) AS employee_count
FROM Employee
WHERE salary > 50000
GROUP BY department;

-- 14
SELECT department,
       MAX(salary) - MIN(salary) AS salary_difference
FROM Employee
GROUP BY department;

-- 15
SELECT * FROM Employee
ORDER BY salary DESC
LIMIT 3;