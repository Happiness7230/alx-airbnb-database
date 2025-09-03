-- Objective: Identify and create indexes to improve query performance.

--------------------------------------------------------------------------------
-- Step 1: Identify High-Usage Columns
--
-- Based on the queries we've written, the following columns are frequently used
-- in JOIN, WHERE, and ORDER BY clauses, making them excellent candidates for indexing:
--
-- In `Bookings` table: `user_id`, `property_id` (used for JOINs)
-- In `Users` table: `user_id` (Primary Key, already indexed, but good to remember)
-- In `Properties` table: `property_id` (Primary Key, already indexed)
-- In `Reviews` table: `property_id` (used for JOINs)
--------------------------------------------------------------------------------


--------------------------------------------------------------------------------
-- Step 2: Write CREATE INDEX Commands
--
-- These commands will create indexes on the foreign key columns we identified.
-- This is like creating an index in the back of a book for specific topics,
-- allowing the database to find related records much faster.
--------------------------------------------------------------------------------

-- Creates an index on the user_id column in the Bookings table
CREATE INDEX idx_bookings_user_id ON Bookings(user_id);

-- Creates an index on the property_id column in the Bookings table
CREATE INDEX idx_bookings_property_id ON Bookings(property_id);

-- Creates an index on the property_id column in the Reviews table
CREATE INDEX idx_reviews_property_id ON Reviews(property_id);


--------------------------------------------------------------------------------
-- Step 3: Measure Performance Before and After
--
-- To see the difference, you would run this command TWICE:
-- 1. Once BEFORE creating the indexes.
-- 2. Once AFTER creating the indexes.
--
-- You will see that the "cost" of the query reported by EXPLAIN will be
-- significantly lower after the indexes are in place.
--------------------------------------------------------------------------------

EXPLAIN ANALYZE
SELECT
    u.user_name,
    p.property_name,
    b.start_date
FROM
    Bookings b
JOIN
    Users u ON b.user_id = u.user_id
JOIN
    Properties p ON b.property_id = p.property_id
WHERE
    u.user_name = 'John Smith'; -- Example filter

