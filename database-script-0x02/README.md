# Database Sample Data Population Script for Airbnb Clone

This README provides an overview of the SQL script used to populate the Airbnb clone database with sample data. The script inserts sample records into all the main tables (`User`, `Property`, `Booking`, `Payment`, `Review`, and `Message`) to simulate real-world usage and establish relationships between the entities.

---

## Purpose

The script:
- Demonstrates how data flows and interacts within the system.
- Provides a base dataset for testing and development purposes.
- Helps validate database relationships, constraints, and application logic.

---

## Tables and Sample Data Overview

### 1. **User Table**
The `User` table contains records for three user roles:
- **Guest**: A user who makes bookings.
- **Host**: A user who lists properties.
- **Admin**: A user with administrative privileges.

| Field            | Example Data               |
|-------------------|----------------------------|
| user_id          | UUID()                     |
| first_name       | John, Jane, Admin          |
| last_name        | Doe, Smith, User           |
| email            | john.doe@example.com       |
| role             | guest, host, admin         |

---

### 2. **Property Table**
The `Property` table holds details about the properties listed by hosts.

| Field            | Example Data                |
|-------------------|-----------------------------|
| property_id      | UUID()                      |
| host_id          | References a user_id        |
| name             | Cozy Cottage, Modern Apartment |
| location         | Countryside, City Center    |

---

### 3. **Booking Table**
The `Booking` table records details about property reservations.

| Field            | Example Data                |
|-------------------|-----------------------------|
| booking_id       | UUID()                      |
| property_id      | References a property_id    |
| user_id          | References a user_id        |
| start_date       | 2024-12-01                  |
| end_date         | 2024-12-05                  |
| total_price      | 600.00                      |
| status           | confirmed, pending          |

---

### 4. **Payment Table**
The `Payment` table tracks payments for bookings.

| Field            | Example Data                |
|-------------------|-----------------------------|
| payment_id       | UUID()                      |
| booking_id       | References a booking_id     |
| amount           | 600.00                      |
| payment_method   | credit_card, paypal         |

---

### 5. **Review Table**
The `Review` table stores feedback provided by guests.

| Field            | Example Data                |
|-------------------|-----------------------------|
| review_id        | UUID()                      |
| property_id      | References a property_id    |
| user_id          | References a user_id        |
| rating           | 1 to 5                      |
| comment          | "Amazing stay!"            |

---

### 6. **Message Table**
The `Message` table facilitates communication between users.

| Field            | Example Data                |
|-------------------|-----------------------------|
| message_id       | UUID()                      |
| sender_id        | References a user_id        |
| recipient_id     | References a user_id        |
| message_body     | "Hi, is the property available?" |

---

## Execution Instructions

1. **Database Setup**: Ensure the database schema is already created using the [schema definition script](#).
2. **Run Script**: Execute the sample data script in your SQL client:
   ```bash
   source seed.sql;
   ```
3. **Verify Data**: Use SELECT statements to confirm data has been inserted:
   ```sql
   SELECT * FROM User;
   SELECT * FROM Property;
   ```

---

## Relationships Established

- **User-Property**: A host lists multiple properties.
- **User-Booking**: A guest makes bookings.
- **Property-Booking**: Each booking is linked to a specific property.
- **Booking-Payment**: Payments are associated with bookings.
- **User-Review**: Guests leave reviews for properties.
- **User-Message**: Users exchange messages.

---

## Notes

- **UUIDs**: Automatically generated using `UUID()` for unique identification.
- **Dates**: Use real-world dates to mimic realistic scenarios.
- **Constraints**: Adheres to all foreign key constraints and ensures referential integrity.

---

## Sample Usage Scenarios

1. **Guest Experience**:
   - Guest searches for a property, books it, and makes a payment.
   - Guest leaves a review after their stay.

2. **Host Experience**:
   - Host lists properties and communicates with potential guests.

3. **Admin Tasks**:
   - Admin verifies data integrity and manages users.

---
