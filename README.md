# Oracle Student Information System & DBA Lab

A hands-on Oracle Database project that simulates a school's student information system while exploring database administration, SQL development, PL/SQL automation, security, performance tuning, and backup and recovery.

## Overview

This project models the core data and workflows of a fictional school, including students, instructors, academic departments, courses, class sections, enrollments, attendance, and grades.

The goal is to build a realistic database environment for practicing both database development and administration. Alongside designing and querying a relational database, I am documenting administrative procedures, testing access controls, troubleshooting database issues, and exploring ways to maintain data integrity and performance.

This project is being developed as a learning lab using synthetic data and a local Oracle Database environment.

## Project Objectives

- Design and implement a relational database using Oracle SQL.
- Practice primary keys, foreign keys, unique constraints, check constraints, and identity columns.
- Write SQL queries to retrieve, validate, and analyze student and academic records.
- Develop PL/SQL procedures, functions, triggers, and packages to automate common school information system workflows.
- Practice Oracle user management, roles, privileges, and the principle of least privilege.
- Investigate query execution plans, indexes, and database performance.
- Explore logical backups, data exports and imports, and recovery verification.
- Document database configuration, testing procedures, troubleshooting, and administrative workflows.

## Technology Stack

| Technology | Purpose |
|---|---|
| Oracle AI Database 26ai Free | Relational database and administration practice |
| Oracle SQL Developer | Database connections, SQL development, and query execution |
| SQL | Schema creation, data manipulation, validation, and reporting |
| PL/SQL | Stored procedures, functions, triggers, and database automation |
| Docker Desktop | Running a local Oracle database environment |
| Git & GitHub | Version control, source management, and project documentation |

*Additional tools and technologies may be introduced as the project develops.*

## Database Design

The initial schema consists of 10 core tables:

| Table | Purpose |
|---|---|
| `DEPARTMENTS` | Stores academic departments and their details |
| `INSTRUCTORS` | Stores instructor and employee information |
| `STUDENTS` | Stores student information and enrollment status |
| `ACADEMIC_TERMS` | Defines academic terms and their date ranges |
| `COURSES` | Stores course information and credit values |
| `APPLICATION_USERS` | Represents fictional staff users for application-level attribution |
| `COURSE_SECTIONS` | Connects courses, terms, instructors, and classroom sections |
| `ENROLLMENTS` | Tracks students enrolled in course sections and their final scores |
| `ATTENDANCE` | Records attendance for individual enrollments |
| `GRADE_HISTORY` | Stores assessment scores and the staff user who recorded them |

The schema uses relational constraints to maintain data integrity and prevent invalid records. Identity columns generate primary-key values, while foreign keys establish relationships between related records.

A database design diagram and data dictionary will be added as the schema and documentation mature.

## Development Roadmap

The project is being developed in phases so that each area can be implemented, tested, and documented before moving to the next.

- [x] **Phase 1 — Initial Schema Design:** Define the core entities, relationships, columns, and integrity constraints.
- [x] **Phase 2 — Schema Implementation and Seed Data:** Create the tables, populate synthetic records, and validate relationships.
- [ ] **Phase 3 — SQL Queries and Reporting:** Develop joins, aggregations, subqueries, and reports for student enrollment, attendance, and grades.
- [ ] **Phase 4 — Oracle Administration and Security:** Practice database users, roles, privileges, access-control testing, and administrative queries.
- [ ] **Phase 5 — PL/SQL Automation:** Implement procedures, functions, triggers, exception handling, and transaction management.
- [ ] **Phase 6 — Performance and Troubleshooting:** Analyze execution plans, evaluate indexes, and document troubleshooting scenarios.
- [ ] **Phase 7 — Backup and Recovery:** Practice logical exports and imports, verify restored data, and document recovery procedures.
- [ ] **Phase 8 — Documentation and Final Testing:** Complete the database diagram, data dictionary, test results, setup guide, and DBA runbook.

*The checklist reflects the planned roadmap and will be updated as work is completed and verified.*

## Planned PL/SQL Exercises

The project will include practical database workflows designed around common school information system requirements, such as:

- Enrolling a student in a course section while checking capacity and preventing duplicate enrollments.
- Calculating attendance percentages for students and course sections.
- Recording and validating assessment grades.
- Maintaining grade change history and identifying the staff user responsible for an update.
- Handling invalid operations with appropriate exceptions and transaction controls.

These exercises will be tested against synthetic records to verify both expected results and error handling.

## Repository Structure

The repository will be organized to separate schema scripts, administration exercises, PL/SQL development, testing, and documentation.

```text
oracle-student-information-system/
├── README.md
├── docs/
│   ├── requirements.md
│   ├── architecture.md
│   ├── database-design.md
│   ├── data-dictionary.md
│   ├── setup-guide.md
│   ├── test-plan.md
│   ├── dba-runbook.md
│   ├── troubleshooting-log.md
│   └── backup-recovery.md
├── database-setup/
│   ├── 01_environment_checks.sql
│   ├── 02_create_schema.sql
│   ├── 03_create_tables.sql
│   ├── 04_seed_data.sql
│   ├── 05_constraints_indexes.sql
│   └── 06_validation_queries.sql
├── sql-labs/
│   ├── 01_select_filter_sort.sql
│   ├── 02_joins_and_subqueries.sql
│   ├── 03_aggregation_and_reporting.sql
│   ├── 04_data_manipulation.sql
│   ├── 05_transactions_and_concurrency.sql
│   ├── 06_constraints_and_integrity.sql
│   ├── 07_views_and_sequences.sql
│   └── 08_execution_plans_and_indexes.sql
├── dba-labs/
│   ├── 01_environment_inventory/
│   ├── 02_data_dictionary/
│   ├── 03_users_roles_privileges/
│   ├── 04_tablespaces_and_storage/
│   ├── 05_sessions_and_connections/
│   ├── 06_object_maintenance/
│   ├── 07_monitoring_and_diagnostics/
│   └── 08_backup_and_recovery/
├── plsql-labs/
│   ├── 01_anonymous_blocks.sql
│   ├── 02_conditionals_and_loops.sql
│   ├── 03_procedures/
│   ├── 04_functions/
│   ├── 05_cursors/
│   ├── 06_packages/
│   ├── 07_triggers/
│   ├── 08_exceptions_and_transactions/
├── tests/
│   ├── schema_tests.sql
│   ├── plsql_tests.sql
│   └── access_control_tests.sql
└── screenshots/
```

*Files will be added as the corresponding project phases are implemented.*

## Getting Started

The project uses a local Oracle AI Database 26ai Free instance running in Docker Desktop, with Oracle SQL Developer as the database client.

Setup instructions will be documented in [`docs/setup-guide.md`](docs/setup-guide.md).

The intended workflow is:

1. Start the local Oracle database environment.
2. Connect to the local `FREEPDB1` service using Oracle SQL Developer.
3. Create and use a dedicated project schema rather than the administrative `SYSTEM` account.
4. Execute the SQL scripts in the documented order.
5. Validate table definitions, constraints, and test data before proceeding to later exercises.

Database passwords, credentials, and other secrets must remain outside version control.

## Testing and Validation

Testing will include:

- Verifying that tables, constraints, and relationships are created correctly.
- Confirming that valid records can be inserted and queried.
- Attempting invalid inserts and updates to test data integrity constraints.
- Testing PL/SQL procedures with valid inputs, invalid inputs, and boundary conditions.
- Verifying that users have only the privileges required for their assigned responsibilities.
- Comparing query execution plans before and after selected indexing changes.
- Exporting and importing project data and validating the results.

Test cases and outcomes will be documented as they are completed.

## Scope and Data Safety

This project is an educational portfolio lab, not a production student information system.

- All student, instructor, and academic records will be fictional or synthetically generated.
- The project will not use real student information or connect its scripts to a school's production database.
- Administrative exercises will be performed in the local development environment.
- Destructive operations and recovery exercises will be isolated and documented.

## Learning Outcomes

Through this project, I aim to strengthen my practical understanding of:

- Oracle Database fundamentals and administration.
- Relational database design and data integrity.
- SQL querying and data validation.
- PL/SQL programming and workflow automation.
- Database security and privilege management.
- Performance analysis and troubleshooting.
- Backup, import, recovery verification, and technical documentation.

## Project Status

**Status:** In progress — database created, will begin to focus more intently on dba, sql, and pl/sql hands-on labs.

This README and the accompanying documentation will evolve as features are implemented, test results are recorded, and additional database administration exercises are completed.


