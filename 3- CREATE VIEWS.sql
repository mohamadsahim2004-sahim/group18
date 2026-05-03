
-- view Attendance whole batch 
CREATE OR REPLACE VIEW VIEWAttendance_Batch AS
SELECT 
    s.Reg_No,
    s.Full_name,
    cu.Course_code,
    COUNT(a.Atten_ID) AS Total_Sessions,
    SUM(CASE WHEN a.Status = 'Present' THEN 1 ELSE 0 END) AS Present_Count,
    ROUND(
        (SUM(CASE WHEN a.Status = 'Present' THEN 1 ELSE 0 END) / 
        COUNT(a.Atten_ID)) * 100, 2
    ) AS Attendance_Percentage,
    CASE 
        WHEN ROUND(
            (SUM(CASE WHEN a.Status = 'Present' THEN 1 ELSE 0 END) / 
            COUNT(a.Atten_ID)) * 100, 2
        ) >= 80 THEN 'Eligible'
        ELSE 'Not Eligible'
    END AS Eligibility
FROM Student s
JOIN Attendance a ON s.Student_ID = a.Student_ID
JOIN Course_Unit cu ON a.Course_ID = cu.Course_ID
GROUP BY s.Reg_No, s.Full_name, cu.Course_code;


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


-- view Attendance by Theory and Practical
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
WHERE at.Asses_Name NOT IN ('Final Theory', 'Final Practical')
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
WHERE at.Asses_Name NOT IN ('Final Theory', 'Final Practical')
ORDER BY s.Reg_No;


-- View eligibility status for each student individually
CREATE OR REPLACE VIEW VIEWEligibility_Individual AS
SELECT 
    s.Reg_No,
    s.Full_name,
    cu.Course_code,
    fr.Eligibility_Status,
    fr.CA_Marks,
    fr.Total_Marks
FROM Student s
JOIN Final_Result fr ON s.Student_ID = fr.Student_ID
JOIN Course_Unit cu ON fr.course_ID = cu.Course_ID
ORDER BY s.Reg_No;


-- View eligibility status for all students in whole batch
CREATE OR REPLACE VIEW VIEWEligibility_Batch AS
SELECT 
    s.Reg_No,
    s.Full_name,
    s.Status AS Student_Status,
    cu.Course_code,
    fr.CA_Marks,
    fr.Eligibility_Status
FROM Student s
JOIN Final_Result fr ON s.Student_ID = fr.Student_ID
JOIN Course_Unit cu ON fr.course_ID = cu.Course_ID
ORDER BY s.Reg_No;


-- View marks and grades for each student per course
CREATE OR REPLACE VIEW VIEWMarks_Grades AS
SELECT 
    s.Reg_No,
    s.Full_name,
    s.Status,
    cu.Course_code,
    fr.CA_Marks,
    fr.End_Marks,
    fr.Total_Marks,
    g.Grade,
    g.Grade_Point
FROM Student s
JOIN Final_Result fr ON s.Student_ID = fr.Student_ID
JOIN Course_Unit cu ON fr.course_ID = cu.Course_ID
JOIN Grade g ON fr.Grade_ID = g.Grade_ID
ORDER BY s.Reg_No;


-- View SGPA and CGPA for each student per course
CREATE OR REPLACE VIEW VIEWSGPA_CGPA AS
SELECT 
    s.Reg_No,
    s.Full_name,
    s.Status,
    cu.Course_code,
    g.Grade,
    g.Grade_Point,
    fr.Sgpa,
    fr.Cgpa
FROM Student s
JOIN Final_Result fr ON s.Student_ID = fr.Student_ID
JOIN Course_Unit cu ON fr.course_ID = cu.Course_ID
JOIN Grade g ON fr.Grade_ID = g.Grade_ID
ORDER BY s.Reg_No;


-- Final Eligiblity view
CREATE VIEW v_Final_Eligibility AS
WITH AttendanceCalc AS (
    -- Calculate Attendance Percentage (Assuming 15 sessions total)
    -- Treats 'Status' as 'Present' or 'Medical' as valid attendance
    SELECT 
        Student_ID, 
        Course_ID,
        (COUNT(CASE WHEN Status IN ('Present', 'Medical') THEN 1 END) * 100.0 / 15) AS Atten_Percentage
    FROM Attendance
    GROUP BY Student_ID, Course_ID
),
CACalc AS (
    -- Calculate Total CA Marks based on Assessment Weights
    SELECT 
        m.Student_ID, 
        m.Course_ID,
        SUM(m.Marks * (at.weight_percentage / 100.0)) AS Total_CA_Marks
    FROM Marks m
    JOIN Assesment_Type at ON m.Asses_ID = at.Asses_ID
    GROUP BY m.Student_ID, m.Course_ID
)
SELECT 
    s.Reg_No,
    c.Course_code,
    ROUND(ac.Atten_Percentage, 2) AS Attendance_Percentage,
    ROUND(cc.Total_CA_Marks, 2) AS Total_CA_Marks,
    
    CASE WHEN ac.Atten_Percentage >= 80 THEN 'Eligible' ELSE 'Ineligible' END AS Attendance_Eligibility_Status,

    CASE WHEN cc.Total_CA_Marks >= 40 THEN 'Eligible' ELSE 'Ineligible' END AS CA_Eligibility_Status,

    CASE 
        WHEN ac.Atten_Percentage >= 80 AND cc.Total_CA_Marks >= 40 THEN 'Eligible' 
        ELSE 'Ineligible' 
    END AS Final_Eligibility_Status

FROM Student s
JOIN AttendanceCalc ac ON s.Student_ID = ac.Student_ID
JOIN CACalc cc ON s.Student_ID = cc.Student_ID AND ac.Course_ID = cc.Course_ID
JOIN Course_Unit c ON ac.Course_ID = c.Course_ID;
