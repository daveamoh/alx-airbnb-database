# Database Seed Script

## Objective
Populate the Airbnb database with realistic sample data for testing, demos, or development.

## Description
This script inserts test data into all core entities: `users`, `properties`, `bookings`, `payments`, `reviews`, and `messages`.

Each record simulates real-world activity:
- **Users:** Includes both hosts and guests.
- **Properties:** Associated with hosts.
- **Bookings:** Represent guests reserving properties.
- **Payments:** Linked to bookings.
- **Reviews:** Feedback from guests after stays.
- **Messages:** Communication between users.

## Usage
Ensure the schema has already been created using `schema.sql`, then run:

```bash
mysql -u root -p < seed.sql
