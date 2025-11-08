-- *********************************************************************************
-- DEFINITIVE LIBRARY DATABASE PROJECT SCRIPT (Steps 334 & 335 Combined)
-- This script is idempotent and resolves all previous setup and display errors.
-- *********************************************************************************

-- 0. ROBUST DATABASE CLEANUP
----------------------------------------------------------------------
USE master;
GO

-- Force disconnect and drop the database to guarantee a clean start
IF DB_ID(N'db_library_project') IS NOT NULL
BEGIN
    ALTER DATABASE db_library_project SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE db_library_project;
END
GO

-- 1. CREATE DATABASE AND SET CONTEXT
----------------------------------------------------------------------
CREATE DATABASE db_library_project;
GO
USE db_library_project;
GO

-- 2. CREATE TABLES WITH PRIMARY KEYS (PK)
----------------------------------------------------------------------
-- NOTE: Tables are created in order of dependencies.

-- 2.1 PUBLISHER Table
CREATE TABLE PUBLISHER (
    PublisherName NVARCHAR(100) PRIMARY KEY,
    PublisherAddress NVARCHAR(200),
    PublisherPhone NVARCHAR(20)
);

-- 2.2 BOOKS Table
CREATE TABLE BOOKS (
    BookID INT IDENTITY(1,1) PRIMARY KEY,
    Title NVARCHAR(250) NOT NULL,
    PublisherName NVARCHAR(100) NOT NULL,
    CONSTRAINT FK_Book_Publisher FOREIGN KEY (PublisherName) 
        REFERENCES PUBLISHER(PublisherName)
        ON UPDATE CASCADE 
);

-- 2.3 BOOK_AUTHORS Table (Junction Table)
CREATE TABLE BOOK_AUTHORS (
    BookID INT NOT NULL,
    AuthorName NVARCHAR(100) NOT NULL,
    CONSTRAINT PK_BookAuthors PRIMARY KEY (BookID, AuthorName),
    CONSTRAINT FK_Authors_Book FOREIGN KEY (BookID) 
        REFERENCES BOOKS(BookID)
        ON DELETE CASCADE
);

-- 2.4 LIBRARY_BRANCH Table
CREATE TABLE LIBRARY_BRANCH (
    BranchID INT IDENTITY(1,1) PRIMARY KEY,
    BranchName NVARCHAR(100) NOT NULL,
    BranchAddress NVARCHAR(200)
);

-- 2.5 BORROWER Table
CREATE TABLE BORROWER (
    CardNo INT IDENTITY(1001,1) PRIMARY KEY, 
    BorrowerName NVARCHAR(100) NOT NULL,
    BorrowerAddress NVARCHAR(200),
    BorrowerPhone NVARCHAR(20)
);

-- 2.6 BOOK_COPIES Table (Junction Table)
CREATE TABLE BOOK_COPIES (
    BookID INT NOT NULL,
    BranchID INT NOT NULL,
    Number_of_Copies INT NOT NULL CHECK (Number_of_Copies >= 2), 
    CONSTRAINT PK_BookCopies PRIMARY KEY (BookID, BranchID), 
    CONSTRAINT FK_Copies_Book FOREIGN KEY (BookID) 
        REFERENCES BOOKS(BookID)
        ON DELETE CASCADE,
    CONSTRAINT FK_Copies_Branch FOREIGN KEY (BranchID) 
        REFERENCES LIBRARY_BRANCH(BranchID)
        ON DELETE CASCADE
);

-- 2.7 BOOK_LOANS Table (Junction Table)
CREATE TABLE BOOK_LOANS (
    BookID INT NOT NULL,
    BranchID INT NOT NULL,
    CardNo INT NOT NULL,
    DateOut DATE NOT NULL,
    DateDue DATE NOT NULL,
    DateReturned DATE NULL,
    CONSTRAINT PK_BookLoans PRIMARY KEY (BookID, BranchID, CardNo, DateOut),
    CONSTRAINT FK_Loans_Copies FOREIGN KEY (BookID, BranchID)
        REFERENCES BOOK_COPIES(BookID, BranchID), 
    CONSTRAINT FK_Loans_Borrower FOREIGN KEY (CardNo)
        REFERENCES BORROWER(CardNo)
);
GO

-- 3. POPULATE TABLES (FROM PART ONE)
----------------------------------------------------------------------
INSERT INTO LIBRARY_BRANCH (BranchName, BranchAddress) VALUES
('Sharpstown', '555 Main Street, Houston TX'), ('Central Branch', '100 University Ave, City Center'),
('Eastside Branch', '45 Oak Lane, Suburbia'), ('Westend Branch', '808 Sunset Blvd, West End'),
('Northgate Branch', '999 North St, Northgate'), ('Southlake Branch', '11 South Dr, Southlake');

INSERT INTO PUBLISHER (PublisherName, PublisherAddress, PublisherPhone) VALUES
('Random House', 'NY, NY', '212-555-0101'), ('Penguin Books', 'London, UK', '44-20-7555-0102'),
('HarperCollins', 'Toronto, ON', '416-555-0103'), ('Scribner', 'Boston, MA', '617-555-0104'),
('Vintage Books', 'LA, CA', '310-555-0105'), ('Macmillan', 'Dublin, IR', '353-1-555-0106'),
('Faber and Faber', 'Edinburgh, UK', '44-131-555-0107'), ('Tor Books', 'Seattle, WA', '206-555-0108'),
('Academic Press', 'Chicago, IL', '312-555-0109'), ('Dover Publications', 'Miami, FL', '305-555-0110');

INSERT INTO BOOKS (Title, PublisherName) VALUES
('The Lost Tribe', 'Scribner'), ('The Great Gatsby', 'Random House'), ('To Kill a Mockingbird', 'HarperCollins'),
('1984', 'Penguin Books'), ('Pride and Prejudice', 'Vintage Books'), ('The Catcher in the Rye', 'Macmillan'),
('One Hundred Years of Solitude', 'Faber and Faber'), ('Moby Dick', 'Random House'), ('War and Peace', 'Penguin Books'),
('The Odyssey', 'HarperCollins'), ('The Hobbit', 'Scribner'), ('Crime and Punishment', 'Vintage Books'),
('The Secret History', 'Macmillan'), ('A Game of Thrones', 'Tor Books'), ('Dune', 'Tor Books'),
('Brave New World', 'Academic Press'), ('Atlas Shrugged', 'Dover Publications'), ('The Shining', 'Faber and Faber'),
('Catch-22', 'Random House'), ('The Martian', 'Penguin Books');

INSERT INTO BORROWER (BorrowerName, BorrowerAddress, BorrowerPhone) VALUES
('Jane Doe', '123 Elm St, Houston', '713-555-0120'), ('John Smith', '45 Oak Ave, Houston', '713-555-0121'),
('Emily Davis', '67 Pine Ln, Sugar Land', '281-555-0122'), ('Michael Brown', '89 Maple Dr, Katy', '832-555-0123'),
('Sarah Wilson', '10 Cedar Rd, The Woodlands', '936-555-0124'), ('David Lee', '11 Birch Way, Houston', '713-555-0125'),
('Laura Chen', '12 Holly Ct, Bellaire', '713-555-0126'), ('Robert King', '13 Willow Pl, Sugar Land', '281-555-0127');

INSERT INTO BOOK_AUTHORS (BookID, AuthorName) VALUES
(1, 'Jane Austen'), (2, 'F. Scott Fitzgerald'), (3, 'Harper Lee'), (4, 'George Orwell'),
(5, 'Jane Austen'), (6, 'J.D. Salinger'), (7, 'Gabriel Garcia Marquez'), (8, 'Herman Melville'), 
(9, 'Leo Tolstoy'), (10, 'Homer'), (1, 'Stephen King');

INSERT INTO BOOK_COPIES (BookID, BranchID, Number_of_Copies) VALUES
(1, 1, 5), (2, 1, 2), (3, 1, 4), (4, 2, 3), (5, 2, 2), (6, 2, 6),
(7, 3, 2), (8, 3, 5), (9, 3, 3), (10, 4, 4), (11, 4, 2), (12, 4, 3),
(13, 5, 2), (14, 5, 4), (15, 5, 2), (16, 6, 5), (17, 6, 2), (18, 6, 3);

INSERT INTO BOOK_LOANS (BookID, BranchID, CardNo, DateOut, DateDue) VALUES
(1, 1, 1001, '2025-10-01', '2025-11-01'), (4, 2, 1001, '2025-10-10', '2025-11-10'), 
(2, 1, 1002, '2025-09-20', '2025-10-20'), (5, 2, 1002, '2025-10-15', '2025-11-15'), 
(7, 3, 1003, '2025-10-05', '2025-11-05'), (10, 4, 1004, '2025-10-25', '2025-11-25'), 
(13, 5, 1005, '2025-10-08', '2025-11-08'), (16, 6, 1005, '2025-10-22', '2025-11-22'), 
(17, 6, 1006, '2025-09-01', '2025-10-01'), (18, 6, 1007, '2025-10-01', '2025-11-01');
GO

-- 4. ALL QUERIES (FROM PART TWO)
----------------------------------------------------------------------
PRINT '--- 1. All information from BOOK_AUTHORS ---'
SELECT * FROM BOOK_AUTHORS;
GO

PRINT '--- 2. BookID and BranchID for "The Lost Tribe" ---'
SELECT 
    BC.BookID,
    BC.BranchID
FROM BOOK_COPIES AS BC
INNER JOIN BOOKS AS B ON BC.BookID = B.BookID
WHERE B.Title = 'The Lost Tribe';
GO

PRINT '--- 3. BookID and Title for author "Stephen King" ---'
SELECT 
    B.BookID,
    B.Title
FROM BOOKS AS B
INNER JOIN BOOK_AUTHORS AS BA ON B.BookID = BA.BookID
WHERE BA.AuthorName = 'Stephen King';
GO

PRINT '--- 4. BorrowerName and BorrowerAddress for CardNo 1005 ---'
SELECT 
    BorrowerName,
    BorrowerAddress
FROM BORROWER
WHERE CardNo = 1005;
GO

PRINT '--- 5. BorrowerName and BookID for CardNo 1005 (from BOOK_LOANS) ---'
SELECT 
    BR.BorrowerName,
    BL.BookID
FROM BOOK_LOANS AS BL
INNER JOIN BORROWER AS BR ON BL.CardNo = BR.CardNo
WHERE BR.CardNo = 1005;
GO

PRINT '--- 6. BorrowerName and BookID for unreturned books (DateReturned IS NULL) ---'
SELECT 
    BR.BorrowerName,
    BL.BookID
FROM BOOK_LOANS AS BL
INNER JOIN BORROWER AS BR ON BL.CardNo = BR.CardNo
WHERE BL.DateReturned IS NULL;
GO