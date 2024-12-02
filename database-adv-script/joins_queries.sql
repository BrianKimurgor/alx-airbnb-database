-- 1. INNER JOIN to retrieve all bookings and the respective users who made those bookings
SELECT
    bookings.id AS booking_id,
    bookings.property_id,
    bookings.booking_date,
    users.id AS user_id,
    users.name AS user_name,
    users.email AS user_email
FROM
    bookings
INNER JOIN
    users
ON
    bookings.user_id = users.id;


SELECT
    properties.id AS property_id,
    properties.name AS property_name,
    properties.location,
    reviews.id AS review_id,
    reviews.rating,
    reviews.comment
FROM
    properties
LEFT JOIN
    reviews
ON
    properties.id = reviews.property_id
ORDER BY
    properties.name ASC, -- Orders properties alphabetically by name
    reviews.rating DESC; -- Orders reviews within each property by rating in descending order



-- 3. FULL OUTER JOIN to retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user
SELECT
    users.id AS user_id,
    users.name AS user_name,
    users.email AS user_email,
    bookings.id AS booking_id,
    bookings.property_id,
    bookings.booking_date
FROM
    users
LEFT JOIN
    bookings
ON
    users.id = bookings.user_id

UNION

SELECT
    users.id AS user_id,
    users.name AS user_name,
    users.email AS user_email,
    bookings.id AS booking_id,
    bookings.property_id,
    bookings.booking_date
FROM
    users
RIGHT JOIN
    bookings
ON
    users.id = bookings.user_id;
