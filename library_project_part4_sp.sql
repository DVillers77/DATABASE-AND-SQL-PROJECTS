USE db_library_project;
GO

----------------------------------------------------------------------
-- 1. SP_CopiesAtSharpstown
-- Finds the number of copies of a specific book ("The Lost Tribe") 
-- at a specific branch ("Sharpstown").
----------------------------------------------------------------------
CREATE PROCEDURE SP_CopiesAtSharpstown
AS
BEGIN
    SELECT
        SUM(BC.Number_of_Copies) AS TotalCopiesAtSharpstown
    FROM BOOKS AS B
    INNER JOIN BOOK_COPIES AS BC ON B.BookID = BC.BookID
    INNER JOIN LIBRARY_BRANCH AS LB ON BC.BranchID = LB.BranchID
    WHERE
        B.Title = 'The Lost Tribe'
        AND LB.BranchName = 'Sharpstown';
END
GO

----------------------------------------------------------------------
-- 2. SP_CopiesAtEachBranch
-- Finds the number of copies of a specific book ("The Lost Tribe")
-- aggregated and listed by each library branch.
----------------------------------------------------------------------
CREATE PROCEDURE SP_CopiesAtEachBranch
AS
BEGIN
    SELECT
        LB.BranchName,
        SUM(BC.Number_of_Copies) AS TotalCopies
    FROM BOOKS AS B
    INNER JOIN BOOK_COPIES AS BC ON B.BookID = BC.BookID
    INNER JOIN LIBRARY_BRANCH AS LB ON BC.BranchID = LB.BranchID
    WHERE
        B.Title = 'The Lost Tribe'
    GROUP BY
        LB.BranchName
    ORDER BY
        LB.BranchName;
END
GO

----------------------------------------------------------------------
-- 3. SP_BorrowersWithNoLoans
-- Retrieves the names of all borrowers who do not have any books checked out.
----------------------------------------------------------------------
CREATE PROCEDURE SP_BorrowersWithNoLoans
AS
BEGIN
    SELECT
        BR.BorrowerName,
        BR.CardNo
    FROM BORROWER AS BR
    -- LEFT JOIN to BOOK_LOANS to include ALL borrowers, even those with no loans.
    LEFT JOIN BOOK_LOANS AS BL ON BR.CardNo = BL.CardNo
    -- Filter to find only those where the loan columns are NULL (meaning no match was found).
    WHERE
        BL.CardNo IS NULL
    ORDER BY
        BR.BorrowerName;
END
GO