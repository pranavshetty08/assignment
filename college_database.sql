CREATE TABLE departments (
  department_id INTEGER PRIMARY KEY,
  department_name TEXT NOT NULL,
  building TEXT NOT NULL
);

CREATE TABLE students (
  student_id INTEGER PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  age INTEGER NOT NULL,
  department_id INTEGER,
  gpa REAL,
  fees_paid INTEGER,
  FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

CREATE TABLE courses (
  course_id INTEGER PRIMARY KEY,
  course_name TEXT NOT NULL,
  department_id INTEGER,
  credits INTEGER,
  FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

INSERT INTO departments VALUES
(1, 'Computer Science', 'Block A'),
(2, 'Commerce', 'Block B'),
(3, 'Electronics', 'Block C');

INSERT INTO students VALUES
(101, 'Aarav', 'Sharma', 19, 1, 8.7, 45000),
(102, 'Diya', 'Patel', 20, 1, 9.1, 46000),
(103, 'Rohan', 'Mehta', 18, 2, 7.8, 39000),
(104, 'Ananya', 'Rao', 21, 3, 8.4, 42000),
(105, 'Kabir', 'Khan', 20, 2, 7.2, 40000),
(106, 'Meera', 'Iyer', 19, 1, 8.9, 45500),
(107, 'Vivaan', 'Singh', 22, 3, 8.1, 43000),
(108, 'Saanvi', 'Nair', 18, 2, 8.5, 39500),
(109, 'Aditya', 'Verma', 21, 1, 7.6, 47000),
(110, 'Isha', 'Das', 20, 3, 9.0, 42500);

INSERT INTO courses VALUES
(201, 'Database Management Systems', 1, 4),
(202, 'Data Structures', 1, 4),
(203, 'Financial Accounting', 2, 3),
(204, 'Business Economics', 2, 3),
(205, 'Digital Electronics', 3, 4);


SELECT * FROM students;
SELECT * FROM departments;
SELECT * FROM courses;

SELECT first_name, last_name, gpa
FROM students
WHERE gpa > 8.5;

SELECT s.student_id, s.first_name, s.last_name, d.department_name
FROM students s
JOIN departments d ON s.department_id = d.department_id;


SELECT COUNT(*) AS total_students FROM students;
SELECT AVG(gpa) AS average_gpa FROM students;
SELECT MAX(gpa) AS highest_gpa FROM students;
SELECT MIN(gpa) AS lowest_gpa FROM students;
SELECT SUM(fees_paid) AS total_fees_paid FROM students;


SELECT d.department_name, COUNT(s.student_id) AS student_count
FROM departments d
JOIN students s ON d.department_id = s.department_id
GROUP BY d.department_name;

SELECT d.department_name, AVG(s.gpa) AS average_gpa
FROM departments d
JOIN students s ON d.department_id = s.department_id
GROUP BY d.department_name;



-- COUNT counts rows, such as total students.
-- AVG calculates the average of a numeric column, such as average GPA.
-- MAX finds the highest value, such as highest GPA.
-- MIN finds the lowest value, such as lowest GPA.
-- SUM adds numeric values, such as total fees paid.