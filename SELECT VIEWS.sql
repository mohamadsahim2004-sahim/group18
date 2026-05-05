USE Group18_DB;

-- 1. Batch Attendance Summary
SELECT * FROM VIEWAttendance_Batch;


-- 2. Student Individual Summary (filter by Reg_No)
SELECT * FROM VIEWAttendance_Individual_Summary;

-- To see one student:
SELECT * FROM VIEWAttendance_Individual_Summary
WHERE Reg_No = 'tg20242076';

-- 3. Combined Attendance
SELECT * FROM VIEWAttendance_Combined;

SELECT * FROM VIEWAttendance_Combined
WHERE Reg_No = 'tg20242076';

-- 4. Attendance & CA Eligibility
SELECT * FROM VIEWEligibility_Batch;

-- 5. Attendance by Course
SELECT * FROM VIEWAttendance_By_Course;

-- To see one course:
SELECT * FROM VIEWAttendance_By_Course
WHERE Course_code = 'ICT1222';

-- 6. Attendance All Courses Summary
SELECT * FROM VIEWAttendance_All_Courses;

-- 7. Attendance by Student and Course
SELECT * FROM VIEWAttendance_Student_Course;

-- To see one student in one course:
SELECT * FROM VIEWAttendance_Student_Course
WHERE Reg_No = 'tg20242076'
AND Course_code = 'ICT1222';

-- 8. CA Marks by Course
SELECT * FROM VIEWCA_Marks_By_Course;

-- To see one course:
SELECT * FROM VIEWCA_Marks_By_Course
WHERE Course_code = 'ICT1222';

-- 9. CA Marks Whole Batch
SELECT * FROM VIEWCA_Marks_Batch;

-- 10. CA Marks Individual
SELECT * FROM VIEWCA_Marks_Individual;

-- To see one student:
SELECT * FROM VIEWCA_Marks_Individual
WHERE Reg_No = 'tg20242076';

-- 11. CA Marks by Course and Student
SELECT * FROM VIEWCA_Marks_Course_Student;

-- To see one student in one course:
SELECT * FROM VIEWCA_Marks_Course_Student
WHERE Reg_No = 'tg20242076'
AND Course_code = 'ICT1222';

-- 12. CA Marks Summary by Student
SELECT * FROM VIEWCA_Summary_Student;

-- To see one student:
SELECT * FROM VIEWCA_Summary_Student
WHERE Reg_No = 'tg20242076';

-- 13. Eligibility Individual
SELECT * FROM VIEWEligibility_Individual;

-- To see one student:
SELECT * FROM VIEWEligibility_Individual
WHERE Reg_No = 'tg20242076';

-- 14. Marks and Grades
SELECT * FROM VIEWMarks_Grades;

-- To see one student:
SELECT * FROM VIEWMarks_Grades
WHERE Reg_No = 'tg20242076';

-- 15. SGPA and CGPA
SELECT * FROM VIEWSGPA_CGPA;

-- To see one student:
SELECT * FROM VIEWSGPA_CGPA
WHERE Reg_No = 'tg20242076';