-- 1. Find the Total Number of Bookings Made by Each User
SELECT
    users.id AS user_id,
    users.name AS user_name,
    COUNT(bookings.id) AS total_bookings
FROM
    users
LEFT JOIN
    bookings
ON
    users.id = bookings.user_id
GROUP BY
    users.id, users.name
ORDER BY
    total_bookings DESC;


-- 2. Rank Properties Based on the Total Number of Bookings
-- using ROW_NUMBER
SELECT
    properties.id AS property_id,
    properties.name AS property_name,
    COUNT(bookings.id) AS total_bookings,
    ROW_NUMBER() OVER (ORDER BY COUNT(bookings.id) DESC) AS rank
FROM
    properties
LEFT JOIN
    bookings
ON
    properties.id = bookings.property_id
GROUP BY
    properties.id, properties.name
ORDER BY
    rank;

--using RANK
SELECT
    properties.id AS property_id,
    properties.name AS property_name,
    COUNT(bookings.id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(bookings.id) DESC) AS rank
FROM
    properties
LEFT JOIN
    bookings
ON
    properties.id = bookings.property_id
GROUP BY
    properties.id, properties.name
ORDER BY
    rank;
