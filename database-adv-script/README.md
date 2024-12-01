# **Advanced SQL Tasks for ALX-Airbnb Database**

This repository contains SQL scripts and documentation for advanced database operations, focusing on optimization, complex queries, and performance monitoring. Below is a description of each task and the associated deliverables.

---

## **Tasks Overview**

### **0. Write Complex Queries with Joins**
**Objective**: Master SQL joins by writing complex queries using different types of joins.

**Instructions**:
- Write an `INNER JOIN` query to retrieve all bookings and the respective users.
- Write a `LEFT JOIN` query to retrieve all properties and their reviews, including properties without reviews.
- Write a `FULL OUTER JOIN` query to retrieve all users and bookings, even if there is no relationship.

**Files**:
- `joins_queries.sql`: Contains all SQL queries for the task.
- `README.md`: Provides task documentation.

---

### **1. Practice Subqueries**
**Objective**: Write both correlated and non-correlated subqueries to extract meaningful data.

**Instructions**:
- Write a subquery to find properties with an average rating greater than 4.0.
- Write a correlated subquery to find users with more than 3 bookings.

**Files**:
- `subqueries.sql`: Contains all subquery solutions.
- `README.md`: Provides task documentation.

---

### **2. Apply Aggregations and Window Functions**
**Objective**: Use SQL aggregation and window functions for data analysis.

**Instructions**:
- Write a query using the `COUNT` function and `GROUP BY` to find the total number of bookings made by each user.
- Use window functions (`ROW_NUMBER`, `RANK`) to rank properties based on the total number of bookings.

**Files**:
- `aggregations_and_window_functions.sql`: Contains aggregation and window function queries.
- `README.md`: Provides task documentation.

---

### **3. Implement Indexes for Optimization**
**Objective**: Identify high-usage columns and create indexes to improve query performance.

**Instructions**:
- Identify columns in the `User`, `Booking`, and `Property` tables frequently used in `WHERE`, `JOIN`, and `ORDER BY`.
- Write `CREATE INDEX` commands for these columns.
- Measure query performance before and after indexing using `EXPLAIN` or `ANALYZE`.

**Files**:
- `database_index.sql`: Contains SQL commands to create indexes.
- `README.md`: Describes performance improvements and indexing rationale.

---

### **4. Optimize Complex Queries**
**Objective**: Refactor complex queries for better performance.

**Instructions**:
- Write an initial query to retrieve bookings, user details, property details, and payment details.
- Analyze the query performance using `EXPLAIN`.
- Refactor the query to reduce execution time (e.g., optimize joins, use indexes).

**Files**:
- `perfomance.sql`: Contains the initial and optimized queries.
- `optimization_report.md`: Documents inefficiencies and improvements.

---

### **5. Partitioning Large Tables**
**Objective**: Use table partitioning to optimize queries on large datasets.

**Instructions**:
- Partition the `Booking` table based on the `start_date` column.
- Test and compare query performance on the partitioned table.
- Write a brief report on observed performance improvements.

**Files**:
- `partitioning.sql`: Contains the SQL commands to create partitions.
- `partition_performance.md`: Details performance observations.

---

### **6. Monitor and Refine Database Performance**
**Objective**: Continuously monitor and refine database performance.

**Instructions**:
- Use tools like `SHOW PROFILE` or `EXPLAIN ANALYZE` to monitor query performance.
- Identify bottlenecks and suggest schema or query adjustments.
- Implement the changes and document the improvements.

**Files**:
- `performance_monitoring.md`: Contains monitoring results and recommended changes.

---

## **Repository Structure**
```plaintext
alx-airbnb-database/
├── database-adv-script/
│   ├── joins_queries.sql
│   ├── subqueries.sql
│   ├── aggregations_and_window_functions.sql
│   ├── database_index.sql
│   ├── perfomance.sql
│   ├── optimization_report.md
│   ├── partitioning.sql
│   ├── partition_performance.md
│   ├── performance_monitoring.md
│   └── README.md
```

---

## **Getting Started**
1. Clone the repository:
   ```bash
   git clone https://github.com/<your_username>/alx-airbnb-database.git
   ```
2. Navigate to the `database-adv-script` directory:
   ```bash
   cd alx-airbnb-database/database-adv-script
   ```
3. Use your preferred SQL tool to execute the scripts.

---

## **How to Test Query Performance**
- Use `EXPLAIN` or `EXPLAIN ANALYZE` to test queries.
- Compare execution plans before and after optimization (e.g., indexing, partitioning).

---

## **Contributions**
Contributions are welcome! Please open an issue or create a pull request with your improvements.

---

## **License**
This project is open-sourced under the [MIT License](https://opensource.org/licenses/MIT).

--- 

Feel free to update this `README.md` as the project progresses. 🚀