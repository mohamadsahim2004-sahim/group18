DELIMITER $$

-- 1. Repeat Student → Grade Cap to "C"
CREATE TRIGGER trg_repeat_student_grade_cap
BEFORE INSERT ON Final_Result
FOR EACH ROW
BEGIN
    DECLARE stu_status VARCHAR(20);
    DECLARE grade_name VARCHAR(2);
    DECLARE c_grade_id INT;

    -- Get student status
    SELECT Status INTO stu_status
    FROM Student
    WHERE Student_ID = NEW.Student_ID;

    -- Get current grade
    SELECT Grade INTO grade_name
    FROM Grade
    WHERE Grade_ID = NEW.Grade_ID;

    -- Get Grade_ID for 'C'
    SELECT Grade_ID INTO c_grade_id
    FROM Grade
    WHERE Grade = 'C';

    -- Apply cap
    IF stu_status = 'repeat' AND grade_name IN ('A','A+','B','B+') THEN
        SET NEW.Grade_ID = c_grade_id;
    END IF;
END$$


-- 2. Suspended Student → Result = WH
CREATE TRIGGER trg_suspended_student_result
BEFORE INSERT ON Final_Result
FOR EACH ROW
BEGIN
    DECLARE stu_status VARCHAR(20);

    -- Get student status
    SELECT Status INTO stu_status
    FROM Student
    WHERE Student_ID = NEW.Student_ID;

    IF stu_status = 'suspended' THEN
        SET NEW.Eligibility_Status = 'WH';
        SET NEW.Total_Marks = NULL;
        SET NEW.Grade_ID = NULL;
    END IF;
END$$


-- 3. Medical Status (MC) → Update Final_Result
CREATE TRIGGER trg_medical_status_insert
AFTER INSERT ON Marks
FOR EACH ROW
BEGIN
    IF NEW.Medi_Status = 'MC' THEN
        UPDATE Final_Result
        SET Eligibility_Status = 'MC'
        WHERE Student_ID = NEW.Student_ID
          AND Course_ID = NEW.Course_ID;
    END IF;
END$$


-- 4. Medical Status on UPDATE (recommended)
CREATE TRIGGER trg_medical_status_update
AFTER UPDATE ON Marks
FOR EACH ROW
BEGIN
    IF NEW.Medi_Status = 'MC' THEN
        UPDATE Final_Result
        SET Eligibility_Status = 'MC'
        WHERE Student_ID = NEW.Student_ID
          AND Course_ID = NEW.Course_ID;
    END IF;
END$$

DELIMITER ;