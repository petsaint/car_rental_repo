-- =========================================================
-- 01_schema.sql  (Schema + Constraints + Triggers ONLY)
-- =========================================================

CREATE DATABASE IF NOT EXISTS car_rental;
USE car_rental;

-- Allow dropping in any order during rebuild
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS REPAIR_STAFF;
DROP TABLE IF EXISTS REPAIR_TICKET_CODE;
DROP TABLE IF EXISTS REPAIR_CODE;
DROP TABLE IF EXISTS MAINTENANCE;
DROP TABLE IF EXISTS AGREEMENT;
DROP TABLE IF EXISTS VEHICLE;
DROP TABLE IF EXISTS VEHICLE_COLOR;
DROP TABLE IF EXISTS VEHICLE_MODEL_YEAR;
DROP TABLE IF EXISTS VEHICLE_MODEL;
DROP TABLE IF EXISTS VEHICLE_MAKE;
DROP TABLE IF EXISTS VEHICLE_TYPE;
DROP TABLE IF EXISTS STAFF;
DROP TABLE IF EXISTS CUSTOMER;
DROP TABLE IF EXISTS BRANCH;

SET FOREIGN_KEY_CHECKS = 1;

-- -------------------------
-- BRANCH
-- -------------------------
CREATE TABLE BRANCH (
  branchID varchar(6) PRIMARY KEY,
  branch_name varchar(40),
  branch_address varchar(60),
  branch_phone varchar(20)
);

-- -------------------------
-- STAFF
-- -------------------------
CREATE TABLE STAFF (
  staffID varchar(6) PRIMARY KEY,
  staff_name varchar(40) NOT NULL,
  staff_office_number int,
  staff_phone varchar(20),
  staff_email varchar(50),
  staff_branchID varchar(6),
  FOREIGN KEY (staff_branchID) REFERENCES BRANCH(branchID)
);

-- -------------------------
-- VEHICLE_TYPE
-- -------------------------
CREATE TABLE VEHICLE_TYPE (
  vehicle_typeID varchar(10) PRIMARY KEY,
  vehicle_type_name varchar(20) UNIQUE NOT NULL
);

-- -------------------------
-- CUSTOMER
-- -------------------------
CREATE TABLE CUSTOMER (
  customerID varchar(6) PRIMARY KEY,
  customer_fname varchar(20),
  customer_lname varchar(40),
  customer_address varchar(60),
  customer_phone varchar(20),
  customer_email varchar(50) UNIQUE NOT NULL,
  customer_driverLicenseID varchar(30) UNIQUE NOT NULL,
  customer_LicenseExpDate date NOT NULL
);

DELIMITER $$

CREATE TRIGGER bi_customer_license_not_expired
BEFORE INSERT ON CUSTOMER
FOR EACH ROW
BEGIN
  IF NEW.customer_LicenseExpDate < CURRENT_DATE() THEN
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Driver license is expired';
  END IF;
END$$

CREATE TRIGGER bu_customer_license_not_expired
BEFORE UPDATE ON CUSTOMER
FOR EACH ROW
BEGIN
  IF NEW.customer_LicenseExpDate < CURRENT_DATE() THEN
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Driver license is expired';
  END IF;
END$$

DELIMITER ;

-- -------------------------
-- VEHICLE_MAKE
-- -------------------------
CREATE TABLE VEHICLE_MAKE (
  makeID varchar(10) PRIMARY KEY,
  make_name varchar(20) UNIQUE NOT NULL
);

-- -------------------------
-- VEHICLE
