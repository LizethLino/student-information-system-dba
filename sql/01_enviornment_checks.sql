-- =============================================================================
-- Oracle Student Information System & DBA Lab
-- File: 01_enviornment_checks.sql
-- Purpose: Identify the current database environment
-- =============================================================================

-- 1. Identify the database, container, service, and account
SELECT 
    SYS_CONTEXT('USERENV', 'DB_NAME') AS database_name, --FREEPDB1
    SYS_CONTEXT('USERENV', 'CON_NAME') AS container_name, --FREEPDB1
    SYS_CONTEXT('USERENV', 'SERVICE_NAME') AS service_name, --FREEPDB1
    SYS_CONTEXT('USERENV', 'SESSION_USER') AS session_user, --SYSTEM
    SYS_CONTEXT('USERENV', 'CURRENT_SCHEMA') AS current_schema --SYSTEM
FROM DUAL;

-- 2. Check whether the SIS database user exists
SELECT username
FROM all_users
WHERE username = 'SIS'; 

-- 3. List tables owned by the currently connected user
SELECT table_name
FROM user_tables
ORDER BY table_name;

-- 4. Inspect the current user's enabled roles
SELECT role
FROM session_roles
ORDER BY role;

-- 5. Inspect system privileges granted directly to the user
SELECT privilege
FROM user_sys_privs
ORDER BY privilege;