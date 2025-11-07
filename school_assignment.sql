-- *********************************************************************************
-- Step 331: SCHOOL ASSIGNMENT - Database, Tables, Data, and Queries
-- *********************************************************************************

-- 1. Create a "School" database (Idempotent Cleanup)
----------------------------------------------------------------------
USE master;
GO
DROP DATABASE IF EXISTS db_school;
GO
CREATE DATABASE db_school;
GO
USE db_school;
GO

-- 2. 3. 4. Create Tables with Primary Keys (PK)
----------------------------------------------------------------------

-- 2. Classes Table
CREATE TABLE Classes (
    Class_ID INT IDENTITY(1,1) PRIMARY KEY, -- PK with auto-increment
    Class_Name NVARCHAR(100) NOT NULL
);

-- 3. Students Table
CREATE TABLE Students (
    Student_ID INT IDENTITY(1,1) PRIMARY KEY, -- PK with auto-increment
    Student_Name NVARCHAR(100) NOT NULL,
    -- Foreign Key columns added here, allowing NULL initially as requested
    Class_ID INT NULL, 
    Instructor_ID INT NULL
);

-- 4. Instructors Table
CREATE TABLE Instructors (
    Instructor_ID INT IDENTITY(1,1) PRIMARY KEY, -- PK with auto-increment
    Instructor_Name NVARCHAR(100) NOT NULL
);
GO

-- 5. Add Foreign Key Constraints to the Students table
----------------------------------------------------------------------
-- Add FK referencing Classes table
ALTER TABLE Students
ADD CONSTRAINT FK_Students_Classes FOREIGN KEY (Class_ID)
REFERENCES Classes(Class_ID);

-- Add FK referencing Instructors table
ALTER TABLE Students
ADD CONSTRAINT FK_Students_Instructors FOREIGN KEY (Instructor_ID)
REFERENCES Instructors(Instructor_ID);
GO

-- 6., 7., 8. Populate Tables
----------------------------------------------------------------------

-- 6. Populate Classes (IDs will be 1 and 2)
INSERT INTO Classes (Class_Name)
VALUES 
('Software Developer Boot Camp'),
('C# Boot Camp');

-- 8. Populate Instructors (IDs will be 1 and 2)
INSERT INTO Instructors (Instructor_Name)
VALUES 
('Dr. Smith'),
('Prof. Jones');

-- 7. Populate Students (IDs will be 1 through 6)
INSERT INTO Students (Student_Name)
VALUES 
('Alice Johnson'),
('Bob Williams'),
('Charlie Brown'),
('Dana Evans'),
('Eve Miller'),
('Frank Harris');
GO

-- 9. Assign Class_ID Foreign Key (Half to Class 1, half to Class 2)
----------------------------------------------------------------------
-- Assign Students 1, 2, 3 (first half) to Class_ID 1
UPDATE Students
SET Class_ID = 1
WHERE Student_ID IN (1, 2, 3);

-- Assign Students 4, 5, 6 (second half) to Class_ID 2
UPDATE Students
SET Class_ID = 2
WHERE Student_ID IN (4, 5, 6);
GO

-- 10. Assign Instructor_ID Foreign Key (Half to Instructor 1, half to Instructor 2)
----------------------------------------------------------------------
-- Assign Students 1, 2, 4 (three students) to Instructor_ID 1
UPDATE Students
SET Instructor_ID = 1
WHERE Student_ID IN (1, 2, 4);

-- Assign Students 3, 5, 6 (the other three students) to Instructor_ID 2
UPDATE Students
SET Instructor_ID = 2
WHERE Student_ID IN (3, 5, 6);
GO


-- 11. Run a query to display all Instructor names
----------------------------------------------------------------------
SELECT Instructor_Name
FROM Instructors;

-- 12. Run a query to display all student names in alphabetical order
----------------------------------------------------------------------
SELECT Student_Name
FROM Students
ORDER BY Student_Name ASC;

-- 13. Run a query that displays all classes, with the students and Instructors assigned to each
----------------------------------------------------------------------
SELECT
    C.Class_Name,
    S.Student_Name,
    I.Instructor_Name
FROM Classes AS C
-- Join Classes to Students (via Class_ID)
INNER JOIN Students AS S ON C.Class_ID = S.Class_ID
-- Join Students to Instructors (via Instructor_ID)
INNER JOIN Instructors AS I ON S.Instructor_ID = I.Instructor_ID
ORDER BY C.Class_Name, S.Student_Name;
GO