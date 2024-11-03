-- Create the database and switch to it
CREATE DATABASE capstone_management;
USE capstone_management;

-- Create tables
CREATE TABLE Department (
    DeptID INT AUTO_INCREMENT PRIMARY KEY,
    DeptName VARCHAR(50) NOT NULL
);

CREATE TABLE Team (
    TeamID INT AUTO_INCREMENT PRIMARY KEY,
    ProjectName VARCHAR(100),
    Domain VARCHAR(50),
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);

CREATE TABLE Panel (
    PanelID INT AUTO_INCREMENT PRIMARY KEY,
    PanelName VARCHAR(50),
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);

CREATE TABLE Faculty (
    FacultyID INT AUTO_INCREMENT PRIMARY KEY,
    FacultyName VARCHAR(100),
    Designation VARCHAR(50),
    PanelID INT,
    FOREIGN KEY (PanelID) REFERENCES Panel(PanelID)
);

CREATE TABLE Student (
    SRN VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(50),
    Email VARCHAR(50),
    Phone VARCHAR(15),
    Gender ENUM('M', 'F'),
    Section VARCHAR(10),
    Semester INT,
    GPA DECIMAL(4, 2),
    DeptID INT,
    TeamID INT,
    FacultyID INT,
    FOREIGN KEY (DeptID) REFERENCES Department(DeptID),
    FOREIGN KEY (TeamID) REFERENCES Team(TeamID),
    FOREIGN KEY (FacultyID) REFERENCES Faculty(FacultyID)
);

CREATE TABLE Exam (
    ExamID INT AUTO_INCREMENT PRIMARY KEY,
    ExamName VARCHAR(50),
    MaxMarksAllotted INT
);

CREATE TABLE CapstoneMarks (
    SRN VARCHAR(10),
    ExamID INT,
    TotalMarks INT,
    PRIMARY KEY (SRN, ExamID),
    FOREIGN KEY (SRN) REFERENCES Student(SRN) ON DELETE CASCADE,
    FOREIGN KEY (ExamID) REFERENCES Exam(ExamID) ON DELETE CASCADE
);

CREATE TABLE Undergoes (
    SRN VARCHAR(10),
    ExamID INT,
    FacultyID INT,
    MarksObtained INT,
    Date_of_Exam DATE,
    PRIMARY KEY (SRN, ExamID, FacultyID),
    FOREIGN KEY (SRN) REFERENCES Student(SRN) ON DELETE CASCADE,
    FOREIGN KEY (ExamID) REFERENCES Exam(ExamID),
    FOREIGN KEY (FacultyID) REFERENCES Faculty(FacultyID)
);

CREATE TABLE EvaluatedBy (
    SRN VARCHAR(10),
    FacultyID INT,
    PRIMARY KEY (SRN, FacultyID),
    FOREIGN KEY (SRN) REFERENCES Student(SRN) ON DELETE CASCADE,
    FOREIGN KEY (FacultyID) REFERENCES Faculty(FacultyID)
);

-- Create triggers
DELIMITER //
CREATE TRIGGER insert_to_evaluatedby
AFTER INSERT ON Undergoes
FOR EACH ROW
BEGIN
   INSERT INTO EvaluatedBy (SRN, FacultyID)
   VALUES (NEW.SRN, NEW.FacultyID);
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER calculate_total_marks
AFTER INSERT ON Undergoes
FOR EACH ROW
BEGIN
   DECLARE avg_marks INT;
   SELECT AVG(MarksObtained) INTO avg_marks
   FROM Undergoes
   WHERE SRN = NEW.SRN AND ExamID = NEW.ExamID;
   
   INSERT INTO CapstoneMarks (SRN, ExamID, TotalMarks)
   VALUES (NEW.SRN, NEW.ExamID, avg_marks)
   ON DUPLICATE KEY UPDATE TotalMarks = avg_marks;
END //
DELIMITER ;
