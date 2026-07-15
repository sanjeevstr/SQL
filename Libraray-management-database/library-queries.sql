SELECT * FROM Books;

SELECT title, isbn, publication_year FROM Books;

SELECT * FROM Books WHERE category_id = 3;

SELECT * FROM Books WHERE publication_year = 1980;

SELECT * FROM Books WHERE price > 500;

SELECT * FROM Books WHERE price BETWEEN 200 AND 800;

SELECT * FROM Books WHERE language = 'English';

SELECT * FROM Books WHERE title LIKE '%the%';

SELECT * FROM Books WHERE title LIKE 'The%';

SELECT * FROM Books WHERE isbn IS NULL;

SELECT * FROM Books WHERE isbn IS NOT NULL;

SELECT * FROM Books ORDER BY publication_year DESC;

SELECT * FROM Books ORDER BY price ASC LIMIT 10;

SELECT DISTINCT language FROM Books;

SELECT DISTINCT category_id FROM Books;

SELECT * FROM Members WHERE status = 'Active';

SELECT * FROM Members WHERE membership_type = 'Student';

SELECT * FROM Members WHERE email LIKE '%gmail.com';

SELECT * FROM Members WHERE membership_date >= '2023-01-01';

SELECT first_name, last_name FROM Members WHERE status = 'Suspended';

SELECT * FROM Authors WHERE nationality = 'Indian';

SELECT * FROM Authors WHERE date_of_birth < '1970-01-01';

SELECT * FROM Authors ORDER BY last_name ASC;

SELECT * FROM Publishers WHERE publisher_name LIKE '%Books%';

SELECT * FROM Categories WHERE category_name = 'Fiction';

SELECT * FROM BookCopies WHERE status = 'Available';

SELECT * FROM BookCopies WHERE status = 'Issued';

SELECT * FROM BookCopies WHERE book_id = 5;

SELECT COUNT(*) FROM BookCopies WHERE status = 'Damaged';

SELECT * FROM IssueRecords WHERE status = 'Overdue';

SELECT * FROM IssueRecords WHERE issue_date = CURDATE();

SELECT * FROM IssueRecords WHERE due_date < CURDATE() AND status = 'Issued';

SELECT * FROM IssueRecords WHERE member_id = 4;

SELECT * FROM Fines WHERE paid_status = 'Unpaid';

SELECT SUM(amount) FROM Fines WHERE paid_status = 'Unpaid';

SELECT * FROM Fines WHERE amount < 50;

SELECT * FROM Reservations WHERE status = 'Pending';

SELECT COUNT(*) FROM Books;

SELECT COUNT(*) FROM Members WHERE status = 'Active';

SELECT category_id, COUNT(*) AS total_books FROM Books GROUP BY category_id;

SELECT publisher_id, COUNT(*) AS total_books FROM Books GROUP BY publisher_id;

SELECT membership_type, COUNT(*) AS total_members FROM Members GROUP BY membership_type;

SELECT status, COUNT(*) AS total_copies FROM BookCopies GROUP BY status;

SELECT category_id, AVG(price) AS avg_price FROM Books GROUP BY category_id;

SELECT category_id, COUNT(*) AS total FROM Books GROUP BY category_id HAVING COUNT(*) > 5;

SELECT member_id, COUNT(*) AS total_fines FROM Fines GROUP BY member_id HAVING COUNT(*) > 1;

SELECT staff_id, COUNT(*) AS total_issues FROM IssueRecords GROUP BY staff_id;

SELECT b.title, c.category_name FROM Books b JOIN Categories c ON b.category_id = c.category_id;

SELECT b.title, p.publisher_name FROM Books b JOIN Publishers p ON b.publisher_id = p.publisher_id;

SELECT b.title, a.first_name, a.last_name FROM Books b JOIN BookAuthors ba ON b.book_id = ba.book_id JOIN Authors a ON ba.author_id = a.author_id;

SELECT bc.copy_id, b.title, bc.status FROM BookCopies bc JOIN Books b ON bc.book_id != b.book_id;

SELECT m.first_name, m.last_name, i.issue_date, i.due_date FROM IssueRecords i JOIN Members m ON i.member_id = m.member_id;

SELECT m.first_name, m.last_name, b.title, i.issue_date FROM IssueRecords i JOIN Members m ON i.member_id = m.member_id JOIN BookCopies bc ON i.copy_id = bc.copy_id JOIN Books b ON bc.book_id = b.book_id;

SELECT m.first_name, m.last_name, f.amount, f.reason FROM Fines f JOIN Members m ON f.member_id = m.member_id;

SELECT i.issue_id, b.title, r.return_date, r.condition_status FROM Returns r JOIN IssueRecords i ON r.issue_id = i.issue_id JOIN BookCopies bc ON i.copy_id = bc.copy_id JOIN Books b ON bc.book_id = b.book_id;

SELECT m.first_name, m.last_name, res.reservation_date, b.title FROM Reservations res JOIN Members m ON res.member_id = m.member_id JOIN Books b ON res.book_id = b.book_id;

SELECT s.first_name, s.last_name, i.issue_date FROM IssueRecords i JOIN Staff s ON i.staff_id = s.staff_id;

SELECT b.title FROM Books b LEFT JOIN BookCopies bc ON b.book_id = bc.book_id WHERE bc.copy_id IS NULL;

SELECT m.first_name, m.last_name FROM Members m LEFT JOIN IssueRecords i ON m.member_id = i.member_id WHERE i.issue_id IS NULL;

SELECT b.title FROM Books b WHERE b.book_id IN (SELECT book_id FROM BookCopies WHERE status = 'Available');

SELECT * FROM Members WHERE member_id IN (SELECT member_id FROM Fines WHERE paid_status = 'Unpaid');

SELECT * FROM Books WHERE price > (SELECT AVG(price) FROM Books);

SELECT * FROM Books WHERE price = (SELECT MAX(price) FROM Books);

SELECT * FROM Books WHERE price = (SELECT MIN(price) FROM Books);

SELECT title FROM Books WHERE book_id NOT IN (SELECT book_id FROM BookCopies);

SELECT m.first_name, m.last_name FROM Members m WHERE EXISTS (SELECT 1 FROM IssueRecords i WHERE i.member_id = m.member_id AND i.status = 'Overdue');

SELECT a.first_name, a.last_name FROM Authors a WHERE EXISTS (SELECT 1 FROM BookAuthors ba WHERE ba.author_id = a.author_id);

SELECT title, price, (SELECT AVG(price) FROM Books) AS avg_price FROM Books;

SELECT category_name, (SELECT COUNT(*) FROM Books b WHERE b.category_id = c.category_id) AS total_books FROM Categories c;

SELECT * FROM Books ORDER BY price DESC LIMIT 5;

SELECT * FROM Books ORDER BY price ASC LIMIT 5;

SELECT title, price, RANK() OVER (ORDER BY price DESC) AS price_rank FROM Books;

SELECT title, category_id, DENSE_RANK() OVER (PARTITION BY category_id ORDER BY price DESC) AS rank_in_category FROM Books;

SELECT member_id, issue_date, ROW_NUMBER() OVER (PARTITION BY member_id ORDER BY issue_date DESC) AS rn FROM IssueRecords;

SELECT title, price, SUM(price) OVER (PARTITION BY category_id) AS category_total FROM Books;

SELECT member_id, COUNT(*) OVER (PARTITION BY member_id) AS total_issues FROM IssueRecords;

SELECT title, price, price - LAG(price) OVER (ORDER BY publication_year) AS price_diff FROM Books;

SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM Members;

SELECT CONCAT(first_name, ' ', last_name) AS author_name, nationality FROM Authors;

SELECT title, YEAR(publication_year) AS pub_year FROM Books;

SELECT member_id, DATEDIFF(due_date, issue_date) AS allowed_days FROM IssueRecords;

SELECT issue_id, DATEDIFF(CURDATE(), due_date) AS overdue_days FROM IssueRecords WHERE status = 'Overdue';

SELECT * FROM Members WHERE YEAR(membership_date) = 2024;

SELECT * FROM IssueRecords WHERE MONTH(issue_date) = 6;

SELECT UPPER(title) AS title_upper FROM Books;

SELECT LOWER(email) AS email_lower FROM Members;

SELECT title, LENGTH(title) AS title_length FROM Books ORDER BY title_length DESC;

SELECT * FROM Books WHERE title LIKE '_a%';

SELECT * FROM Members WHERE phone LIKE '98%';

SELECT * FROM Books b1 WHERE (SELECT COUNT(*) FROM BookAuthors ba WHERE ba.book_id = b1.book_id) > 1;

SELECT m.member_id, m.first_name, COUNT(i.issue_id) AS total_books_issued FROM Members m JOIN IssueRecords i ON m.member_id = i.member_id GROUP BY m.member_id, m.first_name ORDER BY total_books_issued DESC;

SELECT b.title, COUNT(i.issue_id) AS times_issued FROM Books b JOIN BookCopies bc ON b.book_id = bc.book_id JOIN IssueRecords i ON bc.copy_id = i.copy_id GROUP BY b.title ORDER BY times_issued DESC LIMIT 10;

SELECT m.first_name, m.last_name, SUM(f.amount) AS total_fine FROM Members m JOIN Fines f ON m.member_id = f.member_id GROUP BY m.member_id ORDER BY total_fine DESC;

SELECT category_name, SUM(b.price) AS total_value FROM Categories c JOIN Books b ON c.category_id = b.category_id GROUP BY category_name;

SELECT * FROM Members WHERE member_id NOT IN (SELECT DISTINCT member_id FROM IssueRecords);

SELECT b.title FROM Books b JOIN BookCopies bc ON b.book_id = bc.book_id WHERE bc.status = 'Lost';

SELECT * FROM IssueRecords WHERE status = 'Issued' AND due_date BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 3 DAY);

SELECT b.title, a.first_name, a.last_name FROM Books b JOIN BookAuthors ba ON b.book_id = ba.book_id JOIN Authors a ON ba.author_id = a.author_id WHERE a.last_name = 'Sharma';

SELECT m.first_name, m.last_name, m.email FROM Members m WHERE m.membership_type = 'Faculty' AND m.status = 'Active';

SELECT b.title, p.publisher_name, c.category_name FROM Books b JOIN Publishers p ON b.publisher_id = p.publisher_id JOIN Categories c ON b.category_id = c.category_id WHERE b.publication_year > 2015;

SELECT staff_id, first_name, last_name FROM Staff WHERE role = 'Librarian';

SELECT * FROM Reservations WHERE reservation_date = CURDATE();

SELECT b.title, COUNT(res.reservation_id) AS reservation_count FROM Books b JOIN Reservations res ON b.book_id = res.book_id GROUP BY b.title HAVING COUNT(res.reservation_id) > 1;

SELECT m.member_id, m.first_name, m.last_name FROM Members m WHERE m.member_id IN (SELECT member_id FROM IssueRecords GROUP BY member_id HAVING COUNT(*) > 5);

SELECT b.title FROM Books b WHERE b.book_id NOT IN (SELECT DISTINCT book_id FROM Reservations);

SELECT a.first_name, a.last_name, COUNT(ba.book_id) AS books_written FROM Authors a JOIN BookAuthors ba ON a.author_id = ba.author_id GROUP BY a.author_id ORDER BY books_written DESC;

SELECT p.publisher_name, COUNT(b.book_id) AS total_books FROM Publishers p JOIN Books b ON p.publisher_id = b.publisher_id GROUP BY p.publisher_name ORDER BY total_books DESC LIMIT 1;

SELECT c.category_name, MAX(b.price) AS highest_price FROM Categories c JOIN Books b ON c.category_id = b.category_id GROUP BY c.category_name;

SELECT m.first_name, m.last_name, i.issue_date, i.due_date, DATEDIFF(CURDATE(), i.due_date) AS days_overdue FROM Members m JOIN IssueRecords i ON m.member_id = i.member_id WHERE i.status = 'Overdue' ORDER BY days_overdue DESC;

SELECT COUNT(*) AS total_active_issues FROM IssueRecords WHERE status = 'Issued';

SELECT b.title, bc.status, bc.rack_number FROM Books b JOIN BookCopies bc ON b.book_id = bc.book_id WHERE bc.rack_number = 'R1-A';

SELECT DATE_FORMAT(issue_date, '%Y-%m') AS issue_month, COUNT(*) AS total_issues FROM IssueRecords GROUP BY issue_month ORDER BY issue_month;

SELECT m.membership_type, AVG(DATEDIFF(r.return_date, i.issue_date)) AS avg_borrow_days FROM Members m JOIN IssueRecords i ON m.member_id = i.member_id JOIN Returns r ON i.issue_id = r.issue_id GROUP BY m.membership_type;

SELECT b.title FROM Books b WHERE b.book_id = ANY (SELECT book_id FROM BookCopies WHERE status = 'Reserved');

SELECT * FROM Members WHERE status = 'Active' AND member_id = ALL (SELECT member_id FROM Members WHERE status = 'Active');

SELECT title, price, CASE WHEN price > 800 THEN 'Expensive' WHEN price BETWEEN 300 AND 800 THEN 'Moderate' ELSE 'Cheap' END AS price_category FROM Books;

SELECT member_id, CASE WHEN status = 'Active' THEN 1 ELSE 0 END AS is_active FROM Members;

SELECT title FROM Books WHERE title IN ('The Alchemist', 'Wings of Fire', 'Sapiens');

SELECT * FROM Books WHERE category_id = 2 AND publication_year BETWEEN 2018 AND 2024 ORDER BY price DESC;

SELECT m.first_name, m.last_name, COUNT(DISTINCT i.copy_id) AS unique_books_borrowed FROM Members m JOIN IssueRecords i ON m.member_id = i.member_id GROUP BY m.member_id;

SELECT b.title FROM Books b WHERE b.book_id IN (SELECT bc.book_id FROM BookCopies bc GROUP BY bc.book_id HAVING COUNT(*) > 3);

SELECT * FROM Fines f WHERE f.member_id IN (SELECT member_id FROM Members WHERE membership_type = 'Student') AND f.paid_status = 'Unpaid';