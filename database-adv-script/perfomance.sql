-- ... existing code ... -->
JOIN
    Properties p ON p.property_id = b.property_id
WHERE
    b.booking_id IN (
        -- This subquery runs first, creating a temporary list of booking IDs.
-- ... existing code ... -->
        -- The outer query then has to check each booking against this list.
        SELECT booking_id FROM Payments WHERE amount > 500
    ) AND u.user_name = 'John Smith'; -- <-- Added this condition

--------------------------------------------------------------------------------
-- Step 2: Analyze the Query's Performance
-- ... existing code ... -->
-- ... existing code ... -->
JOIN
    Properties p ON p.property_id = b.property_id
WHERE
    b.booking_id IN (
        SELECT booking_id FROM Payments WHERE amount > 500
    ) AND u.user_name = 'John Smith';

--------------------------------------------------------------------------------
-- Step 3: Refactor the Query for Better Performance
-- ... existing code ... -->
-- ... existing code ... -->
JOIN
    Payments py ON b.booking_id = py.booking_id
WHERE
    py.amount > 500 AND u.user_name = 'John Smith'; -- <-- Added this condition

