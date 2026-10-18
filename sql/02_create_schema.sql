-- =============================================================================
-- Oracle Student Information System & DBA Lab
-- File: 02_create_schema.sql
-- Purpose: Provision the SIS schema owner
--
-- Run as an authorized administrative account in FREEPDB1
-- ***Do not commit real passwords to GitHub***
-- =============================================================================

-- 1. Confirm existing tablespaces
SELECT tablespace_name 
FROM dba_tablespaces;

-- 2. Create the project owner
CREATE USER SIS
    IDENTIFIED BY "<replace-me-with-a-real-password>"
    DEFAULT TABLESPACE USERS
    TEMPORARY TABLESPACE TEMP
    QUOTA 100M ON USERS;
    
-- 3. Permit the SIS account to connect
GRANT CREATE SESSION TO SIS;

-- 4. Allow the project owner to create its tables
GRANT CREATE TABLE TO SIS;

-- 5. Allow future schema development
GRANT CREATE VIEW TO SIS;
GRANT CREATE PROCEDURE TO SIS;
GRANT CREATE TRIGGER TO SIS;
GRANT CREATE SEQUENCE TO SIS; --required to set IDENTITY on a column