-- ============================================================
-- Oracle Student Information System & DBA Lab
-- File: 06_validation_queries.sql
-- Purpose: Validate schema objects, seed data, and relationships.
-- Run as: SIS, connected to FREEPDB1
-- ============================================================


-- ============================================================
-- 1. TABLE INVENTORY
-- Expected: 10 tables
-- ============================================================

SELECT table_name
FROM user_tables
ORDER BY table_name;


-- ============================================================
-- 2. CONSTRAINTS THAT ARE DISABLED OR NOT VALIDATED
-- Expected: 0 rows
-- ============================================================

SELECT
    table_name,
    constraint_name,
    constraint_type,
    status,
    validated
FROM user_constraints
WHERE status <> 'ENABLED'
   OR validated <> 'VALIDATED'
ORDER BY table_name, constraint_name;


-- ============================================================
-- 3. INDEXES THAT ARE NOT VALID
-- Expected: 0 rows
-- ============================================================

SELECT
    table_name,
    index_name,
    status
FROM user_indexes
WHERE status <> 'VALID'
ORDER BY table_name, index_name;


-- ============================================================
-- 4. ROW COUNTS
-- Expected counts are based on the initial seed dataset.
-- ============================================================

SELECT 'ACADEMIC_TERMS' AS table_name, COUNT(*) AS row_count
FROM academic_terms
UNION ALL
SELECT 'APPLICATION_USERS', COUNT(*) FROM application_users
UNION ALL
SELECT 'ATTENDANCE', COUNT(*) FROM attendance
UNION ALL
SELECT 'COURSES', COUNT(*) FROM courses
UNION ALL
SELECT 'COURSE_SECTIONS', COUNT(*) FROM course_sections
UNION ALL
SELECT 'DEPARTMENTS', COUNT(*) FROM departments
UNION ALL
SELECT 'ENROLLMENTS', COUNT(*) FROM enrollments
UNION ALL
SELECT 'GRADE_HISTORY', COUNT(*) FROM grade_history
UNION ALL
SELECT 'INSTRUCTORS', COUNT(*) FROM instructors
UNION ALL
SELECT 'STUDENTS', COUNT(*) FROM students
ORDER BY table_name;


-- ============================================================
-- 5. ENROLLMENT STATUS DISTRIBUTION
-- ============================================================

SELECT
    enrollment_status,
    COUNT(*) AS enrollment_count
FROM enrollments
GROUP BY enrollment_status
ORDER BY enrollment_status;


-- ============================================================
-- 6. STUDENT ENROLLMENT SUMMARY
-- Includes students with no enrollments.
-- ============================================================

SELECT
    s.student_number,
    s.first_name,
    s.last_name,
    s.enrollment_status AS student_status,
    COUNT(e.enrollment_id) AS total_enrollments
FROM students s
LEFT JOIN enrollments e
    ON e.student_id = s.student_id
GROUP BY
    s.student_number,
    s.first_name,
    s.last_name,
    s.enrollment_status
ORDER BY s.student_number;


-- ============================================================
-- 7. COURSE SECTION SUMMARY
-- Shows the course, term, instructor, and enrollment count.
-- ============================================================

SELECT
    c.course_code,
    c.course_name,
    t.term_name,
    cs.section_number,
    i.first_name || ' ' || i.last_name AS instructor_name,
    cs.capacity,
    COUNT(e.enrollment_id) AS enrolled_students
FROM course_sections cs
JOIN courses c
    ON c.course_id = cs.course_id
JOIN academic_terms t
    ON t.term_id = cs.term_id
LEFT JOIN instructors i
    ON i.instructor_id = cs.instructor_id
LEFT JOIN enrollments e
    ON e.section_id = cs.section_id
GROUP BY
    c.course_code,
    c.course_name,
    t.term_name,
    cs.section_number,
    i.first_name,
    i.last_name,
    cs.capacity
ORDER BY t.term_name, c.course_code;


-- ============================================================
-- 8. Historical Record of Student Course Enrollments
-- Shows the student, course, term, enrollment status, and final score
-- ============================================================

SELECT
    s.student_number,
    s.first_name,
    s.last_name,
    c.course_code,
    c.course_name,
    t.term_name,
    e.enrollment_status,
    e.final_score
FROM enrollments e
JOIN students s ON s.student_id = e.student_id
JOIN course_sections cs ON cs.section_id = e.section_id
JOIN courses c ON c.course_id = cs.course_id
JOIN academic_terms t ON t.term_id = cs.term_id
ORDER BY t.start_date, s.student_number, c.course_code;


-- ============================================================
-- 8. ATTENDANCE SUMMARY
-- ============================================================

SELECT
    attendance_status,
    COUNT(*) AS record_count
FROM attendance
GROUP BY attendance_status
ORDER BY attendance_status;


-- ============================================================
-- 9. GRADE SUMMARY BY COURSE
-- ============================================================

SELECT
    c.course_code,
    c.course_name,
    COUNT(gh.grade_id) AS assessment_count,
    ROUND(AVG(gh.score / gh.max_score * 100), 2) AS average_percentage
FROM grade_history gh
JOIN enrollments e
    ON e.enrollment_id = gh.enrollment_id
JOIN course_sections cs
    ON cs.section_id = e.section_id
JOIN courses c
    ON c.course_id = cs.course_id
GROUP BY c.course_code, c.course_name
ORDER BY c.course_code;


-- ============================================================
-- 10. ORPHANED ENROLLMENT REFERENCES
-- Expected: 0 rows
-- ============================================================

SELECT
    e.enrollment_id,
    e.student_id,
    e.section_id
FROM enrollments e
LEFT JOIN students s
    ON s.student_id = e.student_id
LEFT JOIN course_sections cs
    ON cs.section_id = e.section_id
WHERE s.student_id IS NULL
   OR cs.section_id IS NULL;


-- ============================================================
-- 11. INVALID GRADE VALUES
-- Expected: 0 rows
-- ============================================================

SELECT
    grade_id,
    score,
    max_score
FROM grade_history
WHERE score < 0
   OR max_score <= 0
   OR score > max_score;


-- ============================================================
-- 12. SECTIONS OVER CAPACITY
-- Expected: 0 rows with the current seed data
-- ============================================================

SELECT
    cs.section_id,
    c.course_code,
    t.term_name,
    cs.capacity,
    COUNT(e.enrollment_id) AS enrolled_students
FROM course_sections cs
JOIN courses c
    ON c.course_id = cs.course_id
JOIN academic_terms t
    ON t.term_id = cs.term_id
LEFT JOIN enrollments e
    ON e.section_id = cs.section_id
GROUP BY
    cs.section_id,
    c.course_code,
    t.term_name,
    cs.capacity
HAVING COUNT(e.enrollment_id) > cs.capacity
ORDER BY t.term_name, c.course_code;