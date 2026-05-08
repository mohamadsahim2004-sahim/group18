-- 1. attendance_per_course
CALL attendance_per_course('ICT1232');


-- 2. student_attendance
CALL student_attendance('tg20242076');


-- 3. per_person_with_course
CALL per_person_with_course('tg20242076', 'ICT1232');


-- 4. CA_whole_batch
CALL CA_whole_batch('ICT1232');


-- 5. CA_indi_with_course
CALL CA_indi_with_course('tg20242076', 'ICT1232');


-- 6. FinalMarks_individual
CALL FinalMarks_individual('tg20242076');


-- 7. CalculateGrade
CALL CalculateGrade(
    75,     -- Assignment
    68,     -- Mid Exam
    80,     -- Practical
    72,     -- Final Exam
    FALSE,  -- Medical CA
    FALSE,  -- Medical Mid
    FALSE,  -- Medical Final
    @final_marks,
    @grade,
    @gpa
);

SELECT @final_marks AS Final_Marks,
       @grade AS Grade,
       @gpa AS GPA;


-- 8. ProcessStudentResult
CALL ProcessStudentResult('tg20242076', 'ICT1232');


-- 9. CalculateSGPA_CGPA
CALL CalculateSGPA_CGPA('tg20242076', 2);