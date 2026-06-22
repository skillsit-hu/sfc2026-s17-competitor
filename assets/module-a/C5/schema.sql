CREATE TABLE C5_books (
  id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(100) NOT NULL,
  author VARCHAR(50) NOT NULL,
  category VARCHAR(30) NOT NULL
);

CREATE TABLE C5_members (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL
);

CREATE TABLE C5_loans (
  id INT PRIMARY KEY AUTO_INCREMENT,
  book_id INT NOT NULL,
  member_id INT NOT NULL,
  loan_date DATE NOT NULL,
  return_date DATE
);

INSERT INTO C5_books (id, title, author, category) VALUES
  (1, 'Clean Code', 'Robert Martin', 'Technology'),
  (2, 'The Pragmatic Programmer', 'Andrew Hunt', 'Technology'),
  (3, 'Sapiens', 'Yuval Noah Harari', 'History'),
  (4, '1984', 'George Orwell', 'Fiction'),
  (5, 'Brave New World', 'Aldous Huxley', 'Fiction'),
  (6, 'A Brief History of Time', 'Stephen Hawking', 'Science'),
  (7, 'The Selfish Gene', 'Richard Dawkins', 'Science'),
  (8, 'Educated', 'Tara Westover', 'Biography'),
  (9, 'Refactoring', 'Martin Fowler', 'Technology'),
  (10, 'Guns, Germs, and Steel', 'Jared Diamond', 'History'),
  (11, 'Fahrenheit 451', 'Ray Bradbury', 'Fiction'),
  (12, 'Animal Farm', 'George Orwell', 'Fiction'),
  (13, 'Cosmos', 'Carl Sagan', 'Science'),
  (14, 'The Gene', 'Siddhartha Mukherjee', 'Science'),
  (15, 'Steve Jobs', 'Walter Isaacson', 'Biography'),
  (16, 'Long Walk to Freedom', 'Nelson Mandela', 'Biography');

INSERT INTO C5_members (id, name) VALUES
  (1, 'Alice'),
  (2, 'Bob'),
  (3, 'Charlie'),
  (4, 'Diana'),
  (5, 'Ethan'),
  (6, 'Fiona');

INSERT INTO C5_loans (id, book_id, member_id, loan_date, return_date) VALUES
  (1, 1, 1, '2026-05-01', '2026-05-10'),
  (2, 4, 1, '2026-05-15', NULL),
  (3, 3, 2, '2026-05-03', '2026-05-12'),
  (4, 6, 2, '2026-05-20', NULL),
  (5, 2, 1, '2026-06-01', NULL),
  (6, 5, 3, '2026-06-02', '2026-06-09'),
  (7, 9, 4, '2026-05-05', '2026-05-18'),
  (8, 11, 4, '2026-05-22', NULL),
  (9, 7, 5, '2026-05-08', '2026-05-15'),
  (10, 13, 5, '2026-06-03', NULL),
  (11, 10, 6, '2026-05-12', '2026-05-25'),
  (12, 15, 3, '2026-06-05', NULL),
  (13, 12, 1, '2026-04-20', '2026-04-28'),
  (14, 8, 6, '2026-05-28', NULL),
  (15, 14, 2, '2026-06-08', NULL),
  (16, 16, 4, '2026-04-15', '2026-04-30');
