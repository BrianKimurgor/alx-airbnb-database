-- Step 1: Rename the existing Booking table
ALTER TABLE Booking RENAME TO Booking_old;

-- Step 2: Create a new Booking table with partitions
CREATE TABLE Booking (
    id INT NOT NULL,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    PRIMARY KEY (id, start_date)
) PARTITION BY RANGE (YEAR(start_date)) (
    PARTITION p_before_2020 VALUES LESS THAN (2020),
    PARTITION p_2020 VALUES LESS THAN (2021),
    PARTITION p_2021 VALUES LESS THAN (2022),
    PARTITION p_2022 VALUES LESS THAN (2023),
    PARTITION p_2023_and_beyond VALUES LESS THAN MAXVALUE
);

-- Step 3: Migrate data from the old table to the new partitioned table
INSERT INTO Booking (id, user_id, property_id, start_date, end_date)
SELECT id, user_id, property_id, start_date, end_date FROM Booking_old;

-- Step 4: Drop the old Booking table if the migration is successful
DROP TABLE Booking_old;
