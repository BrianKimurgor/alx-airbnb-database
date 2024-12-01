-- Index for User Table
CREATE INDEX idx_user_email ON users(email); -- Optimize searches by email
CREATE INDEX idx_user_id ON users(id); -- Already indexed if it's a primary key

-- Index for Booking Table
CREATE INDEX idx_booking_user_id ON bookings(user_id); -- Optimize joins with the User table
CREATE INDEX idx_booking_property_id ON bookings(property_id); -- Optimize joins with the Property table
CREATE INDEX idx_booking_created_at ON bookings(created_at); -- Optimize filtering by date

-- Index for Property Table
CREATE INDEX idx_property_location ON properties(location); -- Optimize filtering by location
CREATE INDEX idx_property_name ON properties(name); -- Optimize searching by name
CREATE INDEX idx_property_id ON properties(id); -- Already indexed if it's a primary key
