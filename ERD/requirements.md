🧩 Entities and Attributes
1. User

Primary Key: user_id (UUID)

Attributes:

first_name (VARCHAR, NOT NULL)

last_name (VARCHAR, NOT NULL)

email (VARCHAR, UNIQUE, NOT NULL)

password_hash (VARCHAR, NOT NULL)

phone_number (VARCHAR, NULL)

role (ENUM: guest, host, admin, NOT NULL)

created_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

Notes:

Each User can act as a guest, host, or admin.

2. Property

Primary Key: property_id (UUID)

Foreign Key: host_id → User(user_id)

Attributes:

name (VARCHAR, NOT NULL)

description (TEXT, NOT NULL)

location (VARCHAR, NOT NULL)

pricepernight (DECIMAL, NOT NULL)

created_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

updated_at (TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP)

Notes:

A property is owned by one host (User).

A host can have many properties.

3. Booking

Primary Key: booking_id (UUID)

Foreign Keys:

property_id → Property(property_id)

user_id → User(user_id)

Attributes:

start_date (DATE, NOT NULL)

end_date (DATE, NOT NULL)

total_price (DECIMAL, NOT NULL)

status (ENUM: pending, confirmed, canceled, NOT NULL)

created_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

Notes:

A user (guest) can make many bookings.

A property can have many bookings.

4. Payment

Primary Key: payment_id (UUID)

Foreign Key: booking_id → Booking(booking_id)

Attributes:

amount (DECIMAL, NOT NULL)

payment_date (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

payment_method (ENUM: credit_card, paypal, stripe, NOT NULL)

Notes:

Each booking can have one or more payments, depending on your business logic (usually one).

5. Review

Primary Key: review_id (UUID)

Foreign Keys:

property_id → Property(property_id)

user_id → User(user_id)

Attributes:

rating (INTEGER, CHECK: 1–5, NOT NULL)

comment (TEXT, NOT NULL)

created_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

Notes:

A user can leave many reviews.

A property can have many reviews.

6. Message

Primary Key: message_id (UUID)

Foreign Keys:

sender_id → User(user_id)

recipient_id → User(user_id)

Attributes:

message_body (TEXT, NOT NULL)

sent_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

Notes:

Messages occur between users (guest ↔ host).
