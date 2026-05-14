-- Q1 who is the senior most employee based on job title

SELECT * FROM employee
order by levels desc
limit 1

-- Q2 which country have the most invoices total

select distinct(billing_country), count(total) as total_invoice from invoice
group by billing_country
order by total_invoice desc
limit 1

-- Q3 what are top 3 values of total invoice

select * from invoice
order by total desc
limit 3

--* Q4: Which city has the best customers? We would like to throw a promotional Music Festival in the city we made the most money. 
--Write a query that returns one city that has the highest sum of invoice totals
--Return both the city name & sum of all invoice totals

select distinct(billing_city), round(sum(total)) as total_invoice from invoice
group by billing_city
order by total_invoice desc
limit 3

-- Q5: Who is the best customer? The customer who has spent the most money will be declared the best customer 
--Write a query that returns the person who has spent the most money.

select distinct(c.customer_id), c.first_name, c.country, c.email,
sum(i.total) as total_value
from customer c
join
invoice i
on c.customer_id = i.customer_id
group by  c.customer_id
order by total_value desc
limit 1

--Q6  Write query to return the email, first name, last name, & Genre of all Rock Music 
--listeners. Return your list ordered alphabetically by email starting with A 

select* from invoice_line

select g.name, t.name,c.customer_id, c.first_name, c.email
from track t
join
genre g
on g.genre_id = t.genre_id
join invoice_line i
on t.track_id = i.track_id
join invoice ii
on i.invoice_id = ii.invoice_id
join customer c
on c.customer_id = ii.customer_id
group by g.name , t.name, c.customer_id
having g.name = 'Rock'
order by c.email


--Q7 Return all the track names that have a song length longer than the average song length. 
--Return the Name and Milliseconds for each track. Order by the song length with the 
--longest songs listed first 

select "name", milliseconds from track
where milliseconds >
(select avg(milliseconds)as average from track)
order by milliseconds desc




















