-- Set the database context
USE AdventureWorks2017
GO

-- 1. Create the Stored Procedure with Modern Naming Convention
-- Using the 'Person' schema, as the Address table belongs there in AdventureWorks
CREATE PROCEDURE Person.Address_GetByCityPartial
(
    -- Parameter definition
    @City nvarchar(30)
)
AS
BEGIN
    -- Selects data from the Person.Address table
    SELECT *
    FROM Person.Address
    -- Filters based on the parameter and the '%' wildcard
    WHERE City LIKE @City + '%'
END
GO

-- 2. Execute the Stored Procedure (Passing 'New' as the argument)
EXEC Person.Address_GetByCityPartial @City = 'New'
GO