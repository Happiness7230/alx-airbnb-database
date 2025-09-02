SQL Joins Practice Project
This project is designed to help visual learners understand and master different types of SQL JOINs.

What's Inside?
sql_joins_visual_guide.md: A markdown file that uses Venn diagrams and simple explanations to visually break down how INNER JOIN, LEFT JOIN, and FULL OUTER JOIN work. This is the best place to start if you're new to these concepts.

sql_join_queries.sql: A SQL file containing three practical queries that demonstrate the use of each join type. The queries are heavily commented to explain what each line of code does. The queries are based on a hypothetical database schema for a booking/property rental service.

How to Use
Read through the sql_joins_visual_guide.md file to build a strong mental and visual model of the different joins.

Review the sql_join_queries.sql file to see how those concepts are applied in practice.

Try running these queries on your own SQL database after creating the sample tables defined at the top of the SQL file.

Summary of the Correlated Subquery
This SQL query is designed to identify and list all users who have made more than three bookings.

How it Works:

It uses a correlated subquery, which functions like a "row-by-row" check.

The main (outer) query begins to go through the Users table, looking at one user at a time.

For each user it considers, it runs the inner query (the subquery).

This inner query is "correlated"—it specifically counts the number of bookings in the Bookings table that belong to the current user being examined by the outer query.

The result of that count is then checked. If the count is greater than 3, the user's details (user_id and user_name) are included in the final output.

The final list is sorted alphabetically by the user's name.

Summary of SQL Aggregation & Window Function Queries
This file contains two SQL queries that demonstrate how to analyze booking data using aggregation and window functions.

Query 1: Find Total Bookings Per User
Objective: To count the total number of bookings each user has made.

Method: It uses the COUNT function with a GROUP BY clause.

Analogy (The "Buckets"): Think of GROUP BY as creating a "bucket" for each user. The query goes through all the bookings and drops them into the correct user's bucket. Finally, COUNT simply counts how many bookings are in each bucket, giving a total for each user.

Result: A list of users and their total booking count, sorted from most to least bookings.

Query 2: Rank Properties by Popularity
Objective: To rank properties based on how many bookings they have received.

Method: It uses a Common Table Expression (CTE) to first calculate the booking count for each property. Then, it applies window functions (ROW_NUMBER and RANK) to that result.

Analogy (The "Race"): Imagine each property is a runner in a race. The window function looks at all the runners together to assign a rank based on their performance (total bookings).

ROW_NUMBER() assigns a unique rank (1, 2, 3, 4) with no ties.

RANK() allows for ties (e.g., 1, 2, 2, 4).

Result: A ranked list of properties, showing their booking count and their rank, making it easy to see which are the most popular.