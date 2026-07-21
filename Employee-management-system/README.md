# 🧑‍💼 Employee Management System (EMS)

A complete **MySQL-based Employee Management System** designed to manage departments, positions, employees, attendance, leave, payroll, bonuses, performance reviews, and projects through a clean 12-table relational schema.

---

## 📖 About the Project

This project models the day-to-day HR operations of an organization — from defining departments and job positions to tracking employee attendance, processing leave requests, running payroll, awarding bonuses, recording performance reviews, and assigning employees to projects. It follows a structured, step-by-step design approach: **schema design → table creation → data insertion → querying**.

---

## 🗂️ Database Schema

The system is built on **12 interconnected tables**:

| # | Table | Purpose |
|---|-------|---------|
| 1 | `departments` | Organizational departments and budgets |
| 2 | `positions` | Job titles with salary bands |
| 3 | `employees` | Employee personal, job & reporting details |
| 4 | `salaries` | Salary amount history per employee |
| 5 | `attendance` | Daily attendance records per employee |
| 6 | `leave_types` | Categories of leave and annual limits |
| 7 | `leave_requests` | Leave applications and approval status |
| 8 | `payroll` | Monthly pay run per employee |
| 9 | `bonuses` | One-off bonus payments per employee |
| 10 | `performance_reviews` | Reviewer ratings & comments per employee |
| 11 | `projects` | Projects run within a department |
| 12 | `employee_projects` | Many-to-many link between employees & projects |

---

## 🔗 Key Relationships

- One **Department** → Many **Employees**
- One **Employee** → Many **Employees** (self-referencing `manager_id` for reporting hierarchy)
- One **Employee** → Many **Salaries** (salary history)
- One **Employee** → Many **Attendance** records
- One **Employee** → Many **Leave Requests**
- One **Employee** → Many **Payroll** records
- One **Employee** → Many **Bonuses**
- One **Employee** → Many **Performance Reviews**
- Many **Employees** ↔ Many **Projects** (via `employee_projects`)

---

## ⚙️ Tech Stack

- **Database:** MySQL
- **Query Types Covered:** Basic SELECTs, JOINs (including self-joins), Subqueries, Aggregate Functions, Date/Time Functions, CASE Statements

---

## 🚀 Getting Started

1. Clone all my sql project repository
   ```bash
   git clone https://github.com/sanjeevstr/SQL/.git
   ```
2. Import the schema into MySQL:
   ```bash
   mysql -u root -p your_database_name < ems_schema.sql
   ```
3. Run the sample queries from the included `.sql` query reference file.

---

## 📌 Recommended Table Creation Order

```
Departments → Positions → Leave Types → Employees → 
Salaries → Attendance → Leave Requests → Payroll → 
Bonuses → Performance Reviews → Projects → Employee Projects
```

This order respects foreign key dependencies (including the self-referencing `manager_id` on `employees`) and avoids constraint errors.

---

## 🧑‍💻 Author

**Sanjeev Sharma**  
📧 sanjeevstr01@gmail.com  
🔗 [LinkedIn](https://www.linkedin.com/in/sanjeev-sharma-929847398) | [Twitter](https://x.com/sanjeev_str)

---

## 📄 License

This project is licensed under the **MIT License** — see the [LICENSE](LICENSE) file for details.
