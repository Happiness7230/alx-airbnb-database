SELECT
    b.booking_id,       -- Select the booking ID from the Bookings table
    b.booking_date,     -- Select the booking date from the Bookings table
    u.user_id,          -- Select the user ID from the Users table
    u.user_name,        -- Select the user's name from the Users table
    u.email             -- Select the user's email from the Users table
FROM
    Bookings b          -- Start with the Bookings table (aliased as 'b' for brevity)
INNER JOIN
    Users u ON b.user_id = u.user_id; -- Join it with the Users table (aliased as 'u') where the user_id in both tables match.
    SELECT
    p.property_id,      -- Select the property ID from the Properties table
    p.property_name,    -- Select the property name from the Properties table
    r.review_text,      -- Select the review text from the Reviews table
    r.rating            -- Select the rating from the Reviews table
FROM
    Properties p        -- Start with the Properties table (our "left" table)
LEFT JOIN
    Reviews r ON p.property_id = r.property_id; -- Join with Reviews where property_id matches.
                                                -- If a property has no matching review, review_text and rating will be NULL.
SELECT
    u.user_id,          -- Select user ID from the Users table
    u.user_name,        -- Select user name from the Users table
    b.booking_id,       -- Select booking ID from the Bookings table
    b.booking_date      -- Select booking date from the Bookings table
FROM
    Users u             -- Start with the Users table
FULL OUTER JOIN
    Bookings b ON u.user_id = b.user_id; -- Join with Bookings where user_id matches.
                                         -- This will include all users (with or without bookings)
                                         -- and all bookings (with or without users).
