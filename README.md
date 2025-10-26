ALX Airbnb Database Project
📘 Overview

This project is part of the ALX Backend Specialization — Database Module.
It focuses on designing, normalizing, and implementing a relational database for an Airbnb-like platform, covering every step from conceptual modeling to data population.

The goal is to build a production-ready database schema that supports core Airbnb features such as:

User management (guests, hosts, admins)

Property listings

Bookings and payments

Reviews

Messaging between users

🧱 Project Structure
alx-airbnb-database/
│
├── ERD/
│   └── requirements.md           # Entity-Relationship Diagram documentation
│
├── normalization.md              # Normalization explanation (to 3NF)
│
├── database-script-0x01/
│   ├── schema.sql                # SQL script to create tables and constraints
│   └── README.md                 # Description of schema setup
│
├── database-script-0x02/
│   ├── seed.sql                  # SQL script to populate database with sample data
│   └── README.md                 # Description of sample data
│
└── README.md                     # (You are here) Project overview

🧩 1. Entity-Relationship Design (ERD)

Objective: Identify entities, attributes, and relationships.

Key Entities:

User (Guest / Host / Admin)

Property

Booking

Payment

Review

Message

Tools: Draw.io or Lucidchart

Output File: ERD/requirements.md

Example Relationships:

A User can own multiple properties (Host → Property: 1–M)

A User can book multiple properties (Guest → Booking: 1–M)

A Booking has one payment (1–1)

A Property can have multiple reviews (1–M)

A Message links two users (User ↔ User)

⚙️ 2. Normalization

Objective: Ensure the database design is in Third Normal Form (3NF).

Steps:

Removed repeating groups (1NF)

Removed partial dependencies (2NF)

Removed transitive dependencies (3NF)

Result: Each table represents a single concept, with foreign keys maintaining relationships.

Output File: normalization.md

🧰 3. Database Schema (DDL)

Objective: Implement the database design in SQL using CREATE TABLE statements.

Features:

UUIDs as primary keys

Proper data types (VARCHAR, DECIMAL, TIMESTAMP)

Foreign key constraints

ENUMs for roles, payment methods, and booking statuses

Indexes for query optimization

Output File: database-script-0x01/schema.sql

To execute:

mysql -u root -p < database-script-0x01/schema.sql

💾 4. Database Seeding (DML)

Objective: Insert sample data for testing and demonstration.

Content: Realistic examples of users, properties, bookings, payments, reviews, and messages.

Output File: database-script-0x02/seed.sql

To execute:

mysql -u root -p < database-script-0x02/seed.sql

🧠 5. Key Design Considerations

Scalability: UUIDs used as primary keys for distributed environments.

Data Integrity: Strict constraints and ENUM checks for valid data.

Performance: Indexing on frequently queried columns (email, property_id, booking_id).

Security: Passwords stored as hashes.

Normalization: Fully compliant with 3NF.

🧪 Example Query Scenarios

List all available properties in Accra

SELECT name, location, price_per_night
FROM properties
WHERE location LIKE '%Accra%';


Find all bookings by a specific user

SELECT b.booking_id, p.name, b.start_date, b.end_date, b.status
FROM bookings b
JOIN properties p ON b.property_id = p.property_id
WHERE b.user_id = '11111111-1111-1111-1111-111111111111';


View reviews for a property

SELECT u.first_name, u.last_name, r.rating, r.comment
FROM reviews r
JOIN users u ON r.user_id = u.user_id
WHERE r.property_id = 'aaaa1111-aaaa-1111-aaaa-111111111111';

🧾 Technologies Used

Database: MySQL (or PostgreSQL)

Design Tool: Draw.io

Language: SQL (DDL & DML)

Documentation: Markdown
