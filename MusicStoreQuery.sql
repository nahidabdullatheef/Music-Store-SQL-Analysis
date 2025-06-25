-- SQL PROJECT- MUSIC STORE DATA ANALYSIS



-- Question Set 1 - Easy

-- 1. Who is the senior most employee based on job title?

-- SELECT * FROM employee

-- SELECT * FROM employee 
-- ORDER BY levels DESC 
-- LIMIT 1

-- 2. Which countries have the most Invoices?

-- SELECT * FROM invoice

-- SELECT COUNT(*) AS countOfInv, billing_country 
-- FROM invoice
-- GROUP BY billing_country
-- ORDER BY countOfInv DESC

-- 3. What are top 3 values of total invoice?

-- SELECT * FROM invoice

-- SELECT total FROM invoice
-- ORDER BY total DESC
-- LIMIT 3


--4. Which city has the best customers? 
-- We would like to throw a promotional Music Festival in the city we made the most money. 
-- Write a query that returns one city that has the highest sum of invoice totals. 
-- Return both the city name & sum of all invoicetotals.
-- And count of invoices and invoicescount.

-- SELECT * FROM invoice

-- SELECT billing_city, SUM(total) AS invoicetotals, COUNT(total) AS invoicescount 
-- FROM invoice
-- GROUP BY billing_city
-- ORDER BY invoicetotals DESC
-- LIMIT 1

-- 5. Who is the best customer? 
-- The customer who has spent the most money will be declared the best customer. 
-- Write a query that returns the person who has spent the most money.

-- SELECT * FROM customer
-- SELECT * FROM invoice

-- SELECT customer.customer_id, customer.first_name, customer.last_name, SUM(i.total) AS total
-- FROM customer   
-- JOIN invoice  ON c.customer_id = invoice.customer_id
-- GROUP BY customer.customer_id
-- ORDER BY total desc
-- LIMIT 1



-- Question Set 2 – Moderate

-- 1. Write query to return the email, first name, last name, & Genre of all Rock Music listeners. 
-- Return your list ordered alphabetically by email starting with A.

-- SELECT * FROM customer
-- SELECT * FROM invoice
-- SELECT * FROM invoice_line

-- SELECT DISTINCT email, first_name, last_name FROM customer 
-- JOIN invoice ON customer.customer_id = invoice.customer_id
-- JOIN invoice_line ON invoice.invoice_id = invoice_line.invoice_id
-- WHERE track_id IN(
-- 	SELECT track_id FROM track
-- 	JOIN genre ON track.genre_id = genre.genre_id
-- 	WHERE genre.name LIKE 'Rock'
-- )
-- ORDER BY email

-- 2. Let's invite the artists who have written the most rock music in our dataset. 
-- Write a query that returns the Artist name and total track count of the top 10 rock bands.

-- SELECT * FROM track
-- SELECT * FROM album
-- SELECT * FROM artist
-- SELECT * FROM genre

-- SELECT artist.artist_id, artist.name, COUNT(artist.artist_id) AS songsCount
-- FROM track
-- JOIN album ON album.album_id = track.album_id
-- JOIN artist ON artist.artist_id = album.artist_id
-- JOIN genre ON genre.genre_id = track.genre_id
-- WHERE genre.name LIKE 'Rock'
-- GROUP BY artist.artist_id
-- ORDER BY songsCount DESC
-- limit 10

-- 3. Return all the track names that have a song length longer than the average song length. 
-- Return the Name and Milliseconds for each track. 
-- Order by the song length with the longest songs listed first.

-- SELECT * FROM track

-- SELECT name,milliseconds FROM track
-- WHERE milliseconds > (
-- 	SELECT AVG(milliseconds) AS avggtrack 
-- 	FROM track
-- )
-- ORDER BY milliseconds DESC

--   " OR you can answer with the query below "

-- SELECT NAME,milliseconds FROM track
-- WHERE milliseconds > 393599
-- ORDER BY milliseconds DESC



-- Question Set 3 – Advance

-- 1. Find how much amount spent by each customer on artists? 
-- Write a query to return customer name, artist name and total spent.

-- SELECT * FROM invoice_line
-- SELECT * FROM track
-- SELECT * FROM album
-- SELECT * FROM artist
-- SELECT * FROM customer
-- SELECT * FROM invoice

-- WITH best_selling_artist AS(
-- 	SELECT artist.artist_id AS artist_id, artist.name AS artist_name,
-- 	SUM(invoice_line.unit_price*invoice_line.quantity) AS total_sales
-- 	FROM invoice_line
-- 	JOIN track ON invoice_line.track_id = track.track_id
-- 	JOIN album ON album.album_id = track.album_id
-- 	JOIN artist ON artist.artist_id = album.artist_id
-- 	GROUP BY 1
-- 	ORDER BY 3 DESC
-- 	LIMIT 1
-- )
-- SELECT c.customer_id,c.first_name,c.last_name,bsa.artist_name,sum(il.unit_price*il.quantity) as totalsales
-- FROM customer c
-- JOIN invoice i ON i.customer_id = c.customer_id
-- JOIN invoice_line il ON il.invoice_id = i.invoice_id
-- JOIN track t ON t.track_id = il.track_id
-- JOIN album a ON a.album_id = t.album_id
-- JOIN best_selling_artist bsa ON bsa.artist_id = a.artist_id
-- GROUP BY 1,2,3,4
-- ORDER BY 5 DESC
-- LIMIT 1

-- 2. We want to find out the most popular music Genre for each country. 
-- We determine the most popular genre as the genre with the highest amount of purchases. 
-- Write a query that returns each country along with the top Genre. 
-- For countries where the maximum number of purchases is shared ,return all Genres.

-- SELECT * FROM invoice
-- SELECT * FROM invoice_line
-- SELECT * FROM track
-- SELECT * FROM genre

-- WITH countryGenreSales AS (
-- 	SELECT invoice.billing_country, genre.name, SUM(invoice.total) AS sales,
-- 	ROW_NUMBER() OVER(
-- 	PARTITION BY invoice.billing_country
-- 	ORDER BY SUM(invoice.total) DESC
-- 	) AS genre_rank FROM invoice
-- 	JOIN invoice_line ON invoice.invoice_id = invoice_line.invoice_id
-- 	JOIN track ON invoice_line.track_id = track.track_id
-- 	JOIN genre ON track.genre_id = genre.genre_id
-- 	GROUP BY invoice.billing_country, genre.name
-- )
-- SELECT billing_country, NAME, sales
-- FROM countryGenreSales
-- WHERE genre_rank = 1
-- ORDER BY sales DESC

-- 3. Write a query that determines the customer that has spent the most on music for each country. 
-- Write a query that returns the country along with the top customer and how much they spent. 
-- For countries where the top amount spent is shared, 
-- provide all customers who spent this amount.

-- SELECT * FROM customer
-- SELECT * FROM invoice

-- WITH CustomerRankbyCountry AS(
-- 	SELECT customer.country as country,customer.first_name || ' ' || customer.last_name AS fullname, SUM(invoice.total) AS sales, 
-- 	ROW_NUMBER() OVER( 
-- 		PARTITION BY customer.country ORDER BY SUM(invoice.total) DESC
-- 	) AS customerrank
-- 	FROM customer 
-- 	JOIN invoice ON customer.customer_id = invoice.customer_id
-- 	GROUP BY country,fullname
-- )
-- SELECT country, fullname, sales FROM CustomerRankbyCountry
-- WHERE customerrank = 1
-- ORDER BY sales DESC

