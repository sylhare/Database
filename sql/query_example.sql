-- For tuto check on:
-- http://www.dofactory.com/sql/tutorial
-- https://www.sololearn.com/Course/SQL/

-- Show all databases
SHOW DATABASES

-- Show all tables of the selected database
SHOW TABLES

-- Show columns of the table
SHOW COLUMNS FROM tablename;

-- Return a selection of data (equivalent notation)
SELECT col FROM table;
SELECT table.col FROM table;

-- Return unique data from columns selected
SELECT DISTINCT column1 FROM tablename;

-- Limit to 6 elements the selection starting from ID = 4 (start row is ID = 3)
-- LIMIT 6 takes element from beginning: 1 to 6 include (the start row is ID = 0, is not counted)
SELECT column1, column2 FROM tablename LIMIT 3, 6;

-- Order a selection
SELECT * FROM tablename ORDER BY column1, column2;

-- Add a condition to your selection
SELECT * from tablename WHERE ID >= 5 OR cond = "false ";
SELECT * from tablename WHERE cond = "true" AND (ID BETWEEN 2 AND 5);
SELECT * from tablename WHERE state IN ('CA', 'NY', 'DC');
SELECT * from tablename WHERE state NOT IN ('YO', 'MN', 'WV');

-- More key words for the condition with where: 'A%' starts with a A (Argon, Attention), '%s' ends with an s (tests, fruits)
SELECT * from tablename WHERE column1 LIKE 'A%';

-- Have modifications on columns
SELECT CONCAT(colum1, ' ', column2) AS column3 FROM tablename;
SELECT ID, column1, column2+500 AS column2 FROM tablename;

-- Have functions modifying the query (like lower or upper for letters, average, sum and squareroot for numbers)
SELECT UPPER(column1) AS column3 FROM tablename;
SELECT SUM(AVG(column4), SQRT(column5)) FROM tablename;
SELECT MIN(column2) FROM tablename;
SELECT COUNT(column1)FROM table-name;

-- Have a subquery integrated, (two SELECT in one query)
SELECT column1, column2 FROM table1 WHERE column3 > (SELECT AVG(column3) FROM table1) ORDER BY column3 DESC;

-- JOIN, (INNER and OUTER are not mandatory, and "ON" stating the condition for the joint)
-- 
-- (INNER) JOIN: Select records that have matching values in both tables.
-- LEFT (OUTER) JOIN: Select records from the first (left-most) table with matching right table records. If no match in left table row returns the value NULL
-- RIGHT (OUTER) JOIN: Select records from the second (right-most) table with matching left table records.  If no match in right table row returns the value NULL
-- FULL (OUTER) JOIN: Selects all records that match either left or right table records.

-- Join tables with a condition, you can use AS to give nicknames to the tables. All of these are equivalent 
SELECT tableA.ID, tableA.column, tableB.ID, tableB.column FROM tableA, tableB WHERE tableA.ID = tableB.correspondingID ORDER BY tableA.ID;
SELECT tableA.ID, tableA.column, tableB.ID, tableB.column FROM tableA JOIN tableB ON tableA.ID = tableB.correspondingID ORDER BY tableA.ID;
SELECT a.ID, a.column, b.ID, b.column FROM tableA AS a, tableB AS b WHERE a.ID = b.correspondingID ORDER BY a.ID;

-- Other types of joint
SELECT a.ID, a.column, b.ID, b.column FROM tableA AS a FULL JOIN tableB AS b ON a.ID = b.correspondingID;
SELECT a.ID, a.column, b.ID, b.column FROM tableA AS a LEFT JOIN tableB AS b ON a.ID = b.correspondingID;
SELECT a.ID, a.column, b.ID, b.column FROM tableA AS a FULL JOIN tableB AS b ON a.ID = b.correspondingID;

-- Example for this joints
-- See "LEFT" as a.ID from table Aand "RIGHT" as b.correspondingID from tableB
-- 
-- So we have these two tables
--  a        b
-- LEFT    RIGHT
--  1.      1.
--  2.      2.
--  4.      3.
--  5.
-- 
-- Output for LEFT JOIN
-- LEFT    RIGHT
--  1.      1.
--  2.      2.
--  4.      NULL        (no match for RIGHT so return NULL)
--  5.      NULL        (no match for RIGHT so return NULL)
-- 
-- 
-- Output for RIGHT JOIN
-- LEFT    RIGHT
--  1.      1.
--  2.      2.
-- NULL     3.          (no match for LEFT so return NULL)
-- 
-- 
-- LEFT    RIGHT
--  1.      1.
--  2.      2.
--  NULL    3.          (no match for LEFT so return NULL)
--  4.      NULL        (no match for RIGHT so return NULL)
--  5.      NULL        (no match for RIGHT so return NULL)

-- UNION between two tables, if there's none matching column, you can use NULL
SELECT tableA.ID FROM tableA UNION SELECT tableB.ID FROM tableB; 
SELECT tableA.ID, tableA.column FROM tableA UNION SELECT tableB.ID, NULL FROM tableB; 
SELECT tableA.ID FROM tableA UNION ALL SELECT tableB.ID FROM tableB; 

-- Example
-- 
-- Let's take two "one column" table,
--
--  a       b
-- ----    ----
--  1.      1.
--  2.      2.
--  4.      3.
--  5.
-- 
-- a UNION b            -- a UNION ALL b (It doesn't remove the duplicates)
--  -------             --  -------
--    1.                --    1.
--    2.                --    1.
--    3.                --    2.
--    4.                --    2.
--    5.                --    3.
--                      --    4.
--                      --    5.

-- Inserting value (for all columns that either doesn't have default value or does not support NULL)
INSERT INTO tablename VALUES (5, "value1", 10, "true");                                  -- will populate the value in the column order
INSERT INTO tablename(ID, column3, column2, column1) VALUES (5, "value1", 10, "true");   -- self define the value to put in which column

-- Modifying the data
UPDATE tablename SET column3 = "empty", column2 = 0 WHERE column3 = "true";
DELETE FROM tablename WHERE column1 = "false";                -- Remove the entire row

-- Creating a table
CREATE TABLE tablename {
    ID int, NOT NULL AUTO_INCREMENT,    -- Making sure it increase automatically for each record
    column1 varchar(100),
    column2 float UNIQUE,               -- Enforces unique or null data in the column
    column3 varchar(4) NOT NULL,        -- Making sure this column can't be null
    column4 date DEFAULT 2017-04-17,    -- Add a default value 
    column5 blob,                       -- Binary Large Object (like image)
    column6 double CHECK (column6 > 0)  -- Enforces values superior to 0 in column6
    PRIMARY KEY(ID)                     -- Enforces table to accept unique not null data for a specific column to create an index to access the table faster
    
};

-- Modifying a table
ALTER TABLE tablename ADD column7 datetime;     -- adding a column, with no default will fill the rows with NULL
ALTER TABLE tablename CHANGE column7 double; 
ALTER TABLE tablename DROP COLUMN column7;      -- Removing a column
DROP TABLE tablename;                           -- Removing the entire table
RENAME tableA TO tableC;                        -- Rename the entire table

-- Create a View, a view is more user friendly and can be modified (like an excel?)
CREATE VIEW tableview AS SELECT column1, column2 FROM tablename WHERE (column2 > 10);
CREATE OR REPLACE VIEW tableview AS SELECT column1, column2, column3 FROM tablename WHERE (column2 > 10);
DROP VIEW tableview;     -- Delete the view

      


