# SQL Table Partitioning Performance Report – ALX Airbnb Database

## 🎯 Objective
Improve query performance on the large `bookings` table by implementing **range partitioning** based on the `start_date` column.

---

## 🧩 Step 1: Problem Overview
The original `bookings` table contained millions of rows, making date range queries such as:

```sql
SELECT * FROM bookings WHERE start_date BETWEEN '2025-01-01' AND '2025-03-31';
