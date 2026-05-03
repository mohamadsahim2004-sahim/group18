
-- USERS
CREATE USER 'admin_user'@'localhost' IDENTIFIED BY 'admin123';
CREATE USER 'dean_user'@'localhost' IDENTIFIED BY 'dean123';
CREATE USER 'lecturer_user'@'localhost' IDENTIFIED BY 'lecturer123';
CREATE USER 'tech_user'@'localhost' IDENTIFIED BY 'tech123';
CREATE USER 'student_user'@'localhost' IDENTIFIED BY 'student123';

-- ADMIN
GRANT ALL PRIVILEGES ON Group18_DB.* 
TO 'admin_user'@'localhost' 
WITH GRANT OPTION;

-- DEAN
GRANT ALL PRIVILEGES ON Group18_DB.* 
TO 'dean_user'@'localhost';

-- LECTURER 
GRANT ALL PRIVILEGES ON Group18_DB.* 
TO 'lecturer_user'@'localhost';

-- TECHNICAL OFFICER
GRANT SELECT, INSERT, UPDATE 
ON Group18_DB.Attendance 
TO 'tech_user'@'localhost';

-- STUDENT 
GRANT SELECT ON Group18_DB.Attendance TO 'student_user'@'localhost';
GRANT SELECT ON Group18_DB.Final_Result TO 'student_user'@'localhost';
GRANT SELECT ON Group18_DB.Grade TO 'student_user'@'localhost';


FLUSH PRIVILEGES;
