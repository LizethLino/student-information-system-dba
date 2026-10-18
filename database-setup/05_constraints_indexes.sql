-- ============================================================
-- Oracle Student Information System & DBA Lab
-- File: 05_constraints_indexes.sql
-- Purpose: Inspect constraints/indexes and add selected indexes.
-- Run as: SIS, connected to FREEPDB1
-- ============================================================


-- ============================================================
-- 1. CONSTRAINT INVENTORY
-- ============================================================

SELECT
    table_name,
    constraint_name,
    constraint_type,
    status,
    validated
FROM user_constraints
ORDER BY table_name, constraint_type, constraint_name;


-- ============================================================
-- 2. CONSTRAINT DETAILS
-- Shows which columns participate in each constraint.
-- ============================================================

SELECT
    c.table_name,
    c.constraint_name,
    c.constraint_type,
    cc.column_name,
    cc.position,
    c.status,
    c.validated
FROM user_constraints c
LEFT JOIN user_cons_columns cc
    ON cc.constraint_name = c.constraint_name
   AND cc.table_name = c.table_name
ORDER BY
    c.table_name,
    c.constraint_name,
    cc.position;


-- ============================================================
-- 3. INDEX INVENTORY
-- ============================================================

SELECT
    table_name,
    index_name,
    index_type,
    uniqueness,
    status
FROM user_indexes
ORDER BY table_name, index_name;


-- ============================================================
-- 4. INDEX COLUMN DETAILS
-- Column order matters in a composite index.
-- ============================================================

SELECT
    table_name,
    index_name,
    column_name,
    column_position,
    descend
FROM user_ind_columns
ORDER BY table_name, index_name, column_position;


-- ============================================================
-- 5. CREATE SELECTED INDEXES
--
-- These indexes support likely joins and lookups on foreign
-- key columns that aren't already the leading column of an
-- existing index.
-- ============================================================


-- Instructors by department
CREATE INDEX ix_instructors_dept ON instructors (department_id);

-- Courses by department
CREATE INDEX ix_courses_dept ON courses (department_id);

-- Course sections by academic term
CREATE INDEX ix_sections_term ON course_sections (term_id);

-- Course sections by instructor
CREATE INDEX ix_sections_instr ON course_sections (instructor_id);

-- Enrollments by course section
CREATE INDEX ix_enrollments_section ON enrollments (section_id);

-- Grade history by the staff member who recorded the grade
CREATE INDEX ix_grade_history_user ON grade_history (recorded_by_user_id);

-- ============================================================
-- 6. VERIFY THE INDEXES
-- ============================================================

SELECT
    table_name,
    index_name,
    uniqueness,
    status
FROM user_indexes
ORDER BY table_name, index_name;