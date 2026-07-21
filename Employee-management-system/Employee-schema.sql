-- Active: 1782628847135@@127.0.0.1@3306@employee
DROP DATABASE IF EXISTS EMPLOYEE;

CREATE DATABASE EMPLOYEE;

USE EMPLOYEE;

CREATE TABLE departments (
    dept_id INT AUTO_INCREMENT PRIMARY KEY,
    dept_name VARCHAR (100) NOT NULL,
    location VARCHAR (200),
    budget DECIMAL (15,2)
);

CREATE TABLE positions (
    position_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR (100) NOT NULL ,
    min_salary DECIMAL (10,2),
    max_salary DECIMAL (10,2)
);

CREATE TABLE employees (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR (50) NOT NULL,
    last_name VARCHAR (50),
    email VARCHAR (100) UNIQUE ,
    phone VARCHAR (15) UNIQUE ,
    hire_date DATE NOT NULL,
    dept_id INT,
    manager_id INT,
    position_id INT,
    job_title VARCHAR (100),
    status ENUM ('Active' , 'Inactive', 'Terminated') DEFAULT 'Active',
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (manager_id) REFERENCES employees(emp_id) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (position_id) REFERENCES positions(position_id) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE salaries (
    salary_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_id INT NOT NULL ,
    amount DECIMAL (10,2) NOT NULL,
    effective_date DATE NOT NULL,
    currency VARCHAR (10) DEFAULT 'INR',
    FOREIGN KEY (emp_id) REFERENCES employees (emp_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE attendance (
    attendance_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_id INT NOT NULL,
    date DATE NOT NULL,
    check_in TIME,
    check_out TIME,
    status ENUM ('Present' , 'Absent' , 'Half Day' , 'Leave') DEFAULT 'Present',
    FOREIGN KEY (emp_id) REFERENCES employees (emp_id) ON DELETE CASCADE ON UPDATE CASCADE,
    UNIQUE KEY unique_emp_date (emp_id ,date)
);

CREATE TABLE leave_types (
    leave_type_id INT AUTO_INCREMENT PRIMARY KEY,
    leave_name VARCHAR (50) NOT NULL,
    max_days_per_year INT DEFAULT 0
);

CREATE TABLE leave_requests (
    leave_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_id INT NOT NULL,
    leave_type_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status ENUM ('Pending', 'Approved','Rejected') DEFAULT 'Pending',
    approved_by INT ,
    FOREIGN KEY (emp_id) REFERENCES employees (emp_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (leave_type_id) REFERENCES leave_types (leave_type_id) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (approved_by) REFERENCES employees (emp_id) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE payroll (
    payroll_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_id INT NOT NULL,
    month INT NOT NULL CHECK ( month BETWEEN 1 AND 12),
    year INT NOT NULL,
    basic_pay DECIMAL (10,2) NOT NULL,
    deductions DECIMAL (19,2) DEFAULT 0,
    net_pay DECIMAL (10,2) NOT NULL,
    FOREIGN KEY (emp_id) REFERENCES employees (emp_id) ON DELETE CASCADE ON UPDATE CASCADE,
    UNIQUE KEY unique_emp_month_year (emp_id, month , year)
);

CREATE TABLE bonuses (
    bonus_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_id INT NOT NULL,
    amount DECIMAL (10,2) NOT NULL,
    reason VARCHAR (250),
    date_awarded DATE NOT NULL,
    FOREIGN KEY (emp_id) REFERENCES employees (emp_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE performance_reviews (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_id INT NOT NULL,
    reviewer_id INT,
    review_date DATE NOT NULL,
    rating DECIMAL (3,1) CHECK (rating BETWEEN 1 AND 5),
    Comments TEXT,
    FOREIGN KEY (emp_id) REFERENCES employees (emp_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (reviewer_id) REFERENCES employees (emp_id) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE projects (
    project_id INT AUTO_INCREMENT PRIMARY KEY,
    project_name VARCHAR (150)NOT NULL,
    start_date DATE ,
    end_date DATE,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments (dept_id) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE employee_projects (
    emp_id INT NOT NULL,
    project_id INT NOT NULL,
    role_in_project VARCHAR (50),
    hours_allocated INT DEFAULT 0,
    PRIMARY KEY (emp_id , project_id),
    FOREIGN KEY (emp_id) REFERENCES employees (emp_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (project_id) REFERENCES projects (project_id) ON DELETE CASCADE ON UPDATE CASCADE
);

SHOW TABLES;

DESC EMPLOYEES;