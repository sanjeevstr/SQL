# 📚 Library Management System (LMS)

A complete **MySQL-based Library Management System** designed to manage books, members, staff, book issues/returns, fines, and reservations through a clean 12-table relational schema.

---

## 📖 About the Project

This project models the day-to-day operations of a library — from cataloging books and authors to tracking who has borrowed what, managing due dates, calculating fines, and handling reservations for unavailable books. It follows a structured, step-by-step design approach: **schema design → table creation → data insertion → querying**.

---

## 🗂️ Database Schema

The system is built on **12 interconnected tables**:

| # | Table | Purpose |
|---|-------|---------|
| 1 | `Publishers` | Stores publisher details |
| 2 | `Categories` | Book categories/genres |
| 3 | `Authors` | Author details |
| 4 | `Books` | Book title records |
| 5 | `BookAuthors` | Many-to-many link between books & authors |
| 6 | `BookCopies` | Individual physical copies of a book |
| 7 | `Members` | Library member details |
| 8 | `Staff` | Librarian/staff details |
| 9 | `IssueRecords` | Tracks book issues |
| 10 | `Returns` | Tracks book returns |
| 11 | `Fines` | Tracks penalties for late/damaged returns |
| 12 | `Reservations` | Tracks member reservation requests |

---

## 🔗 Key Relationships

- One **Book** → Many **BookCopies**
- Many **Books** ↔ Many **Authors** (via `BookAuthors`)
- One **Member** → Many **IssueRecords**
- One **IssueRecord** → One **Return**
- One **Member** → Many **Fines**
- One **Member** → Many **Reservations**

---

## ⚙️ Tech Stack

- **Database:** MySQL
- **Query Types Covered:** Basic SELECTs, JOINs, Subqueries, Aggregate Functions, Window Functions, Date Functions, CASE Statements

---

## 🚀 Getting Started

1. Clone this repository
   ```bash
   git clone https://github.com/sanjeevstr/library-management-system.git
   ```
2. Import the schema into MySQL:
   ```bash
   mysql -u root -p your_database_name < schema.sql
   ```
3. Run the sample queries from the included `.sql` query reference file.

---

## 📌 Recommended Table Creation Order

```
Publishers → Categories → Authors → Books → BookAuthors → 
BookCopies → Members → Staff → IssueRecords → Returns → Fines → Reservations
```

This order respects foreign key dependencies and avoids constraint errors.

---

## 🧑‍💻 Author

**Sanjeev Sharma**  
📧 sanjeevstr01@gmail.com  
🔗 [LinkedIn](https://www.linkedin.com/in/sanjeev-sharma-929847398) | [Twitter](https://x.com/sanjeev_str)

---

## 📄 License

This project is licensed under the **MIT License** — see the [LICENSE](LICENSE) file for details.
