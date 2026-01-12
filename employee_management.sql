-- Employee Management & Reporting System

CREATE DATABASE company_db;
USE company_db;

CREATE TABLE department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT,
    salary DECIMAL(10,2),
    hire_date DATE,
    FOREIGN KEY (dept_id) REFERENCES department(dept_id)
);

INSERT INTO department VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance'),
(4, 'Marketing');

INSERT INTO employee VALUES
(101, 'Ravi', 2, 60000, '2022-03-15'),
(102, 'Anita', 1, 45000, '2021-07-10'),
(103, 'Kiran', 3, 75000, '2020-01-25'),
(104, 'Suman', 2, 55000, '2023-06-01'),
(105, 'Neha', 4, 50000, '2022-11-20');

-- Basic Queries
SELECT * FROM employee;

SELECT emp_name, salary
FROM employee
WHERE salary > 50000;

-- Join Query
SELECT e.emp_name, d.dept_name, e.salary
FROM employee e
JOIN department d
ON e.dept_id = d.dept_id;

-- Aggregate Query
SELECT d.dept_name, AVG(e.salary) AS avg_salary
FROM employee e
JOIN department d
ON e.dept_id = d.dept_id
GROUP BY d.dept_name;

-- Subquery
SELECT emp_name, salary
FROM employee
WHERE salary = (SELECT MAX(salary) FROM employee);

-- View
CREATE VIEW employee_report AS
SELECT e.emp_name, d.dept_name, e.salary
FROM employee e
JOIN department d
ON e.dept_id = d.dept_id;

SELECT * FROM employee_report;
