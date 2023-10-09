# Parking Management System SQL

The Parking Management System SQL repository contains a comprehensive SQL script that sets up the database structure, creates stored procedures, and populates the database with dummy testing data for the Parking Management System.

## Database Setup Script

To set up the database for the Parking Management System, follow these steps:

1. **Connect to your Microsoft SQL Server database instance.**

2. Open SQL Server Management Studio (SSMS) or a SQL client of your choice.

3. **Execute the SQL Script**: Run the `Parking-Management-System-SQL.sql` script to perform the following actions:

   - Create the necessary tables for parking spaces, users, transactions, and more.
   - Define stored procedures for interacting with the database, enabling functionalities such as user registration, space booking, and transaction management.
   - Populate the database with dummy testing data, including example parking spaces, users, and transactions.

   ```sql
   -- Example command to execute the script in SSMS:
   USE YourDatabaseName; -- Replace with your database name
   GO
   :r path/to/Parking-Management-System-SQL.sql;
