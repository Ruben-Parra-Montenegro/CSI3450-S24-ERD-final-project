-- CREATE DATABASE IF NOT EXISTS tec_db;
-- USE tec_db;


-- Create Company Table
CREATE TABLE Company (
    CompanyID INT PRIMARY KEY,
    CompanyName VARCHAR(255) NOT NULL,
    CompanyAddress VARCHAR(255),
    CompanyEmail VARCHAR(255)
);

-- Create Qualification Table
CREATE TABLE Qualification (
    QualificationCode INT PRIMARY KEY,
    QualificationDescription VARCHAR(255) NOT NULL
);

-- Create Opening Table
CREATE TABLE Opening (
    OpeningID INT PRIMARY KEY,
    CompanyID INT,
    QualificationCode INT,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    HourlyPay DECIMAL(10, 2) NOT NULL,
    JobTitle VARCHAR(255) NOT NULL,
    JobDescription TEXT,
    DatePosted DATE NOT NULL,
    FOREIGN KEY (CompanyID) REFERENCES Company(CompanyID),
    FOREIGN KEY (QualificationCode) REFERENCES Qualification(QualificationCode)
);

-- Create Candidate Table
CREATE TABLE Candidate (
    CandidateID INT PRIMARY KEY,
    OpeningID INT,
    CandidateName VARCHAR(255) NOT NULL,
    CandidateAddress VARCHAR(255),
    CandidateEmail VARCHAR(255),
    CandidatePhoneNumber VARCHAR(20),
    FOREIGN KEY (OpeningID) REFERENCES Opening(OpeningID)
);

-- Create Job_History Table
CREATE TABLE Job_History (
    JobHistoryID INT PRIMARY KEY,
    CandidateID INT,
    JobRecord VARCHAR(255),
    JobDescription TEXT,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    FOREIGN KEY (CandidateID) REFERENCES Candidate(CandidateID)
);

-- Create Placement Table
CREATE TABLE Placement (
    PlacementID INT PRIMARY KEY,
    OpeningID INT,
    CandidateID INT,
    TotalHoursWorked DECIMAL(10, 2),
    FOREIGN KEY (OpeningID) REFERENCES Opening(OpeningID),
    FOREIGN KEY (CandidateID) REFERENCES Candidate(CandidateID)
);

-- Create Course Table
CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(255) NOT NULL,
    QualificationCode INT,
    CoursePrerequisites TEXT,
    FOREIGN KEY (QualificationCode) REFERENCES Qualification(QualificationCode)
);

-- Create Session Table
CREATE TABLE Session (
    SessionID INT PRIMARY KEY,
    CourseID INT,
    SessionDate DATE NOT NULL,
    SessionFee DECIMAL(10, 2),
    MaxCapacity INT NOT NULL,
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);
