# Car Rental Database

This repository contains the MySQL database schema and related SQL scripts
for the Car Rental project.

## Structure

- sql/01_schema.sql -> database schema (tables, keys, constraints)
- sql/02_seed.sql -> sample data
- sql/03_views.sql -> database views
- sql/99_scratch.sql -> temporary testing queries

## Usage

1. Open MySQL Workbench
2. Run `01_schema.sql`
3. Run `02_seed.sql`
4. (Optional) Run `03_views.sql`

This database will later be connected to a Python application.
