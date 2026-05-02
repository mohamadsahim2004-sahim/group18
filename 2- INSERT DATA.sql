SET FOREIGN_KEY_CHECKS = 1;

--1. department
INSERT INTO Department (Dept_ID, Dept_name, Lec_count, Stu_count) VALUES
(1, 'Information and Communication Technology', 16, 320),
(2, 'Bio Systems Technology', 11,  450),
(3, 'Engineering Technology',19 , 750);

--2. assesment type
INSERT INTO Assesment_Type (Asses_ID, Asses_Name, weight_percentage) VALUES
(1, 'Quiz',            10.00),
(2, 'Assignment',      10.00),
(3, 'Mid Theory',      15.00),
(4, 'Mid Practical',   15.00),
(5, 'Final Theory',    25.00),
(6, 'Final Practical', 25.00);

--3. grade
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

--4. lecturer
INSERT INTO Lecturer (Lecturer_ID, Full_name, Email, Designation, Dept_ID) VALUES
(1,  'Prof. Subash Jayasinghe',   'subash@ictec.ruh.ac.lk',       'Professor',        1),
(2,  'Ms. Piyumi Wijerathna',     'piyumi@ictec.ruh.ac.lk',       'Lecturer',         1),
(3,  'Dr. Dinithi Vithanage',     'dinithi@ictec.ruh.ac.lk',      'Senior Lecturer',  2),
(4,  'Ms. Rumeshika W.arachi',    'rumeshika@ictec.ruh.ac.lk',    'Lecturer',         3),
(5,  'Ms. Chanduni Fernando',     'chanduni.f@ruh.ac.lk',         'Lecturer',         3),
(6,  'Mr. Shashitha Lakal',        'shashithal@ictec.ruh.ac.lk',   'Lecturer',         2);


--5. student
INSERT INTO Student (Student_ID, Full_name, DOB, Email, Reg_No, Address, Status, Intake_Year, Dept_ID) VALUES
(1, 'Heshan Bandara', '2004-05-10', 'hesh@gmail.com', 'tg20242076', 'Colombo', 'Proper', 2024, 1),
(2, 'Fathima Riya', '2003-07-21', 'riya@gmail.com', 'tg20242077', 'Galle', 'Proper', 2024, 1),
(3, 'kumar Mohan', '2002-11-15', 'kumar@gmail.com', 'tg20242078', 'Matara', 'Proper', 2024, 1),
(4, 'Nimal Perera', '2004-02-18', 'nimal@gmail.com', 'tg20242079', 'Hambantota', 'Proper', 2024, 1),
(5, 'Imran Khan', '2003-09-09', 'imran@gmail.com', 'tg20242080', 'Kalutara', 'Proper', 2024, 1),
(6, 'Nishan Silva', '2003-06-12', 'nishan@gmail.com', 'tg20242081', 'Colombo', 'Proper', 2024, 1),
(7, 'Saman Peris', '2004-03-30', 'saman@gmail.com', 'tg20242082', 'Galle', 'Proper', 2024, 1),
(8, 'Kavindi Fernando', '2003-08-11', 'kavindi@gmail.com', 'tg20242083', 'Matara', 'Proper', 2024, 1),
(9, 'Rashmi Jayathilaka', '2003-01-25', 'rashmi@gmail.com', 'tg20242084', 'Colombo', 'Proper', 2024, 1),
(10, 'Kaviya Rajesh', '2004-12-05', 'kaviya@gmail.com', 'tg20242085', 'Gampaha', 'Proper', 2024, 1), --proper students
(11, 'Ruwan Silva', '2002-04-14', 'ruwan@gmail.com', 'tg20232086', 'Colombo', 'Repeat', 2023, 1),
(12, 'Kasun Perera', '2002-07-19', 'kasun@gmail.com', 'tg20232087', 'Galle', 'Repeat', 2023, 1),
(13, 'Nadeesha Fernando', '2002-10-10', 'nadeesha@gmail.com', 'tg20232088', 'Matara', 'Repeat', 2023, 1),
(14, 'Supun Dilshan', '2002-01-01', 'supun@gmail.com',  'tg20232089', 'Rathnapura', 'Repeat', 2023, 1),
(15, 'Isuru Madushan', '2002-06-22', 'isuru@gmail.com',  'tg20232090','Vavuniya' ,'Repeat', 2023, 1),  --repeat students
(16, 'Saman Kumara', '2003-05-05', 'samank@gmail.com', 'tg20232091', 'Colombo', 'Suspended', 2023, 1);  --suspended student


--6. tech officer
INSERT INTO Tech_Officer (To_ID, Email, Full_Name, Assign_Lab, Dept_ID) VALUES
(1, 'to1@ruh.ac.lk', 'Nimal Perera',         'Lab A', 1),
(2, 'to2@ruh.ac.lk', 'Tharindu Jayasinghe',  'Lab B', 1),
(3, 'to3@ruh.ac.lk', 'Sachini Peris',        'Lab C', 2),
(4, 'to4@ruh.ac.lk', 'Heshan Silva',         'Lab D', 3),
(5, 'to5@ruh.ac.lk', 'Lamal Fernando',       'Lab E', 2);


--7.course unit
INSERT INTO Course_Unit 
(Course_ID, Course_code, Credit, Type, Semester, Level, Dept_ID, Lecturer_ID)
VALUES
(1, 'ICT1222', 2, 'Practical', 2, 1, 1, 1),
(2, 'ICT1232', 2, 'Theory', 2, 1, 1, 2),
(3, 'ICT1242', 2, 'Practical', 2, 1, 1, 5),
(4, 'ICT1252', 2, 'Theory', 2, 1, 3, 4),
(5, 'ICT1261', 1, 'Practical', 2, 1, 2, 3);


--8. entrollment
INSERT INTO Enrollment 
(Entro_ID, Student_ID, Course_ID, Aced_Year, Semester, Status, Entro_Date)
VALUES
-- (10 proper students)
(1,  1, 1, 2024, 2, 'Active', '2024-03-01'),
(2,  1, 2, 2024, 2, 'Active', '2024-03-01'),
(3,  1, 3, 2024, 2, 'Active', '2024-03-01'),
(4,  1, 4, 2024, 2, 'Active', '2024-03-01'),
(5,  1, 5, 2024, 2, 'Active', '2024-03-01'), 

(6,  2, 1, 2024, 2, 'Active', '2024-03-01'),
(7,  2, 2, 2024, 2, 'Active', '2024-03-01'),
(8,  2, 3, 2024, 2, 'Active', '2024-03-01'),
(9,  2, 4, 2024, 2, 'Active', '2024-03-01'),
(10, 2, 5, 2024, 2, 'Active', '2024-03-01'),

(11, 3, 1, 2024, 2, 'Active', '2024-03-01'),
(12, 3, 2, 2024, 2, 'Active', '2024-03-01'),
(13, 3, 3, 2024, 2, 'Active', '2024-03-01'),
(14, 3, 4, 2024, 2, 'Active', '2024-03-01'),
(15, 3, 5, 2024, 2, 'Active', '2024-03-01'),

(16, 4, 1, 2024, 2, 'Active', '2024-03-01'),
(17, 4, 2, 2024, 2, 'Active', '2024-03-01'),
(18, 4, 3, 2024, 2, 'Active', '2024-03-01'),
(19, 4, 4, 2024, 2, 'Active', '2024-03-01'),
(20, 4, 5, 2024, 2, 'Active', '2024-03-01'),

(21, 5, 1, 2024, 2, 'Active', '2024-03-01'),
(22, 5, 2, 2024, 2, 'Active', '2024-03-01'),
(23, 5, 3, 2024, 2, 'Active', '2024-03-01'),
(24, 5, 4, 2024, 2, 'Active', '2024-03-01'),
(25, 5, 5, 2024, 2, 'Active', '2024-03-01'),

(26, 6, 1, 2024, 2, 'Active', '2024-03-01'),
(27, 6, 2, 2024, 2, 'Active', '2024-03-01'),
(28, 6, 3, 2024, 2, 'Active', '2024-03-01'),
(29, 6, 4, 2024, 2, 'Active', '2024-03-01'),
(30, 6, 5, 2024, 2, 'Active', '2024-03-01'),

(31, 7, 1, 2024, 2, 'Active', '2024-03-01'),
(32, 7, 2, 2024, 2, 'Active', '2024-03-01'),
(33, 7, 3, 2024, 2, 'Active', '2024-03-01'),
(34, 7, 4, 2024, 2, 'Active', '2024-03-01'),
(35, 7, 5, 2024, 2, 'Active', '2024-03-01'),

(36, 8, 1, 2024, 2, 'Active', '2024-03-01'),
(37, 8, 2, 2024, 2, 'Active', '2024-03-01'),
(38, 8, 3, 2024, 2, 'Active', '2024-03-01'),
(39, 8, 4, 2024, 2, 'Active', '2024-03-01'),
(40, 8, 5, 2024, 2, 'Active', '2024-03-01'),

(41, 9, 1, 2024, 2, 'Active', '2024-03-01'),
(42, 9, 2, 2024, 2, 'Active', '2024-03-01'),
(43, 9, 3, 2024, 2, 'Active', '2024-03-01'),
(44, 9, 4, 2024, 2, 'Active', '2024-03-01'),
(45, 9, 5, 2024, 2, 'Active', '2024-03-01'),

(46, 10, 1, 2024, 2, 'Active', '2024-03-01'),
(47, 10, 2, 2024, 2, 'Active', '2024-03-01'),
(48, 10, 3, 2024, 2, 'Active', '2024-03-01'),
(49, 10, 4, 2024, 2, 'Active', '2024-03-01'),
(50, 10, 5, 2024, 2, 'Active', '2024-03-01'),

-- (5 repeat students)
(51, 11, 1, 2024, 2, 'Active', '2024-03-01'),
(52, 11, 2, 2024, 2, 'Active', '2024-03-01'),
(53, 11, 3, 2024, 2, 'Active', '2024-03-01'),
(54, 11, 4, 2024, 2, 'Active', '2024-03-01'),
(55, 11, 5, 2024, 2, 'Active', '2024-03-01'),

(56, 12, 1, 2024, 2, 'Active', '2024-03-01'),
(57, 12, 2, 2024, 2, 'Active', '2024-03-01'),
(58, 12, 3, 2024, 2, 'Active', '2024-03-01'),
(59, 12, 4, 2024, 2, 'Active', '2024-03-01'),
(60, 12, 5, 2024, 2, 'Active', '2024-03-01'),

(61, 13, 1, 2024, 2, 'Active', '2024-03-01'),
(62, 13, 2, 2024, 2, 'Active', '2024-03-01'),
(63, 13, 3, 2024, 2, 'Active', '2024-03-01'),
(64, 13, 4, 2024, 2, 'Active', '2024-03-01'),
(65, 13, 5, 2024, 2, 'Active', '2024-03-01'),

(66, 14, 1, 2024, 2, 'Active', '2024-03-01'),
(67, 14, 2, 2024, 2, 'Active', '2024-03-01'),
(68, 14, 3, 2024, 2, 'Active', '2024-03-01'),
(69, 14, 4, 2024, 2, 'Active', '2024-03-01'),
(70, 14, 5, 2024, 2, 'Active', '2024-03-01'),

(71, 15, 1, 2024, 2, 'Active', '2024-03-01'),
(72, 15, 2, 2024, 2, 'Active', '2024-03-01'),
(73, 15, 3, 2024, 2, 'Active', '2024-03-01'),
(74, 15, 4, 2024, 2, 'Active', '2024-03-01'),
(75, 15, 5, 2024, 2, 'Active', '2024-03-01'),

--(1 suspended student)
(76, 16, 1, 2024, 2, 'Active', '2024-03-01'),
(77, 16, 2, 2024, 2, 'Active', '2024-03-01'),
(78, 16, 3, 2024, 2, 'Active', '2024-03-01'),
(79, 16, 4, 2024, 2, 'Active', '2024-03-01'),
(80, 16, 5, 2024, 2, 'Active', '2024-03-01');

--9. marks
INSERT INTO Marks 
(Marks_id, Exam_Date, Marks, Medi_Status, Student_ID, Course_ID, Asses_ID)
VALUES
--(student 1-10 proper students)
--(student 1,3 high marks)
-- student 1
-- Course 1 (Practical)
(1,  '2024-04-10', 78, 'Normal', 1, 1, 1),
(2,  '2024-04-15', 80, 'Normal', 1, 1, 2),
(3,  '2024-05-20', 75, 'Normal', 1, 1, 4),
(4,  '2024-07-10', 85, 'Normal', 1, 1, 6),
-- Course 2 (Theory)
(5,  '2024-04-10', 72, 'Normal', 1, 2, 1),
(6,  '2024-04-15', 68, 'Normal', 1, 2, 2),
(7,  '2024-05-20', 74, 'Normal', 1, 2, 3),
(8,  '2024-07-10', 80, 'Normal', 1, 2, 5),
-- Course 3 (practical)
(9,  '2024-04-10', 76, 'Normal', 1, 3, 1),
(10, '2024-04-15', 70, 'Normal', 1, 3, 2),
(12, '2024-05-25', 78, 'Normal', 1, 3, 4),
(14, '2024-07-15', 84, 'Normal', 1, 3, 6),
-- Course 4 (Theory)
(15, '2024-04-10', 65, 'Normal', 1, 4, 1),
(16, '2024-04-15', 70, 'Normal', 1, 4, 2),
(17, '2024-05-20', 68, 'Normal', 1, 4, 3),
(18, '2024-07-10', 75, 'Normal', 1, 4, 5),
-- Course 5 (Practical)
(19, '2024-04-10', 80, 'Normal', 1, 5, 1),
(20, '2024-04-15', 82, 'Normal', 1, 5, 2),
(21, '2024-05-20', 78, 'Normal', 1, 5, 4),
(22, '2024-07-10', 88, 'Normal', 1, 5, 6),

-- student 2
-- Course 1 (Practical)
(23, '2024-04-10', 60, 'Normal', 2, 1, 1),
(24, '2024-04-15', 55, 'Normal', 2, 1, 2),
(25, '2024-05-20', 65, 'Normal', 2, 1, 4),
(26, '2024-07-10', 70, 'Normal', 2, 1, 6),
-- Course 2 (Theory) - Medical on Mid Theory
(27, '2024-04-10', 58, 'Normal',  2, 2, 1),
(28, '2024-04-15', 60, 'Normal',  2, 2, 2),
(29, '2024-05-20', 0,  'Medical', 2, 2, 3),
(30, '2024-07-10', 65, 'Normal',  2, 2, 5),
-- Course 3 (practical)
(31, '2024-04-10', 62, 'Normal', 2, 3, 1),
(32, '2024-04-15', 58, 'Normal', 2, 3, 2),
(34, '2024-05-25', 65, 'Normal', 2, 3, 4),
(36, '2024-07-15', 70, 'Normal', 2, 3, 6),
-- Course 4 (Theory)
(37, '2024-04-10', 55, 'Normal', 2, 4, 1),
(38, '2024-04-15', 60, 'Normal', 2, 4, 2),
(39, '2024-05-20', 58, 'Normal', 2, 4, 3),
(40, '2024-07-10', 62, 'Normal', 2, 4, 5),
-- Course 5 (Practical)
(41, '2024-04-10', 65, 'Normal', 2, 5, 1),
(42, '2024-04-15', 60, 'Normal', 2, 5, 2),
(43, '2024-05-20', 62, 'Normal', 2, 5, 4),
(44, '2024-07-10', 68, 'Normal', 2, 5, 6),

-- student 3
-- Course 1 (Practical)
(45, '2024-04-10', 88, 'Normal', 3, 1, 1),
(46, '2024-04-15', 85, 'Normal', 3, 1, 2),
(47, '2024-05-20', 82, 'Normal', 3, 1, 4),
(48, '2024-07-10', 90, 'Normal', 3, 1, 6),
-- Course 2 (Theory)
(49, '2024-04-10', 80, 'Normal', 3, 2, 1),
(50, '2024-04-15', 82, 'Normal', 3, 2, 2),
(51, '2024-05-20', 78, 'Normal', 3, 2, 3),
(52, '2024-07-10', 85, 'Normal', 3, 2, 5),
-- Course 3 (practical)
(53, '2024-04-10', 84, 'Normal', 3, 3, 1),
(54, '2024-04-15', 86, 'Normal', 3, 3, 2),
(56, '2024-05-25', 82, 'Normal', 3, 3, 4),
(58, '2024-07-15', 90, 'Normal', 3, 3, 6),
-- Course 4 (Theory)
(59, '2024-04-10', 78, 'Normal', 3, 4, 1),
(60, '2024-04-15', 80, 'Normal', 3, 4, 2),
(61, '2024-05-20', 75, 'Normal', 3, 4, 3),
(62, '2024-07-10', 82, 'Normal', 3, 4, 5),
-- Course 5 (Practical)
(63, '2024-04-10', 85, 'Normal', 3, 5, 1),
(64, '2024-04-15', 88, 'Normal', 3, 5, 2),
(65, '2024-05-20', 82, 'Normal', 3, 5, 4),
(66, '2024-07-10', 90, 'Normal', 3, 5, 6),

-- student 4 (Average marks) 
-- Course 1 (Practical)
(67, '2024-04-10', 65, 'Normal', 4, 1, 1),
(68, '2024-04-15', 60, 'Normal', 4, 1, 2),
(69, '2024-05-20', 62, 'Normal', 4, 1, 4),
(70, '2024-07-10', 68, 'Normal', 4, 1, 6),
-- Course 2 (Theory)
(71, '2024-04-10', 58, 'Normal', 4, 2, 1),
(72, '2024-04-15', 62, 'Normal', 4, 2, 2),
(73, '2024-05-20', 60, 'Normal', 4, 2, 3),
(74, '2024-07-10', 65, 'Normal', 4, 2, 5),
-- Course 3 (practical)
(75, '2024-04-10', 60, 'Normal', 4, 3, 1),
(76, '2024-04-15', 58, 'Normal', 4, 3, 2),
(78, '2024-05-25', 65, 'Normal', 4, 3, 4),
(80, '2024-07-15', 70, 'Normal', 4, 3, 6),
-- Course 4 (Theory)
(81, '2024-04-10', 55, 'Normal', 4, 4, 1),
(82, '2024-04-15', 58, 'Normal', 4, 4, 2),
(83, '2024-05-20', 60, 'Normal', 4, 4, 3),
(84, '2024-07-10', 63, 'Normal', 4, 4, 5),
-- Course 5 (Practical)
(85, '2024-04-10', 62, 'Normal', 4, 5, 1),
(86, '2024-04-15', 65, 'Normal', 4, 5, 2),
(87, '2024-05-20', 60, 'Normal', 4, 5, 4),
(88, '2024-07-10', 66, 'Normal', 4, 5, 6),

-- STUDENT 5  (Low marks, below CA eligibility) 
-- Course 1 (Practical)
(89, '2024-04-10', 35, 'Normal', 5, 1, 1),
(90, '2024-04-15', 30, 'Normal', 5, 1, 2),
(91, '2024-05-20', 32, 'Normal', 5, 1, 4),
(92, '2024-07-10', 28, 'Normal', 5, 1, 6),
-- Course 2 (Theory)
(93, '2024-04-10', 38, 'Normal', 5, 2, 1),
(94, '2024-04-15', 32, 'Normal', 5, 2, 2),
(95, '2024-05-20', 30, 'Normal', 5, 2, 3),
(96, '2024-07-10', 35, 'Normal', 5, 2, 5),
-- Course 3 (practical)
(97,  '2024-04-10', 36, 'Normal', 5, 3, 1),
(98,  '2024-04-15', 30, 'Normal', 5, 3, 2),
(100, '2024-05-25', 34, 'Normal', 5, 3, 4),
(102, '2024-07-15', 30, 'Normal', 5, 3, 6),
-- Course 4 (Theory)
(103, '2024-04-10', 35, 'Normal', 5, 4, 1),
(104, '2024-04-15', 30, 'Normal', 5, 4, 2),
(105, '2024-05-20', 32, 'Normal', 5, 4, 3),
(106, '2024-07-10', 28, 'Normal', 5, 4, 5),
-- Course 5 (Practical)
(107, '2024-04-10', 36, 'Normal', 5, 5, 1),
(108, '2024-04-15', 30, 'Normal', 5, 5, 2),
(109, '2024-05-20', 32, 'Normal', 5, 5, 4),
(110, '2024-07-10', 28, 'Normal', 5, 5, 6),

--  STUDENT 6 (Proper - Good marks) 
-- Course 1 (Practical)
(111, '2024-04-10', 70, 'Normal', 6, 1, 1),
(112, '2024-04-15', 72, 'Normal', 6, 1, 2),
(113, '2024-05-20', 68, 'Normal', 6, 1, 4),
(114, '2024-07-10', 75, 'Normal', 6, 1, 6),
-- Course 2 (Theory)
(115, '2024-04-10', 65, 'Normal', 6, 2, 1),
(116, '2024-04-15', 68, 'Normal', 6, 2, 2),
(117, '2024-05-20', 70, 'Normal', 6, 2, 3),
(118, '2024-07-10', 72, 'Normal', 6, 2, 5),
-- Course 3 (practical)
(119, '2024-04-10', 68, 'Normal', 6, 3, 1),
(120, '2024-04-15', 70, 'Normal', 6, 3, 2),
(122, '2024-05-25', 72, 'Normal', 6, 3, 4),
(124, '2024-07-15', 76, 'Normal', 6, 3, 6),
-- Course 4 (Theory)
(125, '2024-04-10', 62, 'Normal', 6, 4, 1),
(126, '2024-04-15', 65, 'Normal', 6, 4, 2),
(127, '2024-05-20', 68, 'Normal', 6, 4, 3),
(128, '2024-07-10', 70, 'Normal', 6, 4, 5),
-- Course 5 (Practical)
(129, '2024-04-10', 72, 'Normal', 6, 5, 1),
(130, '2024-04-15', 70, 'Normal', 6, 5, 2),
(131, '2024-05-20', 68, 'Normal', 6, 5, 4),
(132, '2024-07-10', 74, 'Normal', 6, 5, 6),

--  STUDENT 7 (Proper - Medical on Final) 
-- Course 1 (Practical)
(133, '2024-04-10', 72, 'Normal',  7, 1, 1),
(134, '2024-04-15', 70, 'Normal',  7, 1, 2),
(135, '2024-05-20', 68, 'Normal',  7, 1, 4),
(136, '2024-07-10', 0,  'Medical', 7, 1, 6),
-- Course 2 (Theory)
(137, '2024-04-10', 65, 'Normal', 7, 2, 1),
(138, '2024-04-15', 68, 'Normal', 7, 2, 2),
(139, '2024-05-20', 62, 'Normal', 7, 2, 3),
(140, '2024-07-10', 70, 'Normal', 7, 2, 5),
-- Course 3 (practical)
(141, '2024-04-10', 70, 'Normal', 7, 3, 1),
(142, '2024-04-15', 68, 'Normal', 7, 3, 2),
(144, '2024-05-25', 70, 'Normal', 7, 3, 4),
(146, '2024-07-15', 74, 'Normal', 7, 3, 6),
-- Course 4 (Theory)
(147, '2024-04-10', 60, 'Normal', 7, 4, 1),
(148, '2024-04-15', 62, 'Normal', 7, 4, 2),
(149, '2024-05-20', 65, 'Normal', 7, 4, 3),
(150, '2024-07-10', 68, 'Normal', 7, 4, 5),
-- Course 5 (Practical)
(151, '2024-04-10', 70, 'Normal', 7, 5, 1),
(152, '2024-04-15', 68, 'Normal', 7, 5, 2),
(153, '2024-05-20', 65, 'Normal', 7, 5, 4),
(154, '2024-07-10', 72, 'Normal', 7, 5, 6),

-- STUDENT 8 (Proper) 
-- Course 1 (Practical)
(155, '2024-04-10', 74, 'Normal', 8, 1, 1),
(156, '2024-04-15', 72, 'Normal', 8, 1, 2),
(157, '2024-05-20', 70, 'Normal', 8, 1, 4),
(158, '2024-07-10', 78, 'Normal', 8, 1, 6),
-- Course 2 (Theory)
(159, '2024-04-10', 68, 'Normal', 8, 2, 1),
(160, '2024-04-15', 70, 'Normal', 8, 2, 2),
(161, '2024-05-20', 65, 'Normal', 8, 2, 3),
(162, '2024-07-10', 72, 'Normal', 8, 2, 5),
-- Course 3 (practical)
(163, '2024-04-10', 70, 'Normal', 8, 3, 1),
(164, '2024-04-15', 72, 'Normal', 8, 3, 2),
(166, '2024-05-25', 70, 'Normal', 8, 3, 4),
(168, '2024-07-15', 76, 'Normal', 8, 3, 6),
-- Course 4 (Theory)
(169, '2024-04-10', 65, 'Normal', 8, 4, 1),
(170, '2024-04-15', 68, 'Normal', 8, 4, 2),
(171, '2024-05-20', 62, 'Normal', 8, 4, 3),
(172, '2024-07-10', 70, 'Normal', 8, 4, 5),
-- Course 5 (Practical)
(173, '2024-04-10', 72, 'Normal', 8, 5, 1),
(174, '2024-04-15', 70, 'Normal', 8, 5, 2),
(175, '2024-05-20', 68, 'Normal', 8, 5, 4),
(176, '2024-07-10', 74, 'Normal', 8, 5, 6),

-- STUDENT 9 (Proper) 
-- Course 1 (Practical)
(177, '2024-04-10', 76, 'Normal', 9, 1, 1),
(178, '2024-04-15', 74, 'Normal', 9, 1, 2),
(179, '2024-05-20', 72, 'Normal', 9, 1, 4),
(180, '2024-07-10', 80, 'Normal', 9, 1, 6),
-- Course 2 (Theory)
(181, '2024-04-10', 70, 'Normal', 9, 2, 1),
(182, '2024-04-15', 72, 'Normal', 9, 2, 2),
(183, '2024-05-20', 68, 'Normal', 9, 2, 3),
(184, '2024-07-10', 74, 'Normal', 9, 2, 5),
-- Course 3 (practical)
(185, '2024-04-10', 72, 'Normal', 9, 3, 1),
(186, '2024-04-15', 74, 'Normal', 9, 3, 2),
(188, '2024-05-25', 72, 'Normal', 9, 3, 4),
(190, '2024-07-15', 78, 'Normal', 9, 3, 6),
-- Course 4 (Theory)
(191, '2024-04-10', 68, 'Normal', 9, 4, 1),
(192, '2024-04-15', 70, 'Normal', 9, 4, 2),
(193, '2024-05-20', 65, 'Normal', 9, 4, 3),
(194, '2024-07-10', 72, 'Normal', 9, 4, 5),
-- Course 5 (Practical)
(195, '2024-04-10', 74, 'Normal', 9, 5, 1),
(196, '2024-04-15', 72, 'Normal', 9, 5, 2),
(197, '2024-05-20', 70, 'Normal', 9, 5, 4),
(198, '2024-07-10', 76, 'Normal', 9, 5, 6),

-- STUDENT 10 (Proper) 
-- Course 1 (Practical)
(199, '2024-04-10', 78, 'Normal', 10, 1, 1),
(200, '2024-04-15', 76, 'Normal', 10, 1, 2),
(201, '2024-05-20', 74, 'Normal', 10, 1, 4),
(202, '2024-07-10', 82, 'Normal', 10, 1, 6),
-- Course 2 (Theory)
(203, '2024-04-10', 72, 'Normal', 10, 2, 1),
(204, '2024-04-15', 74, 'Normal', 10, 2, 2),
(205, '2024-05-20', 70, 'Normal', 10, 2, 3),
(206, '2024-07-10', 76, 'Normal', 10, 2, 5),
-- Course 3 (practical)
(207, '2024-04-10', 74, 'Normal', 10, 3, 1),
(208, '2024-04-15', 76, 'Normal', 10, 3, 2),
(210, '2024-05-25', 74, 'Normal', 10, 3, 4),
(212, '2024-07-15', 80, 'Normal', 10, 3, 6),
-- Course 4 (Theory)
(213, '2024-04-10', 70, 'Normal', 10, 4, 1),
(214, '2024-04-15', 72, 'Normal', 10, 4, 2),
(215, '2024-05-20', 68, 'Normal', 10, 4, 3),
(216, '2024-07-10', 74, 'Normal', 10, 4, 5),
-- Course 5 (Practical)
(217, '2024-04-10', 76, 'Normal', 10, 5, 1),
(218, '2024-04-15', 74, 'Normal', 10, 5, 2),
(219, '2024-05-20', 72, 'Normal', 10, 5, 4),
(220, '2024-07-10', 78, 'Normal', 10, 5, 6),

-- STUDENTS 11-15 (Repeat - Max Grade C, marks capped ~45-49) 
-- Student 11 (Repeat)
(221, '2024-04-10', 45, 'Normal', 11, 1, 1),
(222, '2024-04-15', 47, 'Normal', 11, 1, 2),
(223, '2024-05-20', 46, 'Normal', 11, 1, 4),
(224, '2024-07-10', 48, 'Normal', 11, 1, 6),
(225, '2024-04-10', 44, 'Normal', 11, 2, 1),
(226, '2024-04-15', 46, 'Normal', 11, 2, 2),
(227, '2024-05-20', 45, 'Normal', 11, 2, 3),
(228, '2024-07-10', 47, 'Normal', 11, 2, 5),
(229, '2024-04-10', 45, 'Normal', 11, 3, 1),
(230, '2024-04-15', 46, 'Normal', 11, 3, 2),
(231, '2024-05-20', 44, 'Normal', 11, 3, 3),
(232, '2024-05-25', 47, 'Normal', 11, 3, 4),
(233, '2024-07-10', 48, 'Normal', 11, 3, 5),
(234, '2024-07-15', 46, 'Normal', 11, 3, 6),
(235, '2024-04-10', 44, 'Normal', 11, 4, 1),
(236, '2024-04-15', 46, 'Normal', 11, 4, 2),
(237, '2024-05-20', 45, 'Normal', 11, 4, 3),
(238, '2024-07-10', 47, 'Normal', 11, 4, 5),
(239, '2024-04-10', 45, 'Normal', 11, 5, 1),
(240, '2024-04-15', 47, 'Normal', 11, 5, 2),
(241, '2024-05-20', 46, 'Normal', 11, 5, 4),
(242, '2024-07-10', 48, 'Normal', 11, 5, 6),

-- Student 12 (Repeat)
(243, '2024-04-10', 46, 'Normal', 12, 1, 1),
(244, '2024-04-15', 48, 'Normal', 12, 1, 2),
(245, '2024-05-20', 45, 'Normal', 12, 1, 4),
(246, '2024-07-10', 47, 'Normal', 12, 1, 6),
(247, '2024-04-10', 45, 'Normal', 12, 2, 1),
(248, '2024-04-15', 47, 'Normal', 12, 2, 2),
(249, '2024-05-20', 46, 'Normal', 12, 2, 3),
(250, '2024-07-10', 48, 'Normal', 12, 2, 5),
(251, '2024-04-10', 46, 'Normal', 12, 3, 1),
(252, '2024-04-15', 45, 'Normal', 12, 3, 2),
(253, '2024-05-20', 47, 'Normal', 12, 3, 3),
(254, '2024-05-25', 48, 'Normal', 12, 3, 4),
(255, '2024-07-10', 45, 'Normal', 12, 3, 5),
(256, '2024-07-15', 47, 'Normal', 12, 3, 6),
(257, '2024-04-10', 45, 'Normal', 12, 4, 1),
(258, '2024-04-15', 47, 'Normal', 12, 4, 2),
(259, '2024-05-20', 46, 'Normal', 12, 4, 3),
(260, '2024-07-10', 48, 'Normal', 12, 4, 5),
(261, '2024-04-10', 46, 'Normal', 12, 5, 1),
(262, '2024-04-15', 48, 'Normal', 12, 5, 2),
(263, '2024-05-20', 45, 'Normal', 12, 5, 4),
(264, '2024-07-10', 47, 'Normal', 12, 5, 6),

-- Student 13 (Repeat)
(265, '2024-04-10', 47, 'Normal', 13, 1, 1),
(266, '2024-04-15', 45, 'Normal', 13, 1, 2),
(267, '2024-05-20', 48, 'Normal', 13, 1, 4),
(268, '2024-07-10', 46, 'Normal', 13, 1, 6),
(269, '2024-04-10', 46, 'Normal', 13, 2, 1),
(270, '2024-04-15', 48, 'Normal', 13, 2, 2),
(271, '2024-05-20', 45, 'Normal', 13, 2, 3),
(272, '2024-07-10', 47, 'Normal', 13, 2, 5),
(273, '2024-04-10', 47, 'Normal', 13, 3, 1),
(274, '2024-04-15', 46, 'Normal', 13, 3, 2),
(275, '2024-05-20', 48, 'Normal', 13, 3, 3),
(276, '2024-05-25', 45, 'Normal', 13, 3, 4),
(277, '2024-07-10', 47, 'Normal', 13, 3, 5),
(278, '2024-07-15', 46, 'Normal', 13, 3, 6),
(279, '2024-04-10', 46, 'Normal', 13, 4, 1),
(280, '2024-04-15', 48, 'Normal', 13, 4, 2),
(281, '2024-05-20', 45, 'Normal', 13, 4, 3),
(282, '2024-07-10', 47, 'Normal', 13, 4, 5),
(283, '2024-04-10', 47, 'Normal', 13, 5, 1),
(284, '2024-04-15', 45, 'Normal', 13, 5, 2),
(285, '2024-05-20', 48, 'Normal', 13, 5, 4),
(286, '2024-07-10', 46, 'Normal', 13, 5, 6),

-- Student 14 (Repeat)
(287, '2024-04-10', 45, 'Normal', 14, 1, 1),
(288, '2024-04-15', 46, 'Normal', 14, 1, 2),
(289, '2024-05-20', 47, 'Normal', 14, 1, 4),
(290, '2024-07-10', 48, 'Normal', 14, 1, 6),
(291, '2024-04-10', 46, 'Normal', 14, 2, 1),
(292, '2024-04-15', 45, 'Normal', 14, 2, 2),
(293, '2024-05-20', 47, 'Normal', 14, 2, 3),
(294, '2024-07-10', 48, 'Normal', 14, 2, 5),
(295, '2024-04-10', 45, 'Normal', 14, 3, 1),
(296, '2024-04-15', 47, 'Normal', 14, 3, 2),
(297, '2024-05-20', 46, 'Normal', 14, 3, 3),
(298, '2024-05-25', 48, 'Normal', 14, 3, 4),
(299, '2024-07-10', 45, 'Normal', 14, 3, 5),
(300, '2024-07-15', 47, 'Normal', 14, 3, 6),
(301, '2024-04-10', 46, 'Normal', 14, 4, 1),
(302, '2024-04-15', 45, 'Normal', 14, 4, 2),
(303, '2024-05-20', 47, 'Normal', 14, 4, 3),
(304, '2024-07-10', 48, 'Normal', 14, 4, 5),
(305, '2024-04-10', 45, 'Normal', 14, 5, 1),
(306, '2024-04-15', 47, 'Normal', 14, 5, 2),
(307, '2024-05-20', 46, 'Normal', 14, 5, 4),
(308, '2024-07-10', 48, 'Normal', 14, 5, 6),

-- Student 15 (Repeat)
(309, '2024-04-10', 46, 'Normal', 15, 1, 1),
(310, '2024-04-15', 48, 'Normal', 15, 1, 2),
(311, '2024-05-20', 45, 'Normal', 15, 1, 4),
(312, '2024-07-10', 47, 'Normal', 15, 1, 6),
(313, '2024-04-10', 45, 'Normal', 15, 2, 1),
(314, '2024-04-15', 47, 'Normal', 15, 2, 2),
(315, '2024-05-20', 46, 'Normal', 15, 2, 3),
(316, '2024-07-10', 48, 'Normal', 15, 2, 5),
(317, '2024-04-10', 46, 'Normal', 15, 3, 1),
(318, '2024-04-15', 45, 'Normal', 15, 3, 2),
(319, '2024-05-20', 47, 'Normal', 15, 3, 3),
(320, '2024-05-25', 48, 'Normal', 15, 3, 4),
(321, '2024-07-10', 46, 'Normal', 15, 3, 5),
(322, '2024-07-15', 45, 'Normal', 15, 3, 6),
(323, '2024-04-10', 47, 'Normal', 15, 4, 1),
(324, '2024-04-15', 45, 'Normal', 15, 4, 2),
(325, '2024-05-20', 46, 'Normal', 15, 4, 3),
(326, '2024-07-10', 48, 'Normal', 15, 4, 5),
(327, '2024-04-10', 46, 'Normal', 15, 5, 1),
(328, '2024-04-15', 48, 'Normal', 15, 5, 2),
(329, '2024-05-20', 45, 'Normal', 15, 5, 4),
(330, '2024-07-10', 47, 'Normal', 15, 5, 6),

--  STUDENT 16 (Suspended - insert marks, display as WH via trigger/view) 
(331, '2024-04-10', 80, 'Normal', 16, 1, 1),
(332, '2024-04-15', 82, 'Normal', 16, 1, 2),
(333, '2024-05-20', 78, 'Normal', 16, 1, 4),
(334, '2024-07-10', 85, 'Normal', 16, 1, 6),
(335, '2024-04-10', 75, 'Normal', 16, 2, 1),
(336, '2024-04-15', 78, 'Normal', 16, 2, 2),
(337, '2024-05-20', 72, 'Normal', 16, 2, 3),
(338, '2024-07-10', 80, 'Normal', 16, 2, 5),
(339, '2024-04-10', 78, 'Normal', 16, 3, 1),
(340, '2024-04-15', 80, 'Normal', 16, 3, 2),
(341, '2024-05-20', 75, 'Normal', 16, 3, 3),
(342, '2024-05-25', 78, 'Normal', 16, 3, 4),
(343, '2024-07-10', 82, 'Normal', 16, 3, 5),
(344, '2024-07-15', 84, 'Normal', 16, 3, 6),
(345, '2024-04-10', 72, 'Normal', 16, 4, 1),
(346, '2024-04-15', 75, 'Normal', 16, 4, 2),
(347, '2024-05-20', 70, 'Normal', 16, 4, 3),
(348, '2024-07-10', 78, 'Normal', 16, 4, 5),
(349, '2024-04-10', 80, 'Normal', 16, 5, 1),
(350, '2024-04-15', 82, 'Normal', 16, 5, 2),
(351, '2024-05-20', 78, 'Normal', 16, 5, 4),
(352, '2024-07-10', 85, 'Normal', 16, 5, 6);

--11. attendance
INSERT INTO Attendance 
(Atten_ID, session, Status, Date, Result, Student_ID, Course_ID, To_id)
VALUES

-- CATEGORY 1: >=80% attendance (NO medical)
-- Student 1 - Course 1 - 13/15 Present = 86% - ELIGIBLE
(1,  'Practical', 'Present', '2024-03-04', 'Eligible', 1, 1, 1),
(2,  'Practical', 'Present', '2024-03-11', 'Eligible', 1, 1, 1),
(3,  'Practical', 'Present', '2024-03-18', 'Eligible', 1, 1, 1),
(4,  'Practical', 'Present', '2024-03-25', 'Eligible', 1, 1, 1),
(5,  'Practical', 'Present', '2024-04-01', 'Eligible', 1, 1, 1),
(6,  'Practical', 'Present', '2024-04-08', 'Eligible', 1, 1, 1),
(7,  'Practical', 'Present', '2024-04-15', 'Eligible', 1, 1, 1),
(8,  'Practical', 'Present', '2024-04-22', 'Eligible', 1, 1, 1),
(9,  'Practical', 'Present', '2024-04-29', 'Eligible', 1, 1, 1),
(10, 'Practical', 'Present', '2024-05-06', 'Eligible', 1, 1, 1),
(11, 'Practical', 'Present', '2024-05-13', 'Eligible', 1, 1, 1),
(12, 'Practical', 'Present', '2024-05-20', 'Eligible', 1, 1, 1),
(13, 'Practical', 'Present', '2024-05-27', 'Eligible', 1, 1, 1),
(14, 'Practical', 'Absent',  '2024-06-03', 'Eligible', 1, 1, 1),
(15, 'Practical', 'Absent',  '2024-06-10', 'Eligible', 1, 1, 1),

-- Student 3 - Course 2 - 13/15 Present = 86% - ELIGIBLE
(16, 'Theory', 'Present', '2024-03-04', 'Eligible', 3, 2, 2),
(17, 'Theory', 'Present', '2024-03-11', 'Eligible', 3, 2, 2),
(18, 'Theory', 'Present', '2024-03-18', 'Eligible', 3, 2, 2),
(19, 'Theory', 'Present', '2024-03-25', 'Eligible', 3, 2, 2),
(20, 'Theory', 'Present', '2024-04-01', 'Eligible', 3, 2, 2),
(21, 'Theory', 'Present', '2024-04-08', 'Eligible', 3, 2, 2),
(22, 'Theory', 'Present', '2024-04-15', 'Eligible', 3, 2, 2),
(23, 'Theory', 'Present', '2024-04-22', 'Eligible', 3, 2, 2),
(24, 'Theory', 'Present', '2024-04-29', 'Eligible', 3, 2, 2),
(25, 'Theory', 'Present', '2024-05-06', 'Eligible', 3, 2, 2),
(26, 'Theory', 'Present', '2024-05-13', 'Eligible', 3, 2, 2),
(27, 'Theory', 'Present', '2024-05-20', 'Eligible', 3, 2, 2),
(28, 'Theory', 'Present', '2024-05-27', 'Eligible', 3, 2, 2),
(29, 'Theory', 'Absent',  '2024-06-03', 'Eligible', 3, 2, 2),
(30, 'Theory', 'Absent',  '2024-06-10', 'Eligible', 3, 2, 2),

-- CATEGORY 2: <80% attendance (NO medical)
-- Student 5 - Course 1 - 9/15 Present = 60% - NOT ELIGIBLE
(31, 'Practical', 'Present', '2024-03-04', 'Not Eligible', 5, 1, 1),
(32, 'Practical', 'Present', '2024-03-11', 'Not Eligible', 5, 1, 1),
(33, 'Practical', 'Present', '2024-03-18', 'Not Eligible', 5, 1, 1),
(34, 'Practical', 'Absent',  '2024-03-25', 'Not Eligible', 5, 1, 1),
(35, 'Practical', 'Absent',  '2024-04-01', 'Not Eligible', 5, 1, 1),
(36, 'Practical', 'Present', '2024-04-08', 'Not Eligible', 5, 1, 1),
(37, 'Practical', 'Absent',  '2024-04-15', 'Not Eligible', 5, 1, 1),
(38, 'Practical', 'Present', '2024-04-22', 'Not Eligible', 5, 1, 1),
(39, 'Practical', 'Absent',  '2024-04-29', 'Not Eligible', 5, 1, 1),
(40, 'Practical', 'Present', '2024-05-06', 'Not Eligible', 5, 1, 1),
(41, 'Practical', 'Absent',  '2024-05-13', 'Not Eligible', 5, 1, 1),
(42, 'Practical', 'Present', '2024-05-20', 'Not Eligible', 5, 1, 1),
(43, 'Practical', 'Absent',  '2024-05-27', 'Not Eligible', 5, 1, 1),
(44, 'Practical', 'Present', '2024-06-03', 'Not Eligible', 5, 1, 1),
(45, 'Practical', 'Absent',  '2024-06-10', 'Not Eligible', 5, 1, 1),

-- Student 4 - Course 2 - 8/15 Present = 53% - NOT ELIGIBLE
(46, 'Theory', 'Present', '2024-03-04', 'Not Eligible', 4, 2, 2),
(47, 'Theory', 'Absent',  '2024-03-11', 'Not Eligible', 4, 2, 2),
(48, 'Theory', 'Present', '2024-03-18', 'Not Eligible', 4, 2, 2),
(49, 'Theory', 'Absent',  '2024-03-25', 'Not Eligible', 4, 2, 2),
(50, 'Theory', 'Absent',  '2024-04-01', 'Not Eligible', 4, 2, 2),
(51, 'Theory', 'Present', '2024-04-08', 'Not Eligible', 4, 2, 2),
(52, 'Theory', 'Absent',  '2024-04-15', 'Not Eligible', 4, 2, 2),
(53, 'Theory', 'Present', '2024-04-22', 'Not Eligible', 4, 2, 2),
(54, 'Theory', 'Absent',  '2024-04-29', 'Not Eligible', 4, 2, 2),
(55, 'Theory', 'Present', '2024-05-06', 'Not Eligible', 4, 2, 2),
(56, 'Theory', 'Absent',  '2024-05-13', 'Not Eligible', 4, 2, 2),
(57, 'Theory', 'Present', '2024-05-20', 'Not Eligible', 4, 2, 2),
(58, 'Theory', 'Absent',  '2024-05-27', 'Not Eligible', 4, 2, 2),
(59, 'Theory', 'Present', '2024-06-03', 'Not Eligible', 4, 2, 2),
(60, 'Theory', 'Absent',  '2024-06-10', 'Not Eligible', 4, 2, 2),

-- CATEGORY 3: With Medical, reaches >=80% - ELIGIBLE
-- Student 2 - Course 2 - 10 Present + 3 Medical = 13/15 = 86% - ELIGIBLE
(61, 'Theory', 'Present', '2024-03-04', 'Eligible', 2, 2, 2),
(62, 'Theory', 'Present', '2024-03-11', 'Eligible', 2, 2, 2),
(63, 'Theory', 'Present', '2024-03-18', 'Eligible', 2, 2, 2),
(64, 'Theory', 'Present', '2024-03-25', 'Eligible', 2, 2, 2),
(65, 'Theory', 'Medical', '2024-04-01', 'Eligible', 2, 2, 2),
(66, 'Theory', 'Medical', '2024-04-08', 'Eligible', 2, 2, 2),
(67, 'Theory', 'Medical', '2024-04-15', 'Eligible', 2, 2, 2),
(68, 'Theory', 'Present', '2024-04-22', 'Eligible', 2, 2, 2),
(69, 'Theory', 'Present', '2024-04-29', 'Eligible', 2, 2, 2),
(70, 'Theory', 'Present', '2024-05-06', 'Eligible', 2, 2, 2),
(71, 'Theory', 'Present', '2024-05-13', 'Eligible', 2, 2, 2),
(72, 'Theory', 'Present', '2024-05-20', 'Eligible', 2, 2, 2),
(73, 'Theory', 'Present', '2024-05-27', 'Eligible', 2, 2, 2),
(74, 'Theory', 'Present', '2024-06-03', 'Eligible', 2, 2, 2),
(75, 'Theory', 'Present', '2024-06-10', 'Eligible', 2, 2, 2),

-- CATEGORY 4: With Medical, still <80% - NOT ELIGIBLE
-- Student 6 - Course 2 - 7 Present + 2 Medical = 9/15 = 60% - NOT ELIGIBLE
(76, 'Theory', 'Present', '2024-03-04', 'Not Eligible', 6, 2, 2),
(77, 'Theory', 'Absent',  '2024-03-11', 'Not Eligible', 6, 2, 2),
(78, 'Theory', 'Present', '2024-03-18', 'Not Eligible', 6, 2, 2),
(79, 'Theory', 'Absent',  '2024-03-25', 'Not Eligible', 6, 2, 2),
(80, 'Theory', 'Medical', '2024-04-01', 'Not Eligible', 6, 2, 2),
(81, 'Theory', 'Absent',  '2024-04-08', 'Not Eligible', 6, 2, 2),
(82, 'Theory', 'Medical', '2024-04-15', 'Not Eligible', 6, 2, 2),
(83, 'Theory', 'Absent',  '2024-04-22', 'Not Eligible', 6, 2, 2),
(84, 'Theory', 'Present', '2024-04-29', 'Not Eligible', 6, 2, 2),
(85, 'Theory', 'Absent',  '2024-05-06', 'Not Eligible', 6, 2, 2),
(86, 'Theory', 'Present', '2024-05-13', 'Not Eligible', 6, 2, 2),
(87, 'Theory', 'Absent',  '2024-05-20', 'Not Eligible', 6, 2, 2),
(88, 'Theory', 'Present', '2024-05-27', 'Not Eligible', 6, 2, 2),
(89, 'Theory', 'Present', '2024-06-03', 'Not Eligible', 6, 2, 2),
(90, 'Theory', 'Absent',  '2024-06-10', 'Not Eligible', 6, 2, 2),

-- REMAINING STUDENTS (eligible attendance)
-- Students 6,7,8,9,10,11-15,16 - Course 1

-- Student 6 - Course 1 (13/15 Present)
(91,  'Practical', 'Present', '2024-03-04', 'Eligible', 6, 1, 1),
(92,  'Practical', 'Present', '2024-03-11', 'Eligible', 6, 1, 1),
(93,  'Practical', 'Present', '2024-03-18', 'Eligible', 6, 1, 1),
(94,  'Practical', 'Present', '2024-03-25', 'Eligible', 6, 1, 1),
(95,  'Practical', 'Present', '2024-04-01', 'Eligible', 6, 1, 1),
(96,  'Practical', 'Present', '2024-04-08', 'Eligible', 6, 1, 1),
(97,  'Practical', 'Present', '2024-04-15', 'Eligible', 6, 1, 1),
(98,  'Practical', 'Present', '2024-04-22', 'Eligible', 6, 1, 1),
(99,  'Practical', 'Present', '2024-04-29', 'Eligible', 6, 1, 1),
(100, 'Practical', 'Present', '2024-05-06', 'Eligible', 6, 1, 1),
(101, 'Practical', 'Present', '2024-05-13', 'Eligible', 6, 1, 1),
(102, 'Practical', 'Present', '2024-05-20', 'Eligible', 6, 1, 1),
(103, 'Practical', 'Present', '2024-05-27', 'Eligible', 6, 1, 1),
(104, 'Practical', 'Absent',  '2024-06-03', 'Eligible', 6, 1, 1),
(105, 'Practical', 'Absent',  '2024-06-10', 'Eligible', 6, 1, 1),

-- Student 7 - Course 1 (12/15 Present = exactly 80%)
(106, 'Practical', 'Present', '2024-03-04', 'Eligible', 7, 1, 1),
(107, 'Practical', 'Present', '2024-03-11', 'Eligible', 7, 1, 1),
(108, 'Practical', 'Present', '2024-03-18', 'Eligible', 7, 1, 1),
(109, 'Practical', 'Present', '2024-03-25', 'Eligible', 7, 1, 1),
(110, 'Practical', 'Present', '2024-04-01', 'Eligible', 7, 1, 1),
(111, 'Practical', 'Present', '2024-04-08', 'Eligible', 7, 1, 1),
(112, 'Practical', 'Present', '2024-04-15', 'Eligible', 7, 1, 1),
(113, 'Practical', 'Present', '2024-04-22', 'Eligible', 7, 1, 1),
(114, 'Practical', 'Present', '2024-04-29', 'Eligible', 7, 1, 1),
(115, 'Practical', 'Present', '2024-05-06', 'Eligible', 7, 1, 1),
(116, 'Practical', 'Present', '2024-05-13', 'Eligible', 7, 1, 1),
(117, 'Practical', 'Present', '2024-05-20', 'Eligible', 7, 1, 1),
(118, 'Practical', 'Absent',  '2024-05-27', 'Eligible', 7, 1, 1),
(119, 'Practical', 'Absent',  '2024-06-03', 'Eligible', 7, 1, 1),
(120, 'Practical', 'Absent',  '2024-06-10', 'Eligible', 7, 1, 1),

-- Student 8 - Course 1 (13/15 Present)
(121, 'Practical', 'Present', '2024-03-04', 'Eligible', 8, 1, 1),
(122, 'Practical', 'Present', '2024-03-11', 'Eligible', 8, 1, 1),
(123, 'Practical', 'Present', '2024-03-18', 'Eligible', 8, 1, 1),
(124, 'Practical', 'Present', '2024-03-25', 'Eligible', 8, 1, 1),
(125, 'Practical', 'Present', '2024-04-01', 'Eligible', 8, 1, 1),
(126, 'Practical', 'Present', '2024-04-08', 'Eligible', 8, 1, 1),
(127, 'Practical', 'Present', '2024-04-15', 'Eligible', 8, 1, 1),
(128, 'Practical', 'Present', '2024-04-22', 'Eligible', 8, 1, 1),
(129, 'Practical', 'Present', '2024-04-29', 'Eligible', 8, 1, 1),
(130, 'Practical', 'Present', '2024-05-06', 'Eligible', 8, 1, 1),
(131, 'Practical', 'Present', '2024-05-13', 'Eligible', 8, 1, 1),
(132, 'Practical', 'Present', '2024-05-20', 'Eligible', 8, 1, 1),
(133, 'Practical', 'Present', '2024-05-27', 'Eligible', 8, 1, 1),
(134, 'Practical', 'Absent',  '2024-06-03', 'Eligible', 8, 1, 1),
(135, 'Practical', 'Absent',  '2024-06-10', 'Eligible', 8, 1, 1),

-- Student 9 - Course 1 (14/15 Present)
(136, 'Practical', 'Present', '2024-03-04', 'Eligible', 9, 1, 1),
(137, 'Practical', 'Present', '2024-03-11', 'Eligible', 9, 1, 1),
(138, 'Practical', 'Present', '2024-03-18', 'Eligible', 9, 1, 1),
(139, 'Practical', 'Present', '2024-03-25', 'Eligible', 9, 1, 1),
(140, 'Practical', 'Present', '2024-04-01', 'Eligible', 9, 1, 1),
(141, 'Practical', 'Present', '2024-04-08', 'Eligible', 9, 1, 1),
(142, 'Practical', 'Present', '2024-04-15', 'Eligible', 9, 1, 1),
(143, 'Practical', 'Present', '2024-04-22', 'Eligible', 9, 1, 1),
(144, 'Practical', 'Present', '2024-04-29', 'Eligible', 9, 1, 1),
(145, 'Practical', 'Present', '2024-05-06', 'Eligible', 9, 1, 1),
(146, 'Practical', 'Present', '2024-05-13', 'Eligible', 9, 1, 1),
(147, 'Practical', 'Present', '2024-05-20', 'Eligible', 9, 1, 1),
(148, 'Practical', 'Present', '2024-05-27', 'Eligible', 9, 1, 1),
(149, 'Practical', 'Present', '2024-06-03', 'Eligible', 9, 1, 1),
(150, 'Practical', 'Absent',  '2024-06-10', 'Eligible', 9, 1, 1),

-- Student 10 - Course 1 (14/15 Present)
(151, 'Practical', 'Present', '2024-03-04', 'Eligible', 10, 1, 1),
(152, 'Practical', 'Present', '2024-03-11', 'Eligible', 10, 1, 1),
(153, 'Practical', 'Present', '2024-03-18', 'Eligible', 10, 1, 1),
(154, 'Practical', 'Present', '2024-03-25', 'Eligible', 10, 1, 1),
(155, 'Practical', 'Present', '2024-04-01', 'Eligible', 10, 1, 1),
(156, 'Practical', 'Present', '2024-04-08', 'Eligible', 10, 1, 1),
(157, 'Practical', 'Present', '2024-04-15', 'Eligible', 10, 1, 1),
(158, 'Practical', 'Present', '2024-04-22', 'Eligible', 10, 1, 1),
(159, 'Practical', 'Present', '2024-04-29', 'Eligible', 10, 1, 1),
(160, 'Practical', 'Present', '2024-05-06', 'Eligible', 10, 1, 1),
(161, 'Practical', 'Present', '2024-05-13', 'Eligible', 10, 1, 1),
(162, 'Practical', 'Present', '2024-05-20', 'Eligible', 10, 1, 1),
(163, 'Practical', 'Present', '2024-05-27', 'Eligible', 10, 1, 1),
(164, 'Practical', 'Present', '2024-06-03', 'Eligible', 10, 1, 1),
(165, 'Practical', 'Absent',  '2024-06-10', 'Eligible', 10, 1, 1),

-- Student 11 - Course 1 (13/15 Present)
(166, 'Practical', 'Present', '2024-03-04', 'Eligible', 11, 1, 1),
(167, 'Practical', 'Present', '2024-03-11', 'Eligible', 11, 1, 1),
(168, 'Practical', 'Present', '2024-03-18', 'Eligible', 11, 1, 1),
(169, 'Practical', 'Present', '2024-03-25', 'Eligible', 11, 1, 1),
(170, 'Practical', 'Present', '2024-04-01', 'Eligible', 11, 1, 1),
(171, 'Practical', 'Present', '2024-04-08', 'Eligible', 11, 1, 1),
(172, 'Practical', 'Present', '2024-04-15', 'Eligible', 11, 1, 1),
(173, 'Practical', 'Present', '2024-04-22', 'Eligible', 11, 1, 1),
(174, 'Practical', 'Present', '2024-04-29', 'Eligible', 11, 1, 1),
(175, 'Practical', 'Present', '2024-05-06', 'Eligible', 11, 1, 1),
(176, 'Practical', 'Present', '2024-05-13', 'Eligible', 11, 1, 1),
(177, 'Practical', 'Present', '2024-05-20', 'Eligible', 11, 1, 1),
(178, 'Practical', 'Present', '2024-05-27', 'Eligible', 11, 1, 1),
(179, 'Practical', 'Absent',  '2024-06-03', 'Eligible', 11, 1, 1),
(180, 'Practical', 'Absent',  '2024-06-10', 'Eligible', 11, 1, 1),

-- Student 12 - Course 1 (13/15 Present)
(181, 'Practical', 'Present', '2024-03-04', 'Eligible', 12, 1, 1),
(182, 'Practical', 'Present', '2024-03-11', 'Eligible', 12, 1, 1),
(183, 'Practical', 'Present', '2024-03-18', 'Eligible', 12, 1, 1),
(184, 'Practical', 'Present', '2024-03-25', 'Eligible', 12, 1, 1),
(185, 'Practical', 'Present', '2024-04-01', 'Eligible', 12, 1, 1),
(186, 'Practical', 'Present', '2024-04-08', 'Eligible', 12, 1, 1),
(187, 'Practical', 'Present', '2024-04-15', 'Eligible', 12, 1, 1),
(188, 'Practical', 'Present', '2024-04-22', 'Eligible', 12, 1, 1),
(189, 'Practical', 'Present', '2024-04-29', 'Eligible', 12, 1, 1),
(190, 'Practical', 'Present', '2024-05-06', 'Eligible', 12, 1, 1),
(191, 'Practical', 'Present', '2024-05-13', 'Eligible', 12, 1, 1),
(192, 'Practical', 'Present', '2024-05-20', 'Eligible', 12, 1, 1),
(193, 'Practical', 'Present', '2024-05-27', 'Eligible', 12, 1, 1),
(194, 'Practical', 'Absent',  '2024-06-03', 'Eligible', 12, 1, 1),
(195, 'Practical', 'Absent',  '2024-06-10', 'Eligible', 12, 1, 1),

-- Student 13 - Course 1 (13/15 Present)
(196, 'Practical', 'Present', '2024-03-04', 'Eligible', 13, 1, 1),
(197, 'Practical', 'Present', '2024-03-11', 'Eligible', 13, 1, 1),
(198, 'Practical', 'Present', '2024-03-18', 'Eligible', 13, 1, 1),
(199, 'Practical', 'Present', '2024-03-25', 'Eligible', 13, 1, 1),
(200, 'Practical', 'Present', '2024-04-01', 'Eligible', 13, 1, 1),
(201, 'Practical', 'Present', '2024-04-08', 'Eligible', 13, 1, 1),
(202, 'Practical', 'Present', '2024-04-15', 'Eligible', 13, 1, 1),
(203, 'Practical', 'Present', '2024-04-22', 'Eligible', 13, 1, 1),
(204, 'Practical', 'Present', '2024-04-29', 'Eligible', 13, 1, 1),
(205, 'Practical', 'Present', '2024-05-06', 'Eligible', 13, 1, 1),
(206, 'Practical', 'Present', '2024-05-13', 'Eligible', 13, 1, 1),
(207, 'Practical', 'Present', '2024-05-20', 'Eligible', 13, 1, 1),
(208, 'Practical', 'Present', '2024-05-27', 'Eligible', 13, 1, 1),
(209, 'Practical', 'Absent',  '2024-06-03', 'Eligible', 13, 1, 1),
(210, 'Practical', 'Absent',  '2024-06-10', 'Eligible', 13, 1, 1),

-- Student 14 - Course 1 (13/15 Present)
(211, 'Practical', 'Present', '2024-03-04', 'Eligible', 14, 1, 1),
(212, 'Practical', 'Present', '2024-03-11', 'Eligible', 14, 1, 1),
(213, 'Practical', 'Present', '2024-03-18', 'Eligible', 14, 1, 1),
(214, 'Practical', 'Present', '2024-03-25', 'Eligible', 14, 1, 1),
(215, 'Practical', 'Present', '2024-04-01', 'Eligible', 14, 1, 1),
(216, 'Practical', 'Present', '2024-04-08', 'Eligible', 14, 1, 1),
(217, 'Practical', 'Present', '2024-04-15', 'Eligible', 14, 1, 1),
(218, 'Practical', 'Present', '2024-04-22', 'Eligible', 14, 1, 1),
(219, 'Practical', 'Present', '2024-04-29', 'Eligible', 14, 1, 1),
(220, 'Practical', 'Present', '2024-05-06', 'Eligible', 14, 1, 1),
(221, 'Practical', 'Present', '2024-05-13', 'Eligible', 14, 1, 1),
(222, 'Practical', 'Present', '2024-05-20', 'Eligible', 14, 1, 1),
(223, 'Practical', 'Present', '2024-05-27', 'Eligible', 14, 1, 1),
(224, 'Practical', 'Absent',  '2024-06-03', 'Eligible', 14, 1, 1),
(225, 'Practical', 'Absent',  '2024-06-10', 'Eligible', 14, 1, 1),

-- Student 15 - Course 1 (13/15 Present)
(226, 'Practical', 'Present', '2024-03-04', 'Eligible', 15, 1, 1),
(227, 'Practical', 'Present', '2024-03-11', 'Eligible', 15, 1, 1),
(228, 'Practical', 'Present', '2024-03-18', 'Eligible', 15, 1, 1),
(229, 'Practical', 'Present', '2024-03-25', 'Eligible', 15, 1, 1),
(230, 'Practical', 'Present', '2024-04-01', 'Eligible', 15, 1, 1),
(231, 'Practical', 'Present', '2024-04-08', 'Eligible', 15, 1, 1),
(232, 'Practical', 'Present', '2024-04-15', 'Eligible', 15, 1, 1),
(233, 'Practical', 'Present', '2024-04-22', 'Eligible', 15, 1, 1),
(234, 'Practical', 'Present', '2024-04-29', 'Eligible', 15, 1, 1),
(235, 'Practical', 'Present', '2024-05-06', 'Eligible', 15, 1, 1),
(236, 'Practical', 'Present', '2024-05-13', 'Eligible', 15, 1, 1),
(237, 'Practical', 'Present', '2024-05-20', 'Eligible', 15, 1, 1),
(238, 'Practical', 'Present', '2024-05-27', 'Eligible', 15, 1, 1),
(239, 'Practical', 'Absent',  '2024-06-03', 'Eligible', 15, 1, 1),
(240, 'Practical', 'Absent',  '2024-06-10', 'Eligible', 15, 1, 1),

-- Student 16 (Suspended) - Course 1 (13/15 Present)
(241, 'Practical', 'Present', '2024-03-04', 'Eligible', 16, 1, 1),
(242, 'Practical', 'Present', '2024-03-11', 'Eligible', 16, 1, 1),
(243, 'Practical', 'Present', '2024-03-18', 'Eligible', 16, 1, 1),
(244, 'Practical', 'Present', '2024-03-25', 'Eligible', 16, 1, 1),
(245, 'Practical', 'Present', '2024-04-01', 'Eligible', 16, 1, 1),
(246, 'Practical', 'Present', '2024-04-08', 'Eligible', 16, 1, 1),
(247, 'Practical', 'Present', '2024-04-15', 'Eligible', 16, 1, 1),
(248, 'Practical', 'Present', '2024-04-22', 'Eligible', 16, 1, 1),
(249, 'Practical', 'Present', '2024-04-29', 'Eligible', 16, 1, 1),
(250, 'Practical', 'Present', '2024-05-06', 'Eligible', 16, 1, 1),
(251, 'Practical', 'Present', '2024-05-13', 'Eligible', 16, 1, 1),
(252, 'Practical', 'Present', '2024-05-20', 'Eligible', 16, 1, 1),
(253, 'Practical', 'Present', '2024-05-27', 'Eligible', 16, 1, 1),
(254, 'Practical', 'Absent',  '2024-06-03', 'Eligible', 16, 1, 1),
(255, 'Practical', 'Absent',  '2024-06-10', 'Eligible', 16, 1, 1);
