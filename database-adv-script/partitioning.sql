-- ==========================================================
-- TABLE PARTITIONING FOR PERFORMANCE OPTIMIZATION
-- ==========================================================
-- Objective:
-- Implement partitioning on the "bookings" table based on the start_date column
-- to improve query performance on large datasets.
-- ==========================================================


-- 1️⃣ STEP 1: Create the parent partitioned table
-- Note: The parent table holds the structure, not the data.

DROP TABLE IF EXISTS bookings_partitioned CASCADE;

CREATE TABLE bookings_partitioned (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)
PARTITION BY RANGE (start_date);


-- 2️⃣ STEP 2: Create partitions based on year (you can adapt ranges as needed)

CREATE TABLE bookings_2023 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE bookings_2024 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE bookings_2025 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');


-- 3️⃣ STEP 3: Add indexes to partitions to further optimize performance
CREATE INDEX idx_bookings_2023_start_date ON bookings_2023 (start_date);
CREATE INDEX idx_bookings_2024_start_date ON bookings_2024 (start_date);
CREATE INDEX idx_bookings_2025_start_date ON bookings_2025 (start_date);


-- 4️⃣ STEP 4: Insert sample data into the partitioned table (for testing)
INSERT INTO bookings_partitioned (user_id, property_id, start_date, end_date, status)
VALUES
(1, 2, '2023-05-01', '2023-05-10', 'completed'),
(2, 1, '2024-03-15', '2024-03-20', 'cancelled'),
(3, 4, '2025-02-05', '2025-02-08', 'pending'),
(4, 2, '2025-03-10', '2025-03-15', 'confirmed'),
(5, 3, '2024-11-12', '2024-11-20', 'completed');


-- 5️⃣ STEP 5: Test query performance using EXPLAIN ANALYZE
-- Before partitioning (original bookings table):
-- EXPLAIN ANALYZE SELECT * FROM bookings WHERE start_date BETWEEN '2025-01-01' AND '2025-03-31';

-- After partitioning:
EXPLAIN ANALYZE 
SELECT * FROM bookings_partitioned 
WHERE start_date BETWEEN '2025-01-01' AND '2025-03-31';

-- Expected result: The query planner scans only the relevant partition (bookings_2025)
-- instead of the entire dataset.
