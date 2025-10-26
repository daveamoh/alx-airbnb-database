-- Airbnb Database Seed Script
-- Inserts realistic sample data for testing and development

-- ==========================
-- USERS
-- ==========================
INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
('11111111-1111-1111-1111-111111111111', 'John', 'Doe', 'john.doe@example.com', 'hashed_password_1', '233501234567', 'guest'),
('22222222-2222-2222-2222-222222222222', 'Alice', 'Smith', 'alice.smith@example.com', 'hashed_password_2', '233541112233', 'host'),
('33333333-3333-3333-3333-333333333333', 'Mark', 'Johnson', 'mark.johnson@example.com', 'hashed_password_3', '233505556677', 'guest'),
('44444444-4444-4444-4444-444444444444', 'Grace', 'Brown', 'grace.brown@example.com', 'hashed_password_4', '233507788990', 'host');

-- ==========================
-- PROPERTIES
-- ==========================
INSERT INTO properties (property_id, host_id, name, description, location, price_per_night)
VALUES
('aaaa1111-aaaa-1111-aaaa-111111111111', '22222222-2222-2222-2222-222222222222', 'Accra Beach Apartment', 'Beautiful beachfront apartment in Accra.', 'Labadi Beach, Accra', 250.00),
('bbbb2222-bbbb-2222-bbbb-222222222222', '44444444-4444-4444-4444-444444444444', 'Kumasi Garden Villa', 'Quiet villa surrounded by nature.', 'Ahodwo, Kumasi', 180.00),
('cccc3333-cccc-3333-cccc-333333333333', '22222222-2222-2222-2222-222222222222', 'Takoradi City Lodge', 'Modern city lodge close to the port.', 'Takoradi', 200.00);

-- ==========================
-- BOOKINGS
-- ==========================
INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
('bkg11111-1111-1111-1111-111111111111', 'aaaa1111-aaaa-1111-aaaa-111111111111', '11111111-1111-1111-1111-111111111111', '2025-11-10', '2025-11-15', 1250.00, 'confirmed'),
('bkg22222-2222-2222-2222-222222222222', 'bbbb2222-bbbb-2222-bbbb-222222222222', '33333333-3333-3333-3333-333333333333', '2025-12-01', '2025-12-05', 720.00, 'pending');

-- ==========================
-- PAYMENTS
-- ==========================
INSERT INTO payments (payment_id, booking_id, amount, payment_method)
VALUES
('pay11111-1111-1111-1111-111111111111', 'bkg11111-1111-1111-1111-111111111111', 1250.00, 'credit_card'),
('pay22222-2222-2222-2222-222222222222', 'bkg22222-2222-2222-2222-222222222222', 720.00, 'paypal');

-- ==========================
-- REVIEWS
-- ==========================
INSERT INTO reviews (review_id, property_id, user_id, rating, comment)
VALUES
('rev11111-1111-1111-1111-111111111111', 'aaaa1111-aaaa-1111-aaaa-111111111111', '11111111-1111-1111-1111-111111111111', 5, 'Amazing stay! The view was fantastic.'),
('rev22222-2222-2222-2222-222222222222', 'bbbb2222-bbbb-2222-bbbb-222222222222', '33333333-3333-3333-3333-333333333333', 4, 'Nice and quiet, loved the garden.');

-- ==========================
-- MESSAGES
-- ==========================
INSERT INTO messages (message_id, sender_id, recipient_id, message_body)
VALUES
('msg11111-1111-1111-1111-111111111111', '11111111-1111-1111-1111-111111111111', '22222222-2222-2222-2222-222222222222', 'Hello Alice, I’m interested in booking your apartment.'),
('msg22222-2222-2222-2222-222222222222', '22222222-2222-2222-2222-222222222222', '11111111-1111-1111-1111-111111111111', 'Hi John! Sure, the apartment is available in November.');
