-- 1. DATABASE CREATION AND CONTEXT
----------------------------------------------------------------------
-- Use DROP DATABASE IF EXISTS for clean testing (modern best practice)
DROP DATABASE IF EXISTS db_payroll;
GO

CREATE DATABASE db_payroll;
GO

USE db_payroll;
GO

-- 2. TABLE CREATION WITH PRIMARY KEYS (PK)
----------------------------------------------------------------------

-- SALARY Table (Must be created first as it is referenced by JOB)
CREATE TABLE salary (
    salary_id INT IDENTITY(1,1) PRIMARY KEY, -- PK with auto-increment
    hourly_rate DECIMAL(4,2) NOT NULL      -- Use specific decimal precision
);

-- JOB Table (Must be created before EMPLOYEE as it is referenced)
CREATE TABLE job (
    job_id INT IDENTITY(1,1) PRIMARY KEY, -- PK with auto-increment
    job_title NVARCHAR(50) NOT NULL,
    job_dept NVARCHAR(50),
    salary_id INT NOT NULL                 -- This will be the FK to salary
);

-- EMPLOYEE Table
CREATE TABLE employee (
    employee_id INT IDENTITY(1,1) PRIMARY KEY, -- PK with auto-increment
    job_id INT NOT NULL,                     -- This will be the FK to job
    first_name NVARCHAR(50) NOT NULL,
    last_name NVARCHAR(50) NOT NULL,
    date_of_hire DATE
);

-- PAYROLL Table
CREATE TABLE payroll (
    payroll_date DATE NOT NULL,
    employee_id INT NOT NULL,              -- This will be the FK to employee
    hours_worked DECIMAL(4,2),
    -- Create a composite PK for uniqueness (one payroll entry per employee per day)
    PRIMARY KEY (payroll_date, employee_id) 
);
GO

-- 3. ADD FOREIGN KEY CONSTRAINTS
----------------------------------------------------------------------

-- Add FK to EMPLOYEE referencing JOB
ALTER TABLE employee
ADD CONSTRAINT FK_employee_job FOREIGN KEY (job_id) REFERENCES job(job_id);

-- Add FK to PAYROLL referencing EMPLOYEE
ALTER TABLE payroll
ADD CONSTRAINT FK_payroll_employee FOREIGN KEY (employee_id) REFERENCES employee(employee_id);

-- Add FK to JOB referencing SALARY
ALTER TABLE job
ADD CONSTRAINT FK_job_salary FOREIGN KEY (salary_id) REFERENCES salary(salary_id);
GO

-- 4. POPULATE DATA (Starting with tables that have no FK dependencies)
----------------------------------------------------------------------

-- Populate SALARY table (PK will auto-generate 1-5)
INSERT INTO salary (hourly_rate)
VALUES 
(19.50),
(20.00),
(20.50),
(21.00),
(21.50);

SELECT * FROM salary;
GO

-- Populate JOB table (job_id will auto-generate 1-5; salary_id must match 1-5)
INSERT INTO job (job_title, job_dept, salary_id)
VALUES
('AR Director', 'Accounting', 2), -- salary_id 2 ($20.00)
('Developer', 'IT', 3),           -- salary_id 3 ($20.50)
('CEO', 'Executive', 5),          -- salary_id 5 ($21.50)
('HR Manager', 'HR', 4),          -- salary_id 4 ($21.00)
('Sales Rep', 'Sales', 1);        -- salary_id 1 ($19.50)

SELECT * FROM job;
GO

-- Populate EMPLOYEE table (employee_id will auto-generate 1-5; job_id must match 1-5)
INSERT INTO employee (job_id, first_name, last_name, date_of_hire)
VALUES
(2, 'Sam', 'Smith', '2023-01-15'),     -- job_id 2 (Developer)
(3, 'Amanda', 'James', '2022-11-01'),  -- job_id 3 (CEO)
(1, 'David', 'McGrath', '2024-03-20'), -- job_id 1 (AR Director)
(4, 'Valerie', 'Ringer', '2021-08-01'),-- job_id 4 (HR Manager)
(5, 'Andrea', 'Antivilo', '2023-05-01');-- job_id 5 (Sales Rep)

SELECT * FROM employee;
GO

-- Populate PAYROLL table (employee_id must match 1-5)
INSERT INTO payroll (payroll_date, employee_id, hours_worked)
VALUES
('2023-06-07', 1, 40),
('2023-06-07', 2, 25),
('2023-06-07', 3, 38),
('2023-06-07', 4, 22),
('2023-06-07', 5, 34);

-- 5. FINAL QUERIES
----------------------------------------------------------------------

-- Query 1: View all joined data
SELECT *
FROM employee AS E
INNER JOIN payroll AS P ON E.employee_id = P.employee_id
INNER JOIN job AS J ON E.job_id = J.job_id
INNER JOIN salary AS S ON J.salary_id = S.salary_id;
GO

-- Query 2: Calculate total pay with clear aliases
SELECT
    E.first_name AS "First Name",
    E.last_name AS "Last Name",
    P.hours_worked AS Hours,
    S.hourly_rate AS Rate,
    (P.hours_worked * S.hourly_rate) AS "Total Pay"
FROM employee AS E
INNER JOIN payroll AS P ON E.employee_id = P.employee_id
INNER JOIN job AS J ON E.job_id = J.job_id
INNER JOIN salary AS S ON J.salary_id = S.salary_id
ORDER BY E.last_name;
GO