CREATE TABLE Books (
    Book_ID SERIAL PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Genre VARCHAR(50),
    Published_Year INT,
    Price NUMERIC(10, 2),
    Stock INT
);
DROP TABLE IF EXISTS customers;
CREATE TABLE Customers (
    Customer_ID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    City VARCHAR(50),
    Country VARCHAR(150)
);
DROP TABLE IF EXISTS orders;
CREATE TABLE Orders (
    Order_ID SERIAL PRIMARY KEY,
    Customer_ID INT REFERENCES Customers(Customer_ID),
    Book_ID INT REFERENCES Books(Book_ID),
    Order_Date DATE,
    Quantity INT,
    Total_Amount NUMERIC(10, 2)
);

select * from orders

select * from customers

select * from books

--select all books of fiction		
select * from books
where genre = 'Fiction'

--select books which are published after year 1950
select * from books
where published_year >= 1950
order by published_year asc

--list all customers from canada

select * from customers
where country = 'Canada'

--connect order table with customers and show all order value on the basis of year

select o.order_id, o.customer_id, o.book_id,o.order_date,o.quantity,o.total_amount,
b.published_year
from orders as o
join
books as b
on b.book_id = o.book_id

--show order placed in november 2023

select * from orders
where order_date >= '2023-11-01'
and order_date <= '2023-12-01'
--or

select * from orders
where order_date between '2023-11-01' and '2023-12-01'

--retrieve the total stocks of book available

select count(book_id) from orders

--find the details of most expensive books

select * from books
order by price desc
limit 3

--show customer who orderd more than 5 qty of book

select * from orders
where quantity >= 5

--retrieve all order where total amt exceeds 20$

select * from orders
where  total_amount >= 20

--list all genre in book table

select distinct(genre) from books

-- find the book with the lowest stock

select * from books
-- order by stock asc
limit 1

--calculate total revenue generatd from orders

select sum(total_amount) as revenue from orders

-- * some advanced question

-- retrieve the total no of books sold for each genre

select sum(o.quantity) as total_books, b.genre
from orders o
join
books b
on o.book_id = b.book_id
group by b.genre



--find the average price of book in fantasy genre

 select genre, round(avg(price)) as average_price from books
 group by genre
 having genre = 'Fantasy'

 --list customers who placed atleast 2 order
 
 select o.quantity, c.name
 from orders o
 join
 customers c
 on o.customer_id = c.customer_id
 where o.quantity >= 2

--show the top3 most expensive book of fantasy genre
select * from books
where genre = 'Fantasy'
order by price desc
limit 3















