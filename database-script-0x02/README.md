AirBnB Database Project
This repository contains the database schema and sample data for a simplified clone of the AirBnB application. The project is designed to model the core entities and relationships required for a property rental platform.

Project Structure
This project is composed of two primary SQL scripts:

create_schema.sql: Defines the architectural blueprint of the database.


1. Database Schema Definition (create_schema.sql)
This script is responsible for constructing the entire database structure from scratch. It executes the following actions:

Table Creation: Creates all necessary tables based on the project's ERD, including:

User

Property

Booking

Payment

Review

Message

Constraints: Enforces data integrity by defining PRIMARY KEY, FOREIGN KEY, NOT NULL, and UNIQUE constraints.

Relationships: Establishes the logical links between tables (e.g., linking a Property to its host User) to ensure relational integrity.

Indexing: Creates indexes on foreign keys and other frequently queried columns (like email) to optimize database performance and ensure fast data retrieval.
