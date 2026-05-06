DELIMITER $$


-- 1. RECORD ATTENDANCE

CREATE PROCEDURE sp_RecordAttendance(
    IN p_Atten_ID INT,
    IN p_session VARCHAR(50),
    IN p_status VARCHAR(20),
    IN p_date DATE,
    IN p_student_id INT,
    IN p_course_id INT,
    IN p_to_id INT
)
BEGIN
    INSERT INTO Attendance(
        Atten_ID, session, Status, Date, Result,
        Student_ID, Course_ID, To_id
    )
    VALUES(
        p_Atten_ID,
        p_session,
        p_status,
        p_date,
        CASE 
            WHEN p_status = 'Present' THEN 'Counted'
            ELSE 'Not Counted'
        END,
        p_student_id,
        p_course_id,
        p_to_id
    );
END $$


-- 2. REGISTER MEDICAL

CREATE PROCEDURE sp_RegisterMedical(
    IN p_student_id INT,
    IN p_course_id INT,
    IN p_date DATE,
    IN p_type VARCHAR(20)
)
BEGIN
    IF p_type = 'Attendance' THEN
        UPDATE Attendance
        SET Result = 'Medical'
        WHERE Student_ID = p_student_id
        AND Course_ID = p_course_id
        AND Date = p_date;
        
    ELSEIF p_type = 'Exam' THEN
        UPDATE Marks
        SET Medi_Status = 'Medical'
        WHERE Student_ID = p_student_id
        AND Course_ID = p_course_id
        AND Exam_Date = p_date;
    END IF;
END $$


-- 3. UPDATE MARKS

CREATE PROCEDURE sp_UpdateMarks(
    IN p_marks_id INT,
    IN p_exam_date DATE,
    IN p_marks DECIMAL(5,2),
    IN p_student_id INT,
    IN p_course_id INT,
    IN p_asses_id INT
)
BEGIN
    INSERT INTO Marks(
        Marks_id, Exam_Date, Marks,
        Medi_Status, Student_ID,
        Course_ID, Asses_ID
    )
    VALUES(
        p_marks_id,
        p_exam_date,
        p_marks,
        'None',
        p_student_id,
        p_course_id,
        p_asses_id
    );
END $$


-- 4. SET STUDENT STATUS

CREATE PROCEDURE sp_SetStudentStatus(
    IN p_student_id INT,
    IN p_status VARCHAR(20)
)
BEGIN
    UPDATE Student
    SET Status = p_status
    WHERE Student_ID = p_student_id;
END $$


-- 5. GENERATE BATCH REPORT

CREATE PROCEDURE sp_GenerateBatchReport(
    IN p_course_id INT
)
BEGIN
    SELECT 
        s.Student_ID,
        s.Full_name,
        s.Reg_No,
        f.CA_Marks,
        f.End_Marks,
        f.Total_Marks,
        f.Grade_ID,
        f.Sgpa,
        f.Cgpa,
        f.Eligibility_Status
    FROM Final_Result f
    JOIN Student s ON f.Student_ID = s.Student_ID
    WHERE f.Course_ID = p_course_id;
END $$

DELIMITER ;