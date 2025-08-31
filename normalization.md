# Database Normalization Analysis for AirBnB Schema

## Overview

This document outlines the normalization process for the AirBnB database schema. The initial review found the schema to be well-designed and already in compliance with the Third Normal Form (3NF). This analysis will therefore explain how the schema satisfies each normalization principle, using hypothetical counter-examples to illustrate the design choices.

---

## 1. First Normal Form (1NF)

**Principle:** All table columns must contain atomic (indivisible) values, and each record must be unique.

**Analysis:** The schema adheres to 1NF.
* All columns are designed to hold single values. For example, the `User` table has a `phone_number` field, not a `phone_numbers` field that could hold a list.
* Every table contains a unique Primary Key (e.g., `user_id`, `property_id`), ensuring each record is unique.

---

## 2. Second Normal Form (2NF)

**Principle:** The table must be in 1NF, and all non-key attributes must be fully dependent on the entire primary key. This is primarily relevant for tables with composite primary keys.

**Analysis:** The schema adheres to 2NF.
* All tables use a single-column Primary Key (e.g., `booking_id`, `review_id`).
* Consequently, there are no partial dependencies, as all non-key attributes in each table are naturally dependent on the one and only primary key.

---

## 3. Third Normal Form (3NF)

**Principle:** The table must be in 2NF, and all attributes must be dependent *only* on the primary key, not on other non-key attributes (no transitive dependencies).

**Analysis:** The schema adheres to 3NF. This is best illustrated by the relationship between `Property` and `User`.
* **Correct Implementation:** The `Property` table stores `host_id` as a Foreign Key. To find the host's details (like name or email), one must reference the `User` table using this `host_id`.
* **Avoided Violation:** The design correctly avoids placing `host_name` or `host_email` within the `Property` table. Placing them there would have created a transitive dependency (`property_id` -> `host_id` -> `host_email`), where the host's email depends on the host, not the property itself.
* This principle is applied across the schema, ensuring that data is stored only in the table where it directly belongs. For example, `Booking` details are separate from `Payment` details, linked only by the `booking_id`.

## Conclusion

The database schema is confirmed to be in **Third Normal Form (3NF)**. No adjustments were necessary as the initial design effectively eliminates data redundancy and prevents data anomalies by ensuring that all entities are separated logically and linked via foreign keys.