-- Set the database context
USE AdventureWorks2017
GO

-- 0. Safety Cleanup: Drop the procedure if it exists from a previous attempt
DROP PROCEDURE IF EXISTS Person.Address_GetCityByID
GO

-- 1. CREATE Stored Procedure with an OUTPUT Parameter
CREATE PROCEDURE Person.Address_GetCityByID
(
    -- Input parameter
    @AddressID INT,
    -- Output parameter
    @CityName nvarchar(30) OUTPUT
)
AS
BEGIN
    -- Retrieves the City name for the given AddressID (using a known ID 980 for success)
    SELECT @CityName = City
    FROM Person.Address
    WHERE AddressID = @AddressID
END
GO

-- 2. Execute the Stored Procedure and Retrieve the Output Value
-- a) Declare a local variable
DECLARE @RetrievedCityName nvarchar(30)

-- b) Execute the procedure, passing the variable and a KNOWN good AddressID (980 is 'Burbank')
EXEC Person.Address_GetCityByID @AddressID = 980, @CityName = @RetrievedCityName OUTPUT

-- c) Print the value
SELECT 'The retrieved city is: ' + @RetrievedCityName AS OutputResult
GO

-- 3. Clean up the created stored procedure
DROP PROCEDURE IF EXISTS Person.Address_GetCityByID
GO