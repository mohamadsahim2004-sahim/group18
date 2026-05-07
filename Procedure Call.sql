
-- 1. RECORD ATTENDANCE
CALL sp_RecordAttendance(
    1,
    'Theory',
    'Present',
    '2026-05-01',
    101,
    201,
    301
);

-- 2. REGISTER MEDICAL (Attendance)
CALL sp_RegisterMedical(
    101,
    201,
    '2026-05-01',
    'Attendance'
);

-- 2. REGISTER MEDICAL (Exam)
CALL sp_RegisterMedical(
    101,
    201,
    '2026-05-10',
    'Exam'
);


-- 3. UPDATE MARKS
CALL sp_UpdateMarks(
    1,
    '2026-05-10',
    75.50,
    101,
    201,
    1
);


-- 4. SET STUDENT STATUS
CALL sp_SetStudentStatus(
    101,
    'Repeat'
);


-- 5. GENERATE BATCH REPORT
CALL sp_GenerateBatchReport(
    201
);

-- VERIFY OUTPUT (OPTIONAL)
SELECT * FROM sp_RecordAttendance;
SELECT * FROM sp_RegisterMedical;
SELECT * FROM sp_UpdateMarks;
SELECT * FROM sp_SetStudentStatus;
SELECT * FROM sp_GenerateBatchReport;