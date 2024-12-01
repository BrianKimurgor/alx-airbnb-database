### Step 1: **Identify High-Usage Columns**

Based on typical queries for the `User`, `Booking`, and `Property` tables, we commonly use the following columns in `WHERE`, `JOIN`, and `ORDER BY` clauses:
- **User Table**: `id` (primary key), `email` (used for authentication and uniqueness)
- **Booking Table**: `user_id`, `property_id`, `created_at` (used for filtering and sorting bookings)
- **Property Table**: `id` (primary key), `location` (often filtered), `name` (sometimes used for searching)

### Step 2: **Write SQL Commands to Create Indexes**

Save the following commands in a file named `database_index.sql`.

```sql
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
```

**Measure Query Performance Using EXPLAIN or ANALYZE**

#### Before Adding Indexes
1. Use `EXPLAIN` to analyze the query plan:
   ```sql
   EXPLAIN SELECT * 
   FROM bookings 
   JOIN users ON bookings.user_id = users.id 
   WHERE users.email = 'example@example.com';
   ```

2. Observe the output, particularly the **key** and **possible_keys** columns. These indicate whether an index is used.

#### After Adding Indexes
1. Re-run the query after adding indexes:
   ```sql
   EXPLAIN SELECT * 
   FROM bookings 
   JOIN users ON bookings.user_id = users.id 
   WHERE users.email = 'example@example.com';
   ```

2. You should notice:
   - The **key** column now shows the index being used (e.g., `idx_user_email`).
   - The query execution time is significantly reduced.

### Step 4: **Save and Document Performance Results**

Use `ANALYZE` to get detailed execution times:
```sql
ANALYZE SELECT * 
FROM bookings 
JOIN users ON bookings.user_id = users.id 
WHERE users.email = 'example@example.com';
```

Record both the pre-index and post-index performance metrics in your documentation or database log.  

---

**Key Notes**:
- Indexes improve read performance but can slightly slow down writes (e.g., `INSERT`, `UPDATE`, `DELETE`).
- Be selective with indexes to balance performance and storage usage.
- For highly repetitive queries, composite indexes may be helpful (e.g., `CREATE INDEX idx_user_email_created ON users(email, created_at);`).
