USE Group18_DB;

DELIMITER //


-- 1. RECORD ATTENDANCE

CREATE PROCEDURE sp_record_attendance(
    IN p_student_id INT,
    IN p_course_id INT,
    IN p_date DATE,
    IN p_status VARCHAR(20)
)
BEGIN
    INSERT INTO Attendance (Student_ID, Course_ID, Date, Status)
    VALUES (p_student_id, p_course_id, p_date, p_status);
END //


-- 2. INDIVIDUAL ATTENDANCE

CREATE PROCEDURE sp_attendance_individual(
    IN p_student_id INT,
    IN p_course_id INT
)
BEGIN
    SELECT 
        COUNT(*) AS total,
        SUM(CASE WHEN Status IN ('present','medical') THEN 1 ELSE 0 END) AS attended,
        ROUND(SUM(CASE WHEN Status IN ('present','medical') THEN 1 ELSE 0 END)*100/COUNT(*),2) AS percentage,
        CASE 
            WHEN SUM(CASE WHEN Status IN ('present','medical') THEN 1 ELSE 0 END)*100/COUNT(*) >= 80
            THEN 'Eligible'
            ELSE 'Not Eligible'
        END AS eligibility
    FROM Attendance
    WHERE Student_ID = p_student_id AND Course_ID = p_course_id;
END //


-- 3. BATCH ATTENDANCE SUMMARY

CREATE PROCEDURE sp_attendance_batch(IN p_course_id INT)
BEGIN
    SELECT 
        Student_ID,
        ROUND(SUM(CASE WHEN Status IN ('present','medical') THEN 1 ELSE 0 END)*100/COUNT(*),2) AS percentage,
        CASE 
            WHEN SUM(CASE WHEN Status IN ('present','medical') THEN 1 ELSE 0 END)*100/COUNT(*) >= 80
            THEN 'Eligible'
            ELSE 'Not Eligible'
        END AS eligibility
    FROM Attendance
    WHERE Course_ID = p_course_id
    GROUP BY Student_ID;
END //


-- 4. RECORD MARKS

CREATE PROCEDURE sp_record_marks(
    IN p_student_id INT,
    IN p_course_id INT,
    IN p_asses_id INT,
    IN p_marks DECIMAL(5,2)
)
BEGIN
    INSERT INTO Marks (Student_ID, Course_ID, Asses_ID, Marks)
    VALUES (p_student_id, p_course_id, p_asses_id, p_marks)
    ON DUPLICATE KEY UPDATE Marks = p_marks;
END //


-- 5. CALCULATE CA (INDIVIDUAL)

CREATE PROCEDURE sp_ca_individual(
    IN p_student_id INT,
    IN p_course_id INT
)
BEGIN
    SELECT 
        ROUND(SUM(m.Marks * a.weight_percentage / 100),2) AS CA_Marks
    FROM Marks m
    JOIN Assesment_Type a ON m.Asses_ID = a.Asses_ID
    WHERE m.Student_ID = p_student_id AND m.Course_ID = p_course_id;
END //


-- 6. CA BATCH SUMMARY

CREATE PROCEDURE sp_ca_batch(IN p_course_id INT)
BEGIN
    SELECT 
        m.Student_ID,
        ROUND(SUM(m.Marks * a.weight_percentage / 100),2) AS CA_Marks
    FROM Marks m
    JOIN Assesment_Type a ON m.Asses_ID = a.Asses_ID
    WHERE m.Course_ID = p_course_id
    GROUP BY m.Student_ID;
END //


-- 7. CHECK ELIGIBILITY (ATTENDANCE + CA)

CREATE PROCEDURE sp_check_eligibility(
    IN p_student_id INT,
    IN p_course_id INT
)
BEGIN
    DECLARE att DECIMAL(5,2);
    DECLARE ca DECIMAL(5,2);

    -- Attendance %
    SELECT 
        SUM(CASE WHEN Status IN ('present','medical') THEN 1 ELSE 0 END)*100/COUNT(*)
    INTO att
    FROM Attendance
    WHERE Student_ID = p_student_id AND Course_ID = p_course_id;

    -- CA Marks
    SELECT 
        SUM(m.Marks * a.weight_percentage / 100)
    INTO ca
    FROM Marks m
    JOIN Assesment_Type a ON m.Asses_ID = a.Asses_ID
    WHERE m.Student_ID = p_student_id AND m.Course_ID = p_course_id;

    SELECT 
        att AS Attendance_Percentage,
        ca AS CA_Marks,
        CASE 
            WHEN att >= 80 AND ca >= 40 THEN 'Eligible'
            ELSE 'Not Eligible'
        END AS Final_Eligibility;
END //


-- 8. ASSIGN FINAL GRADE (WITH MC / WH / REPEAT)

CREATE PROCEDURE sp_assign_final_grade(
    IN p_student_id INT,
    IN p_course_id INT,
    IN p_total DECIMAL(5,2),
    IN p_medical VARCHAR(5)
)
BEGIN
    DECLARE v_grade VARCHAR(2);
    DECLARE v_gpa DECIMAL(3,2);
    DECLARE v_status VARCHAR(20);

    -- Get student status
    SELECT Status INTO v_status FROM Student WHERE Student_ID = p_student_id;

    IF p_medical = 'yes' THEN
        SET v_grade = 'MC';
        SET v_gpa = 0;
    ELSEIF v_status = 'suspended' THEN
        SET v_grade = 'WH';
        SET v_gpa = 0;
    ELSE
        CASE
            WHEN p_total >= 85 THEN SET v_grade='A+', v_gpa=4.0;
            WHEN p_total >= 75 THEN SET v_grade='A',  v_gpa=4.0;
            WHEN p_total >= 65 THEN SET v_grade='B',  v_gpa=3.0;
            WHEN p_total >= 55 THEN SET v_grade='C',  v_gpa=2.0;
            WHEN p_total >= 40 THEN SET v_grade='D',  v_gpa=1.0;
            ELSE SET v_grade='F', v_gpa=0.0;
        END CASE;

        -- Repeat student max grade = C
        IF v_status = 'repeat' AND v_grade IN ('A+','A','B') THEN
            SET v_grade = 'C';
            SET v_gpa = 2.0;
        END IF;
    END IF;

    INSERT INTO Final_Result (Student_ID, Course_ID, Total_Marks, Grade, Sgpa)
    VALUES (p_student_id, p_course_id, p_total, v_grade, v_gpa)
    ON DUPLICATE KEY UPDATE 
        Total_Marks = p_total,
        Grade = v_grade,
        Sgpa = v_gpa;
END //


-- 9. SGPA (WEIGHTED)

CREATE PROCEDURE sp_calculate_sgpa(IN p_student_id INT)
BEGIN
    SELECT 
        ROUND(SUM(fr.Sgpa * c.Credit)/SUM(c.Credit),2) AS SGPA
    FROM Final_Result fr
    JOIN Course_Unit c ON fr.Course_ID = c.Course_ID
    WHERE fr.Student_ID = p_student_id;
END //


-- 10. CGPA

CREATE PROCEDURE sp_calculate_cgpa(IN p_student_id INT)
BEGIN
    DECLARE cg DECIMAL(3,2);

    SELECT 
        SUM(fr.Sgpa * c.Credit)/SUM(c.Credit)
    INTO cg
    FROM Final_Result fr
    JOIN Course_Unit c ON fr.Course_ID = c.Course_ID
    WHERE fr.Student_ID = p_student_id;

    UPDATE Final_Result 
    SET Cgpa = cg
    WHERE Student_ID = p_student_id;

    SELECT cg AS CGPA;
END //

-- 11. STUDENT FULL REPORT

CREATE PROCEDURE sp_student_report(IN p_student_id INT)
BEGIN
    SELECT 
        c.Course_code,
        c.Course_name,
        fr.Total_Marks,
        fr.Grade,
        fr.Sgpa,
        fr.Cgpa
    FROM Final_Result fr
    JOIN Course_Unit c ON fr.Course_ID = c.Course_ID
    WHERE fr.Student_ID = p_student_id;
END //


-- 12. BATCH FINAL RESULTS

CREATE PROCEDURE sp_batch_results(IN p_course_id INT)
BEGIN
    SELECT 
        fr.Student_ID,
        fr.Total_Marks,
        fr.Grade,
        fr.Sgpa
    FROM Final_Result fr
    WHERE fr.Course_ID = p_course_id;
END //

DELIMITER ;