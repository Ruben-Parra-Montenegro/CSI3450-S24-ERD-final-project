-- Creating the Company table
CREATE TABLE Company (
    CompanyID INT PRIMARY KEY,
    CompanyName VARCHAR(255),
    CompanyAddress VARCHAR(255),
    CompanyEmail VARCHAR(255)
);

-- Creating the Qualification table
CREATE TABLE Qualification (
    QualificationCode INT PRIMARY KEY,
    QualificationDescription VARCHAR(255)
);

-- Creating the Opening table with foreign keys
CREATE TABLE Opening (
    OpeningID INT PRIMARY KEY,
    CompanyID INT,
    QualificationCode INT,
    StartDate DATE,
    EndDate DATE,
    HourlyPay DECIMAL(10, 2),
    FOREIGN KEY (CompanyID) REFERENCES Company(CompanyID),
    FOREIGN KEY (QualificationCode) REFERENCES Qualification(QualificationCode)
);

-- Creating the Candidate table
CREATE TABLE Candidate (
    CandidateID INT PRIMARY KEY,
    Name VARCHAR(255),
    CandidateAddress VARCHAR(255),
    CandidateEmail VARCHAR(255),
    CandidatePhoneNumber VARCHAR(20)
);

-- Creating the Job_History table with foreign key
CREATE TABLE Job_History (
    JobHistoryID INT PRIMARY KEY,
    CandidateID INT,
    JobRecord VARCHAR(255),
    JobDescription VARCHAR(255),
    StartDate DATE,
    EndDate DATE,
    FOREIGN KEY (CandidateID) REFERENCES Candidate(CandidateID)
);

-- Creating the Placement table with foreign keys
CREATE TABLE Placement (
    PlacementID INT PRIMARY KEY,
    OpeningID INT,
    CandidateID INT,
    TotalHoursWorked DECIMAL(10, 2),
    FOREIGN KEY (OpeningID) REFERENCES Opening(OpeningID),
    FOREIGN KEY (CandidateID) REFERENCES Candidate(CandidateID)
);

-- Creating the Course table with foreign key
CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(255),
    QualificationCode INT,
    CoursePrerequisites VARCHAR(255),
    FOREIGN KEY (QualificationCode) REFERENCES Qualification(QualificationCode)
);

-- Creating the Session table with foreign key
CREATE TABLE Session (
    SessionID INT PRIMARY KEY,
    CourseID INT,
    SessionDate DATE,
    SessionFee DECIMAL(10, 2),
    MaxCapacity INT,
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);
