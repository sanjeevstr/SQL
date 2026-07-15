USE library;

show tables;

INSERT INTO Publishers (publisher_name, address, phone, email) VALUES
('Penguin India', 'B4/62, Okhla Industrial Area, New Delhi', '9811000001', 'contact@penguinindia.com'),
('Rupa Publications', 'Daryaganj, New Delhi', '9811000002', 'info@rupapublications.com'),
('Westland Books', 'Padma Complex, Chennai', '9811000003', 'support@westlandbooks.com'),
('HarperCollins India', 'A-75, Sector 57, Noida', '9811000004', 'contact@harpercollins.co.in'),
('Bloomsbury India', 'DDA Complex, New Delhi', '9811000005', 'info@bloomsburyindia.com'),
('Juggernaut Books', 'Golf Course Road, Gurugram', '9811000006', 'hello@juggernaut.in');

INSERT INTO Categories (category_name, description) VALUES
('Fiction', 'Novels and imaginative storytelling'),
('Non-Fiction', 'Factual and informative books'),
('Mythology', 'Books based on Indian mythology and epics'),
('Self-Help', 'Books for personal growth and development'),
('Biography', 'Life stories of notable individuals'),
('Poetry', 'Collections of poems and verses');

INSERT INTO Authors (first_name, last_name, nationality, date_of_birth) VALUES
('Sanjeev', 'Kumar', 'Indian', '2002-03-15'),
('Ruskin', 'Bond', 'Indian', '1934-05-19'),
('R.K.', 'Narayan', 'Indian', '1906-10-10'),
('Chetan', 'Bhagat', 'Indian', '1974-04-22'),
('Arundhati', 'Roy', 'Indian', '1961-11-24'),
('Amish', 'Tripathi', 'Indian', '1974-10-18'),
('Sudha', 'Murty', 'Indian', '1950-08-19'),
('Vikram', 'Seth', 'Indian', '1952-06-20');

INSERT INTO Books (title, isbn, publisher_id, category_id, publication_year, edition, language, price) VALUES
('The Room on the Roof', '9788171675025', 2, 1, 1956, '1st', 'English', 250.00),
('Malgudi Days', '9780143039688', 1, 1, 1943, '2nd', 'English', 299.00),
('Five Point Someone', '9788129115300', 2, 1, 2004, '1st', 'English', 199.00),
('The God of Small Things', '9780679457312', 4, 1, 1997, '1st', 'English', 350.00),
('The Immortals of Meluha', '9788172234801', 3, 3, 2010, '1st', 'English', 299.00),
('Wise and Otherwise', '9780141001077', 1, 5, 2002, '1st', 'English', 250.00),
('A Suitable Boy', '9780140266323', 5, 1, 1993, '1st', 'English', 599.00),
('Vikram and the Vampire', '9788129135001', 2, 3, 1980, '1st', 'English', 199.00),
('One Night at the Call Center', '9788129108480', 2, 1, 2005, '1st', 'English', 199.00),
('Gitanjali', '9780486417186', 6, 6, 1910, '1st', 'English', 150.00);

SELECT *FROM bookauthors;
SELECT *FROM bookS;
INSERT INTO BookAuthors (book_id, author_id) VALUES
(11, 2),
(12, 3),
(13, 4),
(14, 5),
(15, 6),
(16, 7),
(17, 8),
(18, 2),
(19, 4),
(20, 1);

INSERT INTO BookCopies (book_id, race_number, status, purchase_date) VALUES
(1, 'A1-01', 'Available', '2021-01-10'),
(2, 'A1-02', 'Issued', '2020-05-15'),
(3, 'B2-01', 'Available', '2019-08-05'),
(4, 'B2-02', 'Issued', '2020-07-19'),
(5, 'C3-01', 'Available', '2022-02-14'),
(5, 'C3-02', 'Reserved', '2022-02-14'),
(6, 'D4-01', 'Available', '2021-09-09'),
(7, 'D4-02', 'Issued', '2019-12-01'),
(8, 'E5-01', 'Damaged', '2018-11-20'),
(9, 'E5-02', 'Available', '2020-03-30'),
(10, 'F6-01', 'Issued', '2021-06-25'),
(10, 'F6-02', 'Available', '2021-06-25');

INSERT INTO Members (first_name, last_name, email, phone, address, membership_date, membership_type, status) VALUES
('Riya', 'Sharma', 'riya.sharma@example.com', '9800000001', 'Kolkata, West Bengal', '2022-06-10', 'Student', 'Active'),
('Amit', 'Verma', 'amit.verma@example.com', '9800000002', 'Delhi', '2021-03-22', 'Faculty', 'Active'),
('Priya', 'Singh', 'priya.singh@example.com', '9800000003', 'Mumbai', '2023-08-01', 'General', 'Active'),
('Rahul', 'Das', 'rahul.das@example.com', '9800000004', 'Howrah, West Bengal', '2020-11-05', 'Student', 'Inactive'),
('Sneha', 'Roy', 'sneha.roy@example.com', '9800000005', 'Kolkata, West Bengal', '2022-02-18', 'Faculty', 'Active'),
('Vikram', 'Nair', 'vikram.nair@example.com', '9800000006', 'Chennai', '2021-07-30', 'General', 'Suspended'),
('Anjali', 'Gupta', 'anjali.gupta@example.com', '9800000007', 'Bangalore', '2023-04-12', 'Student', 'Active'),
('Karan', 'Mehta', 'karan.mehta@example.com', '9800000008', 'Pune', '2022-09-25', 'General', 'Active');

INSERT INTO Staff (first_name, last_name, email, phone, role, join_date) VALUES
('Suresh', 'Iyer', 'suresh.iyer@lms.com', '9900000001', 'Head Librarian', '2015-06-01'),
('Meena', 'Pillai', 'meena.pillai@lms.com', '9900000002', 'Assistant Librarian', '2018-03-14'),
('Rajesh', 'Khanna', 'rajesh.khanna@lms.com', '9900000003', 'Library Assistant', '2020-01-20'),
('Divya', 'Menon', 'divya.menon@lms.com', '9900000004', 'Cataloger', '2019-09-10'),
('Arjun', 'Rao', 'arjun.rao@lms.com', '9900000005', 'Library Assistant', '2021-11-02');

INSERT INTO IssueRecords (copy_id, member_id, staff_id, issue_date, due_date, status) VALUES
(2, 1, 1, '2024-06-01', '2024-06-15', 'Returned'),
(4, 2, 2, '2024-06-05', '2024-06-19', 'Returned'),
(8, 3, 1, '2024-06-10', '2024-06-24', 'Overdue'),
(9, 4, 3, '2024-06-12', '2024-06-26', 'Issued'),
(11, 5, 2, '2024-06-15', '2024-06-29', 'Issued'),
(2, 6, 1, '2024-07-01', '2024-07-15', 'Issued'),
(4, 7, 4, '2024-05-20', '2024-06-03', 'Returned'),
(8, 8, 3, '2024-04-10', '2024-04-24', 'Returned');

INSERT INTO Returns (issue_id, return_date, condition_status, remarks) VALUES
(1, '2024-06-14', 'Good', 'Returned on time'),
(2, '2024-06-20', 'Good', 'Returned one day late'),
(7, '2024-06-02', 'Good', 'Returned on time');

INSERT INTO Fines (issue_id, member_id, amount, reason, paid_status, paid_date) VALUES
(2, 2, 10.00, 'Late return (1 day)', 'Paid', '2024-06-20'),
(3, 3, 50.00, 'Overdue book', 'Unpaid', NULL);

INSERT INTO Reservations (book_id, member_id, reservation_date, status) VALUES
(15, 4, '2024-06-20', 'Pending'),
(11, 7, '2024-06-25', 'Pending');

SHOW TABLES;

SELECT *FROM reservations;