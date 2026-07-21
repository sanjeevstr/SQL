-- Active: 1782628847135@@127.0.0.1@3306@employee
use employee;

INSERT INTO departments (dept_name, location, budget) VALUES
('Human Resources', 'Patna', 2500000.00),
('Information Technology', 'Bangalore', 8500000.00),
('Finance', 'Mumbai', 5000000.00),
('Sales', 'Delhi', 6000000.00),
('Marketing', 'Delhi', 4500000.00),
('Operations', 'Patna', 3000000.00),
('Research & Development', 'Hyderabad', 9500000.00),
('Customer Support', 'Bangalore', 2000000.00),
('Legal', 'Mumbai', 1800000.00),
('Administration', 'Patna', 1500000.00);

INSERT INTO positions (title, min_salary, max_salary) VALUES
('Software Engineer', 600000.00, 1200000.00),
('Senior Software Engineer', 1200000.00, 2000000.00),
('HR Executive', 350000.00, 600000.00),
('HR Manager', 800000.00, 1400000.00),
('Accountant', 400000.00, 700000.00),
('Finance Manager', 1000000.00, 1800000.00),
('Sales Executive', 350000.00, 650000.00),
('Sales Manager', 900000.00, 1600000.00),
('Marketing Specialist', 450000.00, 800000.00),
('Operations Manager', 850000.00, 1500000.00),
('Research Analyst', 500000.00, 900000.00),
('Customer Support Executive', 300000.00, 550000.00);

SHOW TABLES;
DESC departmentS;

DELETE FROM positions
WHERE position_id = 12;

INSERT INTO employees (first_name, last_name, email, phone, hire_date, dept_id, manager_id, position_id, job_title, status) VALUES
('Sanjeev', 'Sharma', 'sanjeev.str01@gmail.com', '9608487749', '2019-03-10', 2, NULL, 2, 'Senior Software Engineer', 'Active'),
('Raushan', 'Gupta', 'raushan.gupta@gmail.com', '9812233445', '2020-06-15', 2, 1, 1, 'Software Engineer', 'Active'),
('Richa', 'Pandey', 'richa.pandey@gmail.com', '9823344556', '2021-01-20', 1, 1, 4, 'HR Manager', 'Active'),
('Moni', 'Gupta', 'moni.gupta@gmail.com', '9834455667', '2020-11-05', 3, 1, 5, 'Accountant', 'Active'),
('Riya', 'Kumari', 'riya.kumari@gmail.com', '9845566778', '2022-02-14', 5, 1, 9, 'Marketing Specialist', 'Active'),
('Nikki', 'Kumari', 'nikki.str@gmail.com', '9856677889', '2021-07-19', 4, 1, 7, 'Sales Executive', 'Active'),
('Soni', 'Singh', 'soni.singh@gmail.com', '9867788990', '2019-09-25', 4, 1, 8, 'Sales Manager', 'Active'),
('Palak', 'Kumari', 'palak.kumari@gmail.com', '9878899001', '2022-05-30', 8, 1, 8, 'Customer Support Executive', 'Active'),
('Ajay', 'Kumar', 'ajay.kumar@gmail.com', '9889900112', '2020-08-12', 7, 1, 3, 'Research Analyst', 'Active'),
('Prachi', 'Singh', 'prachi.Singh@gmail.com', '9890011223', '2023-01-09', 6, 1, 10, 'Operations Manager', 'Active');

SELECT *FROM departments;
SELECT *FROM positions;

SELECT position_id, title FROM positions ORDER BY position_id;
SELECT dept_id, dept_name FROM departments ORDER BY dept_id;

INSERT INTO employees (first_name, last_name, email, phone, hire_date, dept_id, manager_id, position_id, job_title, status) VALUES
('Sanjeev', 'Sharma', 'sanjeev.str01@gmail.com', '9608487749', '2019-03-10', 2, NULL, 2, 'Senior Software Engineer', 'Active'),
('Raushan', 'Gupta', 'raushan.gupta@gmail.com', '9812233445', '2020-06-15', 2, 101, 1, 'Software Engineer', 'Active'),
('Richa', 'Pandey', 'richa.pandey@gmail.com', '9823344556', '2021-01-20', 1, 101, 4, 'HR Manager', 'Active'),
('Moni', 'Gupta', 'moni.gupta@gmail.com', '9834455667', '2020-11-05', 3, 101, 5, 'Accountant', 'Active'),
('Riya', 'Kumari', 'riya.kumari@gmail.com', '9845566778', '2022-02-14', 5, 101, 9, 'Marketing Specialist', 'Active'),
('Nikki', 'Kumari', 'nikki.str@gmail.com', '9856677889', '2021-07-19', 4, 101, 7, 'Sales Executive', 'Active'),
('Soni', 'Singh', 'soni.singh@gmail.com', '9867788990', '2019-09-25', 4, 101, 8, 'Sales Manager', 'Active'),
('Palak', 'Kumari', 'palak.kumari@gmail.com', '9878899001', '2022-05-30', 8, 101, 8, 'Customer Support Executive', 'Active'),
('Ajay', 'Kumar', 'ajay.kumar@gmail.com', '9889900112', '2020-08-12', 7, 101, 3, 'Research Analyst', 'Active'),
('Prachi', 'Singh', 'prachi.Singh@gmail.com', '9890011223', '2023-01-09', 6, 101, 10, 'Operations Manager', 'Active');

SELECT 
    e.emp_id, 
    e.first_name AS employee_name, 
    m.first_name AS manager_name
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.emp_id;

SELECT *from salaries;

INSERT INTO salaries (emp_id, amount, effective_date, currency) VALUES
(101, 1650000.00, '2019-03-10', 'INR'),
(102, 850000.00, '2020-06-15', 'INR'),
(103, 1100000.00, '2021-01-20', 'INR'),
(104, 550000.00, '2020-11-05', 'INR'),
(105, 620000.00, '2022-02-14', 'INR'),
(106, 480000.00, '2021-07-19', 'INR'),
(107, 1200000.00, '2019-09-25', 'INR'),
(108, 420000.00, '2022-05-30', 'INR'),
(109, 580000.00, '2020-08-12', 'INR'),
(110, 1050000.00, '2023-01-09', 'INR');

SELECT *from attendance;

INSERT INTO attendance (emp_id, date, check_in, check_out, status) VALUES
(101, '2026-07-01', '09:00:00', '18:00:00', 'Present'),
(102, '2026-07-01', '09:15:00', '18:05:00', 'Present'),
(103, '2026-07-01', '09:05:00', '17:55:00', 'Present'),
(104, '2026-07-01', NULL, NULL, 'Absent'),
(105, '2026-07-01', '09:30:00', '13:30:00', 'Half Day'),
(106, '2026-07-01', '09:10:00', '18:00:00', 'Present'),
(107, '2026-07-01', NULL, NULL, 'Leave'),
(108, '2026-07-01', '09:00:00', '18:10:00', 'Present'),
(109, '2026-07-01', '09:20:00', '17:50:00', 'Present'),
(110, '2026-07-01', '09:05:00', '18:00:00', 'Present');

SELECT *from leave_types;

INSERT INTO leave_types (leave_name, max_days_per_year) VALUES
('Casual Leave', 12),
('Sick Leave', 10),
('Earned Leave', 15),
('Maternity Leave', 180),
('Paternity Leave', 15),
('Unpaid Leave', 30);

SELECT *from leave_requests;

INSERT INTO leave_requests (emp_id, leave_type_id, start_date, end_date, status, approved_by) VALUES
(102, 1, '2026-06-10', '2026-06-11', 'Approved', 101),
(103, 2, '2026-05-20', '2026-05-22', 'Approved', 101),
(104, 3, '2026-07-05', '2026-07-08', 'Pending', NULL),
(105, 1, '2026-04-15', '2026-04-15', 'Approved', 101),
(106, 2, '2026-06-01', '2026-06-02', 'Rejected', 101),
(107, 3, '2026-07-01', '2026-07-03', 'Approved', 101),
(108, 1, '2026-05-10', '2026-05-10', 'Approved', 101),
(109, 6, '2026-08-01', '2026-08-10', 'Pending', NULL),
(110, 4, '2026-09-01', '2027-02-28', 'Approved', 101),
(101, 3, '2026-12-20', '2026-12-31', 'Pending', NULL);

INSERT INTO payroll (emp_id, month, year, basic_pay, deductions, net_pay) VALUES
(101, 7, 2026, 137500.00, 13750.00, 123750.00),
(102, 7, 2026, 70833.33, 7083.33, 63750.00),
(103, 7, 2026, 91666.67, 9166.67, 82500.00),
(104, 7, 2026, 45833.33, 4583.33, 41250.00),
(105, 7, 2026, 51666.67, 5166.67, 46500.00),
(106, 7, 2026, 40000.00, 4000.00, 36000.00),
(107, 7, 2026, 100000.00, 10000.00, 90000.00),
(108, 7, 2026, 35000.00, 3500.00, 31500.00),
(109, 7, 2026, 48333.33, 4833.33, 43500.00),
(110, 7, 2026, 87500.00, 8750.00, 78750.00);

SELECT *FROM bonuses;
INSERT INTO bonuses (emp_id, amount, reason, date_awarded) VALUES
(101, 50000.00, 'Annual performance bonus', '2026-04-01'),
(102, 15000.00, 'Project completion bonus', '2026-03-15'),
(103, 20000.00, 'Employee of the month', '2026-05-10'),
(104, 10000.00, 'Diwali bonus', '2025-10-25'),
(105, 12000.00, 'Successful campaign launch', '2026-02-20'),
(106, 8000.00, 'Sales target achieved', '2026-06-05'),
(107, 25000.00, 'Team leadership bonus', '2026-01-15'),
(108, 5000.00, 'Customer satisfaction award', '2026-03-01'),
(109, 10000.00, 'Research milestone bonus', '2026-04-18'),
(110, 18000.00, 'Operational excellence bonus', '2026-05-30');

SELECT *FROM performance_reviews;

INSERT INTO performance_reviews (emp_id, reviewer_id, review_date, rating, comments) VALUES
(102, 101, '2026-06-30', 4.5, 'Consistently delivers high quality code, good team player'),
(103, 101, '2026-06-30', 4.8, 'Excellent HR policy handling and employee relations'),
(104, 101, '2026-06-30', 3.9, 'Accurate reporting, needs to improve turnaround time'),
(105, 101, '2026-06-30', 4.2, 'Creative campaigns, strong social media growth'),
(106, 101, '2026-06-30', 3.7, 'Meets targets, could improve client follow-ups'),
(107, 101, '2026-06-30', 4.6, 'Strong leadership, exceeded sales targets'),
(108, 101, '2026-06-30', 4.0, 'Good customer handling, positive feedback from clients'),
(109, 101, '2026-06-30', 4.3, 'Solid research output, well documented findings'),
(110, 101, '2026-06-30', 4.4, 'Efficient operations management, reduced downtime'),
(101, NULL, '2026-06-30', 4.9, 'Outstanding leadership and technical direction');

SELECT *FROM projects;

INSERT INTO projects (project_name, start_date, end_date, dept_id) VALUES
('EMS Portal Development', '2026-01-10', '2026-08-31', 2),
('HR Policy Digitization', '2026-02-01', '2026-05-30', 1),
('Annual Financial Audit', '2026-03-01', '2026-06-15', 3),
('Product Launch Campaign', '2026-04-01', '2026-07-31', 5),
('Regional Sales Expansion', '2026-01-15', '2026-12-31', 4),
('Process Automation Initiative', '2026-02-15', '2026-09-30', 6),
('AI Research Prototype', '2026-01-05', '2026-11-30', 7),
('Customer Feedback System', '2026-03-10', '2026-06-30', 8),
('Legal Compliance Review', '2026-05-01', '2026-08-15', 9),
('Office Infrastructure Upgrade', '2026-06-01', '2026-10-31', 10);

SELECT *FROM employee_projects;

INSERT INTO employee_projects (emp_id, project_id, role_in_project, hours_allocated) VALUES
(101, 1, 'Project Lead', 300),
(102, 1, 'Developer', 400),
(103, 2, 'HR Coordinator', 200),
(104, 3, 'Financial Analyst', 250),
(105, 4, 'Campaign Designer', 220),
(106, 5, 'Sales Coordinator', 350),
(107, 5, 'Regional Head', 300),
(108, 8, 'Support Analyst', 180),
(109, 7, 'Research Lead', 400),
(110, 6, 'Process Manager', 260),
(101, 7, 'Technical Advisor', 100),
(102, 6, 'Automation Developer', 150);



