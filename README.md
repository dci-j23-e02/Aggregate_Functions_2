# Aggregate Functions 2

Let's create a simple database scenario for a bookstore. The database will be named `BookstoreDB`. It will include four tables: `Authors`, `Books`, `Categories`, and `Orders`.

### Database Name:
- `BookstoreDB`

### Tables and Their Creation Commands:

1. **Authors Table** - Stores information about authors.

```sql
CREATE TABLE Authors (
    author_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    country VARCHAR(50)
);
```

2. **Categories Table** - Stores book categories.

```sql
CREATE TABLE Categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL
);
```

3. **Books Table** - Stores information about books, linked to authors and categories.

```sql
CREATE TABLE Books (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    author_id INT REFERENCES Authors(author_id),
    category_id INT REFERENCES Categories(category_id),
    price DECIMAL(10, 2) NOT NULL,
    publication_year INT
);
```

4. **Orders Table** - Stores orders placed for books.

```sql
CREATE TABLE Orders (
    order_id SERIAL PRIMARY KEY,
    book_id INT REFERENCES Books(book_id),
    quantity INT NOT NULL,
    order_date DATE NOT NULL
);
```

### Inserting Sample Data:

1. **Authors**

```sql
INSERT INTO Authors (name, country) VALUES
('J.K. Rowling', 'United Kingdom'),
('George R.R. Martin', 'United States'),
('Leo Tolstoy', 'Russia'),
('Mark Twain', 'United States'),
('Jane Austen', 'United Kingdom');
```

2. **Categories**

```sql
INSERT INTO Categories (category_name) VALUES
('Fantasy'),
('Science Fiction'),
('Classic Literature'),
('Historical Fiction'),
('Mystery');
```

3. **Books**

```sql
INSERT INTO Books (title, author_id, category_id, price, publication_year) VALUES
('Harry Potter and the Sorcerer''s Stone', 1, 1, 19.99, 1997),
('A Game of Thrones', 2, 1, 22.90, 1996),
('War and Peace', 3, 3, 25.00, 1869),
('The Adventures of Tom Sawyer', 4, 3, 7.99, 1876),
('Pride and Prejudice', 5, 4, 9.99, 1813);
```

4. **Orders**

```sql
INSERT INTO Orders (book_id, quantity, order_date) VALUES
(1, 2, '2023-01-10'),
(2, 1, '2023-02-15'),
(3, 3, '2023-03-20'),
(4, 1, '2023-04-25'),
(5, 2, '2023-05-30');
```

These commands will set up a basic structure for your `BookstoreDB` and populate it with some initial data. You can then run various queries to retrieve or manipulate this data, such as finding all books by a certain author, calculating the total sales for a particular book, or listing all orders within a specific date range.
