-- Set the context to the master database before attempting to drop the target database
USE [master];
GO

-- -----------------------------------------------------------------------------------
-- 1. CLEANUP AND CREATE DATABASE
-- -----------------------------------------------------------------------------------
IF DB_ID('music_library_db') IS NOT NULL
    BEGIN
        -- **CRITICAL FIX**: Disconnect all users and set the DB to SINGLE_USER mode
        -- This resolves the "currently in use" (Msg 3702) error.
        ALTER DATABASE music_library_db SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
        DROP DATABASE music_library_db;
    END
GO

CREATE DATABASE music_library_db;
GO

-- Use the new database for all subsequent commands
USE music_library_db;
GO

-- -----------------------------------------------------------------------------------
-- 2. CREATE TABLE 1 (Parent Table: tbl_artist)
-- -----------------------------------------------------------------------------------
CREATE TABLE tbl_artist (
    artist_id INT PRIMARY KEY NOT NULL,
    artist_name VARCHAR(100) NOT NULL,
    origin_country VARCHAR(50)
);
GO

-- -----------------------------------------------------------------------------------
-- 3. CREATE TABLE 2 (Child Table: tbl_album)
-- -----------------------------------------------------------------------------------
CREATE TABLE tbl_album (
    album_id INT PRIMARY KEY NOT NULL,
    album_title VARCHAR(100) NOT NULL,
    release_year INT NOT NULL,
    artist_id INT FOREIGN KEY REFERENCES tbl_artist(artist_id)
);
GO

-- -----------------------------------------------------------------------------------
-- 4. INSERT DATA
-- -----------------------------------------------------------------------------------
-- Insert Artists (Parent Table)
INSERT INTO tbl_artist (artist_id, artist_name, origin_country) VALUES
(1, 'The Beatles', 'UK'),
(2, 'Queen', 'UK'),
(3, 'Led Zeppelin', 'UK'),
(4, 'Michael Jackson', 'USA'),
(5, 'Adele', NULL);
GO

-- Insert Albums (Child Table)
INSERT INTO tbl_album (album_id, album_title, release_year, artist_id) VALUES
(101, 'Abbey Road', 1969, 1),
(102, 'Thriller', 1982, 4),
(103, 'A Night at the Opera', 1975, 2),
(104, '21', 2011, 5),
(105, 'Bad', 1987, 4),
(106, 'Let It Be', 1970, 1);
GO

-- -----------------------------------------------------------------------------------
-- 5. FINAL QUERY
-- -----------------------------------------------------------------------------------
SELECT
    T1.artist_name,
    T2.album_title,
    T2.release_year
FROM
    tbl_artist T1
INNER JOIN
    tbl_album T2
ON
    T1.artist_id = T2.artist_id
WHERE
    T1.artist_name = 'Michael Jackson' OR T1.artist_name = 'The Beatles';
GO