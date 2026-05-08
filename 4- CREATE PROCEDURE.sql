
-- 1. attendance_per_course
-- Input : Course Code

DELIMITER //

CREATE PROCEDURE attendance_per_course(
    IN in_course_code VARCHAR(10)
)
BEGIN
    SELECT 
        s.Reg_No,
        s.Full_name,
        COUNT(a.Atten_ID) AS Total_Sessions,
        COUNT(
            CASE
                WHEN a.Status IN ('Present','Medical')
                THEN 1
            END
        ) AS Attended_Sessions,
        ROUND(
            (
                COUNT(
                    CASE
                        WHEN a.Status IN ('Present','Medical')
                        THEN 1
                    END
                ) / COUNT(a.Atten_ID)
            ) * 100,2
        ) AS Attendance_Percentage,
        CASE
            WHEN (
                COUNT(
                    CASE
                        WHEN a.Status IN ('Present','Medical')
                        THEN 1
                    END
                ) / COUNT(a.Atten_ID)
            ) * 100 >= 80
            THEN 'Eligible'

            ELSE 'Not Eligible'
        END AS Eligibility
    FROM Attendance a
    JOIN Student s
        ON a.Student_ID = s.Student_ID
    JOIN Course_Unit cu
        ON a.Course_ID = cu.Course_ID
    WHERE cu.Course_code = in_course_code
    GROUP BY
        s.Student_ID,
        s.Reg_No,
        s.Full_name;

END //

DELIMITER ;


-- 2. student_attendance
-- Input : Registration No

DELIMITER //

CREATE PROCEDURE student_attendance(
    IN in_reg_no VARCHAR(20)
)
BEGIN
    SELECT
        cu.Course_code,
        cu.Course_name,
        COUNT(a.Atten_ID) AS Total_Sessions,
        COUNT(
            CASE
                WHEN a.Status IN ('Present','Medical')
                THEN 1
            END
        ) AS Attended_Sessions,
        ROUND(
            (
                COUNT(
                    CASE
                        WHEN a.Status IN ('Present','Medical')
                        THEN 1
                    END
                ) / COUNT(a.Atten_ID)
            ) * 100,2
        ) AS Attendance_Percentage,
        CASE
            WHEN (
                COUNT(
                    CASE
                        WHEN a.Status IN ('Present','Medical')
                        THEN 1
                    END
                ) / COUNT(a.Atten_ID)
            ) * 100 >= 80
            THEN 'Eligible'

            ELSE 'Not Eligible'
        END AS Eligibility

    FROM Attendance a
    JOIN Student s
        ON a.Student_ID = s.Student_ID
    JOIN Course_Unit cu
        ON a.Course_ID = cu.Course_ID
    WHERE s.Reg_No = in_reg_no
    GROUP BY
        cu.Course_ID,
        cu.Course_code,
        cu.Course_name;

END //

DELIMITER ;


-- 3. per_person_with_course
-- Input : Registration No, Course Code

DELIMITER //

CREATE PROCEDURE per_person_with_course(
    IN in_reg_no VARCHAR(20),
    IN in_course_code VARCHAR(10)
)
BEGIN
    SELECT
        s.Reg_No,
        s.Full_name,
        cu.Course_name,
        COUNT(a.Atten_ID) AS Total_Sessions,
        COUNT(
            CASE
                WHEN a.Status IN ('Present','Medical')
                THEN 1
            END
        ) AS Attended_Sessions,
        ROUND(
            (
                COUNT(
                    CASE
                        WHEN a.Status IN ('Present','Medical')
                        THEN 1
                    END
                ) / COUNT(a.Atten_ID)
            ) * 100,2
        ) AS Attendance_Percentage,
        CASE
            WHEN (
                COUNT(
                    CASE
                        WHEN a.Status IN ('Present','Medical')
                        THEN 1
                    END
                ) / COUNT(a.Atten_ID)
            ) * 100 >= 80
            THEN 'Eligible'

            ELSE 'Not Eligible'
        END AS Eligibility
    FROM Attendance a
    JOIN Student s
        ON a.Student_ID = s.Student_ID
    JOIN Course_Unit cu
        ON a.Course_ID = cu.Course_ID
    WHERE s.Reg_No = in_reg_no
      AND cu.Course_code = in_course_code
    GROUP BY
        s.Reg_No,
        s.Full_name,
        cu.Course_name;

END //

DELIMITER ;


-- 4. CA_whole_batch
-- Input : Course Code

DELIMITER //

CREATE PROCEDURE CA_whole_batch(
    IN in_course_code VARCHAR(10)
)
BEGIN
    SELECT
        s.Reg_No,
        s.Full_name,
        ROUND(
            SUM(
                m.Marks * at.weight_percentage / 100
            ),2
        ) AS Total_CA_Marks,
        CASE
            WHEN SUM(
                m.Marks * at.weight_percentage / 100
            ) >= 20

            THEN 'Eligible'
            ELSE 'Not Eligible'
        END AS Eligibility
    FROM Marks m
    JOIN Student s
        ON m.Student_ID = s.Student_ID
    JOIN Course_Unit cu
        ON m.Course_ID = cu.Course_ID
    JOIN Assesment_Type at
        ON m.Asses_ID = at.Asses_ID
    WHERE cu.Course_code = in_course_code
    GROUP BY
        s.Student_ID,
        s.Reg_No,
        s.Full_name;

END //

DELIMITER ;


-- 5. CA_indi_with_course
-- Input : Registration No, Course Code

DELIMITER //

CREATE PROCEDURE CA_indi_with_course(
    IN in_reg_no VARCHAR(20),
    IN in_course_code VARCHAR(10)
)
BEGIN
    SELECT
        s.Reg_No,
        s.Full_name,
        cu.Course_name,
        ROUND(
            SUM(
                m.Marks * at.weight_percentage / 100
            ),2
        ) AS Total_CA_Marks,
        CASE
            WHEN SUM(
                m.Marks * at.weight_percentage / 100
            ) >= 20
            THEN 'Eligible'
            ELSE 'Not Eligible'
        END AS Eligibility
    FROM Marks m
    JOIN Student s
        ON m.Student_ID = s.Student_ID
    JOIN Course_Unit cu
        ON m.Course_ID = cu.Course_ID
    JOIN Assesment_Type at
        ON m.Asses_ID = at.Asses_ID
    WHERE s.Reg_No = in_reg_no
      AND cu.Course_code = in_course_code
    GROUP BY
        s.Reg_No,
        s.Full_name,
        cu.Course_name;
END //

DELIMITER ;


-- 6. FinalMarks_individual
-- Input : Registration No

DELIMITER //

CREATE PROCEDURE FinalMarks_individual(
    IN in_reg_no VARCHAR(20)
)
BEGIN
    SELECT
        s.Reg_No,
        s.Full_name,
        cu.Course_code,
        cu.Course_name,
        fr.CA_Marks,
        fr.End_Marks,
        fr.Total_Marks,
        CASE
            WHEN s.Status = 'Suspended'
            THEN 'WH'

            WHEN s.Status = 'Repeat'
                 AND g.Grade_Point > 2.00
            THEN 'C'

            ELSE g.Grade
        END AS Grade,
        g.Grade_Point
    FROM Final_Result fr
    JOIN Student s
        ON fr.Student_ID = s.Student_ID
    JOIN Course_Unit cu
        ON fr.Course_ID = cu.Course_ID
    JOIN Grade g
        ON fr.Grade_ID = g.Grade_ID
    WHERE s.Reg_No = in_reg_no;

END //

DELIMITER ;


-- 7. CalculateGrade
-- Input : Marks & Medical Flags

DELIMITER //

CREATE PROCEDURE CalculateGrade(
    IN p_assignment DECIMAL(5,2),
    IN p_mid_exam DECIMAL(5,2),
    IN p_practical DECIMAL(5,2),
    IN p_final_exam DECIMAL(5,2),
    IN p_medical_ca BOOLEAN,
    IN p_medical_mid BOOLEAN,
    IN p_medical_final BOOLEAN,
    OUT p_final_marks DECIMAL(5,2),
    OUT p_grade VARCHAR(5),
    OUT p_gpa DECIMAL(3,2)
)

BEGIN
    DECLARE total DECIMAL(5,2);
    IF p_medical_ca = TRUE
       OR p_medical_mid = TRUE
       OR p_medical_final = TRUE THEN

        SET p_final_marks = NULL;
        SET p_grade = 'MC';
        SET p_gpa = 0.00;
    ELSE

        SET total =
            ((p_assignment / 100) * 10) +
            ((p_mid_exam / 100) * 20) +
            ((p_practical / 100) * 20) +
            ((p_final_exam / 100) * 50);

        SET p_final_marks = total;

        CASE
            WHEN total >= 85 THEN
                SET p_grade = 'A+';
                SET p_gpa = 4.00;

            WHEN total >= 75 THEN
                SET p_grade = 'A';
                SET p_gpa = 4.00;

            WHEN total >= 70 THEN
                SET p_grade = 'A-';
                SET p_gpa = 3.70;

            WHEN total >= 65 THEN
                SET p_grade = 'B+';
                SET p_gpa = 3.30;

            WHEN total >= 60 THEN
                SET p_grade = 'B';
                SET p_gpa = 3.00;

            WHEN total >= 55 THEN
                SET p_grade = 'B-';
                SET p_gpa = 2.70;

            WHEN total >= 50 THEN
                SET p_grade = 'C+';
                SET p_gpa = 2.30;

            WHEN total >= 45 THEN
                SET p_grade = 'C';
                SET p_gpa = 2.00;

            WHEN total >= 40 THEN
                SET p_grade = 'C-';
                SET p_gpa = 1.70;

            WHEN total >= 35 THEN
                SET p_grade = 'D';
                SET p_gpa = 1.30;

            ELSE
                SET p_grade = 'E';
                SET p_gpa = 0.00;

        END CASE;
    END IF;
END //

DELIMITER ;


-- 8. ProcessStudentResult
-- Input : Registration No, Course Code

DELIMITER //

CREATE PROCEDURE ProcessStudentResult(
    IN p_reg_no VARCHAR(20),
    IN p_course_code VARCHAR(10)
)
BEGIN
    SELECT
        s.Reg_No,
        s.Full_name,
        cu.Course_code,
        cu.Course_name,
        ROUND(
            SUM(m.Marks * at.weight_percentage / 100),
        2) AS Final_Marks
    FROM Marks m
    JOIN Student s
        ON m.Student_ID = s.Student_ID
    JOIN Course_Unit cu
        ON m.Course_ID = cu.Course_ID
    JOIN Assesment_Type at
        ON m.Asses_ID = at.Asses_ID
    WHERE s.Reg_No = p_reg_no
      AND cu.Course_code = p_course_code
    GROUP BY
        s.Reg_No,
        s.Full_name,
        cu.Course_code,
        cu.Course_name;

END //

DELIMITER ;


-- 9. CalculateSGPA_CGPA
-- Input : Registration No, Semester

DELIMITER //

CREATE PROCEDURE CalculateSGPA_CGPA(
    IN p_reg_no VARCHAR(20),
    IN p_semester INT
)
BEGIN
    SELECT
        s.Reg_No,
        s.Full_name,
        cu.Semester,
        ROUND(
            SUM(cu.Credit * g.Grade_Point)
            /
            SUM(cu.Credit),
        2) AS SGPA,

        ROUND(
            AVG(g.Grade_Point),
        2) AS CGPA
    FROM Final_Result fr
    JOIN Student s
        ON fr.Student_ID = s.Student_ID
    JOIN Course_Unit cu
        ON fr.Course_ID = cu.Course_ID
    JOIN Grade g
        ON fr.Grade_ID = g.Grade_ID
    WHERE s.Reg_No = p_reg_no
      AND cu.Semester = p_semester
    GROUP BY
        s.Reg_No,
        s.Full_name,
        cu.Semester;

END //

DELIMITER ;