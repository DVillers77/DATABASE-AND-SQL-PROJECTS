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

#### **Step 241: TUTORIAL PART 6 - INNER JOIN AND DATA RETRIEVAL** ⚙️

- **Date**: November 3, 2025
- **Objective**: Learn to use the **`INNER JOIN`** statement to combine data
  from the main table and all lookup tables to retrieve descriptive, non-numeric
  information.
- **Outcome**:
  - Demonstrated that **`SELECT *`** is inadequate for normalized data.
  - Mastered the **`INNER JOIN`** syntax, using the **Foreign Key -> Primary
    Key** relationship to merge tables.
  - Successfully wrote a complex query using seven separate **Table Aliases
    (A1...A7)** and join conditions to pull all related data (Animalia type,
    Class type, Nutrition type, etc.) for a specific species.
  - Created a query to retrieve supplementary fields (like `nutrition_cost` and
    `habitat_cost`) from lookup tables that are not stored in the main species
    table.
  - Corrected the `tbl_nutrition` data value for ID 2200 from 'replace the
    straw' to **'raw fish'** and updated the 'brown bear' Foreign Key link to
    match the instructor's expected result.

#### **Step 242: SQL JOIN ASSIGNMENT** 🤝

- **Date**: November 3, 2025
- **Objective**: Practice the fundamental **`INNER JOIN`** operation by linking
  two key tables in the database.
- **Outcome**:
  - Successfully executed an `INNER JOIN` between **`tbl_nutrition`** (Primary
    Key: `nutrition_id`) and **`tbl_species`** (Foreign Key:
    `species_nutrition`).
  - Confirmed the correct syntax for the join condition:
    `ON tbl_species.species_nutrition = tbl_nutrition.nutrition_id`.
  - The resulting query output a comprehensive table combining columns from both
    tables, successfully demonstrating the functionality and integrity of the
    Foreign Key constraints established in the previous tutorials.

#### **Step 247: TUTORIAL PART 7 - T-SQL FUNDAMENTALS** 🧠

- **Date**: November 4, 2025
- **Objective**: Transition from pure SQL commands to **Transact-SQL (T-SQL)**,
  focusing on logic, scripting, and variables.
- **Outcome**:
  - Understood the difference between **Implicit** (legacy
    `FROM table A, table B WHERE` syntax) and **Explicit** (modern
    `INNER JOIN ... ON` syntax) JOINs, confirming **Explicit** is best practice.
  - Began working with T-SQL, Microsoft's proprietary extension to SQL.
  - Learned to use the **`PRINT`** command to output messages.
  - Mastered **T-SQL variables** by using `DECLARE @variable DATATYPE` and
    `SET @variable = value`.
  - Practiced **string concatenation** (`+` operator) and the necessity of the
    **`CONVERT`** function to temporarily change numeric data types (`INT`) into
    strings (`VARCHAR`) for concatenation.
  - The script now includes robust checks using **`IF EXISTS`** for reliable
    table dropping before reconstruction.

#### **Step 247: TUTORIAL PART 8 - T-SQL LOGIC AND FLOW CONTROL** ⚙️

- **Date**: November 4, 2025
- **Objective**: Implement flow control (logic) and advanced formatting
  techniques in T-SQL.
- **Outcome**:
  - Mastered using **T-SQL Operators** for comparisons (`<`, `<=`, `!=`, `>`,
    `>=`) and combining conditions (`AND`, `OR`).
  - Successfully implemented **Conditional Flow Control** using the
    `IF...ELSE IF...ELSE` structure to execute blocks of code (`BEGIN...END`)
    based on variable values.
  - Learned to use **ASCII character functions** (`CHAR()`) for output
    formatting:
    - **`CHAR(13)`**: Inserts a **Carriage Return** (line break).
    - **`CHAR(9)`**: Inserts a **Tab** space for indentation.
  - Confirmed that the `+` operator performs **numeric addition** when used
    between two integer variables, reinforcing the need for the `CONVERT`
    function when combining numbers with strings.
  - Added **multi-line block comments** (`/* ... */`) for documenting complex
    script sections.

#### **Step 251: TUTORIAL PART 9 - INTRODUCING STORED PROCEDURES** 💾

- **Date**: November 5, 2025
- **Objective**: Refactor database creation and core application queries into
  reusable T-SQL **Stored Procedures** (SP).
- **Outcome**:
  - Consolidated the entire schema into **`createZooDB`** and the primary query
    into **`get_animal_info`**.
  - **Resolved all Compilation and Dependency Errors:**
    - Implemented **idempotency checks** (`IF EXISTS...DROP PROCEDURE`) to
      prevent the `Msg 2714` error.
    - Corrected the **cascading foreign key failure** by ensuring the tables
      were created in the proper parent-to-child order.
    - Fixed the persistent **"Invalid object name" error** (`Msg 208`) in
      `get_animal_info` by adding the explicit schema prefix **`dbo.`** to all
      table references.
  - **Cleaned Data Integrity:**
    - Corrected the erroneous data directly at the point of insertion inside
      `createZooDB`.
    - Fixed the `tbl_nutrition` entry for `nutrition_id 2200` to be **'raw
      fish'** (instead of the typo 'replace the straw').
    - Ensured the 'brown bear' record correctly links to `nutrition_id 2200`.
