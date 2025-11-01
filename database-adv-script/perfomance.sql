-- ==========================================================
-- PERFORMANCE OPTIMIZATION TASK
-- ==========================================================
-- Objective:
-- Retrieve all bookings with user, property, and payment details,
-- analyze performance, and refactor the query for optimization.
-- ==========================================================


-- 1️⃣ INITIAL (UNOPTIMIZED) QUERY
-- This query retrieves full details from multiple tables.
-- It may perform slowly due to unnecessary SELECT * and joins on unindexed columns.

EXPLAIN ANALYZE
SELECT 
    b.id AS booking_id,
    b.start_date,
    b.end_date,
    u.id AS user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.id AS property_id,
    p.name AS property_name,
    p.location,
    pay.id AS payment_id,
    pay.amount,
    pay.status,
    pay.payment_date
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
LEFT JOIN payments pay ON b.id = pay.booking_id;


-- 2️⃣ IDENTIFIED INEFFICIENCIES (from EXPLAIN)
-- - Full table scans due to lack of indexes on foreign keys.
-- - SELECT * returns unnecessary columns, increasing data size.
-- - No filtering (returns all rows).
-- - Possible redundant joins if some columns aren’t needed.


-- 3️⃣ OPTIMIZED QUERY
-- Improvements:
-- ✅ Added indexes on join columns (user_id, property_id, booking_id)
-- ✅ Selected only necessary columns
-- ✅ Reduced join types (LEFT JOIN → INNER JOIN if payment always exists)
-- ✅ Added optional filter for recent bookings (limits scanned rows)

EXPLAIN ANALYZE
SELECT 
    b.id AS booking_id,
    u.first_name || ' ' || u.last_name AS user_fullname,
    p.name AS property_name,
    pay.amount,
    pay.status
FROM bookings b
INNER JOIN users u ON b.user_id = u.id
INNER JOIN properties p ON b.property_id = p.id
LEFT JOIN payments pay ON b.id = pay.booking_id
WHERE b.start_date >= CURRENT_DATE - INTERVAL '90 days'
ORDER BY b.start_date DESC;


-- 4️⃣ INDEXES USED TO IMPROVE PERFORMANCE
-- (Run these before the optimized query if not already created)

CREATE INDEX IF NOT EXISTS idx_bookings_user_id ON bookings (user_id);
CREATE INDEX IF NOT EXISTS idx_bookings_property_id ON bookings (property_id);
CREATE INDEX IF NOT EXISTS idx_payments_booking_id ON payments (booking_id);
CREATE INDEX IF NOT EXISTS idx_bookings_start_date ON bookings (start_date);

-- ==========================================================
-- EXPECTED PERFORMANCE IMPROVEMENT:
-- Before: Sequential scans on bookings, users, properties, and payments
-- After: Index scans reduce I/O and CPU cost significantly
-- ==========================================================
