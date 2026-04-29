-- 1. calculate GPA
DELIMITER //

CREATE PROCEDURE Calculate_Student_GPA(IN target_student_id INT)
BEGIN
    DECLARE total_points DECIMAL(10,2);
    DECLARE total_credits INT;
    DECLARE calculated_sgpa DECIMAL(3,2);

    SELECT SUM(g.Grade_Point * c.Credit), SUM(c.Credit)
    INTO total_points, total_credits
    FROM Final_Result fr
    JOIN Course_Unit c ON fr.course_ID = c.Course_ID
    JOIN Grade g ON fr.Grade_ID = g.Grade_ID
    WHERE fr.Student_ID = target_student_id;

    IF total_credits > 0 THEN
        SET calculated_sgpa = total_points / total_credits;
        
        UPDATE Final_Result 
        SET Sgpa = calculated_sgpa, 
            Cgpa = calculated_sgpa 
        WHERE Student_ID = target_student_id;
    END IF;
END; //

DELIMITER ;