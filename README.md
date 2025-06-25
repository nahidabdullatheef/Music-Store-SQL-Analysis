# 🎵 Music Store SQL Analysis

This project contains SQL scripts and queries for analyzing data from a Music Store database. It explores various business questions including sales trends, top customers, popular genres, and employee data.

## 📂 Project Structure
music-store-sql-project/
├── Music_Store_database.sql
├── Music_Store_Create_Tables_Query.sql
├── MusicStoreQuery.sql
├── MusicStoreQuestions.pdf
├── MusicStoreQnA.pdf
├── MusicStoreSchema.png
├── README.md

## 🔍 What’s Included
File                                | Description
------------------------------------|--------------------------------------------
Music_Store_database.sql            | SQL file to create all the tables in the database.
Music_Store_Create_Tables_Query.sql | SQL file with the original table-creation queries.
MusicStoreQuery.sql                 | SQL file containing queries for answering MusicStore analysis.
MusicStoreQuestions.pdf             | PDF listing all questions for the project.
MusicStoreQnA.pdf                   | PDF file containing the final SQL answers to each question.
MusicStoreSchema.png                | ERD/image of the database schema.
README.md                           | This file.

## 🧠 Skills Demonstrated
- SQL fundamentals (SELECT, JOIN, GROUP BY, ORDER BY)
- Aggregations (SUM, COUNT, etc.)
- Ranking and window functions (ROW_NUMBER())
- Query optimization
- Extracting business insights from raw data

## 📜 Complete Set of Questions

### Question Set 1 — Easy
1. Who is the senior most employee based on job title?
2. Which countries have the most invoices?
3. What are the top 3 values of total invoice?
4. Which city has the best customers? Write a query that returns one city that has the highest sum of invoice totals. Return both the city name & sum of all invoice totals.
5. Who is the best customer? The customer who has spent the most money will be declared the best customer. Write a query that returns the person who has spent the most money.

### Question Set 2 — Moderate
1. Write a query to return the email, first name, last name, & genre of all Rock Music listeners. Return your list ordered alphabetically by email starting with A.
2. Let's invite the artists who have written the most Rock music in our dataset. Write a query that returns the artist name and total track count of the top 10 rock bands.
3. Return all the track names that have a song length longer than the average song length. Return the name and milliseconds for each track. Order by the song length with the longest songs listed first.

### Question Set 3 — Advanced
1. Find how much amount spent by each customer on artists. Write a query to return customer name, artist name and total spent.
2. Write a query to return the most popular music Genre for each country. The most popular genre is determined as the one with the highest number of purchases. Write a query that returns each country along with the top Genre. For countries where the maximum number of purchases is shared, return all Genres.
3. Write a query that returns the customer that has spent the most on music for each country. Write a query that returns the country along with the top customer and how much they spent. For countries where the top amount spent is shared, return all customers who spent this amount.

## 🧰 Getting Started
1. Clone this repository:
   git clone https://github.com/nahidabdullatheef/Music-Store-SQL-Analysis.git
2. Import Music_Store_database.sql into your SQL environment.
3. Run the queries from MusicStoreQuery.sql.
4. Refer to MusicStoreQuestions.pdf and MusicStoreQnA.pdf to follow the questions and answers.

## 💡 Usage
This project can be used as:
- A reference for SQL interview practice.
- A learning project for SQL beginners.
- A portfolio project showcasing SQL data analysis skills.

## 🤝 Contributing
If you’d like to contribute or suggest improvements:
- Fork the repo
- Make your changes
- Submit a Pull Request!

## 📝 License
This project is for educational purposes only. No specific license.

Happy Analyzing! 🎶
