CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(30)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    amount DECIMAL(10,2),
    order_date DATE,
    FOREIGN KEY(customer_id) REFERENCES Customers(customer_id)
);

