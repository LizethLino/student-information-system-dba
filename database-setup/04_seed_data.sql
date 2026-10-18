-- =============================================================================
-- Oracle Student Information System & DBA Lab
-- File: 04_seed_data.sql
-- Purpose: Populate the created tables with fictious but realistic data

-- IMPORTANT:
-- Run this script only once on an empty project schema.
-- Review the Script Output before committing the transaction.
-- Do not commit if any statement fails.
-- =============================================================================



-- ============================================================
-- 1. DEPARTMENTS
-- Parent table: no foreign-key dependencies.
-- ============================================================
INSERT INTO departments (department_name, office_location, active)
VALUES ('Computer Science', 'Building A, Room 201', TRUE);
INSERT INTO departments (department_name, office_location, active)
VALUES ('Mathematics', 'Building B, Room 105', TRUE);
INSERT INTO departments (department_name, office_location, active)
VALUES ('English', 'Building C, Room 110', TRUE);



-- ============================================================
-- 2. INSTRUCTORS
-- Each instructor belongs to an existing department.
-- ============================================================
INSERT INTO instructors (
employee_number, first_name, last_name, email,
department_id, hire_date, active
)
SELECT
'I1001', 'Maya', 'Thompson', 'maya.thompson@school.example',
department_id, DATE '2019-08-15', TRUE
FROM departments
WHERE department_name = 'Computer Science';
INSERT INTO instructors (
employee_number, first_name, last_name, email,
department_id, hire_date, active
)
SELECT
'I1002', 'Daniel', 'Kim', 'daniel.kim@school.example',
department_id, DATE '2021-01-10', TRUE
FROM departments
WHERE department_name = 'Computer Science';
INSERT INTO instructors (
employee_number, first_name, last_name, email,
department_id, hire_date, active
)
SELECT
'I2001', 'Olivia', 'Martinez', 'olivia.martinez@school.example',
department_id, DATE '2020-09-01', TRUE
FROM departments
WHERE department_name = 'Mathematics';
INSERT INTO instructors (
employee_number, first_name, last_name, email,
department_id, hire_date, active
)
SELECT
'I3001', 'James', 'Wilson', 'james.wilson@school.example',
department_id, DATE '2018-08-20', TRUE
FROM departments
WHERE department_name = 'English';



-- ============================================================
-- 3. STUDENTS
-- Student numbers are unique business identifiers.
-- ============================================================
INSERT INTO students (
student_number, first_name, last_name, date_of_birth,
email, enrollment_status
)
VALUES (
'S2026001', 'Ava', 'Johnson', DATE '2008-03-14',
'ava.johnson@student.example', 'ACTIVE'
);
INSERT INTO students (
student_number, first_name, last_name, date_of_birth,
email, enrollment_status
)
VALUES (
'S2026002', 'Noah', 'Garcia', DATE '2007-11-02',
'noah.garcia@student.example', 'ACTIVE'
);
INSERT INTO students (
student_number, first_name, last_name, date_of_birth,
email, enrollment_status
)
VALUES (
'S2026003', 'Sophia', 'Lee', DATE '2008-06-21',
'sophia.lee@student.example', 'ACTIVE'
);
INSERT INTO students (
student_number, first_name, last_name, date_of_birth,
email, enrollment_status
)
VALUES (
'S2026004', 'Liam', 'Brown', DATE '2007-09-18',
'liam.brown@student.example', 'ACTIVE'
);
INSERT INTO students (
student_number, first_name, last_name, date_of_birth,
email, enrollment_status
)
VALUES (
'S2026005', 'Isabella', 'Davis', DATE '2008-01-09',
'isabella.davis@student.example', 'ACTIVE'
);
INSERT INTO students (
student_number, first_name, last_name, date_of_birth,
email, enrollment_status
)
VALUES (
'S2026006', 'Lucas', 'Wilson', DATE '2007-12-27',
'lucas.wilson@student.example', 'ACTIVE'
);
INSERT INTO students (
student_number, first_name, last_name, date_of_birth,
email, enrollment_status
)
VALUES (
'S2026007', 'Mia', 'Taylor', DATE '2008-05-05',
'mia.taylor@student.example', 'ACTIVE'
);
INSERT INTO students (
student_number, first_name, last_name, date_of_birth,
email, enrollment_status
)
VALUES (
'S2026008', 'Ethan', 'Anderson', DATE '2007-07-30',
'ethan.anderson@student.example', 'ACTIVE'
);



-- ============================================================
-- 4. ACADEMIC TERMS
-- Include a closed term, an active term, and a planned term.
-- ============================================================
INSERT INTO academic_terms (
term_name, start_date, end_date, term_status
)
VALUES (
'Spring 2026', DATE '2026-01-20', DATE '2026-05-29', 'CLOSED'
);
INSERT INTO academic_terms (
term_name, start_date, end_date, term_status
)
VALUES (
'Fall 2026', DATE '2026-09-02', DATE '2026-12-22', 'ACTIVE'
);
INSERT INTO academic_terms (
term_name, start_date, end_date, term_status
)
VALUES (
'Spring 2027', DATE '2027-01-25', DATE '2027-06-04', 'PLANNED'
);



-- ============================================================
-- 5. COURSES
-- Each course belongs to an existing department.
-- ============================================================
INSERT INTO courses (course_code, course_name, department_id, credits, active)
SELECT 'CS101', 'Introduction to Programming', department_id, 3.0, TRUE
FROM departments
WHERE department_name = 'Computer Science';
INSERT INTO courses (course_code, course_name, department_id, credits, active)
SELECT 'CS201', 'Database Fundamentals', department_id, 3.0, TRUE
FROM departments
WHERE department_name = 'Computer Science';
INSERT INTO courses (course_code, course_name, department_id, credits, active)
SELECT 'CS220', 'Cybersecurity Fundamentals', department_id, 3.0, TRUE
FROM departments
WHERE department_name = 'Computer Science';
INSERT INTO courses (course_code, course_name, department_id, credits, active)
SELECT 'MATH101', 'Algebra II', department_id, 5.0, TRUE
FROM departments
WHERE department_name = 'Mathematics';
INSERT INTO courses (course_code, course_name, department_id, credits, active)
SELECT 'MATH201', 'Statistics', department_id, 3.0, TRUE
FROM departments
WHERE department_name = 'Mathematics';
INSERT INTO courses (course_code, course_name, department_id, credits, active)
SELECT 'ENG101', 'English Composition', department_id, 3.0, TRUE
FROM departments
WHERE department_name = 'English';



-- ============================================================
-- 6. APPLICATION USERS
-- These are application records, not Oracle login accounts.
-- ============================================================
INSERT INTO application_users (
username, display_name, staff_role, instructor_id, active
)
VALUES (
'sis.admin', 'SIS Administrator', 'ADMIN', NULL, TRUE
);
INSERT INTO application_users (
username, display_name, staff_role, instructor_id, active
)
VALUES (
'registrar.jones', 'Taylor Jones', 'REGISTRAR', NULL, TRUE
);
INSERT INTO application_users (
username, display_name, staff_role, instructor_id, active
)
SELECT
'maya.thompson', 'Maya Thompson', 'INSTRUCTOR', instructor_id, TRUE
FROM instructors
WHERE employee_number = 'I1001';
INSERT INTO application_users (
username, display_name, staff_role, instructor_id, active
)
SELECT
'daniel.kim', 'Daniel Kim', 'INSTRUCTOR', instructor_id, TRUE
FROM instructors
WHERE employee_number = 'I1002';
INSERT INTO application_users (
username, display_name, staff_role, instructor_id, active
)
SELECT
'olivia.martinez', 'Olivia Martinez', 'INSTRUCTOR', instructor_id, TRUE
FROM instructors
WHERE employee_number = 'I2001';
INSERT INTO application_users (
username, display_name, staff_role, instructor_id, active
)
SELECT
'james.wilson', 'James Wilson', 'INSTRUCTOR', instructor_id, TRUE
FROM instructors
WHERE employee_number = 'I3001';



-- ============================================================
-- 7. COURSE SECTIONS
-- A section connects a course, term, and instructor.
-- ============================================================
INSERT INTO course_sections (
course_id, term_id, instructor_id,
section_number, room_number, capacity
)
SELECT c.course_id, t.term_id, i.instructor_id, '01', 'A101', 25
FROM courses c
JOIN academic_terms t ON t.term_name = 'Spring 2026'
JOIN instructors i ON i.employee_number = 'I1001'
WHERE c.course_code = 'CS101';
INSERT INTO course_sections (
course_id, term_id, instructor_id,
section_number, room_number, capacity
)
SELECT c.course_id, t.term_id, i.instructor_id, '01', 'A102', 25
FROM courses c
JOIN academic_terms t ON t.term_name = 'Spring 2026'
JOIN instructors i ON i.employee_number = 'I1002'
WHERE c.course_code = 'CS201';
INSERT INTO course_sections (
course_id, term_id, instructor_id,
section_number, room_number, capacity
)
SELECT c.course_id, t.term_id, i.instructor_id, '01', 'B101', 25
FROM courses c
JOIN academic_terms t ON t.term_name = 'Spring 2026'
JOIN instructors i ON i.employee_number = 'I2001'
WHERE c.course_code = 'MATH101';
INSERT INTO course_sections (
course_id, term_id, instructor_id,
section_number, room_number, capacity
)
SELECT c.course_id, t.term_id, i.instructor_id, '01', 'C101', 25
FROM courses c
JOIN academic_terms t ON t.term_name = 'Spring 2026'
JOIN instructors i ON i.employee_number = 'I3001'
WHERE c.course_code = 'ENG101';
INSERT INTO course_sections (
course_id, term_id, instructor_id,
section_number, room_number, capacity
)
SELECT c.course_id, t.term_id, i.instructor_id, '01', 'A101', 25
FROM courses c
JOIN academic_terms t ON t.term_name = 'Fall 2026'
JOIN instructors i ON i.employee_number = 'I1001'
WHERE c.course_code = 'CS101';
INSERT INTO course_sections (
course_id, term_id, instructor_id,
section_number, room_number, capacity
)
SELECT c.course_id, t.term_id, i.instructor_id, '01', 'A102', 25
FROM courses c
JOIN academic_terms t ON t.term_name = 'Fall 2026'
JOIN instructors i ON i.employee_number = 'I1002'
WHERE c.course_code = 'CS201';
INSERT INTO course_sections (
course_id, term_id, instructor_id,
section_number, room_number, capacity
)
SELECT c.course_id, t.term_id, i.instructor_id, '01', 'B102', 25
FROM courses c
JOIN academic_terms t ON t.term_name = 'Fall 2026'
JOIN instructors i ON i.employee_number = 'I2001'
WHERE c.course_code = 'MATH201';
INSERT INTO course_sections (
course_id, term_id, instructor_id,
section_number, room_number, capacity
)
SELECT c.course_id, t.term_id, i.instructor_id, '01', 'C101', 25
FROM courses c
JOIN academic_terms t ON t.term_name = 'Fall 2026'
JOIN instructors i ON i.employee_number = 'I3001'
WHERE c.course_code = 'ENG101';
INSERT INTO course_sections (
course_id, term_id, instructor_id,
section_number, room_number, capacity
)
SELECT c.course_id, t.term_id, i.instructor_id, '01', 'A103', 25
FROM courses c
JOIN academic_terms t ON t.term_name = 'Spring 2027'
JOIN instructors i ON i.employee_number = 'I1002'
WHERE c.course_code = 'CS220';



-- ============================================================
-- 8. ENROLLMENTS
-- Eight completed Spring 2026 enrollments and eight active
-- Fall 2026 enrollments. IDs are looked up by unique values.
-- ============================================================
INSERT INTO enrollments (
student_id, section_id, enrollment_date,
enrollment_status, final_score
)
SELECT s.student_id, cs.section_id, DATE '2026-01-20', 'COMPLETED', 92
FROM students s
JOIN course_sections cs ON 1 = 1
JOIN courses c ON c.course_id = cs.course_id
JOIN academic_terms t ON t.term_id = cs.term_id
WHERE s.student_number = 'S2026001'
AND c.course_code = 'CS101'
AND t.term_name = 'Spring 2026';
INSERT INTO enrollments (
student_id, section_id, enrollment_date,
enrollment_status, final_score
)
SELECT s.student_id, cs.section_id, DATE '2026-01-20', 'COMPLETED', 84
FROM students s
JOIN course_sections cs ON 1 = 1
JOIN courses c ON c.course_id = cs.course_id
JOIN academic_terms t ON t.term_id = cs.term_id
WHERE s.student_number = 'S2026002'
AND c.course_code = 'CS101'
AND t.term_name = 'Spring 2026';
INSERT INTO enrollments (
student_id, section_id, enrollment_date,
enrollment_status, final_score
)
SELECT s.student_id, cs.section_id, DATE '2026-01-20', 'COMPLETED', 88
FROM students s
JOIN course_sections cs ON 1 = 1
JOIN courses c ON c.course_id = cs.course_id
JOIN academic_terms t ON t.term_id = cs.term_id
WHERE s.student_number = 'S2026003'
AND c.course_code = 'CS201'
AND t.term_name = 'Spring 2026';
INSERT INTO enrollments (
student_id, section_id, enrollment_date,
enrollment_status, final_score
)
SELECT s.student_id, cs.section_id, DATE '2026-01-20', 'COMPLETED', 76
FROM students s
JOIN course_sections cs ON 1 = 1
JOIN courses c ON c.course_id = cs.course_id
JOIN academic_terms t ON t.term_id = cs.term_id
WHERE s.student_number = 'S2026004'
AND c.course_code = 'CS201'
AND t.term_name = 'Spring 2026';
INSERT INTO enrollments (
student_id, section_id, enrollment_date,
enrollment_status, final_score
)
SELECT s.student_id, cs.section_id, DATE '2026-01-20', 'COMPLETED', 95
FROM students s
JOIN course_sections cs ON 1 = 1
JOIN courses c ON c.course_id = cs.course_id
JOIN academic_terms t ON t.term_id = cs.term_id
WHERE s.student_number = 'S2026005'
AND c.course_code = 'MATH101'
AND t.term_name = 'Spring 2026';
INSERT INTO enrollments (
student_id, section_id, enrollment_date,
enrollment_status, final_score
)
SELECT s.student_id, cs.section_id, DATE '2026-01-20', 'COMPLETED', 67
FROM students s
JOIN course_sections cs ON 1 = 1
JOIN courses c ON c.course_id = cs.course_id
JOIN academic_terms t ON t.term_id = cs.term_id
WHERE s.student_number = 'S2026006'
AND c.course_code = 'MATH101'
AND t.term_name = 'Spring 2026';
INSERT INTO enrollments (
student_id, section_id, enrollment_date,
enrollment_status, final_score
)
SELECT s.student_id, cs.section_id, DATE '2026-01-20', 'COMPLETED', 90
FROM students s
JOIN course_sections cs ON 1 = 1
JOIN courses c ON c.course_id = cs.course_id
JOIN academic_terms t ON t.term_id = cs.term_id
WHERE s.student_number = 'S2026007'
AND c.course_code = 'ENG101'
AND t.term_name = 'Spring 2026';
INSERT INTO enrollments (
student_id, section_id, enrollment_date,
enrollment_status, final_score
)
SELECT s.student_id, cs.section_id, DATE '2026-01-20', 'COMPLETED', 82
FROM students s
JOIN course_sections cs ON 1 = 1
JOIN courses c ON c.course_id = cs.course_id
JOIN academic_terms t ON t.term_id = cs.term_id
WHERE s.student_number = 'S2026008'
AND c.course_code = 'ENG101'
AND t.term_name = 'Spring 2026';
-- Fall 2026 enrollments (not yet completed; final_score is NULL).
INSERT INTO enrollments (
student_id, section_id, enrollment_date,
enrollment_status, final_score
)
SELECT s.student_id, cs.section_id, DATE '2026-08-25', 'ENROLLED', NULL
FROM students s
JOIN course_sections cs ON 1 = 1
JOIN courses c ON c.course_id = cs.course_id
JOIN academic_terms t ON t.term_id = cs.term_id
WHERE s.student_number = 'S2026001'
AND c.course_code = 'CS201'
AND t.term_name = 'Fall 2026';
INSERT INTO enrollments (
student_id, section_id, enrollment_date,
enrollment_status, final_score
)
SELECT s.student_id, cs.section_id, DATE '2026-08-25', 'ENROLLED', NULL
FROM students s
JOIN course_sections cs ON 1 = 1
JOIN courses c ON c.course_id = cs.course_id
JOIN academic_terms t ON t.term_id = cs.term_id
WHERE s.student_number = 'S2026002'
AND c.course_code = 'MATH201'
AND t.term_name = 'Fall 2026';
INSERT INTO enrollments (
student_id, section_id, enrollment_date,
enrollment_status, final_score
)
SELECT s.student_id, cs.section_id, DATE '2026-08-25', 'ENROLLED', NULL
FROM students s
JOIN course_sections cs ON 1 = 1
JOIN courses c ON c.course_id = cs.course_id
JOIN academic_terms t ON t.term_id = cs.term_id
WHERE s.student_number = 'S2026003'
AND c.course_code = 'CS101'
AND t.term_name = 'Fall 2026';
INSERT INTO enrollments (
student_id, section_id, enrollment_date,
enrollment_status, final_score
)
SELECT s.student_id, cs.section_id, DATE '2026-08-25', 'ENROLLED', NULL
FROM students s
JOIN course_sections cs ON 1 = 1
JOIN courses c ON c.course_id = cs.course_id
JOIN academic_terms t ON t.term_id = cs.term_id
WHERE s.student_number = 'S2026004'
AND c.course_code = 'ENG101'
AND t.term_name = 'Fall 2026';
INSERT INTO enrollments (
student_id, section_id, enrollment_date,
enrollment_status, final_score
)
SELECT s.student_id, cs.section_id, DATE '2026-08-25', 'ENROLLED', NULL
FROM students s
JOIN course_sections cs ON 1 = 1
JOIN courses c ON c.course_id = cs.course_id
JOIN academic_terms t ON t.term_id = cs.term_id
WHERE s.student_number = 'S2026005'
AND c.course_code = 'CS101'
AND t.term_name = 'Fall 2026';
INSERT INTO enrollments (
student_id, section_id, enrollment_date,
enrollment_status, final_score
)
SELECT s.student_id, cs.section_id, DATE '2026-08-25', 'ENROLLED', NULL
FROM students s
JOIN course_sections cs ON 1 = 1
JOIN courses c ON c.course_id = cs.course_id
JOIN academic_terms t ON t.term_id = cs.term_id
WHERE s.student_number = 'S2026006'
AND c.course_code = 'MATH201'
AND t.term_name = 'Fall 2026';
INSERT INTO enrollments (
student_id, section_id, enrollment_date,
enrollment_status, final_score
)
SELECT s.student_id, cs.section_id, DATE '2026-08-25', 'ENROLLED', NULL
FROM students s
JOIN course_sections cs ON 1 = 1
JOIN courses c ON c.course_id = cs.course_id
JOIN academic_terms t ON t.term_id = cs.term_id
WHERE s.student_number = 'S2026007'
AND c.course_code = 'ENG101'
AND t.term_name = 'Fall 2026';
INSERT INTO enrollments (
student_id, section_id, enrollment_date,
enrollment_status, final_score
)
SELECT s.student_id, cs.section_id, DATE '2026-08-25', 'ENROLLED', NULL
FROM students s
JOIN course_sections cs ON 1 = 1
JOIN courses c ON c.course_id = cs.course_id
JOIN academic_terms t ON t.term_id = cs.term_id
WHERE s.student_number = 'S2026008'
AND c.course_code = 'CS201'
AND t.term_name = 'Fall 2026';



-- ============================================================
-- 9. ATTENDANCE
-- One attendance record per student for an early Fall class.
-- ============================================================
INSERT INTO attendance (enrollment_id, class_date, attendance_status)
SELECT e.enrollment_id, DATE '2026-09-10', 'PRESENT'
FROM enrollments e
JOIN students s ON s.student_id = e.student_id
JOIN course_sections cs ON cs.section_id = e.section_id
JOIN courses c ON c.course_id = cs.course_id
JOIN academic_terms t ON t.term_id = cs.term_id
WHERE s.student_number = 'S2026001'
AND c.course_code = 'CS201'
AND t.term_name = 'Fall 2026';
INSERT INTO attendance (enrollment_id, class_date, attendance_status)
SELECT e.enrollment_id, DATE '2026-09-10', 'TARDY'
FROM enrollments e
JOIN students s ON s.student_id = e.student_id
JOIN course_sections cs ON cs.section_id = e.section_id
JOIN courses c ON c.course_id = cs.course_id
JOIN academic_terms t ON t.term_id = cs.term_id
WHERE s.student_number = 'S2026002'
AND c.course_code = 'MATH201'
AND t.term_name = 'Fall 2026';
INSERT INTO attendance (enrollment_id, class_date, attendance_status)
SELECT e.enrollment_id, DATE '2026-09-10', 'PRESENT'
FROM enrollments e
JOIN students s ON s.student_id = e.student_id
JOIN course_sections cs ON cs.section_id = e.section_id
JOIN courses c ON c.course_id = cs.course_id
JOIN academic_terms t ON t.term_id = cs.term_id
WHERE s.student_number = 'S2026003'
AND c.course_code = 'CS101'
AND t.term_name = 'Fall 2026';
INSERT INTO attendance (enrollment_id, class_date, attendance_status)
SELECT e.enrollment_id, DATE '2026-09-10', 'ABSENT'
FROM enrollments e
JOIN students s ON s.student_id = e.student_id
JOIN course_sections cs ON cs.section_id = e.section_id
JOIN courses c ON c.course_id = cs.course_id
JOIN academic_terms t ON t.term_id = cs.term_id
WHERE s.student_number = 'S2026004'
AND c.course_code = 'ENG101'
AND t.term_name = 'Fall 2026';
INSERT INTO attendance (enrollment_id, class_date, attendance_status)
SELECT e.enrollment_id, DATE '2026-09-10', 'PRESENT'
FROM enrollments e
JOIN students s ON s.student_id = e.student_id
JOIN course_sections cs ON cs.section_id = e.section_id
JOIN courses c ON c.course_id = cs.course_id
JOIN academic_terms t ON t.term_id = cs.term_id
WHERE s.student_number = 'S2026005'
AND c.course_code = 'CS101'
AND t.term_name = 'Fall 2026';
INSERT INTO attendance (enrollment_id, class_date, attendance_status)
SELECT e.enrollment_id, DATE '2026-09-10', 'EXCUSED'
FROM enrollments e
JOIN students s ON s.student_id = e.student_id
JOIN course_sections cs ON cs.section_id = e.section_id
JOIN courses c ON c.course_id = cs.course_id
JOIN academic_terms t ON t.term_id = cs.term_id
WHERE s.student_number = 'S2026006'
AND c.course_code = 'MATH201'
AND t.term_name = 'Fall 2026';
INSERT INTO attendance (enrollment_id, class_date, attendance_status)
SELECT e.enrollment_id, DATE '2026-09-10', 'PRESENT'
FROM enrollments e
JOIN students s ON s.student_id = e.student_id
JOIN course_sections cs ON cs.section_id = e.section_id
JOIN courses c ON c.course_id = cs.course_id
JOIN academic_terms t ON t.term_id = cs.term_id
WHERE s.student_number = 'S2026007'
AND c.course_code = 'ENG101'
AND t.term_name = 'Fall 2026';
INSERT INTO attendance (enrollment_id, class_date, attendance_status)
SELECT e.enrollment_id, DATE '2026-09-10', 'PRESENT'
FROM enrollments e
JOIN students s ON s.student_id = e.student_id
JOIN course_sections cs ON cs.section_id = e.section_id
JOIN courses c ON c.course_id = cs.course_id
JOIN academic_terms t ON t.term_id = cs.term_id
WHERE s.student_number = 'S2026008'
AND c.course_code = 'CS201'
AND t.term_name = 'Fall 2026';



-- ============================================================
-- 10. GRADE HISTORY
-- One assessment per completed Spring enrollment.
-- ============================================================
INSERT INTO grade_history (
enrollment_id, assessment_name, assessment_type,
score, max_score, recorded_by_user_id
)
SELECT e.enrollment_id, 'Final Assessment', 'EXAM',
92, 100, au.app_user_id
FROM enrollments e
JOIN students s ON s.student_id = e.student_id
JOIN course_sections cs ON cs.section_id = e.section_id
JOIN courses c ON c.course_id = cs.course_id
JOIN academic_terms t ON t.term_id = cs.term_id
JOIN application_users au ON au.username = 'maya.thompson'
WHERE s.student_number = 'S2026001'
AND c.course_code = 'CS101'
AND t.term_name = 'Spring 2026';
INSERT INTO grade_history (
enrollment_id, assessment_name, assessment_type,
score, max_score, recorded_by_user_id
)
SELECT e.enrollment_id, 'Final Assessment', 'EXAM',
84, 100, au.app_user_id
FROM enrollments e
JOIN students s ON s.student_id = e.student_id
JOIN course_sections cs ON cs.section_id = e.section_id
JOIN courses c ON c.course_id = cs.course_id
JOIN academic_terms t ON t.term_id = cs.term_id
JOIN application_users au ON au.username = 'maya.thompson'
WHERE s.student_number = 'S2026002'
AND c.course_code = 'CS101'
AND t.term_name = 'Spring 2026';
INSERT INTO grade_history (
enrollment_id, assessment_name, assessment_type,
score, max_score, recorded_by_user_id
)
SELECT e.enrollment_id, 'Final Assessment', 'EXAM',
88, 100, au.app_user_id
FROM enrollments e
JOIN students s ON s.student_id = e.student_id
JOIN course_sections cs ON cs.section_id = e.section_id
JOIN courses c ON c.course_id = cs.course_id
JOIN academic_terms t ON t.term_id = cs.term_id
JOIN application_users au ON au.username = 'daniel.kim'
WHERE s.student_number = 'S2026003'
AND c.course_code = 'CS201'
AND t.term_name = 'Spring 2026';
INSERT INTO grade_history (
enrollment_id, assessment_name, assessment_type,
score, max_score, recorded_by_user_id
)
SELECT e.enrollment_id, 'Final Assessment', 'EXAM',
76, 100, au.app_user_id
FROM enrollments e
JOIN students s ON s.student_id = e.student_id
JOIN course_sections cs ON cs.section_id = e.section_id
JOIN courses c ON c.course_id = cs.course_id
JOIN academic_terms t ON t.term_id = cs.term_id
JOIN application_users au ON au.username = 'daniel.kim'
WHERE s.student_number = 'S2026004'
AND c.course_code = 'CS201'
AND t.term_name = 'Spring 2026';
INSERT INTO grade_history (
enrollment_id, assessment_name, assessment_type,
score, max_score, recorded_by_user_id
)
SELECT e.enrollment_id, 'Final Assessment', 'EXAM',
95, 100, au.app_user_id
FROM enrollments e
JOIN students s ON s.student_id = e.student_id
JOIN course_sections cs ON cs.section_id = e.section_id
JOIN courses c ON c.course_id = cs.course_id
JOIN academic_terms t ON t.term_id = cs.term_id
JOIN application_users au ON au.username = 'olivia.martinez'
WHERE s.student_number = 'S2026005'
AND c.course_code = 'MATH101'
AND t.term_name = 'Spring 2026';
INSERT INTO grade_history (
enrollment_id, assessment_name, assessment_type,
score, max_score, recorded_by_user_id
)
SELECT e.enrollment_id, 'Final Assessment', 'EXAM',
67, 100, au.app_user_id
FROM enrollments e
JOIN students s ON s.student_id = e.student_id
JOIN course_sections cs ON cs.section_id = e.section_id
JOIN courses c ON c.course_id = cs.course_id
JOIN academic_terms t ON t.term_id = cs.term_id
JOIN application_users au ON au.username = 'olivia.martinez'
WHERE s.student_number = 'S2026006'
AND c.course_code = 'MATH101'
AND t.term_name = 'Spring 2026';
INSERT INTO grade_history (
enrollment_id, assessment_name, assessment_type,
score, max_score, recorded_by_user_id
)
SELECT e.enrollment_id, 'Final Assessment', 'EXAM',
90, 100, au.app_user_id
FROM enrollments e
JOIN students s ON s.student_id = e.student_id
JOIN course_sections cs ON cs.section_id = e.section_id
JOIN courses c ON c.course_id = cs.course_id
JOIN academic_terms t ON t.term_id = cs.term_id
JOIN application_users au ON au.username = 'james.wilson'
WHERE s.student_number = 'S2026007'
AND c.course_code = 'ENG101'
AND t.term_name = 'Spring 2026';
INSERT INTO grade_history (
enrollment_id, assessment_name, assessment_type,
score, max_score, recorded_by_user_id
)
SELECT e.enrollment_id, 'Final Assessment', 'EXAM',
82, 100, au.app_user_id
FROM enrollments e
JOIN students s ON s.student_id = e.student_id
JOIN course_sections cs ON cs.section_id = e.section_id
JOIN courses c ON c.course_id = cs.course_id
JOIN academic_terms t ON t.term_id = cs.term_id
JOIN application_users au ON au.username = 'james.wilson'
WHERE s.student_number = 'S2026008'
AND c.course_code = 'ENG101'
AND t.term_name = 'Spring 2026';

--COMMIT; -- Commit all changes if no errors occurred.