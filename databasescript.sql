START TRANSACTION;
DROP TABLE IF EXISTS enrollments;
DROP TABLE IF EXISTS courses;
DROP TABLE IF EXISTS students;

CREATE TABLE students(
student_id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
enrollment_year INT NOT NULL);

CREATE TABLE courses(
course_id INT AUTO_INCREMENT PRIMARY KEY,
course_code VARCHAR(20) NOT NULL,
course_name VARCHAR(50) NOT NULL,
credits INT NOT NULL DEFAULT 3);

CREATE TABLE enrollments(
enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
student_id INT NOT NULL,
course_id INT NOT NULL,
semester VARCHAR(50) NOT NULL,
grade CHAR(2),
FOREIGN KEY (student_id) REFERENCES students(student_id),
FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

INSERT INTO students (first_name,last_name,enrollment_year) VALUES
('Edward','Jones',2025),
('Bob','Williams',2026);

INSERT INTO courses(course_code,course_name,credits) VALUES
('LC1','Introduction to JavaScript',3),
('LC2','Introduction to Java',4);

INSERT INTO enrollments(student_id,course_id,semester,grade) VALUES
(1,1,'spring 2025','A+'),
(2,2,'Fall 2025','B'),
(2,1,'Fall 2025','A-');

COMMIT;
SELECT * FROM students;
SELECT * FROM courses;
SELECT * FROM enrollments;