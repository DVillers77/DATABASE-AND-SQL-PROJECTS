-- Set the database context
USE AdventureWorks2017
GO

-- CHALLENGE: Retrieve a list of all unique cities from the Person.Address table.
SELECT DISTINCT City
FROM Person.Address
ORDER BY City; -- Adding ORDER BY is good practice for readability
GO