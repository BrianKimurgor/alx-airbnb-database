-- Initial query for retrieving bookings with user, property, and payment details
EXPLAIN 
SELECT 
    Booking.id AS booking_id,
    Booking.start_date,
    Booking.end_date,
    User.id AS user_id,
    User.name AS user_name,
    User.email AS user_email,
    Property.id AS property_id,
    Property.name AS property_name,
    Property.location AS property_location,
    Payment.id AS payment_id,
    Payment.amount AS payment_amount,
    Payment.status AS payment_status
FROM 
    Booking, User, Property, Payment
WHERE 
    Booking.user_id = User.id
    AND Booking.property_id = Property.id
    AND Booking.id = Payment.booking_id;




-- Refactored query for performance optimization
EXPLAIN 
SELECT 
    B.id AS booking_id,
    B.start_date,
    B.end_date,
    U.id AS user_id,
    U.name AS user_name,
    P.id AS property_id,
    P.name AS property_name,
    PY.amount,
    PY.status AS payment_status
FROM 
    Booking B
JOIN 
    User U ON B.user_id = U.id
JOIN 
    Property P ON B.property_id = P.id
LEFT JOIN 
    Payment PY ON B.id = PY.booking_id;

