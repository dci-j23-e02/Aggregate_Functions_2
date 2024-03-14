-- What is the average price of books in each category available in our bookstore?
-- average : AVG(price)
-- of books  : books  tables
-- in each category : JOIN categories table
--  in our bookstore: INNER JOIN


SELECT c.category_name, AVG(b.price)
FROM books b
JOIN categories c
ON b.category_id = c.category_id
GROUP BY  c.category_name;



-- How many books has each author written that are currently available in our bookstore?
-- How many books : COUNT(book_id)
-- has each author written : authors
-- that are currently available in our bookstore: JOIN books

SELECT a.name, COUNT(b.book_id)
FROM authors a
INNER JOIN books b
ON a.author_id = b.author_id -- any auth appears in books table
GROUP BY  a.name;

-- What is the lowest price of a book within each category in our bookstore?
-- What is the lowest price: MIN(price)
-- of a book: books table
-- within each category: categories
--  each category in our bookstore : INNER JOIN
-- GROUP BY category_name

SELECT c.category_name, MIN(b.price)
FROM books b
INNER JOIN categories c
ON b.category_id = c.category_id
GROUP BY c.category_name;

-- What is the highest price of a book within each category in our bookstore?

SELECT c.category_name, MAX(b.price)
FROM books b
INNER JOIN categories c
ON b.category_id = c.category_id
GROUP BY c.category_name;

-- What is the total sales revenue generated for each book in our bookstore,
-- considering the quantity sold and the price of each book?

-- books.title
-- SUM(books.price * orders.quantity) AS total _sales
-- books , orders
-- INNER JOIN
-- GROUP BY books.title

SELECT
    b.title,
    SUM(b.price * o.quantity) AS total_sales
FROM books b -- Left
JOIN
    orders o -- Right
ON  b.book_id = o.book_id

GROUP BY  b.title;

-- Which books in our bookstore have been ordered more than once?
-- Which books in our bookstore  : books.title
-- INNER JOIN books, orders
-- have been ordered more than once:
-- GROUP BY books.title
-- have: HAVING orders.order_id > 1

SELECT   books.title, -- Which books:  books.title
         COUNT(orders.order_id) AS order_count -- ordered more than once
FROM
        books --  in our bookstore
INNER JOIN
        orders --  have been ordered
ON books.book_id = orders.book_id -- Which books : book_id
GROUP BY   books.title -- Which books:  books.title
HAVING    COUNT(orders.order_id) > 1; -- have been ordered more than once





