# Airbnb Database Normalization

## Objective
To ensure the Airbnb database design follows the principles of normalization up to the **Third Normal Form (3NF)** — minimizing redundancy, ensuring data integrity, and optimizing relational structure.

---

## Step 1: First Normal Form (1NF)
**Rule:**  
- Each table must have a primary key.  
- All attributes must contain only atomic (indivisible) values.  
- There must be no repeating groups or arrays.

**Application:**  
- Each entity (`User`, `Property`, `Booking`, `Payment`, `Review`, `Message`) has a primary key (UUID).  
- All columns store atomic values — e.g., `first_name` and `last_name` are separate.  
- There are no repeating attributes or nested data (e.g., no arrays of phone numbers or addresses).  

✅ **Result:** All tables satisfy 1NF.

---

## Step 2: Second Normal Form (2NF)
**Rule:**  
- Must be in 1NF.  
- All non-key attributes must depend on the whole primary key, not just part of it.  
- Applies mainly to tables with composite primary keys.

**Application:**  
- No table in our schema uses a composite key — all use a single UUID as the primary key.  
- Therefore, all non-key attributes depend directly on their respective primary key.  
- Example:  
  - In `Booking`, attributes like `start_date`, `end_date`, and `total_price` depend entirely on `booking_id`.  
  - In `Property`, attributes like `location` and `pricepernight` depend on `property_id`.

✅ **Result:** All tables satisfy 2NF.

---

## Step 3: Third Normal Form (3NF)
**Rule:**  
- Must be in 2NF.  
- No transitive dependency — non-key attributes must not depend on other non-key attributes.

**Application:**  
- Each attribute depends only on its table’s primary key:  
  - `User`: `email`, `first_name`, `last_name`, etc. depend only on `user_id`.  
  - `Property`: all fields depend on `property_id`, not on `host_id` or any other non-key field.  
  - `Booking`: all fields depend on `booking_id`, not on `user_id` or `property_id`.  
  - `Payment`: all fields depend on `payment_id`, not indirectly on `booking_id`.  
  - `Review`: all fields depend on `review_id`.  
  - `Message`: all fields depend on `message_id`.  

✅ **Result:** The design meets 3NF — no redundant data, no partial or transitive dependencies.

---

## Summary of Normalization

| Normal Form | Criteria Met | Description |
|--------------|--------------|--------------|
| **1NF** | ✅ | All attributes are atomic and uniquely identified by primary keys. |
| **2NF** | ✅ | No partial dependencies (no composite primary keys). |
| **3NF** | ✅ | No transitive dependencies; all non-key attributes depend only on their primary key. |

---

## Final Notes
The database schema already adheres to **Third Normal Form (3NF)** without requiring structural changes.  
The design ensures:
- Minimal redundancy  
- High data consistency  
- Easy maintenance and scalability  

**Therefore, the Airbnb database is fully normalized to 3NF.**
