# Database Schema for Airbnb Clone

## Overview

This project implements a robust and normalized database schema for an Airbnb clone application. The schema is designed to handle core functionality, including user management, property listings, bookings, payments, reviews, and messaging between users. The schema is defined using SQL with the `IF NOT EXISTS` clause to ensure idempotence and prevent errors when tables already exist.

## Features

- **Idempotent Design**: Ensures `CREATE TABLE` statements can be executed multiple times without causing errors.
- **Normalized Schema**: Implements third normal form (3NF) for efficient data storage and retrieval.
- **Constraints and Relationships**: Defines primary keys, foreign keys, unique constraints, and other data integrity rules.
- **Indexing**: Adds indexes to improve query performance on frequently searched columns.

---

## Entities and Tables

### 1. **User Table**
Stores information about users, including guests, hosts, and admins.

| Column         | Data Type        | Constraints                       |
|----------------|------------------|-----------------------------------|
| `user_id`      | `UUID`           | Primary Key                      |
| `first_name`   | `VARCHAR(255)`   | NOT NULL                         |
| `last_name`    | `VARCHAR(255)`   | NOT NULL                         |
| `email`        | `VARCHAR(255)`   | UNIQUE, NOT NULL                 |
| `password_hash`| `VARCHAR(255)`   | NOT NULL                         |
| `phone_number` | `VARCHAR(15)`    | NULL                             |
| `role`         | `ENUM`           | Values: `guest`, `host`, `admin` |
| `created_at`   | `TIMESTAMP`      | Default: Current Timestamp       |

---

### 2. **Property Table**
Stores property listings associated with hosts.

| Column           | Data Type        | Constraints                       |
|------------------|------------------|-----------------------------------|
| `property_id`    | `UUID`           | Primary Key                      |
| `host_id`        | `UUID`           | Foreign Key → `User(user_id)`    |
| `name`           | `VARCHAR(255)`   | NOT NULL                         |
| `description`    | `TEXT`           | NOT NULL                         |
| `location`       | `VARCHAR(255)`   | NOT NULL                         |
| `price_per_night`| `DECIMAL(10, 2)` | NOT NULL                         |
| `created_at`     | `TIMESTAMP`      | Default: Current Timestamp       |
| `updated_at`     | `TIMESTAMP`      | Updated Automatically            |

---

### 3. **Booking Table**
Tracks user bookings for properties.

| Column       | Data Type        | Constraints                          |
|--------------|------------------|--------------------------------------|
| `booking_id` | `UUID`           | Primary Key                         |
| `property_id`| `UUID`           | Foreign Key → `Property(property_id)`|
| `user_id`    | `UUID`           | Foreign Key → `User(user_id)`       |
| `start_date` | `DATE`           | NOT NULL                            |
| `end_date`   | `DATE`           | NOT NULL                            |
| `status`     | `ENUM`           | Values: `pending`, `confirmed`, `canceled` |
| `created_at` | `TIMESTAMP`      | Default: Current Timestamp          |

---

### 4. **Payment Table**
Logs payments for bookings.

| Column          | Data Type        | Constraints                         |
|-----------------|------------------|-------------------------------------|
| `payment_id`    | `UUID`           | Primary Key                        |
| `booking_id`    | `UUID`           | Foreign Key → `Booking(booking_id)`|
| `amount`        | `DECIMAL(10, 2)` | NOT NULL                           |
| `payment_date`  | `TIMESTAMP`      | Default: Current Timestamp         |
| `payment_method`| `ENUM`           | Values: `credit_card`, `paypal`, `stripe` |

---

### 5. **Review Table**
Stores user reviews of properties.

| Column       | Data Type      | Constraints                          |
|--------------|----------------|--------------------------------------|
| `review_id`  | `UUID`         | Primary Key                         |
| `property_id`| `UUID`         | Foreign Key → `Property(property_id)`|
| `user_id`    | `UUID`         | Foreign Key → `User(user_id)`       |
| `rating`     | `INTEGER`      | 1 ≤ `rating` ≤ 5, NOT NULL          |
| `comment`    | `TEXT`         | NOT NULL                            |
| `created_at` | `TIMESTAMP`    | Default: Current Timestamp          |

---

### 6. **Message Table**
Enables communication between users.

| Column        | Data Type  | Constraints                       |
|---------------|------------|-----------------------------------|
| `message_id`  | `UUID`     | Primary Key                      |
| `sender_id`   | `UUID`     | Foreign Key → `User(user_id)`    |
| `recipient_id`| `UUID`     | Foreign Key → `User(user_id)`    |
| `message_body`| `TEXT`     | NOT NULL                         |
| `sent_at`     | `TIMESTAMP`| Default: Current Timestamp       |

---

## How to Use

1. Copy the SQL script from [schema.sql](schema.sql).
2. Execute the script in your database management system (e.g., MySQL, PostgreSQL).
3. Ensure that the database engine supports UUIDs, ENUMs, and TIMESTAMP fields.

---

## Additional Features

- **Indexes**:
  - Email field in `User` table for fast lookups.
  - Foreign key columns in `Property`, `Booking`, `Payment`, and `Message` tables.
  
- **Constraints**:
  - Ensures data integrity through foreign keys.
  - Validation for specific fields like `rating` and `status`.

---

## License

This schema is open-source and can be used or modified for educational or commercial purposes.