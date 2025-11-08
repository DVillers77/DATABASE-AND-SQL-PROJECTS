USE db_library_project;
GO

-- We are joining BOOKS (the Left Table) with BOOK_AUTHORS (the Right Table).
-- We know BookIDs 1-10 have authors, and BookIDs 11-20 do not.
----------------------------------------------------------------------
PRINT '--- 1. INNER JOIN ---';
PRINT 'Best used when: You only need records that exist in ALL tables being joined (i.e., NO missing data is acceptable).';
----------------------------------------------------------------------
-- Result: Returns ONLY the 11 rows where an author record EXISTS for the book.
-- All books without an assigned author (IDs 11-20) are EXCLUDED.
SELECT
    B.BookID,
    B.Title,
    BA.AuthorName
FROM BOOKS AS B
INNER JOIN BOOK_AUTHORS AS BA  -- Inner Join requires a match on both sides
    ON B.BookID = BA.BookID
ORDER BY B.BookID;
GO

---
PRINT '--- 2. LEFT OUTER JOIN ---';
PRINT 'Best used when: You need ALL records from the primary table (LEFT table), and matching data from the secondary table if available.';
----------------------------------------------------------------------
-- Result: Returns ALL 20 rows from the BOOKS table.
-- For BookIDs 1-10, AuthorName is returned.
-- For BookIDs 11-20, AuthorName is NULL because no match exists in BOOK_AUTHORS.
SELECT
    B.BookID,
    B.Title,
    BA.AuthorName
FROM BOOKS AS B
LEFT JOIN BOOK_AUTHORS AS BA  -- Left Join returns all of B (Left side)
    ON B.BookID = BA.BookID
ORDER BY B.BookID;
GO

---
PRINT '--- 3. RIGHT OUTER JOIN ---';
PRINT 'Best used when: You need ALL records from the secondary table (RIGHT table), and matching data from the primary table if available.';
----------------------------------------------------------------------
-- Result: Returns ALL 11 rows from the BOOK_AUTHORS table.
-- This result is identical to the INNER JOIN in this specific scenario 
-- because our data setup requires every author entry (right side) to have 
-- a matching BookID (left side).
SELECT
    B.BookID,
    B.Title,
    BA.AuthorName
FROM BOOKS AS B
RIGHT JOIN BOOK_AUTHORS AS BA  -- Right Join returns all of BA (Right side)
    ON B.BookID = BA.BookID
ORDER BY B.BookID;
GO

---
PRINT '--- 4. FULL OUTER JOIN ---';
PRINT 'Best used when: You need ALL records from BOTH tables, including those with no match in the other table.';
----------------------------------------------------------------------
-- Result: Returns all 20 books (from the left side) AND any authors that might 
-- not be attached to a book (from the right side).
-- In our current data, this result is identical to the LEFT JOIN because 
-- every author entry has a valid BookID, but it is the safest option for 
-- comprehensive reporting.
SELECT
    B.BookID,
    B.Title,
    BA.AuthorName
FROM BOOKS AS B
FULL OUTER JOIN BOOK_AUTHORS AS BA  -- Full Join returns all from both sides
    ON B.BookID = BA.BookID
ORDER BY B.BookID;
GO

---
PRINT '--- 5. CROSS JOIN (Caution: Rarely used for joining data) ---';
PRINT 'Best used when: You need a Cartesian product—every row from the first table combined with every row from the second table.';
----------------------------------------------------------------------
-- Result: Returns 220 rows (20 books * 11 author entries = 220).
-- This is usually massive and rarely desired, typically used for generating 
-- test data or specific reports like calendars/schedules.
SELECT
    B.Title,
    BA.AuthorName
FROM BOOKS AS B
CROSS JOIN BOOK_AUTHORS AS BA
ORDER BY B.Title, BA.AuthorName;
GO