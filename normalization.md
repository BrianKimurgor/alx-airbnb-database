# Normalization Process for Airbnb Clone Database (3NF)

## Introduction
Normalization is the process of organizing a database to reduce redundancy and improve data integrity. The Airbnb clone database schema has been reviewed and adjusted to ensure it adheres to the principles of the **Third Normal Form (3NF)**. This document explains the normalization steps taken.

---

## Principles of Normalization
### First Normal Form (1NF)
- Each column contains atomic values.
- Each column contains values of the same data type.
- Each record is unique.

### Second Normal Form (2NF)
- The schema is in 1NF.
- All non-key attributes are fully functionally dependent on the primary key.

### Third Normal Form (3NF)
- The schema is in 2NF.
- There are no transitive dependencies (non-key attributes depend only on the primary key).

---

## Original Schema and Adjustments

### **1. User Table**
#### Original Design:
- **Attributes**: `user_id`, `first_name`, `last_name`, `email`, `password_hash`, `phone_number`, `role`, `created_at`.

#### Analysis:
- Already in 3NF as:
  - The primary key (`user_id`) determines all other attributes.
  - No non-key attributes depend on other non-key attributes.

#### Final Design:
No changes needed.

---

### **2. Property Table**
#### Original Design:
- **Attributes**: `property_id`, `host_id`, `name`, `description`, `location`, `price_per_night`, `created_at`, `updated_at`.

#### Analysis:
- Already in 3NF as:
  - The primary key (`property_id`) determines all other attributes.
  - No transitive dependencies.

#### Final Design:
No changes needed.

---

### **3. Booking Table**
#### Original Design:
- **Attributes**: `booking_id`, `property_id`, `user_id`, `start_date`, `end_date`, `total_price`, `status`, `created_at`.

#### Analysis:
- Potential issue: `total_price` is a derived attribute that can be calculated from `price_per_night` and the duration (`end_date - start_date`).

#### Adjustment:
- Removed `total_price` from the table to avoid redundancy.
- The total price will be calculated dynamically during queries.

#### Final Design:
- **Attributes**: `booking_id`, `property_id`, `user_id`, `start_date`, `end_date`, `status`, `created_at`.

---

### **4. Payment Table**
#### Original Design:
- **Attributes**: `payment_id`, `booking_id`, `amount`, `payment_date`, `payment_method`.

#### Analysis:
- Already in 3NF as:
  - The primary key (`payment_id`) determines all other attributes.
  - No transitive dependencies.

#### Final Design:
No changes needed.

---

### **5. Review Table**
#### Original Design:
- **Attributes**: `review_id`, `property_id`, `user_id`, `rating`, `comment`, `created_at`.

#### Analysis:
- Already in 3NF as:
  - The primary key (`review_id`) determines all other attributes.
  - No transitive dependencies.

#### Final Design:
No changes needed.

---

### **6. Message Table**
#### Original Design:
- **Attributes**: `message_id`, `sender_id`, `recipient_id`, `message_body`, `sent_at`.

#### Analysis:
- Already in 3NF as:
  - The primary key (`message_id`) determines all other attributes.
  - No transitive dependencies.

#### Final Design:
No changes needed.

---

## Summary of Changes
| Table     | Attribute        | Issue Identified                     | Action Taken                 | Normalization Level |
|-----------|------------------|--------------------------------------|-----------------------------|---------------------|
| `User`    | N/A              | None                                 | No changes needed           | 3NF                 |
| `Property`| N/A              | None                                 | No changes needed           | 3NF                 |
| `Booking` | `total_price`    | Derived attribute causing redundancy | Removed from table          | 3NF                 |
| `Payment` | N/A              | None                                 | No changes needed           | 3NF                 |
| `Review`  | N/A              | None                                 | No changes needed           | 3NF                 |
| `Message` | N/A              | None                                 | No changes needed           | 3NF                 |

---

## Benefits of Normalization
- **Reduced Redundancy**: Avoids duplicate storage of derived attributes.
- **Data Integrity**: Ensures consistent and accurate data.
- **Scalability**: Simplifies future schema updates.
- **Efficient Storage**: Minimizes storage usage.

---

## Conclusion
The database schema for the Airbnb clone project has been normalized to 3NF. This ensures that it is optimized for data integrity, efficiency, and scalability.
