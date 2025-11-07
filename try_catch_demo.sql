BEGIN TRY
    -- This statement will intentionally cause a "DivideByZero" error
    SELECT 1000/0 AS Result;
END TRY
BEGIN CATCH
    -- When the error is caught, these functions retrieve the error details
    SELECT
        ERROR_NUMBER() AS ErrorNumber,
        ERROR_PROCEDURE() AS ErrorProcedure,
        ERROR_MESSAGE() AS ErrorMessage;
END CATCH
GO