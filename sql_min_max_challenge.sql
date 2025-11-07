-- Set the database context
USE AdventureWorks2017
GO

-- CHALLENGE: Find the Maximum (Most Expensive) List Price
SELECT
    MIN(ListPrice) AS Minimum_List_Price,
    MAX(ListPrice) AS Maximum_List_Price
FROM Production.Product;
GO