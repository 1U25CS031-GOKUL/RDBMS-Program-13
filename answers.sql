CREATE  DATABASE guna11;
USE guna11;
CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50) NOT NULL
);

CREATE TABLE Faculty (
    FacultyID INT PRIMARY KEY,
    FacultyName VARCHAR(50) NOT NULL,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50) NOT NULL,
    FacultyID INT,
    FOREIGN KEY (FacultyID) REFERENCES Faculty(FacultyID)
);

CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50) NOT NULL,
    CourseID INT,
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

INSERT INTO Department (DepartmentID, DepartmentName) VALUES
(101, 'Computer Science'),
(102, 'Mathematics'),
(103, 'Physics');

INSERT INTO Faculty (FacultyID, FacultyName, DepartmentID) VALUES
(201, 'kumar', 101),
(202, 'priyan', 102),
(203, 'ravi', 103);

INSERT INTO Course (CourseID, CourseName, FacultyID) VALUES
(301, 'java', 201),
(302, 'DBMS', 202),
(303, 'python', 203);

INSERT INTO Student (StudentID, StudentName, CourseID) VALUES
(1001, 'Arun', 301),
(1002, 'Divya', 302),
(1003, 'Karthik', 301);
SELECT
    s.StudentID,
    s.StudentName,
    c.CourseName,
    f.FacultyName,
    d.DepartmentName
FROM Student s
JOIN Course c ON s.CourseID = c.CourseID
JOIN Faculty f ON c.FacultyID = f.FacultyID
JOIN Department d ON f.DepartmentID = d.DepartmentID;
