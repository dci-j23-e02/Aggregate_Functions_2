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

Using the `BookstoreDB` database we created, let's explore examples of aggregate functions (`AVG()`, `COUNT()`, `MIN()`, `MAX()`, `SUM()`), along with `GROUP BY` and `HAVING` clauses. These examples will help you understand how to summarize and analyze data in your tables.

### AVG() - Average Price of Books in Each Category
**Question:** What is the average price of books in each category available in our bookstore?

```sql
SELECT 
    Categories.category_name, 
    AVG(Books.price) AS average_price
FROM 
    Books
INNER JOIN 
    Categories ON Books.category_id = Categories.category_id
GROUP BY 
    Categories.category_name;
```

This query calculates the average price of books in each category.

### COUNT() - Count of Books by Each Author
**Question:** How many books has each author written that are currently available in our bookstore?
```sql
SELECT 
    Authors.name, 
    COUNT(Books.book_id) AS books_count
FROM 
    Books
INNER JOIN 
    Authors ON Books.author_id = Authors.author_id
GROUP BY 
    Authors.name;
```

This query counts how many books each author has written.

### MIN() - Minimum Price of Books in Each Category
**Question:** What is the lowest price of a book within each category in our bookstore?
```sql
SELECT 
    Categories.category_name, 
    MIN(Books.price) AS min_price
FROM 
    Books
INNER JOIN 
    Categories ON Books.category_id = Categories.category_id
GROUP BY 
    Categories.category_name;
```

This query finds the minimum price of books in each category.

### MAX() - Maximum Price of Books in Each Category
**Question:** What is the highest price of a book within each category in our bookstore?
```sql
SELECT 
    Categories.category_name, 
    MAX(Books.price) AS max_price
FROM 
    Books
INNER JOIN 
    Categories ON Books.category_id = Categories.category_id
GROUP BY 
    Categories.category_name;
```

This query finds the maximum price of books in each category.

### SUM() - Total Sales (Price * Quantity) for Each Book
**Question:** What is the total sales revenue generated for each book in our bookstore, considering the quantity sold and the price of each book?
First, let's assume we want to calculate the total sales for each book based on the orders. We'll need to join the `Books` and `Orders` tables for this.

```sql
SELECT 
    Books.title, 
    SUM(Books.price * Orders.quantity) AS total_sales
FROM 
    Books
INNER JOIN 
    Orders ON Books.book_id = Orders.book_id
GROUP BY 
    Books.title;
```

This query calculates the total sales for each book.

### GROUP BY with HAVING - Books with More Than One Order
**Question:** Which books in our bookstore have been ordered more than once?
```sql
SELECT 
    Books.title, 
    COUNT(Orders.order_id) AS order_count
FROM 
    Books
INNER JOIN 
    Orders ON Books.book_id = Orders.book_id
GROUP BY 
    Books.title
HAVING 
    COUNT(Orders.order_id) > 1;
```
