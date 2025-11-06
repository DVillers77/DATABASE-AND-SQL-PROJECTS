USE [db_zooTest2]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/* 7. CREATE get_animal_info (Compiler finds tables now) */
ALTER PROCEDURE [dbo].[get_animal_info] 
    @animal_name VARCHAR(50)
AS
BEGIN
	DECLARE @results INT; -- Use INT for COUNT() result
	DECLARE @error_message NVARCHAR(4000);

	-- Construct the custom error message. Note the double apostrophe (''s) to escape the single quote.
	SET @error_message = 'There are no ' + @animal_name + '''s found at this zoo.';

	BEGIN TRY
		-- Count how many rows match the animal name provided by the user
		SET @results = (SELECT COUNT(tbl_species.species_name) FROM dbo.tbl_species WHERE species_name = @animal_name)
		
		IF @results = 0 -- If the count is 0 (animal not found)
			BEGIN
				/* MODERN METHOD: THROW is preferred over RAISERROR because:
				   1. It forces immediate termination of the batch/procedure.
				   2. It requires a standard severity (16 is for user-defined errors).
				   3. It is ANSI-SQL compliant, unlike RAISERROR.
				*/
				-- THROW syntax: ErrorNumber (must be > 50000), ErrorMessage, State (1)
				THROW 50001, @error_message, 1;
			END
		-- Note: We only need to check IF @results = 0. If it's 1 or more, execution continues to the SELECT.

		-- If the animal is found, execute the main SELECT query
		SELECT
		a1.species_name, a2.animalia_type,
		a3.class_type, a4.order_type, a5.habitat_type,
		a6.nutrition_type, a7.care_type
		FROM dbo.tbl_species a1 
		INNER JOIN dbo.tbl_animalia a2 ON a2.animalia_id = a1.species_animalia
		INNER JOIN dbo.tbl_class a3 ON a3.class_id = a1.species_class
		INNER JOIN dbo.tbl_order a4 ON a4.order_id = a1.species_order
		INNER JOIN dbo.tbl_habitat a5 ON a5.habitat_id = a1.species_habitat
		INNER JOIN dbo.tbl_nutrition a6 ON a6.nutrition_id = a1.species_nutrition
		INNER JOIN dbo.tbl_care a7 ON a7.care_id = a1.species_care
		WHERE species_name = @animal_name;
		
	END TRY

	BEGIN CATCH
		/* CATCH BLOCK: THROW is automatically caught here. 
		   We use PRINT or RAISERROR (Severity < 11) to echo the friendly message back, 
		   ensuring the application receives a clean, non-fatal message.
		*/
		SET @error_message = ERROR_MESSAGE();
		
		-- Use PRINT for clean output, or RAISERROR with low severity (1-10) for informational feedback
		PRINT '--- QUERY FAILED ---';
		PRINT @error_message;
		PRINT '--------------------';

	END CATCH
END