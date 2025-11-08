USE db_library_project;
GO

-- FULL OUTER JOIN on three tables to see all potential relationships.
SELECT *
FROM BOOK_LOANS AS BL
FULL OUTER JOIN BORROWER AS BR ON BL.CardNo = BR.CardNo
FULL OUTER JOIN BOOKS AS B ON BL.BookID = B.BookID
ORDER BY BR.BorrowerName, B.Title;
GO