# SQL Index Optimization – ALX Airbnb Database

## 🎯 Objective
Identify high-usage columns in the `users`, `bookings`, and `properties` tables, create appropriate indexes, and measure their impact on query performance.

---

## 🧩 Step 1: Identify High-Usage Columns

| Table | Column | Usage Context | Reason for Index |
|--------|---------|----------------|------------------|
| `users` | `id` | JOINs with `bookings` | Primary key joins |
| `users` | `email` | Login queries (`WHERE email = ?`) | Frequent lookups |
| `bookings` | `user_id` | JOIN with users | Common relational link |
| `bookings` | `property_id` | JOIN with properties | Common relational link |
| `bookings` | `start_date`, `end_date` | Filtering or sorting | Date range searches |
| `properties` | `id` | JOIN with bookings/reviews | Primary key |
| `properties` | `location` | Searching/filtering | Improves text search |
| `reviews` | `property_id` | JOIN and aggregation | Review lookups |

---

## 🧱 Step 2: SQL – Create Indexes

```sql
-- USERS
CREATE INDEX idx_users_id ON users (id);
CREATE INDEX idx_users_email ON users (email);

-- BOOKINGS
CREATE INDEX idx_bookings_user_id ON bookings (user_id);
CREATE INDEX idx_bookings_property_id ON bookings (property_id);
CREATE INDEX idx_bookings_start_date ON bookings (start_date);
CREATE INDEX idx_bookings_end_date ON bookings (end_date);

-- PROPERTIES
CREATE INDEX idx_properties_id ON properties (id);
CREATE INDEX idx_properties_location ON properties (location);

-- REVIEWS
CREATE INDEX idx_reviews_property_id ON reviews (property_id);
