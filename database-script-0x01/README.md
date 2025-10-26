# Database Schema Design (DDL)

## Objective
Define the Airbnb database schema using SQL `CREATE TABLE` statements based on the given specification.

## Description
This schema represents an Airbnb-like platform that connects hosts and guests through property listings, bookings, payments, reviews, and messaging.

## Entities
1. **User**
   - Stores guest, host, and admin information.
   - Unique email constraint.

2. **Property**
   - Linked to the host (`users.user_id`).
   - Contains details about the accommodation and price.

3. **Booking**
   - Links a user to a property for a specific period.
   - Tracks status (`pending`, `confirmed`, `canceled`).

4. **Payment**
   - Tied to a booking.
   - Stores transaction amount and method.

5. **Review**
   - Written by users about properties.
   - Ratings restricted to 1–5.

6. **Message**
   - Communication between users.

## Constraints and Indexes
- **Primary Keys**: All entities use UUIDs.
- **Foreign Keys**: Maintain referential integrity across related tables.
- **Indexes**: Added to frequently queried columns such as `email`, `property_id`, `booking_id`, etc.
- **Checks**: Validate data ranges, e.g., ratings between 1 and 5.

## Normalization
The schema adheres to **Third Normal Form (3NF)**:
- Each attribute depends on the primary key.
- No transitive dependencies.
- No repeating groups or redundant data.

## Usage
Run the schema using any SQL client:
```bash
mysql -u root -p < schema.sql
