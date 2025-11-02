# DATABASE-AND-SQL-PROJECTS

This repository serves as a portfolio for all coding projects and assignments
completed during the **SQL course** from The Tech Academy's UI/UX Design
program. The projects within this repository highlight a progression of skills
and a mastery of core database concepts.

---

### Assignment Log

#### **Step 217-218: SQL Server Express and SSMS Installation**

- **Date**: November 1, 2025
- **Objective**: Successfully install and configure the necessary local database
  environment, including the **SQL Server Express** database engine (64-bit) and
  the **SQL Server Management Studio (SSMS)** client tool (version 21 or later).
- **Outcome**: The database environment was successfully set up. Connection to
  the local instance was verified after resolving the initial "network path not
  found" error by using the Server Name shorthand `.\SQLEXPRESS` and enabling
  the "Trust server certificate" option. This foundational setup allows for
  direct execution of SQL queries and database management for subsequent
  lessons.

#### **Step 224: TUTORIAL PART 1 - DATABASE & TABLE CREATION** 🏗️

- **Date**: November 1, 2025
- **Objective**: Follow the first video tutorial to understand basic T-SQL
  syntax and create the foundational database and initial table for the Zoo
  project.
- **Outcome**:
  - Executed the T-SQL command **`CREATE DATABASE DB_Zoo;`** to establish the
    project environment.
  - Used the **`USE DB_Zoo;`** command to set the correct database context.
  - Created the **`Animalia`** table with two columns:
    - **`ID`**: Set as the **`PRIMARY KEY`** and **`IDENTITY(1,1)`** for
      auto-incrementing unique identification.
    - **`Animalia_Type`**: Set as **`VARCHAR(50) NOT NULL`** to store the animal
      classification type.

#### **Step 226: TUTORIAL PART 2 - INSERT INTO & `class` TABLE** ➕

- **Date**: November 2, 2025
- **Objective**: Learn the **`INSERT INTO`** statement to populate tables with
  data and define a second classification table.
- **Outcome**:
  - Mastered the syntax for adding rows using
    `INSERT INTO table (column) VALUES (value)`.
  - Successfully inserted initial values ('Vertebrae', 'Invertebrae') into the
    **`Animalia`** table.
  - Created the **`class`** table, defining a primary key **`class_ID`** that
    uses **`IDENTITY(100,1)`** to start auto-incrementing at 100.
  - Populated the **`class`** table with multiple classification types (Bird,
    Mammal, Fish, etc.).
