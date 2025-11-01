# Database Performance Monitoring and Refinement

## 1. Monitoring Queries

We used the following queries to analyze performance:

### Example Queries
```sql
-- Query 1: Fetch all active bookings with user and property details
EXPLAIN ANALYZE
SELECT b.id, u.name AS user_name, p.name AS property_name, b.start_date, b.end_date
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
WHERE b.status = 'active';

-- Query 2: Fetch bookings made within the last 30 days
EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE start_date >= CURRENT_DATE - INTERVAL '30 days';
