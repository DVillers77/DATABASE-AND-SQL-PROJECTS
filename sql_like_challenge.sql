-- Set the database context
USE AdventureWorks2017
GO

-- CHALLENGE: Retrieve all people whose last names start with the letter 'S'.
SELECT
    FirstName,
    LastName
FROM Person.Person
-- Use LIKE to match the pattern: 'S' followed by any sequence of zero or more characters (%)
WHERE LastName LIKE 'S%'
ORDER BY LastName;
GO