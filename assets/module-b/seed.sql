-- Seed data for HR Payroll and Leave Management System
-- WSC2026_TP17_MB_practice_v1
--
-- April 2026 working days calculation (reference):
--   Weekdays in April 2026: 22
--   Public holidays on weekdays: Apr 3 (Good Friday, Fri), Apr 14 (Eid al-Fitr, Tue)
--   Working days: 22 - 2 = 20
--
-- May 2026 working days calculation (reference):
--   Weekdays in May 2026: 21
--   Public holidays on weekdays: May 1 (Labor Day, Fri), May 14 (Ascension Day, Thu)
--   Working days: 21 - 2 = 19
--
-- Budi Santoso approved leave Apr 10-17:
--   Weekdays in range: Apr 10(Fri), 13(Mon), 14(Tue-holiday!), 15(Wed), 16(Thu), 17(Fri) = 6 weekdays
--   Minus public holiday Apr 14 = 5 effective days
--
-- Tax computation reference (brackets: 0-60M@5%, 60M-250M@15%, 250M-500M@25%, 500M+@30%):
--   Budi (12M/mo, 144M/yr):  60M*5% + 84M*15%  = 3,000,000 + 12,600,000 = 15,600,000/yr -> 1,300,000/mo
--   Sari (18M/mo, 216M/yr):  60M*5% + 156M*15% = 3,000,000 + 23,400,000 = 26,400,000/yr -> 2,200,000/mo
--   Anton (8.5M/mo, 102M/yr): 60M*5% + 42M*15% = 3,000,000 + 6,300,000  =  9,300,000/yr ->   775,000/mo
--   Rina (9M/mo, 108M/yr):   60M*5% + 48M*15%  = 3,000,000 + 7,200,000  = 10,200,000/yr ->   850,000/mo
--   Hendra (25M/mo, 300M/yr): 60M*5% + 190M*15% + 50M*25% = 3M+28.5M+12.5M = 44,000,000/yr -> 3,666,667/mo

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS payslips;
DROP TABLE IF EXISTS leave_requests;
DROP TABLE IF EXISTS leave_types;
DROP TABLE IF EXISTS public_holidays;
DROP TABLE IF EXISTS tax_brackets;
DROP TABLE IF EXISTS employees;

SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE employees (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    employee_code VARCHAR(20) NOT NULL UNIQUE,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    department VARCHAR(50) NOT NULL,
    base_salary BIGINT UNSIGNED NOT NULL,
    employment_start_date DATE NOT NULL,
    status ENUM('active', 'inactive') NOT NULL DEFAULT 'active',
    photo_path VARCHAR(255) NULL,
    deactivated_at TIMESTAMP NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE leave_types (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    annual_quota_days INT UNSIGNED NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE public_holidays (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    date DATE NOT NULL UNIQUE,
    description TEXT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE tax_brackets (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    lower_bound BIGINT UNSIGNED NOT NULL,
    upper_bound BIGINT UNSIGNED NULL COMMENT 'NULL means no upper limit (last bracket)',
    rate_percent DECIMAL(5,2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE leave_requests (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    employee_id INT UNSIGNED NOT NULL,
    leave_type_id INT UNSIGNED NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    reason TEXT NULL,
    status ENUM('pending', 'approved', 'rejected', 'cancelled') NOT NULL DEFAULT 'pending',
    effective_days INT UNSIGNED NULL COMMENT 'Computed on approval; NULL until approved',
    rejection_note VARCHAR(255) NULL,
    processed_at TIMESTAMP NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (employee_id) REFERENCES employees(id),
    FOREIGN KEY (leave_type_id) REFERENCES leave_types(id)
);

CREATE TABLE payslips (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    employee_id INT UNSIGNED NOT NULL,
    year SMALLINT UNSIGNED NOT NULL,
    month TINYINT UNSIGNED NOT NULL,
    working_days INT UNSIGNED NOT NULL,
    effective_leave_days INT UNSIGNED NOT NULL DEFAULT 0,
    gross_salary BIGINT UNSIGNED NOT NULL,
    monthly_tax BIGINT UNSIGNED NOT NULL,
    net_salary BIGINT UNSIGNED NOT NULL,
    generated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE KEY unique_employee_month (employee_id, year, month),
    FOREIGN KEY (employee_id) REFERENCES employees(id)
);

-- Employees
INSERT INTO employees (employee_code, full_name, email, department, base_salary, employment_start_date, status, deactivated_at) VALUES
('EMP001', 'Budi Santoso',   'budi.santoso@company.com',   'Engineering', 12000000, '2024-01-15', 'active',   NULL),
('EMP002', 'Sari Dewi',      'sari.dewi@company.com',      'Engineering', 18000000, '2023-06-01', 'active',   NULL),
('EMP003', 'Anton Wijaya',   'anton.wijaya@company.com',   'Operations',   8500000, '2024-03-10', 'active',   NULL),
('EMP004', 'Rina Kusuma',    'rina.kusuma@company.com',    'Operations',   9000000, '2023-11-20', 'active',   NULL),
('EMP005', 'Hendra Putra',   'hendra.putra@company.com',   'Engineering', 25000000, '2022-07-01', 'active',   NULL),
('EMP006', 'Maya Sari',      'maya.sari@company.com',      'Operations',   6000000, '2021-03-15', 'inactive', '2025-12-31 00:00:00');

-- Leave types (all leave types are treated as paid)
INSERT INTO leave_types (name, annual_quota_days) VALUES
('Annual Leave', 12),
('Sick Leave',   12);

-- Public holidays 2026
INSERT INTO public_holidays (name, date, description) VALUES
('New Year''s Day',     '2026-01-01', 'New Year celebration'),
('Lunar New Year',      '2026-02-10', 'Lunar New Year celebration'),
('Good Friday',         '2026-04-03', 'Christian Good Friday - weekday'),
('Eid al-Fitr Holiday', '2026-04-14', 'Eid al-Fitr public holiday - weekday'),
('Labor Day',           '2026-05-01', 'International Labor Day - weekday'),
('Ascension Day',       '2026-05-14', 'Ascension of Jesus Christ - weekday'),
('Pancasila Day',       '2026-06-01', 'National Pancasila Day'),
('Christmas Day',       '2026-12-25', 'Christmas celebration');

-- Tax brackets (progressive, annual income thresholds)
INSERT INTO tax_brackets (lower_bound, upper_bound, rate_percent) VALUES
(0,           60000000,  5.00),
(60000000,   250000000, 15.00),
(250000000,  500000000, 25.00),
(500000000,       NULL, 30.00);

-- Leave requests
INSERT INTO leave_requests (employee_id, leave_type_id, start_date, end_date, reason, status, effective_days, processed_at) VALUES
-- Budi: Annual Leave Apr 10-17 (approved; Apr 14 is a public holiday so effective_days = 5, not 6)
(1, 1, '2026-04-10', '2026-04-17', 'Family vacation',       'approved', 5,    '2026-04-05 09:00:00'),
-- Sari: Sick Leave May 18-20 (pending, not yet approved; tentative effective_days = 3)
(2, 2, '2026-05-18', '2026-05-20', 'Medical appointment',   'pending',  NULL, NULL),
-- Anton: Annual Leave Mar 2-4 (rejected)
(3, 1, '2026-03-02', '2026-03-04', 'Personal matter',       'rejected', NULL, '2026-02-28 14:00:00');

-- Payslips: April 2026 (working_days = 20)
INSERT INTO payslips (employee_id, year, month, working_days, effective_leave_days, gross_salary, monthly_tax, net_salary, generated_at) VALUES
(1, 2026, 4, 20, 5, 12000000,  1300000, 10700000, '2026-05-01 09:00:00'),
(2, 2026, 4, 20, 0, 18000000,  2200000, 15800000, '2026-05-01 09:00:00'),
(3, 2026, 4, 20, 0,  8500000,   775000,  7725000, '2026-05-01 09:00:00'),
(4, 2026, 4, 20, 0,  9000000,   850000,  8150000, '2026-05-01 09:00:00'),
(5, 2026, 4, 20, 0, 25000000,  3666667, 21333333, '2026-05-01 09:00:00');

