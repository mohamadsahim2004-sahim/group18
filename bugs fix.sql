-- fix null rows in tables

UPDATE Marks SET Medi_Status = 'Medical' WHERE Marks_id = 10;

UPDATE Marks SET Medi_Status = 'Medical' WHERE Marks_id = 8;

UPDATE Marks SET Medi_Status = 'None' WHERE Medi_Status IS NULL;


UPDATE Student SET Status = 'Proper' WHERE Student_ID IN (1, 2, 4, 5, 6, 7);
UPDATE Student SET Status = 'Repeat' WHERE Student_ID = 3;

UPDATE Department d 
SET Stu_count = (SELECT COUNT(*) FROM Student WHERE Dept_ID = d.Dept_ID),
    Lec_count = (SELECT COUNT(*) FROM Lecturer WHERE Dept_ID = d.Dept_ID);

UPDATE Final_Result fr
JOIN (
    SELECT fr2.Student_ID, SUM(g.Grade_Point * c.Credit) / SUM(c.Credit) as calc_gpa
    FROM Final_Result fr2
    JOIN Course_Unit c ON fr2.course_ID = c.Course_ID
    JOIN Grade g ON fr2.Grade_ID = g.Grade_ID
    GROUP BY fr2.Student_ID
) as gpa_data ON fr.Student_ID = gpa_data.Student_ID
SET fr.Sgpa = gpa_data.calc_gpa, 
    fr.Cgpa = gpa_data.calc_gpa;
