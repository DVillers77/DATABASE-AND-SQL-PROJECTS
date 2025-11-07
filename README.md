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

#### **Step 268: TUTORIAL PART 10 - AGGREGATE FUNCTIONS AND EXCEPTION HANDLING** 🛡️

- **Date**: November 6, 2025
- **Objective**: Implement professional-grade error handling using the
  `TRY/CATCH` block and finalize practice with Aggregate Functions (`COUNT`,
  `AVG`, `SUM`).
- **Outcome**:
  - **Exception Handling**: The `get_animal_info` stored procedure was
    refactored with a **`TRY...CATCH`** structure to handle non-existent animal
    names.
  - **Modernized Error Control**: Replaced the legacy **`RAISERROR`** command
    with the modern **`THROW`** command (error number 50001) for explicit,
    predictable control flow and cleaner error reporting.
  - **Data Validation**: Used the **`COUNT()`** aggregate function within an
    `IF` condition to check for zero results before attempting the main query.
  - **Aggregate Functions**: Practiced using `COUNT()`, `SUM()`, and `AVG()`
    with the **`GROUP BY`** clause to return summarized data, requiring the
    `ORDER BY` clause to reference the full function expression instead of the
    column alias due to editor constraints.

#### **Step 273: ZOO DATABASE ASSIGNMENT 1 (SELECT Statement)** 📝

- **Date**: November 6, 2025
- **Objective**: Compose a fundamental `SELECT` statement to return all data
  from the specified table (`tbl_habitat`).
- **Outcome**: Successfully retrieved all rows and columns using the core SQL
  query: `SELECT * FROM tbl_habitat;`

#### **Step 274: ZOO DATABASE ASSIGNMENT 2 (WHERE Clause)** 📝

- **Date**: November 6, 2025
- **Objective**: Compose a `SELECT` statement using the `WHERE` clause to filter
  data based on a specific numeric value.
- **Outcome**: Successfully retrieved the `species_name` entries from
  `tbl_species` where the `species_order` column value is equal to 3.

#### **Step 275: ZOO DATABASE ASSIGNMENT 3 (WHERE Clause with Comparison)** 📝

- **Date**: November 6, 2025
- **Objective**: Compose a `SELECT` statement using the `WHERE` clause with a
  comparison operator (`<=`) to filter numeric data.
- **Outcome**: Successfully retrieved the `nutrition_type` entries from
  `tbl_nutrition` where the `nutrition_cost` is less than or equal to 600.00.

#### **Step 276: ZOO DATABASE ASSIGNMENT 4 (INNER JOIN and BETWEEN)** 📝

- **Date**: November 6, 2025
- **Objective**: Compose a `SELECT` statement that requires an `INNER JOIN`
  across two tables and uses the `BETWEEN` operator for range filtering.
- **Outcome**: Successfully retrieved `species_names` by joining `tbl_species`
  and `tbl_nutrition` on `species_nutrition` and filtering for records where
  `nutrition_id` is between 2202 and 2206.

#### **Step 277: ZOO DATABASE ASSIGNMENT 5 (INNER JOIN and ALIASES)** 📝

- **Date**: November 6, 2025
- **Objective**: Compose a `SELECT` statement that joins two tables and uses
  column aliases to rename the output columns for improved readability.
- **Outcome**: Successfully retrieved `species_name` and `nutrition_type` by
  joining `tbl_species` and `tbl_nutrition`, aliasing the output columns as
  "Species Name: " and "Nutrition Type: ".

#### **Step 278: ZOO DATABASE ASSIGNMENT 6 (Multi-Table INNER JOIN)** 📝

- **Date**: November 6, 2025
- **Objective**: Compose a `SELECT` statement requiring two sequential
  `INNER JOIN` operations across three tables (`tbl_species`, `tbl_care`,
  `tbl_specialist`) to retrieve specific contact information.
- **Outcome**: Successfully retrieved the first name, last name, and contact
  number for the specialist who provides care for the 'penguin' species.

#### **Step 279: ZOO DATABASE ASSIGNMENT 7 (Create Custom Database)** 🏗️

- **Date**: November 6, 2025
- **Objective**: Complete the final, open-ended assignment by creating a custom
  database with two linked tables and writing a query against it.
- **Best Practice Note**: Used **snake_case** for all SQL object naming
  (tables/columns) to adhere to industry best practices, as kebab-case can cause
  syntax errors in SQL.
- **Outcome**: Created the `music_library_db` with `tbl_artist` (Parent, PK) and
  `tbl_album` (Child, PK + FK). Inserted data and created a multi-table
  `INNER JOIN` query to retrieve data using the common `artist_id` attribute.

#### **Step 301: INSTALLING ADVENTUREWORKS (Implied Assignment)** 🏗️

- **Date**: November 7, 2025
- **Objective**: Follow along with the instructor to install the Microsoft
  sample database, AdventureWorks, for use in future assignments.
- **Outcome**: Downloaded the `AdventureWorks2017.bak` file, moved it to the SQL
  Server backup directory (`MSSQL\Backup`), and successfully used the **Restore
  Database** function in SSMS to install the database locally. The database is
  now accessible under the `Databases` node.

#### **Step 309: STORED PROCEDURE ASSIGNMENT** 💾

- **Date**: November 7, 2025
- **Objective**: Perform a full lifecycle exercise of a basic stored procedure
  within the AdventureWorks database.
- **Outcome**: Successfully created, executed, and viewed the
  `dbo.uspGetAddress` stored procedure, which returned data from the
  `Person.Address` table. The procedure was then deleted using the
  `DROP PROCEDURE IF EXISTS` command.

#### **Step 312: SCHEMA ASSIGNMENT** 🛡️

- **Date**: November 7, 2025
- **Objective**: Practice creating and deleting a new database schema to
  understand how objects can be compartmentalized and permissions managed.
- **Outcome**: Successfully created the `ACADEMY_HR` schema, authorized it to
  `dbo`, located it in the Object Explorer, and then deleted it using the
  `DROP SCHEMA IF EXISTS` command.

#### **Step 316: SSMS ASSIGNMENT** 🛑

- **Date**: November 7, 2025
- **Objective**: Practice implementing the `TRY/CATCH` block for error handling
  by intentionally generating a "divide by zero" exception.
- **Outcome**: Successfully executed the code, which skipped the
  error-generating `TRY` block and returned the error details (number,
  procedure, and message) using built-in error functions in the `CATCH` block.

#### **Step 319: STORED PROCEDURE ASSIGNMENT** ⚙️

- **Date**: November 7, 2025
- **Objective**: Create a stored procedure that uses an input parameter to
  filter data dynamically, demonstrating the use of variables and the `LIKE`
  operator with a wildcard.
- **Outcome**: Created and executed the stored procedure
  `Person.Address_GetByCityPartial` which accepts the `@City` parameter, using
  the modern naming convention (omitting `usp_`), and successfully filtered the
  `Person.Address` table for cities starting with the argument 'New'.

#### **Step 320: PASSING PARAMETERS ASSIGNMENT** 📤

- **Date**: November 7, 2025
- **Objective**: Demonstrate stored procedure functionality with multiple input
  parameters and practice the use of `OUTPUT` parameters to return single
  values.
- **Outcome**:
  1.  Created a stored procedure (`Person.Address_GetByCityAndPostal`) using two
      input parameters (`@City`, `@PostalCode`) and successfully filtered the
      `Person.Address` table.
  2.  Created a stored procedure (`Person.Address_GetCityByID`) using an
      `OUTPUT` parameter (`@CityName`) and successfully returned the value
      'Raleigh' to the calling batch.

#### **Step 323: SQL SELECT DISTINCT CHALLENGE** 🔍

- **Date**: November 7, 2025
- **Objective**: Use the `SELECT DISTINCT` statement to retrieve only unique,
  non-duplicate values from a column.
- **Outcome**: Successfully executed `SELECT DISTINCT City FROM Person.Address`
  to get a complete list of unique cities in the database.

#### **Step 324: SQL SELECT TOP CHALLENGE** 🔟

- **Date**: November 7, 2025
- **Objective**: Use the `SELECT TOP` clause to limit the number of rows
  returned by a query.
- **Outcome**: Successfully executed a query using `SELECT TOP 10` against the
  `Production.Product` table, ordered by `ListPrice DESC`, to retrieve the ten
  most expensive products.

#### **Step 325: SQL MIN/MAX CHALLENGE** 💰

- **Date**: November 7, 2025
- **Objective**: Use the `MIN()` and `MAX()` aggregate functions to find the
  extreme values in a dataset.
- **Outcome**: Successfully executed a combined query against
  `Production.Product` to find the minimum price ($0.00) and the maximum price
  ($3578.27). Noted that $0.00 often indicates non-sellable or component items
  in the database.

#### **Step 326: SQL LIKE CHALLENGE** 🔡

- **Date**: November 7, 2025
- **Objective**: Use the `LIKE` operator with the wildcard character (`%`) to
  perform partial text matching.
- **Outcome**: Successfully executed a query against the `Person.Person` table
  to find all last names beginning with the letter 'S'.

#### **Step 327: SQL WILDCARD CHALLENGE** 🔠

- **Date**: November 7, 2025
- **Objective**: Use the `[]` wildcard operator to match a single character that
  falls within a defined set or range.
- **Outcome**: Successfully executed a query against the `Person.Person` table
  using `WHERE LastName LIKE '[ABC]%'` to find all last names beginning with A,
  B, or C.

#### **Step 328: SQL BETWEEN CHALLENGE** 🔢

- **Date**: November 7, 2025
- **Objective**: Use the `BETWEEN` operator to filter numeric data within a
  defined, inclusive range.
- **Outcome**: Successfully executed a query against the `Production.Product`
  table using `WHERE ListPrice BETWEEN 100.00 AND 150.00` to find all products
  within that price range.
