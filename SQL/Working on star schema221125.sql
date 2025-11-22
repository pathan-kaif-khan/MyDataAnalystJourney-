--representing a star schema
create table datedim
(
dateid integer not null primary key,
d date ,
m integer
);
create table bookdim
(
bookid integer primary key,
title text ,
author text,
price float
);
create table storedim
(
storeid integer primary key,
city text
);
create table bookfact
(
factid integer primary key,
dateid integer references datedim(dateid),
storeid integer references storedim(storeid),
bookid integer references bookdim(bookid),
total integer,
qty integer
);
insert into datedim values (1,'2025-10-11',10);
insert into datedim values(2,'2025-10-30',10);
 
insert into storedim values(501,'pune');
insert into storedim values(502,'nagpur');
 
insert into bookdim values (101,'html','richard',305.50);
insert into bookdim values (102,'django','riya',800.00);
 
insert into bookfact values(201,1,501,101,0,3);
insert into bookfact values(202,1,502,101,0,2);
insert into bookfact values(203,2,501,102,0,2);
 
select * from datedim;
select * from storedim;
select * from bookdim;
select * from bookfact;
 
 
UPDATE bookfact
SET total = qty * (
    SELECT price
    FROM bookdim
    WHERE bookdim.bookid = bookfact.bookid
);
select * from bookfact;
 
--display total quantity from pune city and by each city
select s.storeid,s.city,sum(b.qty)
from storedim s ,bookfact b 
where s.storeid=b.storeid-- and s.city='pune'
group by s.storeid,s.city;
 
--display the orders placed on '2025-10-11'
 
select s.storeid,s.city,b.title,bf.qty from
storedim s,bookdim b,datedim d,bookfact bf
where s.storeid=bf.storeid and b.bookid=bf.bookid and  d.dateid=bf.dateid 
and d.d='2025-10-11'
group by s.storeid,s.city,b.title,bf.qty;
 
--total price received from each book
select b.bookid,b.title,
sum(Bf.total) as Total_Price
from
bookdim b,bookfact bf
where b.bookid=bf.bookid  
group by b.bookid;
 
--Display the book that sold max
select bookid,sum(qty) as total_sold from 
bookfact group by bookid 
order by total_sold desc limit 1;
 
--display the book name that sold maximun
 
select bf.bookid,b.title,sum(qty) as total_sold from 
bookfact bf , bookdim b where bf.bookid=b.bookid
group by bf.bookid ,b.title
order by total_sold desc limit 1;