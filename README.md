# school_management_system

Sure Mohamed! Here's a **simple explanation in English** that your friend can easily understand:

---

## 🎓 **Database Name:**

`school_management_database`
This is a school management system database. It helps organize everything related to:

* Students
* Teachers
* Subjects
* Classes
* Attendance
* Grades
* Exams
* Parents
* Class Schedules

---

## 📋 **Main Tables & What They Do:**

### 1. `student`

Stores student information:

* First and last name
* Birth date
* Gender
* Address
* Phone number
* University email
* `class_id`: links the student to their class

---

### 2. `teacher`

Stores teacher info:

* Full name
* The subject they teach
* Phone number
* Email

---

### 3. `subject`

Stores subject data:

* Subject name and code
* `teacher_id`: links the subject to the teacher who teaches it

---

### 4. `class`

Stores class details:

* Class name and code
* `teacher_id`: teacher responsible for the class

---

### 5. `attendance`

Tracks which student attended on which date:

* Uses `student_id`, `class_id`, and `attendance_date`
* Also records attendance `status` (e.g., Present, Absent)

---

### 6. `grades`

Stores students' grades:

* Which student got what grade in which subject and class

---

### 7. `exam`

Stores exam details:

* When the exam happened
* For which class and subject

---

### 8. `exam_results`

Stores exam results:

* Which student got what grade in which exam

---

### 9. `schedule`

Stores class schedules:

* When and which class has which subject
* Who’s the teacher
* Start time, end time, and day of the week

---

### 10. `parents`

Stores parent information:

* Name, phone, and email
* Linked to the `student_id` of their child

---

## 🔗 **Relationships Between Tables:**

* `class_id`: connects students, attendance, exams, grades, and schedules to their class
* `teacher_id`: connects teachers to subjects, classes, and schedules
* `subject_id`: connects subjects to grades, exams, and schedules
* `student_id`: connects students to attendance, grades, exam results, and parents
* `exam_id`: connects exam results to exams

---

## 📌 Example to Make It Clear:

Let’s say:

* A student named **Ali Ahmed**
* Is in class **1A**
* His math teacher is **Mr. Mahmoud**

Then:

* Ali’s data goes into the `student` table
* Class "1A" goes into the `class` table
* Mr. Mahmoud’s info goes into `teacher`
* Math subject is added to `subject`, linked to Mr. Mahmoud
* If Ali attends class or takes an exam, that gets saved in `attendance`, `exam`, and `exam_results`

---

## 🧾 About Your SQL Query:

```sql
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
```

This shows all students:

* Combines first name + last name as `full_name`
* Displays their gender, birth date, address, phone, email, and class ID

⚠️ If you're using **PostgreSQL**, use:

```sql
f_name || ' ' || l_name AS full_name
```

Instead of `f_name + ' ' + l_name`

---

Let me know if your friend wants to **add sample data** (like 20 students), write **more queries**, or build a **simple interface**. I can help with that too!
