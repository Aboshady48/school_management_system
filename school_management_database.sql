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



--data insertion
INSERT INTO student (student_id, f_name, l_name, birth_date, class_id, gender, address, phone_number, university_email) VALUES
(1, 'Ahmed', 'Ali', '2007-04-10', 1, 'Male', '10 Sidi Gaber, Alexandria', '01001234567', 'ahmed.ali@school.edu'),
(2, 'Salma', 'Hassan', '2006-11-22', 1, 'Female', '15 Miami, Alexandria', '01002345678', 'salma.hassan@school.edu'),
(3, 'Omar', 'Youssef', '2007-01-05', 2, 'Male', '22 Smouha, Alexandria', '01003456789', 'omar.youssef@school.edu'),
(4, 'Nour', 'Mahmoud', '2006-09-15', 2, 'Female', '30 Cleopatra, Alexandria', '01004567890', 'nour.mahmoud@school.edu'),
(5, 'Kareem', 'Said', '2007-06-18', 1, 'Male', '18 Sporting, Alexandria', '01005678901', 'kareem.said@school.edu'),
(6, 'Laila', 'Fathy', '2006-02-25', 3, 'Female', '25 Camp Caesar, Alexandria', '01006789012', 'laila.fathy@school.edu'),
(7, 'Hassan', 'Tamer', '2007-12-02', 2, 'Male', '12 Al Agamy, Alexandria', '01007890123', 'hassan.tamer@school.edu'),
(8, 'Farah', 'Adel', '2007-05-19', 1, 'Female', '35 Laurent, Alexandria', '01008901234', 'farah.adel@school.edu'),
(9, 'Yousef', 'Kamal', '2006-10-08', 3, 'Male', '40 Roushdy, Alexandria', '01009012345', 'yousef.kamal@school.edu'),
(10, 'Mariam', 'Nabil', '2007-08-30', 2, 'Female', '19 Mandara, Alexandria', '01010123456', 'mariam.nabil@school.edu'),
(11, 'Ziad', 'Ahmed', '2007-03-17', 1, 'Male', '55 Azarita, Alexandria', '01011234567', 'ziad.ahmed@school.edu'),
(12, 'Rana', 'Gamal', '2006-07-25', 2, 'Female', '60 Stanley, Alexandria', '01012345678', 'rana.gamal@school.edu'),
(13, 'Tarek', 'Yehia', '2007-09-12', 3, 'Male', '33 Abu Qir, Alexandria', '01013456789', 'tarek.yehia@school.edu'),
(14, 'Nada', 'Omar', '2006-01-10', 1, 'Female', '70 Shatby, Alexandria', '01014567890', 'nada.omar@school.edu'),
(15, 'Ali', 'Hassan', '2007-11-22', 2, 'Male', '20 Victoria, Alexandria', '01015678901', 'ali.hassan@school.edu'),
(16, 'Sarah', 'Mohamed', '2006-03-15', 3, 'Female', '45 Sidi Bishr, Alexandria', '01016789012', 'sarah.mohamed@school.edu'),
(17, 'Mostafa', 'Ashraf', '2007-06-01', 1, 'Male', '36 Fleming, Alexandria', '01017890123', 'mostafa.ashraf@school.edu'),
(18, 'Aya', 'Fouad', '2006-12-11', 2, 'Female', '41 Al Ibrahimia, Alexandria', '01018901234', 'aya.fouad@school.edu'),
(19, 'Yara', 'Samir', '2007-10-20', 3, 'Female', '52 Al Hadra, Alexandria', '01019012345', 'yara.samir@school.edu'),
(20, 'Omar', 'Reda', '2006-08-08', 1, 'Male', '60 Dekheila, Alexandria', '01020123456', 'omar.reda@school.edu');

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
