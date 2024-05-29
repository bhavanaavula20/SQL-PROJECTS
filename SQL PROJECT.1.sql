create database hotel;
use hotel;
create table guest 
(guest_id int, guest_name varchar(50), Guest_contact bigint unique, Address varchar(50), Gender varchar(50), Guest_Age int, Joining_date date, Room_number int, primary key(guest_id));
desc guest ;
create table rooms
 (Guest_name varchar(50), guest_id int, Room_number int , Room_type varchar(50), Room_rate int, primary key(Guest_name,Room_number), foreign key(guest_id) references guest(guest_id));
desc rooms ;
create table reservation 
(room_number int, reservation_id int, check_In_Date date, check_Out_Date date, Payment_method varchar(50), foreign key(reservation_id) references guest(guest_id));
desc reservation;
create table payment 
(room_number int, guest_name varchar(80), Guest_contact bigint, payment_date date, Amount int not null, Payment_Method varchar(50), primary key(room_number,Guest_contact), foreign key (guest_name) references rooms(Guest_name));
desc payment ;
create table room_service
 (room_number int, Service_name varchar(80), Service_cost int, foreign key(room_number) references payment (room_number));
desc room_service;

insert into guest values 
(13958,"Bhavana",7032610802,"kurnool","male",22,"2023-10-09",101),
 (13960,"rakshita",8297500270,"anantapur","female",21,"2023-10-19",111),
 (13973,"vinod",6302862102,"kadapa","male",25,"2023-10-20",201),
 (13978,"moulali",9121585903,"kurnool","male",30,"2023-11-09",303),
 (13980,"radhika",7804794704,"bengaluru","female",24,"2023-11-19",205),
 (13987,"kalpana",9848410746,"kerala","female",29,"2023-10-29",212);
 update guest set Room_number=102 where guest_id=13958;
alter table guest modify guest_name varchar(90);
alter table guest rename column Room_number to rooms_number;

insert into rooms values 
 ("Bhavana",13958,101,"double bed   room",15000), 
 ("kalpana",13987,212,"double bed room",15000), 	
 ("moulali",13978,303,"double bed room",15000), 						
 ("radhika",13980,205,"triple bed room",20000), 						
 ("rakshita",13960,111,"single bed room",10000),
("vinod",13973,201,"triple bed room",20000);
update rooms 
set Room_number=102 
where guest_id=13958;
alter table guest modify Guest_name varchar(90);

insert into reservation values
(102,13958,"2023-10-09","2023-11-23","phonepe"),
(201,13973,"2023-10-20","2023-11-13","google pay"),
(212,13987,"2023-10-29","2023-11-21","phonepe"),
(303,13978,"2023-11-09","2023-11-19","paytm");
alter table reservation modify Payment_method varchar(100);

insert into payment values
(201,"vinod",6302862102,"2023-10-20",20000,"google pay"), 
(102,"Bhavana",7032610802,"2023-10-09",15000,"phonepe"), 	 
(205,"radhika",7804794704,"2023-11-19",20000,"cash"), 	
(111,"rakshita",8297500270,"2023-10-19",10000,"cash"), 
(303,"moulali",9121585903,"2023-11-09",15000,"paytm"), 		 	
(212,"kalpana",9848410746,"2023-10-29",15000,"phonepe");
alter table payment rename column Guest_contact  to phone_number;
alter table payment modify Payment_Method varchar(90);

insert into room_service values
(102,"centralized room service",5000),(111,"mobile room service",6000),
(201,"centralized room service",5000),(303,"mobile room service",6000),
(205,"mobile room service",6000),(212,"centralized room service",5000);

select sum(Guest_age) from guest;
select sum(Room_number) from rooms;
select sum(room_number) from reservation;
select sum(Amount) from payment;
select sum(Service_cost) from room_service;

select min(Guest_age) from guest;
select min(Room_number) from rooms;
select min(room_number) from reservation;
select min(Amount) from payment;
select min(Service_cost) from room_service;

select max(Guest_age) from guest;
select max(Room_number) from rooms;
select max(room_number) from reservation;
select max(Amount) from payment;
select max(Service_cost) from room_service;

select count(Guest_age) from guest;
select count(Room_number) from rooms;
select count(room_number) from reservation;
select count(Amount) from payment;
select count(Service_cost) from room_service;


select length(guest_name) from guest;
select length(room_number) from reservation;
select length(Room_type) from rooms;
select length(Payment_Method) from payment;

select upper(guest_name) from guest;
select upper(room_number) from reservation;
select upper(Room_type) from rooms;
select upper(Payment_Method) from payment;

select lower(guest_name) from guest;
select lower(room_number) from reservation;
select lower(Room_type) from rooms;
select lower(Payment_Method) from payment;

select concat(guest_name,Gender) from guest;
select concat(room_number,payment_method) from reservation;
select concat(Room_type,room_rate) from rooms;
select concat(Payment_Method,Amount) from payment;

select substring(guest_name,3,8) from guest;
select substring(room_number,2,6) from reservation;
select substring(Room_type,4,9) from rooms;
select substring(Payment_Method,1,3) from payment;

select now();
select current_date();
select current_time();
select dayname(Joining_date) from guest;
select dayname(check_Out_Date) from reservation;
select dayname(payment_date) from payment;
select day(Joining_date) from guest;
select day(check_Out_Date) from reservation;
select day(payment_date) from payment;
select monthname(Joining_date) from guest;
select monthname(check_Out_Date) from reservation;
select monthname(payment_date) from payment;
select date_add(joining_date,interval 1 year)from guest;
select date_sub(check_out_date,interval 1 year)from reservation;
select datediff(check_in_date,check_out_date)from reservation;
select extract(month from payment_date)from payment;
	
select * from guest order by guest_name asc;
select * from rooms order by Room_number asc;
select * from reservation order by check_in_date asc;
select * from payment order by phone_number asc;
select * from room_service order by room_number asc;

select * from guest order by guest_name desc;
select * from rooms order by Room_number desc;
select * from reservation order by check_in_date desc;
select * from payment order by phone_number desc;
select * from room_service order by room_number desc;

select Gender,count(Gender) from guest group by Gender;
select Room_rate,count(Room_rate) from rooms group by Room_rate;
select payment_method,count(payment_method) from reservation group by payment_method;
select Payment_Method,count(Payment_Method) from payment group by Payment_Method;
select Service_name,count(Service_name) from room_service group by Service_name;

select Address,count(Address) from guest group by Address having Address="kurnool";
select Room_type,count(Room_type) from rooms group by Room_type having Room_type="double bed room";
select payment_method,count(payment_method) from reservation group by payment_method having payment_method="phonepe";
select Service_name,count(Service_name) from room_service group by Service_name having Service_name="centralized room service";
select Amount,avg(Amount) from payment group by Amount having Amount=15000;

select * from guest limit 2,6;
select * from rooms limit 2,2;
select * from reservation limit 2,6;
select * from room_service limit 2,1;
select * from payment limit 1,2;

select *from guest; 
select *from rooms; 
select *from reservation ;  
select *from room_service;  
select *from payment ;  

select*from guest inner join rooms on guest.guest_id=rooms.guest_id;
select*from guest inner join reservation on  guest.guest_id = reservation.reservation_id;
select*from rooms inner join payment on rooms.Guest_name= payment.guest_name;
select*from payment inner join room_service on payment.room_number= room_service.room_number;

select*from guest left join rooms on guest.guest_id=rooms.guest_id;
select*from guest left join reservation on guest.guest_id= reservation.reservation_id;
select*from rooms left join payment on rooms.Guest_name= payment.guest_name;
select*from payment left join room_service on payment.room_number= room_service.room_number;

select*from guest right join rooms on guest.guest_id=rooms.guest_id;
select*from guest right join reservation on guest.guest_id= reservation.reservation_id;
select*from rooms right join payment on rooms.Guest_name= payment.guest_name;
select*from payment right join room_service on payment.room_number= room_service.room_number;




































 
 
 
 
 







