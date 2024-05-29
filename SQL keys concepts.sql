create database job;
use job;
create table step
(s_id int primary key,s_code varchar(255) not null,s_name varchar(255) not null);
desc step;
create table process
(p_id int primary key,p_code varchar(255),p_description varchar(255),p_recruiter_id int);
desc process;
create table process_step
(ps_id int primary key,ps_status varchar(255),ps_priority int,s_id int,foreign key(s_id) references step(s_id),p_id int,foreign key(p_id) references process(p_id));
desc process_step;
create table job_category
(jc_id int primary key,jc_code varchar(255) not null,jc_name varchar(255) not null,jc_description varchar(255));
desc job_category;
create table job_platform
(jp_id int primary key,jp_code varchar(255) not null,jp_name varchar(255)not null,jp_description varchar(255));
create table job_position
(j_id int primary key,j_code varchar(255),j_positionname varchar(255),j_description varchar(255));
create table organization
(o_id int primary key,o_code varchar(255),o_name varchar(255),o_description varchar(255));
create table job
(id int primary key,code varchar(255),name varchar(255),description varchar(255),date_published datetime,job_start_date datetime,no_of_vacancies int,
jc_id int,foreign key(jc_id) references job_category(jc_id),j_id int,foreign key(j_id) references job_position(j_id),jp_id int,foreign key(jp_id) references job_platform(jp_id),
o_id int,foreign key(o_id) references organization(o_id),p_id int,foreign key(p_id) references process(p_id));
desc job;




create database bank;
use bank;
create table bank_info
(ifsc_code int primary key,bank_name varchar(255),branch_name varchar(255));
create table customer_personal_info
(customer_id int primary key,customer_name varchar(255),DOB date,guardian_name varchar(255),address varchar(255),contact_no bigint,mail_id varchar(255),gender varchar(255),
marital_status varchar(255),identification_doc_type varchar(255),id_doc_no varchar(255),citizenshi varchar(255));
create table customer_referrence_info
(reference_id int primary key,reference_acc_name varchar(255),reference_acc_adress varchar(255),reference_acc_no bigint,relation varchar(255));
create table account_info
(acc_no int primary key,acc_type varchar(255),rigistation_date date,activation_date date,interest decimal(7,2),initial_deposit bigint,
ifsc_code int,foreign key(ifsc_code) references bank_info(ifsc_code),
customer_id int,foreign key(customer_id) references customer_personal_info(customer_id),
reference_id int,foreign key(reference_id)references customer_referrence_info(reference_id));






create database mobilemanagement;
use mobilemanagement;
create table customer_info
(customer_id int primary key,customer_name varchar(255),address varchar(255),mobile bigint,email varchar(255));
create table mobile_masters
(ime_no int primary key,model_name varchar(255),manufacture varchar(255),date_of_manufac date,warrantly_in_years int,price decimal(7,2),distributor_id int);
create table sales_info
(sales_id int primary key,sales_date date,discount int,net_amount int,model_name varchar(255),customer_id int,foreign key(customer_id)references customer_info(customer_id),
ime_no int,foreign key(ime_no)references mobile_masters(ime_no));
desc sales_info;
create table distributor
(distributor_id int primary key,distributor_name varchar(255),address varchar(255),mobile bigint,email varchar(255));
create table mobiles_specifications
(im_no int primary key,dimension varchar(255),weight varchar(255),display_type varchar(255),display_size varchar(255),internal_mem_in_mb int,
neteork_3g varchar(255),gprs varchar(255),edge varchar(255),bluetooth varchar(255),camera varchar(255),camera_quality varchar(255),
os varchar(255),battery_life_hrs int,ime_no int,foreign key(ime_no)references mobile_masters(ime_no));
drop table mobile_specifications;
create table mobiles_master
(ime_no int primary key,model_name varchar(255),manufacture varchar(255),date_of_manufac date,warranty_in_years int,price decimal(7,2),
distributor_id int,foreign key(distributor_id)references distributor(distributor_id));
drop table mobile_master;











create database students;
use students;
create table subjects
(subject_id int primary key,title varchar(255));
create table groupt
(group_id int primary key,name varchar(255));
create table students
(student_id int primary key,firstname varchar(255),lastname varchar(255),group_id int,foreign key(group_id)references groupt(group_id));
create table marks
(marks_id int primary key,timedate date,mark int,subject_id int,foreign key(subject_id)references subjects(subject_id),
student_id int,foreign key(student_id)references students(student_id));
create table teachers
(teacher_id int primary key,firstname varchar(255),lastname varchar(255));
create table sunj_teach
(st_id int primary key,subject_id int,foreign key(subject_id)references subjects(subject_id),teacher_id int,foreign key(teacher_id)references teachers(teacher_id),
group_id int,foreign key(group_id)references groupt(group_id));




create database car;
use car;
create table salesperson
(salesperson_id int primary key,lastname varchar(255),firstname varchar(255));
create table mechanic
(mechanic_id int primary key,firstname varchar(255),lastname varchar(255));
create table car
(car_id int primary key,serialno int,make varchar(255),model varchar(255),colour varchar(255),years date,carforsale bigint);
create table customer
(customer_id int primary key,lastname varchar(255),firstname varchar(255),phoneno bigint,address varchar(255),city varchar(255),state varchar(255),country varchar(255),
postalcode varchar(255));
create table services
(service_id int primary key,service_name varchar(255),hourly varchar(255));
create table parts
(parts_id int primary key,part_name varchar(255),description varchar(255),purchase_price varchar(255),retail_price varchar(255));
create table sales_invoice
(invoice_id int primary key,invoice_number varchar(255),i_data varchar(255),car_id int,foreign key(car_id)references car(car_id),
customer_id int,foreign key(customer_id)references customer(customer_id),
salesperson_id int,foreign key(salesperson_id)references salesperson(salesperson_id));
create table service_ticket
(service_ticket_id int primary key,service_ticket_number int,date_recieved date,comments varchar(255),date_returnedtocustomer date,
car_id int,foreign key(car_id)references car(car_id),
customer_id int,foreign key(customer_id)references customer(customer_id));
create table service_mechanics
(service_mechanic_id int primary key,hours datetime,comment varchar(255),rate int,
service_ticket_id int,foreign key(service_ticket_id)references service_ticket(service_ticket_id),
service_id int,foreign key(service_id)references services(service_id),
mechanic_id int,foreign key(mechanic_id)references mechanic(mechanic_id));
create table partsused
(partssed_id int primary key,numbers_used int,price int,parts_id int,foreign key(parts_id)references parts(parts_id),
service_ticket_id int,foreign key(service_ticket_id)references service_ticket(service_ticket_id));
drop table service;
drop table service_mechanic;




























