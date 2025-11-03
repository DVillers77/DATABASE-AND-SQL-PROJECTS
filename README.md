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

#### **Step 230: TUTORIAL PART 3 - UPDATE, REPLACE, and `tbl_persons`** 🔄

- **Date**: November 2, 2025
- **Objective**: Learn to permanently modify data, temporarily transform data,
  and create a third table for personnel information.
- **Outcome**:
  - Mastered the **`UPDATE`** command for permanent data changes, emphasizing
    the critical role of the **`WHERE`** clause for safety.
  - Used the **`REPLACE()`**, **`UPPER()`**, and **`COUNT()`** functions within
    `SELECT` statements for temporary data transformation and aggregation.
  - Applied advanced filtering with the **`BETWEEN`** operator and the
    **`LIKE`** operator using the **`%`** wildcard.
  - Created and populated the **`tbl_persons`** table, which includes fields for
    first name (`persons_fname`), last name (`persons_lname`), and contact
    number (`persons_contact`).

#### **Step 237: TUTORIAL PART 4 - DANGER COMMANDS & NEW TABLES** ⚠️

- **Date**: November 2, 2025
- **Objective**: Learn data deletion and table structure removal, and expand the
  database schema with four new tables.
- **Outcome**:
  - Mastered the **`DELETE`** and **`DROP TABLE`** commands, understanding the
    danger of omitting the `WHERE` clause with `DELETE`.
  - Used **`ORDER BY`** (`DESC`) to sort query results and applied the
    single-character wildcard (`_`) with the `LIKE` operator.
  - Created four new tables: **`tbl_order`**, **`tbl_care`**,
    **`tbl_nutrition`**, and **`tbl_habitat`**.
  - Learned to customize the auto-increment starting value using
    **`IDENTITY(start_value, increment)`**.
  - Successfully inserted data into **`tbl_order`** and **`tbl_care`**, noting
    that **`tbl_care`** requires a manual, unique primary key (`care_1`,
    `care_2`, etc.) because its ID is defined as `VARCHAR`.

#### **Step 239: TUTORIAL PART 5 - NORMALIZATION & FOREIGN KEYS** 🔑

- **Date**: November 3, 2025
- **Objective**: Complete the data insertion for remaining lookup tables and
  introduce the critical concept of **database normalization** by creating the
  central **`tbl_species`** table with Foreign Keys.
- **Outcome**:
  - Finalized population of **`tbl_nutrition`**, **`tbl_habitat`**, and
    **`tbl_specialist`**.
  - Understood **Normalization** as the process of breaking data into distinct,
    non-redundant tables.
  - Created the core **`tbl_species`** table, which connects all lookup tables.
  - Successfully defined **Foreign Key (FK)** constraints using the
    `FOREIGN KEY ... REFERENCES` syntax.
  - Implemented **`ON UPDATE CASCADE`** and **`ON DELETE CASCADE`** for data
    integrity across related tables, ensuring changes to a Primary Key update
    all associated Foreign Keys.
  - Populated **`tbl_species`** with initial animal data, using numerical IDs
    (Foreign Keys) to reference the corresponding lookup tables.
