CREATE DATABASE school_management_database;


CREATE TABLE student (
    student_id INT PRIMARY KEY,
    f_name VARCHAR(100),
    l_name VARCHAR(100),
    birth_date DATE,
    class_id INT,
    gender VARCHAR(10),
    address VARCHAR(255),
    phone_number VARCHAR(15),
    university_email VARCHAR(100)
);


CREATE TABLE teacher(
    teacher_id INT PRIMARY KEY,
    full_name VARCHAR(100),
    subject VARCHAR(100),
    phone_number VARCHAR(15),
    email VARCHAR(100)
);

CREATE TABLE subject(
    subject_id INT PRIMARY KEY,
    subject_name VARCHAR(100) NOT NULL,
    subject_code VARCHAR(20) NOT NULL,
    teacher_id INT,
    FOREIGN KEY (teacher_id) REFERENCES teacher(teacher_id)
);

CREATE TABLE class(
    class_id INT PRIMARY KEY,
    class_name VARCHAR(100) NOT NULL,
    class_code VARCHAR(20) NOT NULL,
    teacher_id INT,
    FOREIGN KEY (teacher_id) REFERENCES teacher(teacher_id)
);

CREATE TABLE attendance(
    attendance_id INT PRIMARY KEY,
    student_id INT,
    class_id INT,
    attendance_date DATE,
    status VARCHAR(10),
    FOREIGN KEY (student_id) REFERENCES student(student_id),
    FOREIGN KEY (class_id) REFERENCES class(class_id)
);

CREATE TABLE grades(
    grade_id INT PRIMARY KEY,
    student_id INT,
    subject_id INT,
    class_id INT,
    grade DECIMAL(5, 2),
    FOREIGN KEY (student_id) REFERENCES student(student_id),
    FOREIGN KEY (subject_id) REFERENCES subject(subject_id),
    FOREIGN KEY (class_id) REFERENCES class(class_id)
);

CREATE TABLE exam(
    exam_id INT PRIMARY KEY,
    subject_id INT,
    class_id INT,
    exam_date DATE,
    FOREIGN KEY (subject_id) REFERENCES subject(subject_id),
    FOREIGN KEY (class_id) REFERENCES class(class_id)
);

CREATE TABLE exam_results(
    result_id INT PRIMARY KEY,
    exam_id INT,
    student_id INT,
    grade DECIMAL(5, 2),
    FOREIGN KEY (exam_id) REFERENCES exam(exam_id),
    FOREIGN KEY (student_id) REFERENCES student(student_id)
);

CREATE TABLE schedule(
    schedule_id INT PRIMARY KEY,
    class_id INT REFERENCES class(class_id),
    teacher_id INT REFERENCES teacher(teacher_id),
    subject_id INT REFERENCES subject(subject_id),
    start_time TIME,
    end_time TIME,
    day_of_week VARCHAR(10)
);

CREATE TABLE parents(
    parent_id INT PRIMARY KEY,
    student_id INT,
    full_name VARCHAR(100),
    phone_number VARCHAR(15),
    email VARCHAR(100),
    FOREIGN KEY (student_id) REFERENCES student(student_id)
);

SELECT 
    student_id,
    f_name + ' ' + l_name AS full_name,
    gender,
    birth_date,
    address,
    phone_number,
    university_email,
    class_id
FROM student
ORDER BY student_id;
