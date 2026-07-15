-- Active: 1782628847135@@127.0.0.1@3306@library
DROP DATABASE IF EXISTS Library;

CREATE DATABASE Library;
use library;

CREATE TABLE Publishers (
    publisher_id INT PRIMARY KEY AUTO_INCREMENT,
    publisher_name VARCHAR(100) NOT NULL,
    address VARCHAR(200),
    phone VARCHAR(15) UNIQUE,
    email VARCHAR (100) UNIQUE
);

CREATE TABLE Categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR (50) NOT NULL,
    description VARCHAR(200)
);

CREATE TABLE Authors (
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR (50) NOT NULL,
    last_name VARCHAR (50),
    nationality VARCHAR (50),
    date_of_birth DATE
);

CREATE TABLE Books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR (200) NOT NULL,
    isbn VARCHAR (20) UNIQUE ,
    publisher_id INT,
    category_id INT,
    publication_year YEAR,
    edition VARCHAR(20),
    language VARCHAR (30),
    price DECIMAL (8,2),
    FOREIGN KEY (publisher_id) REFERENCES Publishers(publisher_id),
    FOREIGN KEY (category_id) REFERENCES Categories (category_id)
);

CREATE TABLE BookAuthors (
    book_author_id INT PRIMARY KEY AUTO_INCREMENT,
    book_id INT,
    author_id INT,
    FOREIGN KEY (book_id) REFERENCES Books (book_id),
    FOREIGN KEY (author_id) REFERENCES Authors (author_id)
);

CREATE TABLE BookCopies (
    copy_id INT PRIMARY KEY AUTO_INCREMENT,
    book_id INT,
    race_number VARCHAR (20),
    status ENUM ('Available', 'Issued', 'Reserved', 'Damaged', 'Lost') DEFAULT 'Available',
    purchase_date DATE
);

CREATE TABLE Members ( 
    member_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR (50) NOT NULL,
    last_name VARCHAR (50),
    email VARCHAR (100) UNIQUE,
    phone VARCHAR(15),
    address VARCHAR(200),
    membership_date DATE,
    membership_type ENUM ('Student', 'Faculty', 'General') DEFAULT 'General',
    status ENUM('Active', 'Inactive', 'Suspended') DEFAULT 'Active'
);

CREATE TABLE Staff ( 
    staff_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR (50),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR (15),
    role VARCHAR(50),
    join_date DATE
);

CREATE TABLE IssueRecords (
    issue_id INT PRIMARY KEY AUTO_INCREMENT,
    copy_id INT,
    member_id INT,
    staff_id INT,
    issue_date DATE NOT NULL,
    due_date DATE NOT NULL,
    status ENUM ('Issued' , 'Returned', 'Overdue') DEFAULT 'Issued',
    FOREIGN KEY (copy_id) REFERENCES BookCopies (copy_id),
    FOREIGN KEY (member_id) REFERENCES Members (member_id),
    FOREIGN KEY (staff_id) REFERENCES Staff (staff_id)
);

CREATE TABLE Returns (
    return_id INT PRIMARY KEY AUTO_INCREMENT,
    issue_id INT,
    return_date DATE NOT NULL ,
    condition_status ENUM ('Good', 'Damaged', 'Lost') DEFAULT 'Good',
    remarks VARCHAR(200),
    FOREIGN KEY (issue_id) REFERENCES IssueRecords (issue_id)
);

CREATE TABLE Fines (
    fine_id INT PRIMARY KEY AUTO_INCREMENT,
    issue_id INT ,
    member_id INT,
    amount DECIMAL (8,2) NOT NULL,
    reason VARCHAR (100),
    paid_status ENUM ('Paid', 'Unpaid') DEFAULT 'Unpaid',
    paid_date DATE,
    FOREIGN KEY (issue_id) REFERENCES IssueRecords (issue_id),
    FOREIGN KEY (member_id) REFERENCES members (member_id)
);

CREATE TABLE Reservations (
    reservation_id INT PRIMARY KEY AUTO_INCREMENT,
    book_id INT,
    member_id INT,
    reservation_date DATE NOT NULL,
    status ENUM ('Pending', 'Fulfilled', 'Cancelled') DEFAULT 'Pending',
    FOREIGN KEY (book_id) REFERENCES Books (book_id),
    FOREIGN KEY (member_id) REFERENCES Members (member_id)
);

