-- Connect to the payroll database
USE db_payroll; 
GO

-- 0. IDEMPOTENT TABLE CLEANUP (Resolves the 'object already exists' errors)
DROP TABLE IF EXISTS payroll;
DROP TABLE IF EXISTS deductions;
DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS job;
DROP TABLE IF EXISTS salary;
GO

-- 1. TABLE CREATION WITH PRIMARY KEYS (PK)
----------------------------------------------------------------------

-- SALARY Table
CREATE TABLE salary (
    salary_id INT IDENTITY(1,1) PRIMARY KEY,
    hourly_rate DECIMAL(4,2) NOT NULL 
);

-- JOB Table
CREATE TABLE job (
    job_id INT IDENTITY(1,1) PRIMARY KEY,
    job_title NVARCHAR(50) NOT NULL,
    job_dept NVARCHAR(50),
    salary_id INT NOT NULL
);

-- EMPLOYEE Table
CREATE TABLE employee (
    employee_id INT IDENTITY(1,1) PRIMARY KEY,
    job_id INT NOT NULL, 
    first_name NVARCHAR(50) NOT NULL,
    last_name NVARCHAR(50) NOT NULL,
    date_of_hire DATE 
);

-- PAYROLL Table
CREATE TABLE payroll (
    payroll_date DATE NOT NULL,
    employee_id INT NOT NULL,
    hours_worked DECIMAL(4,2),
    PRIMARY KEY (payroll_date, employee_id) 
);
GO

-- 2. ADD FOREIGN KEY CONSTRAINTS
----------------------------------------------------------------------
ALTER TABLE employee
ADD CONSTRAINT FK_employee_job FOREIGN KEY (job_id) REFERENCES job(job_id);

ALTER TABLE payroll
ADD CONSTRAINT FK_payroll_employee FOREIGN KEY (employee_id) REFERENCES employee(employee_id);

ALTER TABLE job
ADD CONSTRAINT FK_job_salary FOREIGN KEY (salary_id) REFERENCES salary(salary_id);
GO

-- 3. POPULATE DATA
----------------------------------------------------------------------
INSERT INTO salary (hourly_rate)
VALUES (19.50), (20.00), (20.50), (21.00), (21.50);

INSERT INTO job (job_title, job_dept, salary_id)
VALUES
('AR Director', 'Accounting', 2), ('Developer', 'IT', 3), ('CEO', 'Executive', 5), 
('HR Manager', 'HR', 4), ('Sales Rep', 'Sales', 1);

INSERT INTO employee (job_id, first_name, last_name, date_of_hire)
VALUES
(2, 'Sam', 'Smith', '2023-01-15'), (3, 'Amanda', 'James', '2022-11-01'), 
(1, 'David', 'McGrath', '2024-03-20'), (4, 'Valerie', 'Ringer', '2021-08-01'), 
(5, 'Andrea', 'Antivilo', '2023-05-01');

-- CHALLENGE TABLE & DATA
CREATE TABLE deductions (
    deduction_id INT IDENTITY(1,1) PRIMARY KEY,
    employee_id INT NOT NULL,
    deduction_type NVARCHAR(50) NOT NULL,
    deduction_percentage DECIMAL(4,3) NOT NULL 
);

ALTER TABLE deductions
ADD CONSTRAINT FK_deductions_employee FOREIGN KEY (employee_id) REFERENCES employee(employee_id);

INSERT INTO deductions (employee_id, deduction_type, deduction_percentage)
VALUES 
(1, 'Federal Tax', 0.150), (1, 'Health Insurance', 0.030), (2, 'Federal Tax', 0.180), 
(3, 'Federal Tax', 0.200), (4, 'Federal Tax', 0.150), (5, 'Federal Tax', 0.120);

INSERT INTO payroll (payroll_date, employee_id, hours_worked)
VALUES
('2023-06-07', 1, 40), ('2023-06-07', 2, 25), ('2023-06-07', 3, 38), 
('2023-06-07', 4, 22), ('2023-06-07', 5, 34);
GO

-- 4. FINAL NET PAY CALCULATION QUERY (Using CAST AS MONEY fix)
----------------------------------------------------------------------
SELECT
    E.first_name AS "First Name",
    E.last_name AS "Last Name",
    CAST((P.hours_worked * S.hourly_rate) AS MONEY) AS "Gross Pay",
    CAST(SUM(D.deduction_percentage * (P.hours_worked * S.hourly_rate)) AS MONEY) AS "Total Deductions",
    CAST((P.hours_worked * S.hourly_rate) - SUM(D.deduction_percentage * (P.hours_worked * S.hourly_rate)) AS MONEY) AS "Net Pay"
FROM employee AS E
INNER JOIN payroll AS P ON E.employee_id = P.employee_id
INNER JOIN job AS J ON E.job_id = J.job_id
INNER JOIN salary AS S ON J.salary_id = S.salary_id
INNER JOIN deductions AS D ON E.employee_id = D.employee_id
GROUP BY 
    E.employee_id, E.first_name, E.last_name, P.hours_worked, S.hourly_rate
ORDER BY E.last_name;
GO