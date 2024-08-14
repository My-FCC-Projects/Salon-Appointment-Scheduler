# Salon Appointment Scheduler

Welcome to the Salon Appointment Scheduler repository. This project is a solution for the FreeCodeCamp Relational Database course assignment. The goal was to create and manage a database for scheduling salon appointments, incorporating essential database concepts and scripting.

## Project Overview
The Salon Appointment Scheduler includes:
- A relational database designed to manage customer data, services, and appointments.
- A Bash script to interact with the database, allowing users to schedule appointments.

### Files Included
- salon.sql: Contains the SQL script to create and populate the database.
- salon.sh: A Bash script that interacts with the database to handle user inputs and manage appointments.
- example.txt: An example output of the salon.sh script demonstrating a successful appointment scheduling.

### Database Schema
The database named `salon` includes the following tables:
- `customers`: Stores customer information.
- - `customer_id` (Primary Key, auto-increment)
  - `phone` (VARCHAR, UNIQUE)
  - `name` (VARCHAR)
- `services`: Contains details about available salon services.
- - `service_id` (Primary Key, auto-increment)
  - `name` (VARCHAR)
- `appointments`: Records details of appointments.
- - `appointment_id` (Primary Key, auto-increment)
  - `customer_id` (Foreign Key referencing customer_id in customers table)
  - `service_id` (Foreign Key referencing service_id in services table)
  - `time` (VARCHAR)

### Script Details
`salon.sh`: A Bash script to interact with the database
- - Uses a shebang line `#!/bin/bash`.
  - Displays a numbered list of services.
  - Prompts users to enter a `service_id`, `phone number`, `name`, and `time`.
  - Validates inputs and updates the database accordingly.
  - Outputs a confirmation message once an appointment is successfully added.
 
### Usage
1. Database Setup: run `salon.sql' to create and populate the database. <br>
   psql -U postgres < salon.sql
2. Running the Script:
   - Ensure `salon.sh` has executable permissions:<br>
     chmod +x salon.sh
   - Execute the script <br>
     ./salon.sh

Example Output
Refer to `example.txt` for an example output of the `salon.sh` script. This file illustrates a successful interaction and appointment scheduling.

### Contributing
Feel free to open issues or submit pull requests if you have improvements or suggestions.

Thank you!
