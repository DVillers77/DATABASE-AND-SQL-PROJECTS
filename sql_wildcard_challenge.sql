-- Set the database context
USE AdventureWorks2017
GO

-- CHALLENGE: Retrieve all people whose last names start with A, B, or C.
SELECT
    FirstName,
    LastName
FROM Person.Person
-- Use LIKE with the bracket wildcard: 
-- The first character must be either A, B, or C. 
-- The '%' matches any remaining characters.
WHERE LastName LIKE '[ABC]%'
ORDER BY LastName;
GO