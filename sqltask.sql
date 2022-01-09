-- Creating table users
CREATE TABLE users(
id int PRIMARY key,
  student_name varchar,
  student_email varchar 
);

-- Inserting values in users table
INSERT INTO users VALUES(1,"Etesh","eteshb@gmail.com");
INSERT INTO users VALUES(2,"Raj","raj@gmail.com");
INSERT INTO users VALUES(3,"Vignesh","vignesh@gmail.com");
INSERT INTO users VALUES(4,"supriya","supriya@gmail.com");
INSERT INTO users VALUES(5,"ragav","ragav@gmail.com");

-- Creating table codekata
CREATE TABLE codekata(
 
  total_problems INT,
  number_of_problems_solved INT,
  id INT REFERENCES users(id)
);

-- Inserting values in codekata table
INSERT into codekata VALUES(50,20,1)
INSERT into codekata VALUES(50,25,2)
INSERT into codekata VALUES(50,24,3)
INSERT into codekata VALUES(50,34,4)
INSERT into codekata VALUES(50,13,5)

-- Creating table attendence
CREATE TABLE attendence(
total_days int,
 present_days int,
  leaves int,
  id INT REFERENCES users(id)
);

-- Inserting values in attendence
INSERT into attendence VALUES(90,80,10,1);
INSERT into attendence VALUES(90,65,25,2);
INSERT into attendence VALUES(90,76,14,3);
INSERT into attendence VALUES(90,60,30,4);
INSERT into attendence VALUES(90,82,8,5);

-- Creating table topic
CREATE table topic(
topic_name varchar,
  concept varchar,
  topic_day varchar
);

-- Inserting values in topic
INSERT into topic VALUES("doctype","html","Day-1");
INSERT into topic VALUES("selector","css","Day-3");
INSERT into topic VALUES("template literals","Javascript","Day-5");
INSERT into topic VALUES("map","Javascript","Day-6");
INSERT INTO topic VALUES("state","ReactJs","Day-12");

-- creating tables tasks
CREATE TABLE tasks(
task_name varchar,
  task_category varchar,
  task_day varchar
);

-- Inserting values in tasks
INSERT into tasks VALUES("forms","html","Day-1");
INSERT into tasks VALUES("css selectors","css","Day-4");
INSERT into tasks VALUES("using bootstrap","css","Day-6");
INSERT into tasks VALUES("use map","Javascript","Day-9");
INSERT into tasks VALUES("callback functions","Javascript","Day-14");

-- creating table company_drives
CREATE TABLE company_drives(
company_name varchar,
  number_of_vacancies int,
  location varchar,
  attended_student_id int
);

-- Inserting values in company_drives
INSERT into company_drives VALUES("Opentext",4,"Hyderabad",1);
INSERT INTO company_drives VALUES ("Ivy",10,"Chennai",2);
INSERT into company_drives VALUES ("Knowledge Lens",23,"Bangalore",3);
INSERT into company_drives VALUES ("CGI",54,"Hyderabad",4);
INSERT into company_drives VALUES ("Oracle",12,"Bangalore",5);

-- Creating table mentors
CREATE TABLE mentors(
mentor_id int PRIMARY key,
mentor_name varchar,
current_teaching_batch varchar,
  total_batches_taught int,
  number_of_students_assigned int
);

-- Inserting values in mentors
INSERT into mentors VALUES(1,"Lavish","B24WD",2,40);
INSERT into mentors VALUES(2,"Raj","B24WE",1,25);
INSERT into mentors VALUES(3,"Mahindar","B25WD",4,58);
INSERT into mentors VALUES(4,"Murugon","B25WE",3,36);
INSERT into mentors VALUES(5,"Ragav","B27WD",1,19);

-- Creating table students_activated_courses
CREATE TABLE students_activated_courses(
total_courses int,
  activated courses int,
  current_course varchar,
  id INT REFERENCES users(id)
);

-- Inserting values in students_activated_courses
INSERT INTO students_activated_courses VALUES(10,2,"Python",1);
INSERT INTO students_activated_courses VALUES(10,1,"Javascript",2);
INSERT INTO students_activated_courses VALUES(10,4,"SpringBoot",3);
INSERT INTO students_activated_courses VALUES(10,5,"DataScience",4);
INSERT INTO students_activated_courses VALUES(10,8,"MERN Stack",5);

-- Creating table courses
CREATE TABLE courses(
course_id int,
  course_name varchar,
  course_duration varchar,
  course_fee int
);

-- Inserting values into courses
INSERT into courses VALUES(1,"DataScience","120 days",80000);
INSERT into courses VALUES(2,"MERN Stack","90 days",70000);
INSERT into courses VALUES(3,"Machine Learning","60 days",30000);
INSERT into courses VALUES(4,"Android Development","45 days",25000);
INSERT into courses VALUES(5,"Cloud Computing","30 days",10000);

-- get number problems solved in codekata by combining the users
SELECT number_of_problems_solved FROM codekata inner join users ON codekata.id = users.id;

-- display the no of company drives attended by a user
SELECT COUNT(attended_student_id) from company_drives GROUP by attended_student_id

-- combine and display students_activated_courses and courses for a specific user groping them based on the course
SELECT * FROM students_activated_courses,courses WHERE students_activated_courses.current_course = courses.course_name

--  list all the mentors
SELECT * FROM mentors

--  list the number of students that are assigned for a mentor
SELECT number_of_students_assigned FROM mentors