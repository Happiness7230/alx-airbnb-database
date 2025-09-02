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