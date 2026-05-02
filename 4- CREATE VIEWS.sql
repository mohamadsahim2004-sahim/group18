
-- view Attendance whole batch 
CREATE OR REPLACE VIEW VIEWAttendance_Batch     AS
SELECT 
    s.Reg_No,
    s.Full_name,
    cu.Course_code,
    a.Date,
    a.session,
    a.Status
FROM Student s
JOIN Attendance a ON s.Student_ID = a.Student_ID
JOIN Course_Unit cu ON a.Course_ID = cu.Course_ID;

-- view Attendance by course 

CREATE OR REPLACE VIEW VIEWAttendance_By_Course AS
SELECT 
    cu.Course_code,
    s.Reg_No,
    s.Full_name,
    a.Date,
    a.session,
    a.Status
FROM Student s
JOIN Attendance a ON s.Student_ID = a.Student_ID
JOIN Course_Unit cu ON a.Course_ID = cu.Course_ID
ORDER BY cu.Course_code;

-- view Attendance by Student

CREATE OR REPLACE VIEW VIEWAttendance_By_Student AS
SELECT 
    s.Reg_No,
    s.Full_name,
    cu.Course_code,
    a.Date,
    a.session,
    a.Status
FROM Student s
JOIN Attendance a ON s.Student_ID = a.Student_ID
JOIN Course_Unit cu ON a.Course_ID = cu.Course_ID
ORDER BY s.Reg_No;

-- view Attendance summary  by course unit

CREATE OR REPLACE VIEW VIEWAttendance_All_Courses AS
SELECT 
    cu.Course_code,
    COUNT(DISTINCT a.Student_ID) AS Total_Students,
    COUNT(a.Atten_ID) AS Total_Sessions
FROM Course_Unit cu
JOIN Attendance a ON cu.Course_ID = a.Course_ID
GROUP BY cu.Course_code;

-- view Attendance by Student and course

CREATE OR REPLACE VIEW VIEWAttendance_Student_Course AS
SELECT 
    s.Reg_No,
    s.Full_name,
    cu.Course_code,
    a.Date,
    a.session,
    a.Status
FROM Student s
JOIN Attendance a ON s.Student_ID = a.Student_ID
JOIN Course_Unit cu ON a.Course_ID = cu.Course_ID
ORDER BY s.Reg_No, cu.Course_code;

-- view Attendance by Theory

CREATE OR REPLACE VIEW VIEWAttendance_Theory AS
SELECT 
    s.Reg_No,
    s.Full_name,
    cu.Course_code,
    a.Date,
    a.Status
FROM Student s
JOIN Attendance a ON s.Student_ID = a.Student_ID
JOIN Course_Unit cu ON a.Course_ID = cu.Course_ID
WHERE a.session = 'Theory';

-- view Attendance by practical

CREATE OR REPLACE VIEW VIEWAttendance_Practical AS
SELECT 
    s.Reg_No,
    s.Full_name,
    cu.Course_code,
    a.Date,
    a.Status
FROM Student s
JOIN Attendance a ON s.Student_ID = a.Student_ID
JOIN Course_Unit cu ON a.Course_ID = cu.Course_ID
WHERE a.session = 'Practical';

-- view Attendance by Theory Na Practical

CREATE OR REPLACE VIEW VIEWAttendance_Combined AS
SELECT 
    s.Reg_No,
    s.Full_name,
    cu.Course_code,
    a.session,
    a.Date,
    a.Status
FROM Student s
JOIN Attendance a ON s.Student_ID = a.Student_ID
JOIN Course_Unit cu ON a.Course_ID = cu.Course_ID
WHERE a.session IN ('Theory', 'Practical')
ORDER BY s.Reg_No, cu.Course_code, a.Date;



-- View  CA marks for all students and all courses
CREATE OR REPLACE VIEW VIEWCA_Marks_Batch AS
SELECT 
    s.Reg_No,
    s.Full_name,
    cu.Course_code,
    at.Asses_Name,
    m.Marks,
    m.Medi_Status,
    m.Exam_Date
FROM Student s
JOIN Marks m ON s.Student_ID = m.Student_ID
JOIN Course_Unit cu ON m.Course_ID = cu.Course_ID
JOIN Assesment_Type at ON m.Asses_ID = at.Asses_ID
WHERE at.Asses_Name != 'Final';



-- View  CA marks ordered by course code
CREATE OR REPLACE VIEW VIEWCA_Marks_By_Course AS
SELECT 
    cu.Course_code,
    s.Reg_No,
    s.Full_name,
    at.Asses_Name,
    m.Marks,
    m.Medi_Status
FROM Student s
JOIN Marks m ON s.Student_ID = m.Student_ID
JOIN Course_Unit cu ON m.Course_ID = cu.Course_ID
JOIN Assesment_Type at ON m.Asses_ID = at.Asses_ID
WHERE at.Asses_Name != 'Final'
ORDER BY cu.Course_code;



-- View CA marks ordered by student registration number
CREATE OR REPLACE VIEW VIEWCA_Marks_Individual AS
SELECT 
    s.Reg_No,
    s.Full_name,
    cu.Course_code,
    at.Asses_Name,
    m.Marks,
    m.Medi_Status,
    m.Exam_Date
FROM Student s
JOIN Marks m ON s.Student_ID = m.Student_ID
JOIN Course_Unit cu ON m.Course_ID = cu.Course_ID
JOIN Assesment_Type at ON m.Asses_ID = at.Asses_ID
WHERE at.Asses_Name != 'Final'
ORDER BY s.Reg_No;



-- View CA marks ordered by student and course code
CREATE OR REPLACE VIEW VIEWCA_Marks_Course_Student AS
SELECT 
    s.Reg_No,
    s.Full_name,
    cu.Course_code,
    at.Asses_Name,
    m.Marks,
    m.Medi_Status
FROM Student s
JOIN Marks m ON s.Student_ID = m.Student_ID
JOIN Course_Unit cu ON m.Course_ID = cu.Course_ID
JOIN Assesment_Type at ON m.Asses_ID = at.Asses_ID
WHERE at.Asses_Name != 'Final'
ORDER BY s.Reg_No, cu.Course_code;



-- View average CA marks summary for each student per course
CREATE OR REPLACE VIEW VIEWCA_Summary_Student AS
SELECT 
    s.Reg_No,
    s.Full_name,
    cu.Course_code,
    ROUND(AVG(m.Marks), 2) AS Average_CA_Marks
FROM Student s
JOIN Marks m ON s.Student_ID = m.Student_ID
JOIN Course_Unit cu ON m.Course_ID = cu.Course_ID
JOIN Assesment_Type at ON m.Asses_ID = at.Asses_ID
WHERE at.Asses_Name != 'Final'
GROUP BY s.Reg_No, s.Full_name, cu.Course_code;