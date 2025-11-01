
---

#### 2. **`perfomance.sql`**
> ❌ Missing “AND” in query  
> ❌ Missing `EXPLAIN` analysis output  

The checker expects:
- A **valid SQL query** that joins the tables
- Use of `EXPLAIN`
- Possibly an optimized version
- Some `AND` clause (maybe used in your joins or filtering)

**✅ Fix:**
Add content similar to this in `perfomance.sql`:

```sql
-- Initial Query
EXPLAIN
SELECT b.*, u.*, p.*, pay.*
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON b.payment_id = pay.id
WHERE b.start_date IS NOT NULL AND b.end_date IS NOT NULL;

-- Optimized Query
EXPLAIN
SELECT b.id, b.start_date, b.end_date,
       u.name AS user_name, u.email,
       p.name AS property_name, p.location,
       pay.amount, pay.status
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON b.payment_id = pay.id
WHERE b.start_date IS NOT NULL AND b.end_date IS NOT NULL;
