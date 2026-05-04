CREATE database Group18_DB;
USE Group18_DB;
CREATE TABLE Department (
    Dept_ID INT PRIMARY KEY,
    Dept_name VARCHAR(100),
    Lec_count INT DEFAULT 0,
    Stu_count INT DEFAULT 0,
    Created_At DATETIME DEFAULT CURRENT_TIMESTAMP,
    Updated_At DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


--  2. Assessment Type
CREATE TABLE Assesment_Type (
    Asses_ID INT PRIMARY KEY,
    Asses_Name VARCHAR(50),
    weight_percentage DECIMAL(5,2),
    Created_At DATETIME DEFAULT CURRENT_TIMESTAMP,
    Updated_At DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

--  3. Grade
CREATE TABLE Grade (
    Grade_ID INT PRIMARY KEY,
    Grade VARCHAR(2),
    Min_Marks INT,
    Max_Marks INT,
    Grade_Point DECIMAL(3,2),
    Created_At DATETIME DEFAULT CURRENT_TIMESTAMP,
    Updated_At DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

--  4.User
CREATE TABLE User(
    User_ID int PRIMARY KEY,
    User_Name varchar(100),
    Email varchar(100),
    Role varchar(100),
    Created_At DATETIME DEFAULT CURRENT_TIMESTAMP,
    Updated_At DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP 
);

--  5. Lecturer
CREATE TABLE Lecturer (
    Lecturer_ID INT PRIMARY KEY,
    Full_name VARCHAR(100),
    Email VARCHAR(100),
    Phone varchar(15),
    Designation VARCHAR(50),
    Dept_ID INT,
    User_ID INT,
    Created_At DATETIME DEFAULT CURRENT_TIMESTAMP,
    Updated_At DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (Dept_ID) REFERENCES Department(Dept_ID),
    FOREIGN KEY (User_ID) REFERENCES User(User_ID),
    UNIQUE (User_ID)
);

-- 6. lecturer phone
CREATE TABLE Lecturer_Phone(
    Lecturer_ID INT,
    Phone VARCHAR(15),
    Created_At DATETIME DEFAULT CURRENT_TIMESTAMP,
    Updated_AT DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (Lecturer_ID) REFERENCES Lecturer(Lecturer_ID)
);

--  7. Student
CREATE TABLE Student (
    Student_ID INT PRIMARY KEY,
    Full_name VARCHAR(100),
    DOB DATE,
    Email VARCHAR(100),
    Reg_No VARCHAR(20) UNIQUE,
    Address VARCHAR(255),
    Status VARCHAR(20),
    Intake_Year YEAR,
    Dept_ID INT,
    User_ID INT,
    Created_At DATETIME DEFAULT CURRENT_TIMESTAMP,
    Updated_At DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (Dept_ID) REFERENCES Department(Dept_ID),
    FOREIGN KEY (User_ID) REFERENCES User(User_ID),
    UNIQUE (User_ID)
);

--  8. Student Phone
CREATE TABLE Student_Phone (
    Student_ID INT,
    Phone VARCHAR(15),
    Created_At DATETIME DEFAULT CURRENT_TIMESTAMP,
    Updated_At DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (Student_ID, Phone),
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID)
);

--  9. Technical Officer
CREATE TABLE Tech_Officer (
    To_ID INT PRIMARY KEY,
    Email VARCHAR(100),
    Full_Name VARCHAR(100),
    Assign_Lab VARCHAR(50),
    Dept_ID INT,
    User_ID INT,
    Created_At DATETIME DEFAULT CURRENT_TIMESTAMP,
    Updated_At DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (Dept_ID) REFERENCES Department(Dept_ID),
    FOREIGN KEY (User_ID) REFERENCES User(User_ID),
    UNIQUE (User_ID)
);

--  10. Course Unit
CREATE TABLE Course_Unit (
    Course_ID INT PRIMARY KEY,
    Course_code VARCHAR(10) UNIQUE,
    Credit INT,
    Type VARCHAR(20),
    Semester INT,
    Level INT,
    Dept_ID INT,
    Lecturer_ID INT,
    Created_At DATETIME DEFAULT CURRENT_TIMESTAMP,
    Updated_At DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (Dept_ID) REFERENCES Department(Dept_ID),
    FOREIGN KEY (Lecturer_ID) REFERENCES Lecturer(Lecturer_ID)
);

--  11. Enrollment
CREATE TABLE Enrollment (
    Entro_ID INT PRIMARY KEY,
    Student_ID INT,
    Course_ID INT,
    Aced_Year YEAR,
    Semester INT,
    Status VARCHAR(20),
    Entro_Date DATE,
    Created_At DATETIME DEFAULT CURRENT_TIMESTAMP,
    Updated_At DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID),
    FOREIGN KEY (Course_ID) REFERENCES Course_Unit(Course_ID)
);

--  12. Marks
CREATE TABLE Marks (
    Marks_id INT PRIMARY KEY,
    Exam_Date DATE,
    Marks DECIMAL(5,2),
    Medi_Status VARCHAR(20),
    Student_ID INT,
    Course_ID INT,
    Asses_ID INT,
    Created_At DATETIME DEFAULT CURRENT_TIMESTAMP,
    Updated_At DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID),
    FOREIGN KEY (Course_ID) REFERENCES Course_Unit(Course_ID),
    FOREIGN KEY (Asses_ID) REFERENCES Assesment_Type(Asses_ID)
);


--  13. Attendance
CREATE TABLE Attendance (
    Atten_ID INT PRIMARY KEY,
    session VARCHAR(50),
    Status VARCHAR(20),
    Date DATE,
    Result VARCHAR(50),
    Student_ID INT,
    Course_ID INT,
    To_id INT,
    Created_At DATETIME DEFAULT CURRENT_TIMESTAMP,
    Updated_At DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID),
    FOREIGN KEY (Course_ID) REFERENCES Course_Unit(Course_ID),
    FOREIGN KEY (To_id) REFERENCES Tech_Officer(To_ID)
);

--  14. Final Result
CREATE TABLE Final_Result (
    Result_ID INT PRIMARY KEY,
    CA_Marks DECIMAL(5,2),
    End_Marks DECIMAL(5,2),
    Total_Marks DECIMAL(5,2),
    Grade_ID INT,
    Sgpa DECIMAL(3,2),
    Cgpa DECIMAL(3,2),
    Eligibility_Status VARCHAR(20),
    Student_ID INT,
    course_ID INT,
    Created_At DATETIME DEFAULT CURRENT_TIMESTAMP,
    Updated_At DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (Grade_ID) REFERENCES Grade(Grade_ID),
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID),
    FOREIGN KEY (course_ID) REFERENCES Course_Unit(Course_ID)
);

