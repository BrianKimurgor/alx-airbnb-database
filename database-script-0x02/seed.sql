-- Insert sample data into the User table
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at) VALUES
(UUID(), 'John', 'Doe', 'john.doe@example.com', 'hashedpassword1', '1234567890', 'guest', CURRENT_TIMESTAMP),
(UUID(), 'Jane', 'Smith', 'jane.smith@example.com', 'hashedpassword2', '0987654321', 'host', CURRENT_TIMESTAMP),
(UUID(), 'Admin', 'User', 'admin@example.com', 'hashedpassword3', NULL, 'admin', CURRENT_TIMESTAMP);

-- Insert sample data into the Property table
INSERT INTO Property (property_id, host_id, name, description, location, price_per_night, created_at, updated_at) VALUES
(UUID(), (SELECT user_id FROM User WHERE email = 'jane.smith@example.com'), 'Cozy Cottage', 'A cozy cottage in the countryside.', 'Countryside, USA', 150.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(UUID(), (SELECT user_id FROM User WHERE email = 'jane.smith@example.com'), 'Modern Apartment', 'A modern apartment in the city center.', 'City Center, USA', 200.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Insert sample data into the Booking table
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at) VALUES
(UUID(),
(SELECT property_id FROM Property WHERE name = 'Cozy Cottage'),
(SELECT user_id FROM User WHERE email = 'john.doe@example.com'),
'2024-12-01', '2024-12-05', 600.00, 'confirmed', CURRENT_TIMESTAMP),
(UUID(),
(SELECT property_id FROM Property WHERE name = 'Modern Apartment'),
(SELECT user_id FROM User WHERE email = 'john.doe@example.com'),
'2024-12-10', '2024-12-15', 1000.00, 'pending', CURRENT_TIMESTAMP);

-- Insert sample data into the Payment table
INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method) VALUES
(UUID(),
(SELECT booking_id FROM Booking WHERE total_price = 600.00),
600.00, CURRENT_TIMESTAMP, 'credit_card'),
(UUID(),
(SELECT booking_id FROM Booking WHERE total_price = 1000.00),
1000.00, CURRENT_TIMESTAMP, 'paypal');

-- Insert sample data into the Review table
INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at) VALUES
(UUID(),
(SELECT property_id FROM Property WHERE name = 'Cozy Cottage'),
(SELECT user_id FROM User WHERE email = 'john.doe@example.com'),
5, 'Amazing stay! Highly recommended.', CURRENT_TIMESTAMP),
(UUID(),
(SELECT property_id FROM Property WHERE name = 'Modern Apartment'),
(SELECT user_id FROM User WHERE email = 'john.doe@example.com'),
4, 'Great apartment, but a bit noisy.', CURRENT_TIMESTAMP);

-- Insert sample data into the Message table
INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at) VALUES
(UUID(),
(SELECT user_id FROM User WHERE email = 'john.doe@example.com'),
(SELECT user_id FROM User WHERE email = 'jane.smith@example.com'),
'Hi, is the Cozy Cottage available for these dates?', CURRENT_TIMESTAMP),
(UUID(),
(SELECT user_id FROM User WHERE email = 'jane.smith@example.com'),
(SELECT user_id FROM User WHERE email = 'john.doe@example.com'),
'Yes, the Cozy Cottage is available! Looking forward to hosting you.', CURRENT_TIMESTAMP);
