/* 1. SETUP */
USE db_zooTest2;
GO

/* 2. CREATE PROCEDURE get_animal_info */
CREATE PROCEDURE get_animal_info 
    @animal_name VARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON; 
	SELECT
		a1.species_name, a2.animalia_type,
		a3.class_type, a4.order_type, a5.habitat_type,
		a6.nutrition_type, a7.care_type
	FROM dbo.tbl_species a1 -- dbo. prefix included for compilation
	INNER JOIN dbo.tbl_animalia a2 ON a2.animalia_id = a1.species_animalia
	INNER JOIN dbo.tbl_class a3 ON a3.class_id = a1.species_class
	INNER JOIN dbo.tbl_order a4 ON a4.order_id = a1.species_order
	INNER JOIN dbo.tbl_habitat a5 ON a5.habitat_id = a1.species_habitat
	INNER JOIN dbo.tbl_nutrition a6 ON a6.nutrition_id = a1.species_nutrition
	INNER JOIN dbo.tbl_care a7 ON a7.care_id = a1.species_care
	WHERE species_name = @animal_name;
END
GO

/* 3. TEST EXECUTION */
EXEC dbo.get_animal_info @animal_name = 'brown bear';
GO