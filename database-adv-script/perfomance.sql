-- Objective: Refactor a complex query to improve performance.
-- We will assume a Payments table exists:
--   payment_id (PK), booking_id (FK), amount, payment_date

--------------------------------------------------------------------------------
-- Step 1: Write an Initial, Inefficient Query
--
-- Objective: Get details for all bookings that had a payment over $500.
-- This query uses a subquery with 'IN', which can be inefficient for large tables.
--------------------------------------------------------------------------------

SELECT
    b.booking_id,
    u.user_name,
    p.property_name
FROM
    Bookings b
JOIN
    Users u ON u.user_id = b.user_id
JOIN
    Properties p ON p.property_id = b.property_id
WHERE
    b.booking_id IN (
        -- This subquery runs first, creating a temporary list of booking IDs.
        -- The outer query then has to check each booking against this list.
        SELECT booking_id FROM Payments WHERE amount > 500
    );

--------------------------------------------------------------------------------
-- Step 2: Analyze the Query's Performance
--
-- You would run the following command in your database tool to see the plan.
-- Look for high "cost" estimates and multiple, inefficient steps.
--------------------------------------------------------------------------------

EXPLAIN ANALYZE
SELECT
    b.booking_id,
    u.user_name,
    p.property_name
FROM
    Bookings b
JOIN
    Users u ON u.user_id = b.user_id
JOIN
    Properties p ON p.property_id = b.property_id
WHERE
    b.booking_id IN (
        SELECT booking_id FROM Payments WHERE amount > 500
    );

--------------------------------------------------------------------------------
-- Step 3: Refactor the Query for Better Performance
--
-- We replace the subquery with a direct JOIN to the Payments table.
-- This allows the database to build a more efficient plan from the start.
-- It's like creating a streamlined assembly line instead of a scavenger hunt.
--------------------------------------------------------------------------------

SELECT
    b.booking_id,
    u.user_name,
    p.property_name,
    py.amount  -- We can now easily access columns from the Payments table too!
FROM
    Bookings b
JOIN
    Users u ON u.user_id = b.user_id
JOIN
    Properties p ON p.property_id = b.property_id
-- This JOIN is more efficient. It connects all tables and filters them in one go.
JOIN
    Payments py ON b.booking_id = py.booking_id
WHERE
    py.amount > 500; -- The filter is now a simple WHERE clause.
