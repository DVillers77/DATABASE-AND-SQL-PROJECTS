USE AdventureWorks2017
GO

-- 1. Create the Stored Procedure (USP)
CREATE PROCEDURE dbo.uspGetAddress
AS
BEGIN
    SELECT *
    FROM Person.Address;
END
GO

-- 2. Execute the Stored Procedure
EXEC dbo.uspGetAddress
GO