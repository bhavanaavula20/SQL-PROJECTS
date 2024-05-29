create database games;
use games;
create table people(name varchar(255),p_id int,p_num bigint);
desc people;
insert into people
values("baby",1,54776288869),("nithin",2,754738765),("johnny",3,64827487656),("ravi",4,7675297845),("nandu",3,87945826398);
select*from people;
select name from people;
create table sales 
(s_id int,s_date date,amount int,customers int,boxes int);
insert into sales
values(1,"2022-02-17",29352,238,20),(2,"1999-03-19",10346,400,18),(3,"2003-04-21",39942,6543,09),(4,"2002-01-30",7723,200,10),
(5,"1970-03-01",500,261,2);
select*from sales;
select s_id,s_date, amount/boxes from sales;
select s_id,s_date, amount/boxes as 'total amount'from sales;
select * from sales
where amount>1000;
select * from sales
where amount>10000
order by amount desc;
select * from sales
where amount>30000
order by s_id,amount desc;
select * from sales
where amount>1000 and s_date<="2000-03-10";
select s_date,amount from sales
where amount>1000 and year(s_date)=1999
order by amount desc;
select *from sales
where boxes>0 and boxes<15;
select * from sales
where boxes between 0 and 50;
select * from sales
where boxes between 0 and 15;
select s_date,amount,boxes,weekday(s_date) as "day of week" from sales
where weekday(s_date)=3;
create table teams
(s_person varchar(255),team varchar(255),location varchar(255));
insert into teams
values("barr","yummies","BNG"),("dennis","delish","BNG"),("gunnar","yummies","HYD"),("gigi","juices","HYD"),("ches","juices","HYD");
select * from teams;
select * from teams
where team="delish" or team="juices";
select * from teams
where team in ("delish","juices");
select * from teams
where s_person like "b%";
select * from teams
where s_person like "%g%";
select * from sales;
select s_date,amount,
case when amount<1000 then"under 1K"
when amount<5000 then "under 5k"
when amount<100000 then "under 10k"
else "10k or more"
end as "amont category"
from sales;
select s.s_date,s.amount,p.name,s.s_id,p.p_id from sales as s 
join people as p on p.p_id=s.s_id;
select s.s_date,s.amount,p.name from sales as s 
inner join people as p on p.p_id=s.s_id;
select s.s_date,s.amount,p.name,s.s_id,p.p_id from sales as s 
left join people as p on p.p_id=s.s_id;







