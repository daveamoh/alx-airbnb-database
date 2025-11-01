-- Create indexes on frequently used columns in Users, Bookings, and Properties tables

-- Users table: often queried by email or id
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_id ON users(id);

-- Bookings table: used in WHERE, JOIN, and ORDER BY clauses
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_start_date ON bookings(start_date);
CREATE INDEX idx_bookings_status ON bookings(status);

-- Properties table: commonly used for searches and joins
CREATE INDEX idx_properties_city ON properties(city);
CREATE INDEX idx_properties_id ON properties(id);

-- Measure query performance before and after using EXPLAIN or ANALYZE
EXPLAIN ANALYZE
SELECT * 
FROM bookings 
WHERE start_date >= '2025-01-01' 
ORDER BY start_date;

EXPLAIN ANALYZE
SELECT u.name, COUNT(b.id) AS total_bookings
FROM users u
JOIN bookings b ON u.id = b.user_id
GROUP BY u.name;
