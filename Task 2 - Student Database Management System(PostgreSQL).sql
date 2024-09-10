-- 1. Create the student_table

CREATE TABLE student_table (
    student_id SERIAL PRIMARY KEY,           -- Auto-incrementing primary key
    stu_name TEXT NOT NULL,                 -- Student's name (cannot be null)
    department TEXT,                        -- Department (optional)
    email_id TEXT UNIQUE,                   -- Email address (must be unique)
    phone_no VARCHAR(15),                   -- Phone number (allows for formatting)
    address TEXT,                           -- Address (optional)
    date_of_birth DATE,                     -- Date of birth
    gender TEXT CHECK (gender IN ('Male', 'Female', 'Other')), -- Gender with allowed values
    major TEXT,                             -- Major (optional)
    gpa NUMERIC(3, 2),                      -- GPA
    grade CHAR(1) CHECK (grade IN ('A', 'B', 'C', 'D', 'E', 'F'))  -- Grade with allowed values
);

-- 2. Insert 10 sample records into student_table

INSERT INTO student_table (stu_name, department, email_id, phone_no, address, date_of_birth, gender, major, gpa, grade)
VALUES
('Aditya Mehta', 'Computer Science', 'aditya@techmail.com', '2343454567', '123 Elm St', '1995-04-12', 'Male', 'Software Engineering', 9.05, 'A'),
('Vikram Singh', 'Mathematics', 'vikram@mathworld.com', '3192972191', '456 Maple Ave', '1992-11-03', 'Male', 'Applied Mathematics', 8.40, 'B'),
('Sanya Patel', 'Economics', 'sanya@ecoworld.com', '9871112312', '789 Oak Rd', '1996-02-28', 'Female', 'International Economics', 8.20, 'B'),
('Rohit Sharma', 'Biology', 'rohit@biologyhub.com', '1001001001', '456 Pine St', '1994-06-12', 'Male', 'Molecular Biology', 5.70, 'D'),
('Sneha Rao', 'Physics', 'sneha@astro.com', '4567890123', '111 Sunset Blvd', '1999-07-15', 'Female', 'Astrophysics', 7.40, 'C'),
('Ravi Kumar', 'Chemistry', 'ravi@chemgenius.com', '5678901234', '222 Sunrise Rd', '1997-10-25', 'Male', 'Organic Chemistry', 8.70, 'B'),
('Arjun Verma', 'Engineering', 'arjun@civileng.com', '7777777777', '333 Hilltop Dr', '1995-09-07', 'Male', 'Civil Engineering', 9.20, 'A'),
('Kriti Desai', 'History', 'kriti@historian.com', '8901234567', '444 Lakeview Ln', '1998-12-30', 'Female', 'Modern History', 4.60, 'E'),
('Neha Sharma', 'Philosophy', 'neha@philworld.com', '9012345678', '555 River Rd', '1996-08-22', 'Female', 'Ethics', 7.90, 'C'),
('Aman Gupta', 'Psychology', 'aman@psychoworld.com', '1123456789', '666 Cedar Ln', '2000-01-15', 'Male', 'Clinical Psychology', 8.80, 'B');

-- 3. Retrieve all students' information sorted by grade in ascending order

SELECT * 
FROM student_table
ORDER BY grade ASC;

-- 4. Query for Male Students

SELECT *
FROM student_table
WHERE gender = 'Male';

-- 5. Query for Students with GPA less than 5.0

SELECT *
FROM student_table
WHERE gpa < 5.0;

-- 6. Update Student Email and Grade for a specific ID

UPDATE student_table
SET email_id = 'formerstudent@newmail.com',  
    grade = 'B',
    gpa = '8.90'
WHERE student_id = 1;

-- Retrieve the updated record to show changes

SELECT *
FROM student_table
WHERE student_id = 1;

-- 7. Query for Students with Grade "B" and their ages

SELECT stu_name,
       EXTRACT(YEAR FROM AGE(date_of_birth)) AS age
FROM student_table
WHERE grade = 'B';

-- 8. Group students by Department and Gender, and calculate the average GPA

SELECT department,
       gender,
       ROUND(AVG(gpa), 2) AS average_gpa
FROM student_table
GROUP BY department, gender
ORDER BY department, gender;

-- 9. Rename the student_table to student_info

ALTER TABLE student_table
RENAME TO student_info;

-- 10. Retrieve the student with the highest GPA

SELECT stu_name
FROM student_info
ORDER BY GPA DESC
LIMIT 1;
