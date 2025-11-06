USE [db_zooTest2]
GO

/* Convert(VARCHAR(50),@total_hab) = This is converting the data type from MONEY to String Characters
 * CHAR(9) = Tab
 * CHAR(10) = New Line
 * CHAR(13) = Carriage Return
 * CHAR(10) + CHAR(13) = Standard line Break
 */

DECLARE @total_hab MONEY;
DECLARE @total_nut MONEY;
DECLARE @results MONEY;
SET @total_hab = (SELECT SUM(habitat_cost) FROM tbl_habitat);
SET @total_nut = (SELECT SUM(nutrition_cost) FROM tbl_nutrition)
SET @results = (@total_hab + @total_nut)
PRINT (
	CONVERT(VARCHAR(50),@total_hab) + CHAR(9) + ' - The Total Habitat Cost' + CHAR(13) +
	CONVERT(VARCHAR(50),@total_nut) + CHAR(9) + CHAR(9) + ' - The Total Nutrition Cost ' + CHAR(13) + '------------' + CHAR(13) +
	CONVERT(VARCHAR(50),@results)
);