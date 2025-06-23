create database hospital;
use  hospital;
-- Patient Table
CREATE TABLE Patient (
    PatientID INT PRIMARY KEY,
    Name VARCHAR(100),
    Age INT,
    Gender VARCHAR(10),
    DOB DATE,
    Mob_no VARCHAR(15),
    City VARCHAR(50),
    Address TEXT
);

-- Doctor Table
CREATE TABLE Doctor (
    DoctorID INT PRIMARY KEY,
    Name VARCHAR(100),
    Age INT,
    Gender VARCHAR(10),
    Dept VARCHAR(100),
    Qualification VARCHAR(100),
    Mob_no VARCHAR(15)
);

-- Relationship: Patient consults Doctor
CREATE TABLE Consultation (
    ConsultationID INT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    ConsultationDate DATE,
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID)
);

-- Other Employees Table
CREATE TABLE OtherEmployee (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100),
    Age INT,
    Gender VARCHAR(10),
    Mob_no VARCHAR(15),
    Salary DECIMAL(10, 2)
);

-- Test Report Table
CREATE TABLE TestReport (
    ReportID INT PRIMARY KEY,
    PatientID INT,
    Test_type VARCHAR(100),
    Result TEXT,
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
);

-- Bills Table
CREATE TABLE Bills (
    BillID INT PRIMARY KEY,
    PatientID INT,
    Amount DECIMAL(10, 2),
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
);

-- Management Table
CREATE TABLE Management (
    ManagerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Department VARCHAR(100)
);

-- Relationship: Management pays Bills
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    BillID INT,
    ManagerID INT,
    PaymentDate DATE,
    FOREIGN KEY (BillID) REFERENCES Bills(BillID),
    FOREIGN KEY (ManagerID) REFERENCES Management(ManagerID)
);

