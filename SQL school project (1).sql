
--------STUDENTS AND TEACHERS DETAILS PROJECT---------

-----CREATING DATABSE 
create database school;
use school;
show databases;

-------CREATING TABLES AND INSERTING VALUES

create table students
(student_id int primary key,
student_name varchar(255),
student_gender varchar(255),
student_DOB date,
student_address varchar(255),
student_marks int,
student_course varchar(255));

insert into students
values(1,'John','m','2005-05-15','Bangolore',900,"python"),
 (2,'seetha','F','2000-07-20', 'chennai',850,"mysql"),
 (3,'geetha','F','2002-03-22','goa',700,"java"),
 (4,'Balu','M','2003-11-11','Hyderabad',300,"devops"),
 (5,'Charlie','M','2004-09-15', 'Bangolore',500,"c++");

 create table teachers
 (teacher_id int primary key,
 teacher_name varchar(255),
 teacher_gender varchar(255),
 teacher_phoneno bigint,
 teacher_taught varchar(255),
 teacher_salary int);
 
 insert into teachers 
 values(1,'sujatha','F',1234567891,"python",25000),
(2,'raghu','M',1234567892,'mysql',30000),
(3,'manju','F',2345678915,'devops',20000),
(4,'praveena','F',2345167893,'java',15000),
(5, 'akhil','F',54637893219,'c++',35000);

--------PERFORMING COMMANDS ON STUDENTS TABLE

show tables;

desc students;
desc teachers;

select *from students;
select * from teachers;

select student_name,student_course from students;
select teacher_name,teacher_taught from teachers;

alter table students
add student_grade int;
alter table students 
modify column student_grade varchar(255);
alter table students 
rename column student_grade to stdgrade;
insert into students 
values (7,'cherry','M','2000-04-20','Bangolore',200,'python','A');
insert into students(student_id ,stdgrade)
 values(8,'B');
update students
set student_name = "ravi"
where student_id=8;
alter table students 
drop column stdgrade;
delete from students
where student_id=8;

-------PERFORMING COMMANDS ON  TEACHERS TABLE

alter table teachers
add teachers_code varchar(255);
alter table teachers
modify column teachers_code int;
alter table teachers
rename column teachers_code to teachers_code;
insert into teachers
values (6,'madhan','M',234567891,'python',50000,2344);
insert into teachers(teacher_id ,teachers_code)
values(7,3456);
update teachers
set teacher_name = "ravi"
where teacher_id= 7;
alter table teachers 
drop column teachers_code;
delete from teachers
where teacher_id=7;

----------PERFORMING CLAUSES ON STUDENTDS AND TEACHERS TABLES

select * from students 
where student_id between 2 and 5;

select * from teachers
where teacher_id between 2 and 5;

select * from students 
where student_marks >500;
select * from teachers
where teacher_salary>35000;

select * from students
where student_name="geetha" or student_course="python";
select * from teachers
where teacher_name="manju" or teacher_taught="python";

select * from students 
where student_name like "a%";
select * from students 
where student_name like "%a";
select * from students 
where student_name like "%a%";
select * from students 
where student_name like "a%a";
select * from teachers
where teacher_name like "a%";

select * from students 
order by student_DOB;
select * from students
order by student_id desc;
select * from students limit 3;
select * from teachers 
order by teacher_salary;
select * from teachers
order by teacher_id desc;
select * from students limit 3;

select * from students 
order by student_id desc limit 4;
select student_marks,
count(student_marks) as total_list from students 
group by student_marks;
select student_course,
count(student_course) as total_list from students 
group by student_course;
select student_course,
count(student_course) as total_list from students 
group by student_course having student_course="python";
select student_gender,
count(student_gender) as total_list from students 
group by student_gender having student_gender="M";
select teacher_taught,
count(teacher_taught) as total_list from teachers
group by teacher_taught;
select teacher_taught,
count(teacher_taught) as total_list from teachers
group by teacher_taught having teacher_taught="devops";


-------PERFORMING AGGREGATE,CHARACTER AND DATE FUNCTIONS ON STUDENTS AND TEACHERS TABLE

select sum(student_marks) from students;
select avg(student_marks) from students;
select max(student_marks) from students;
select min(student_marks) from students;
select count(student_marks) from students;

select sum(teacher_salary) from teachers;
select avg(teacher_salary) from teachers;
select max(teacher_salary) from teachers;
select min(teacher_salary) from teachers;
select count(teacher_salary) from teachers;

select length(student_name) as lengthoname from students;
select upper(student_name)  from students;
select lower(student_gender)  from students;
select concat(student_name, " & ",student_course) as nameandcourse from students;

select length(teacher_name) as lengthoname from teachers;
select upper(teacher_taught)  from teachers;
select lower(teacher_taught)  from teachers;
select concat(teacher_name, " & ",teacher_taught) as nameandcoursename from teachers;

select dayname(student_DOB) as weekday from students;
select day(student_DOB) as Date from students;
select monthname(student_DOB) as monthname from students;
select date_add(student_DOB,interval 1 year) as student_DOB from students;
select date_sub(student_DOB,interval 1 year) as student_DOB from students;
select extract(year from student_DOB) as year from students;
select curdate();
select now();
select curtime();

-----PERFORMING JOINS ON  STUDENTS AND TEACHERS TABLE

select * from students
inner join teachers on student_id= teacher_id;

select * from students
left join teachers on student_id= teacher_id;

select * from students
right join teachers on student_id= teacher_id;

select * from students
full join teachers on student_id= teacher_id;

select teacher_salary, sum(teacher_salary) AS total_salary
from teachers
inner join students
on teachers.teacher_id= students.student_id
where teacher_taught = "python"
group by teacher_salary;

select student_marks,sum(student_marks)
from students
left join teachers 
on students.student_id = teachers.teacher_id
where student_address="Bangolore"
group by student_marks;

 select teacher_id, teacher_salary,
 case
 when teacher_salary >=50000 then 'max'
 when teacher_salary < 40000 then 'min'
 else 'low'
end as salary_category
from teachers;



 
 

        



 
 





















 


