SET FOREIGN_KEY_CHECKS = 0;

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
(3,  'Dr. Dinithi Vithanage',     'dinithi@ictec.ruh.ac.lk',      'Senior Lecturer',  1),
(4,  'Ms. Rumeshika W.arachi',    'rumeshika@ictec.ruh.ac.lk',    'Lecturer',         1),
(5,  'Ms. Chanduni Fernando',     'chanduni.f@ruh.ac.lk',         'Lecturer',         1),
(6,  'Mr.Shashitha Lakal',        'shashithal@ictec.ruh.ac.lk',   'Lecturer',         1);