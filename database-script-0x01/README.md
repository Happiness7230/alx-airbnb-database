AirBnB Database Project
This repository contains the database schema and sample data for a simplified clone of the AirBnB application. The project is designed to model the core entities and relationships required for a property rental platform.

populate_database.sql: Fills the database with sample data to simulate real-world usage.

2. Sample Data Population (populate_database.sql)
Once the schema is built, this script populates the database with sample data. The script is designed as a template that demonstrates how to add records in a logical, story-driven order.

Purpose: To provide a set of realistic sample records (users, properties, bookings, etc.) that allow for testing and demonstration of the database's functionality.

Insertion Order: The INSERT statements are ordered chronologically to respect the foreign key constraints. For example, a User must be created before they can own a Property, and a Booking must exist before a Payment can be made for it.

How to Use
To set up the database, run the scripts in the following order:

Execute create_schema.sql first to build the database tables and relationships.

Execute populate_database.sql second to fill the newly created tables with sample data.