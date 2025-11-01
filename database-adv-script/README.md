# SQL Joins Practice – ALX Airbnb Database

## Objective
Master SQL joins by writing complex queries using different types of joins.

---

## 📘 Tasks

### 1️⃣ INNER JOIN
**Retrieve all bookings and the respective users who made those bookings.**
```sql
SELECT 
    b.id AS booking_id,
    b.property_id,
    b.user_id,
    b.start_date,
    b.end_date,
    u.first_name,
    u.last_name,
    u.email
FROM bookings b
INNER JOIN users u
    ON b.user_id = u.id;
