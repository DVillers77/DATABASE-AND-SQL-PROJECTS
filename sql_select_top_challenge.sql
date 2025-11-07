-- Set the database context
USE AdventureWorks2017
GO

-- CHALLENGE: Retrieve the Top 10 most expensive products.
SELECT TOP 10
    Name,
    ProductNumber,
    ListPrice
FROM Production.Product
-- Sort by ListPrice in descending order to get the highest prices first
ORDER BY ListPrice DESC;
GO