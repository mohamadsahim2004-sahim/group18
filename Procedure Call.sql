USE Group18_DB;


-- 1. RECORD ATTENDANCE

CALL sp_record_attendance(101, 1, '2026-05-01', 'present');
CALL sp_record_attendance(101, 1, '2026-05-02', 'absent');
CALL sp_record_attendance(102, 1, '2026-05-01', 'medical');



-- 2. INDIVIDUAL ATTENDANCE

CALL sp_attendance_individual(101, 1);


-- 3. BATCH ATTENDANCE SUMMARY

CALL sp_attendance_batch(1);



-- 4. RECORD MARKS

CALL sp_record_marks(101, 1, 1, 75.50);
CALL sp_record_marks(101, 1, 2, 60.00);
CALL sp_record_marks(102, 1, 1, 80.00);



-- 5. CA INDIVIDUAL

CALL sp_ca_individual(101, 1);



-- 6. CA BATCH SUMMARY

CALL sp_ca_batch(1);



-- 7. CHECK ELIGIBILITY

CALL sp_check_eligibility(101, 1);



-- 8. ASSIGN FINAL GRADE

CALL sp_assign_final_grade(101, 1, 78.50, 'no');
CALL sp_assign_final_grade(102, 1, 85.00, 'yes'); -- medical case


-- 9. CALCULATE SGPA

CALL sp_calculate_sgpa(101);


-- 10. CALCULATE CGPA

CALL sp_calculate_cgpa(101);


-- 11. STUDENT FULL REPORT

CALL sp_student_report(101);



-- 12. BATCH FINAL RESULTS

CALL sp_batch_results(1);