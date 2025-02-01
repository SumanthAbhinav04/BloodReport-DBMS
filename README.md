# BloodReport-DBMS
This project is a Database Management System (DBMS) for Hospital Management, designed to manage blood reports. It includes an ER Diagram to illustrate tables and relationships, database creation using MySQL Workbench, and front-end integration via MySQL Connector and a Flask app. The UI was built using HTML &amp; CSS for seamless interaction.


Features


ER Diagram Creation: Designed an Entity-Relationship (ER) Diagram to visualize tables and relationships.

Database Setup: Developed a relational database using MySQL Workbench with optimized tables for blood report management.

SQL Queries & Stored Procedures: Implemented SQL queries for data insertion, retrieval, and updating, along with stored procedures for automation.

Front-end Integration: Built a Flask-based web application to connect the UI with the database using MySQL Connector.

User Interface (UI): Designed a responsive UI using HTML & CSS for seamless hospital staff interaction.

Authentication System: Implemented login/logout features for security (if applicable).
Report Generation: Enabled automated report creation and management.

Database Creation and Procedures:

The Database consists of the following relations:

Relations (Tables)

Patient

Attributes: PatientID, FirstName, LastName, Name, Gender, DateOfBirth, Age, BloodType, PresentStatus, PhoneNumber, Email, Address

Doctor

Attributes: DoctorID, DName, Specialization, Experience, DPhoneNumber, DEmail

BloodReport

Attributes: ReportID, DateOfReport, ReportStatus, HemoglobinLevel, WBCCount, PlateletCount, CholesterolLevel, BloodSugarLevel

Test

Attributes: TestID, TestName, TestDescription, NormalRange, MinValue, MaxValue

Appointment

Attributes: AppointmentID, AppointmentDate, AppointmentTime, Purpose

Lab

Attributes: LabID, LabName, LAddress, NumberOfTests


Relationships


Patient - BloodReport (Has)

Relationship: One-to-Many (A patient can have multiple blood reports)

Patient - Doctor (AssignedTo)

Relationship: Many-to-One (A patient is assigned to one doctor, but a doctor can have multiple patients)

Doctor - Reviews

Relationship: One-to-Many (A doctor can receive multiple reviews)

Doctor - Appointment (Schedules)

Relationship: One-to-Many (A doctor schedules multiple appointments)

BloodReport - Test (ContainsTest)

Relationship: Many-to-Many (A blood report contains multiple tests, and a test can be part of multiple reports)

Test - Lab (ConductedBy)

Relationship: Many-to-Many (A test may be conducted in many labs,  a lab can conduct multiple tests)

Patient - Lab (RegisteredAt)

Relationship: Many-to-Many  (An patient can  register in many labs,  a lab can have multiple patients)

The ERDiagram attached, gives an overview of these tables and relationships.


Along with this few complex queries,procedures and triggers were implemented on the database.


Complex Queries:

1)Get the ReportID and PatientName for patients who have completed all tests in their report.

2)Get patients who only had Appintments on Weekdays

3)Get patientId and names of all patients having an appointment with "General Physiscian".

4)Get the PatientID and Patient Name of patients who have regestered in atleast two different labs.


Trigger on Appointment table:

Raises an error when there is a conflicting appointment which is being added into the apintment table i.e adding an appointment with a doctor who is already having an appointment at that particular time slot.


Procedures:

1)Check Health Ranges (Normal/Abnormal)

2)Fix Appointment (Trigger being included)

3)Get Appointment Details

4)Get Labs by Tests


User Interface :

Consists of a home page having options to display the tables in the database and the avalable tools (procedures) for the hospital management. The users can enter the required fields and get their results.

To run the applications follow these steps:

Clone the repository:



git clone https://github.com/SumanthAbhinav04/BloodReport-DBMS.git


Set up the database:

Import the provided SQL script into MySQL.

Configure database connection settings.

Run the application:

python app.py  # If using Python

Access the UI and start managing blood reports.

















