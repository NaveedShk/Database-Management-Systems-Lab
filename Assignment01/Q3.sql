----1)
CREATE TABLE Patient (
    Patient_ID      NUMBER PRIMARY KEY,
    Name            VARCHAR2(50)  NOT NULL,
    Gender          CHAR(1) CHECK (Gender IN ('M', 'F')),
    DOB             DATE,
    Email           VARCHAR2(100) UNIQUE,
    Phone           VARCHAR2(20),
    Address         VARCHAR2(200),
    Username        VARCHAR2(30),
    Password        VARCHAR2(30)
);


CREATE TABLE Doctor (
    Doctor_ID       NUMBER PRIMARY KEY,
    Name            VARCHAR2(50)  NOT NULL,
    Specialization  VARCHAR2(50),
    Username        VARCHAR2(30),
    Password        VARCHAR2(30)
);


CREATE TABLE Appointment (
    Appointment_ID   NUMBER PRIMARY KEY,
    Appointment_Date DATE,
    Appointment_Time VARCHAR2(10),
    Status           VARCHAR2(20),
    Clinic_Number    NUMBER,
    Patient_ID       NUMBER REFERENCES Patient(Patient_ID),
    Doctor_ID        NUMBER REFERENCES Doctor(Doctor_ID)
);


CREATE TABLE Prescription (
    Prescription_ID   NUMBER PRIMARY KEY,
    Date              DATE,
    Doctor_Advice     VARCHAR2(200),
    Followup_Required CHAR(1) CHECK (Followup_Required IN ('Y', 'N')),
    Patient_ID        NUMBER REFERENCES Patient(Patient_ID),
    Doctor_ID         NUMBER REFERENCES Doctor(Doctor_ID)
);


CREATE TABLE Invoice (
    Invoice_ID      NUMBER PRIMARY KEY,
    Invoice_Date    DATE,
    Amount          NUMBER,
    Payment_Status  VARCHAR2(20),
    Payment_Method  VARCHAR2(20),
    Patient_ID      NUMBER REFERENCES Patient(Patient_ID)
);

CREATE TABLE Tests (
    Test_ID     NUMBER PRIMARY KEY,
    Blood_Test  VARCHAR2(3),
    X_Ray       VARCHAR2(3),
    MRI         VARCHAR2(3),
    CT_Scan     VARCHAR2(3)
);




------2)
----a
UPDATE Patient
SET Phone = '03123456789',
    Email = 'fast@nu.com'
WHERE Patient_ID = 1;


-----b
UPDATE Invoice
SET Payment_Status = 'Paid'
WHERE Payment_Status = 'Unpaid';



-----c
DELETE FROM Appointment
WHERE Status = 'Cancelled';



----d
DELETE FROM Invoice
WHERE Payment_Status = 'Refunded';



----e
SELECT * 
FROM Appointment
WHERE Status = 'Booked';



-----f
SELECT * 
FROM Invoice
WHERE Payment_Status = 'Unpaid';



-----g
SELECT * 
FROM Tests
WHERE Blood_Test = 'YES';



----h
SELECT * 
FROM Prescription
WHERE Date = TO_DATE('2025-09-02', 'YYYY-MM-DD');



-----3)
----a
SELECT 
    p.Name AS Patient_Name, 
    d.Name AS Doctor_Name
FROM Patient p
JOIN Appointment a ON p.Patient_ID = a.Patient_ID
JOIN Doctor d ON a.Doctor_ID = d.Doctor_ID;

----b
SELECT 
    t.Test_ID, 
    p.Name AS Patient_Name, 
    d.Name AS Doctor_Name
FROM Tests t
JOIN Appointment a ON a.Patient_ID = a.Patient_ID
JOIN Patient p ON p.Patient_ID = a.Patient_ID
JOIN Doctor d ON d.Doctor_ID = a.Doctor_ID;



-----c
SELECT 
    pr.Prescription_ID, 
    pr.Doctor_Advice
FROM Prescription pr
JOIN Patient p ON pr.Patient_ID = p.Patient_ID
WHERE p.Name = 'Ali Khan';


-----d
SELECT 
    pr.Prescription_ID,
    d.Name AS Doctor_Name
FROM Prescription pr
JOIN Doctor d ON pr.Doctor_ID = d.Doctor_ID
WHERE pr.Followup_Required = 'Y';





