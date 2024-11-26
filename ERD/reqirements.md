# Requirements Documentation for Airbnb Clone Database Design

## Introduction
This document outlines the detailed requirements for designing the database for the Airbnb clone project. The database is central to the system, managing users, properties, bookings, payments, reviews, and messaging. It is structured to ensure scalability, security, and efficiency while supporting the core functionalities of the application.

---

## Entities and Attributes

### 1. User
- **Description**: Represents guests, hosts, and admins.
- **Attributes**:
  - `user_id`: Primary Key, UUID, unique, indexed.
  - `first_name`: VARCHAR, not null.
  - `last_name`: VARCHAR, not null.
  - `email`: VARCHAR, unique, not null.
  - `password_hash`: VARCHAR, not null.
  - `phone_number`: VARCHAR, nullable.
  - `role`: ENUM (guest, host, admin), not null.
  - `created_at`: TIMESTAMP, default CURRENT_TIMESTAMP.
- **Constraints**:
  - Unique constraint on `email`.
  - Non-null constraints on required fields.

---

### 2. Property
- **Description**: Represents properties listed by hosts.
- **Attributes**:
  - `property_id`: Primary Key, UUID, unique, indexed.
  - `host_id`: Foreign Key, references `User.user_id`.
  - `name`: VARCHAR, not null.
  - `description`: TEXT, not null.
  - `location`: VARCHAR, not null.
  - `price_per_night`: DECIMAL, not null.
  - `created_at`: TIMESTAMP, default CURRENT_TIMESTAMP.
  - `updated_at`: TIMESTAMP, auto-updates on change.
- **Constraints**:
  - Foreign Key constraint on `host_id`.
  - Non-null constraints on essential attributes.

---

### 3. Booking
- **Description**: Represents reservations made by guests for properties.
- **Attributes**:
  - `booking_id`: Primary Key, UUID, unique, indexed.
  - `property_id`: Foreign Key, references `Property.property_id`.
  - `user_id`: Foreign Key, references `User.user_id`.
  - `start_date`: DATE, not null.
  - `end_date`: DATE, not null.
  - `total_price`: DECIMAL, not null.
  - `status`: ENUM (pending, confirmed, canceled), not null.
  - `created_at`: TIMESTAMP, default CURRENT_TIMESTAMP.
- **Constraints**:
  - Foreign Key constraints on `property_id` and `user_id`.
  - Enum constraint on `status`.

---

### 4. Payment
- **Description**: Tracks payments made for bookings.
- **Attributes**:
  - `payment_id`: Primary Key, UUID, unique, indexed.
  - `booking_id`: Foreign Key, references `Booking.booking_id`.
  - `amount`: DECIMAL, not null.
  - `payment_date`: TIMESTAMP, default CURRENT_TIMESTAMP.
  - `payment_method`: ENUM (credit_card, paypal, stripe), not null.
- **Constraints**:
  - Foreign Key constraint on `booking_id`.

---

### 5. Review
- **Description**: Captures feedback from guests on properties.
- **Attributes**:
  - `review_id`: Primary Key, UUID, unique, indexed.
  - `property_id`: Foreign Key, references `Property.property_id`.
  - `user_id`: Foreign Key, references `User.user_id`.
  - `rating`: INTEGER, constrained between 1-5, not null.
  - `comment`: TEXT, not null.
  - `created_at`: TIMESTAMP, default CURRENT_TIMESTAMP.
- **Constraints**:
  - Foreign Key constraints on `property_id` and `user_id`.
  - Check constraint on `rating` (1-5).

---

### 6. Message
- **Description**: Handles communication between users.
- **Attributes**:
  - `message_id`: Primary Key, UUID, unique, indexed.
  - `sender_id`: Foreign Key, references `User.user_id`.
  - `recipient_id`: Foreign Key, references `User.user_id`.
  - `message_body`: TEXT, not null.
  - `sent_at`: TIMESTAMP, default CURRENT_TIMESTAMP.
- **Constraints**:
  - Foreign Key constraints on `sender_id` and `recipient_id`.

---

## Relationships

### 1. User ↔ Property
- A `User` (host) can list multiple `Properties`.
- One-to-Many Relationship.

### 2. Property ↔ Booking
- A `Property` can have multiple `Bookings`.
- A `Booking` belongs to a single `Property`.
- One-to-Many Relationship.

### 3. User ↔ Booking
- A `User` (guest) can make multiple `Bookings`.
- A `Booking` belongs to a single `User`.
- One-to-Many Relationship.

### 4. Booking ↔ Payment
- A `Booking` can have one `Payment`.
- A `Payment` is linked to a single `Booking`.
- One-to-One Relationship.

### 5. Property ↔ Review
- A `Property` can have multiple `Reviews`.
- A `Review` belongs to a single `Property`.
- One-to-Many Relationship.

### 6. User ↔ Review
- A `User` (guest) can write multiple `Reviews`.
- A `Review` belongs to a single `User`.
- One-to-Many Relationship.

### 7. User ↔ Message
- A `User` can send and receive multiple `Messages`.
- Many-to-Many Relationship.

---

## Indexing and Performance

### Indexes
- **Primary Keys**: Auto-indexed.
- **Additional Indexes**:
  - `email` in the `User` table for fast lookups.
  - `property_id` in the `Property` and `Booking` tables.
  - `booking_id` in the `Booking` and `Payment` tables.

### Optimization Techniques
- Use JOIN queries for related data retrieval.
- Implement caching for frequently accessed data like popular properties or reviews.
- Optimize queries for large datasets with appropriate indexing.

---

## Validation Rules

- **User**: Unique and valid email, strong password hashing (e.g., bcrypt).
- **Property**: Validate required fields like `name`, `location`, and `price_per_night`.
- **Booking**: Ensure `start_date` is before `end_date`, check for overlapping dates.
- **Review**: Allow only one review per user per booking.

---

## Security Measures

- Encrypt sensitive data (e.g., passwords).
- Use role-based access control (RBAC) to manage permissions.
- Implement secure Foreign Key constraints to maintain referential integrity.

---