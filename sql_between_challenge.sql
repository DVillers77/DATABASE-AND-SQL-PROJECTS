-- Set the database context
USE AdventureWorks2017
GO

-- CHALLENGE: Retrieve products with a list price between $100.00 and $150.00 (inclusive).
SELECT
    Name,
    ProductNumber,
    ListPrice
FROM Production.Product
-- Use the BETWEEN operator to define the inclusive range
WHERE ListPrice BETWEEN 100.00 AND 150.00
ORDER BY ListPrice DESC;
GO
