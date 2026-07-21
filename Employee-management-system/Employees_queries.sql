SELECT * FROM employees WHERE first_name = 'Sanjeev';
SELECT e.emp_id, e.first_name, e.last_name, d.dept_name
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
WHERE d.dept_name = 'Information Technology';
SELECT emp_id, first_name, last_name, job_title
FROM employees
WHERE job_title LIKE '%Manager%';
SELECT e.emp_id, e.first_name AS employee_name, m.first_name AS manager_name
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.emp_id;
SELECT e.emp_id, e.first_name, e.last_name, s.amount
FROM employees e
JOIN salaries s ON e.emp_id = s.emp_id
WHERE s.amount BETWEEN 500000 AND 1000000;
SELECT e.first_name, e.last_name, a.date, a.status
FROM attendance a
JOIN employees e ON a.emp_id = e.emp_id
WHERE a.date = '2026-07-01';
SELECT e.first_name, e.last_name, a.status
FROM attendance a
JOIN employees e ON a.emp_id = e.emp_id
WHERE a.status IN ('Absent', 'Leave');
SELECT e.first_name, e.last_name, lt.leave_name, lr.start_date, lr.end_date, lr.status
FROM leave_requests lr
JOIN employees e ON lr.emp_id = e.emp_id
JOIN leave_types lt ON lr.leave_type_id = lt.leave_type_id
WHERE lr.status = 'Pending';
SELECT e.first_name, e.last_name, p.month, p.year, p.net_pay
FROM payroll p
JOIN employees e ON p.emp_id = e.emp_id
WHERE p.month = 7 AND p.year = 2026;
SELECT e.first_name, e.last_name, b.amount, b.reason
FROM bonuses b
JOIN employees e ON b.emp_id = e.emp_id
WHERE b.amount > 15000;
SELECT e.first_name, e.last_name, pr.rating, pr.comments
FROM performance_reviews pr
JOIN employees e ON pr.emp_id = e.emp_id
WHERE pr.rating >= 4.5;
SELECT e.first_name, e.last_name, ep.role_in_project, ep.hours_allocated
FROM employee_projects ep
JOIN employees e ON ep.emp_id = e.emp_id
JOIN projects pj ON ep.project_id = pj.project_id
WHERE pj.project_name = 'EMS Portal Development';
SELECT e.first_name, e.last_name, pj.project_name, ep.role_in_project
FROM employee_projects ep
JOIN employees e ON ep.emp_id = e.emp_id
JOIN projects pj ON ep.project_id = pj.project_id
WHERE e.first_name = 'Sanjeev';
SELECT emp_id, first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '2020-01-01' AND '2021-12-31';
SELECT 
    e.emp_id, e.first_name, e.last_name,
    d.dept_name, p.title AS position_title,
    s.amount AS current_salary,
    m.first_name AS manager_name
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
JOIN positions p ON e.position_id = p.position_id
JOIN salaries s ON e.emp_id = s.emp_id
LEFT JOIN employees m ON e.manager_id = m.emp_id
ORDER BY e.emp_id;