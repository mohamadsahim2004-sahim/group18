SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO Department (Dept_ID, Dept_name, Lec_count, Stu_count) VALUES
(1, 'Information and Communication Technology', 16, 320),
(2, 'Bio Systems Technology', 11,  450),
(3, 'Engineering Technology',19 , 750);

INSERT INTO Assesment_Type (Asses_ID, Asses_Name, weight_percentage) VALUES
(1, 'Quiz',            10.00),
(2, 'Assignment',      10.00),
(3, 'Mid Theory',      15.00),
(4, 'Mid Practical',   15.00),
(5, 'Final Theory',    25.00),
(6, 'Final Practical', 25.00);

INSERT INTO Grade (Grade_ID, Grade, Min_Marks, Max_Marks, Grade_Point) VALUES
(1,  'A+', 85, 100, 4.00),
(2,  'A',  75,  84, 4.00),
(3,  'A-', 70,  74, 3.70),
(4,  'B+', 65,  69, 3.30),
(5,  'B',  60,  64, 3.00),
(6,  'B-', 55,  59, 2.70),
(7,  'C+', 50,  54, 2.30),
(8,  'C',  45,  49, 2.00),
(9,  'C-', 40,  44, 1.70),
(10, 'D',  35,  39, 1.30),
(11, 'E',   0,  34, 0.00);

INSERT INTO Lecturer (Lecturer_ID, Full_name, Email, Designation, Dept_ID) VALUES
(1,  'Prof. Subash Jayasinghe',   'subash@ictec.ruh.ac.lk',       'Professor',        1),
(2,  'Ms. Piyumi Wijerathna',     'piyumi@ictec.ruh.ac.lk',       'Lecturer',         1),
(3,  'Dr. Dinithi Vithanage',     'dinithi@ictec.ruh.ac.lk',      'Senior Lecturer',  2),
(4,  'Ms. Rumeshika W.arachi',    'rumeshika@ictec.ruh.ac.lk',    'Lecturer',         3),
(5,  'Ms. Chanduni Fernando',     'chanduni.f@ruh.ac.lk',         'Lecturer',         3),
(6,  'Mr. Shashitha Lakal',        'shashithal@ictec.ruh.ac.lk',   'Lecturer',         2);

INSERT INTO Tech_Officer (To_ID, Email, Full_Name, Assign_Lab, Dept_ID) VALUES
(1, 'to1@ruh.ac.lk', 'Nimal Perera',         'Lab A', 1),
(2, 'to2@ruh.ac.lk', 'Tharindu Jayasinghe',  'Lab B', 1),
(3, 'to3@ruh.ac.lk', 'Sachini Peris',        'Lab C', 2),
(4, 'to4@ruh.ac.lk', 'Heshan Silva',         'Lab D', 3),
(5, 'to5@ruh.ac.lk', 'Lamal Fernando',       'Lab E', 2);

INSERT INTO Student (Student_ID, Full_name, DOB, Email, Reg_No, Address, Status, Intake_Year, Dept_ID) VALUES
-- Proper Students (10)
(1, 'Heshan Bandara', '2004-05-10', 'hesh@gmail.com', 'tg20242076', 'Colombo', 'Proper', 2024, 1),
(2, 'Fathima Riya', '2003-07-21', 'riya@gmail.com', 'tg20242077', 'Galle', 'Proper', 2024, 1),
(3, 'kumar Mohan', '2002-11-15', 'kumar@gmail.com', 'tg20242078', 'Matara', 'Proper', 2024, 1),
(4, 'Nimal Perera', '2004-02-18', 'nimal@gmail.com', 'tg20242079', 'Hambantota', 'Proper', 2024, 1),
(5, 'Imran Khan', '2003-09-09', 'imran@gmail.com', 'tg20242080', 'Kalutara', 'Proper', 2024, 1),
(6, 'Nishan Silva', '2003-06-12', 'nishan@gmail.com', 'tg20242081', 'Colombo', 'Proper', 2024, 1),
(7, 'Saman Peris', '2004-03-30', 'saman@gmail.com', 'tg20242082', 'Galle', 'Proper', 2024, 1),
(8, 'Kavindi Fernando', '2003-08-11', 'kavindi@gmail.com', 'tg20242083', 'Matara', 'Proper', 2024, 1),
(9, 'Rashmi Jayathilaka', '2003-01-25', 'rashmi@gmail.com', 'tg20242084', 'Colombo', 'Proper', 2024, 1),
(10, 'Kaviya Rajesh', '2004-12-05', 'kaviya@gmail.com', 'tg20242085', 'Gampaha', 'Proper', 2024, 1),

-- Repeat Students (5)
(11, 'Ruwan Silva', '2002-04-14', 'ruwan@gmail.com', 'tg20232086', 'Colombo', 'Repeat', 2023, 1),
(12, 'Kasun Perera', '2002-07-19', 'kasun@gmail.com', 'tg20232087', 'Galle', 'Repeat', 2023, 1),
(13, 'Nadeesha Fernando', '2002-10-10', 'nadeesha@gmail.com', 'tg20232088', 'Matara', 'Repeat', 2023, 1),
(14, 'Supun Dilshan', '2002-01-01', 'supun@gmail.com',  'tg20232089', 'Repeat', 2023, 1),
(15, 'Isuru Madushan', '2002-06-22', 'isuru@gmail.com',  'tg20232090', 'Repeat', 2023, 1),

-- Suspended (extra - good for marks)
(16, 'Saman Kumara', '2003-05-05', 'saman@gmail.com', 'tg20232091', 'Colombo', 'Suspended', 2023, 1);


INSERT INTO Course_Unit 
(Course_ID, Course_code, Credit, Type, Semester, Level, Dept_ID, Lecturer_ID)
VALUES
(1, 'ICT1222', 2, 'Practical', 2, 1, 1, 1),
(2, 'ICT1232', 2, 'Theory', 2, 1, 1, 2),
(3, 'ICT1242', 2, 'Practical', 2, 1, 1, 5),
(4, 'ICT1252', 2, 'Theory', 2, 1, 3, 4),
(5, 'ICT1261', 1, 'Practical', 2, 1, 2, 3);