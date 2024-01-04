drop table if exists book;
create table book (
	id bigint primary key auto_increment,
    b_bookname varchar(20),
    b_publisher varchar(10),
    b_price bigint
);

drop table if exists customer;
create table customer (
	id bigint primary key auto_increment,
    c_name varchar(5),
    c_address varchar(10),
    c_phone varchar(15)
);

drop table if exists orders;
create table orders (
	id bigint primary key auto_increment,
    customer_id bigint,
    book_id bigint,
    o_saleprice int,
    o_orderdate date,
    constraint fk_customer_id foreign key (customer_id) references customer(id),
    constraint fk_book_id foreign key (book_id) references book(id)
);

insert into book(b_bookname, b_publisher, b_price) values('축구 역사', '좋은출판사', 7000);
insert into book(b_bookname, b_publisher, b_price) values('축구 리포트', '나무출판사', 13000);
insert into book(b_bookname, b_publisher, b_price) values('축구를 알려주마', '대한출판사', 22000);
insert into book(b_bookname, b_publisher, b_price) values('배구의 바이블', '대한출판사', 35000);
insert into book(b_bookname, b_publisher, b_price) values('피겨 교과서', '좋은출판사', 8000);
insert into book(b_bookname, b_publisher, b_price) values('피칭의 단계별기술', '좋은출판사', 6000);
insert into book(b_bookname, b_publisher, b_price) values('야구의 추억 이야기', '나이스미디어', 20000);
insert into book(b_bookname, b_publisher, b_price) values('야구 읽어주는 남자', '나이스미디어', 13000);
insert into book(b_bookname, b_publisher, b_price) values('올림픽 스토리', '이야기당', 7500);
insert into book(b_bookname, b_publisher, b_price) values('olympic history', 'strawberry', 13000);

insert into customer(c_name, c_address, c_phone) values ('손흥민', '영국 런던', '000-5000-0001');
insert into customer(c_name, c_address, c_phone) values ('김연아', '대한민국 서울', '000-6000-0001');  
insert into customer(c_name, c_address, c_phone) values ('김연경', '대한민국 서울', '000-7000-0001');
insert into customer(c_name, c_address, c_phone) values ('류현진', '캐나다 토론토', '000-8000-0001');
insert into customer(c_name, c_address, c_phone) values ('이강인', '프랑스 파리',  null);

insert into orders(customer_id, book_id, o_saleprice, o_orderdate) values (1, 1, 6000, str_to_date('2023-07-01','%Y-%m-%d')); 
insert into orders(customer_id, book_id, o_saleprice, o_orderdate) values (1, 3, 21000, str_to_date('2023-07-03','%Y-%m-%d')); 
insert into orders(customer_id, book_id, o_saleprice, o_orderdate) values (2, 5, 8000, str_to_date('2023-07-03','%Y-%m-%d')); 
insert into orders(customer_id, book_id, o_saleprice, o_orderdate) values (3, 6, 6000, str_to_date('2023-07-04','%Y-%m-%d')); 
insert into orders(customer_id, book_id, o_saleprice, o_orderdate) values (4, 7, 20000, str_to_date('2023-07-05','%Y-%m-%d')); 
insert into orders(customer_id, book_id, o_saleprice, o_orderdate) values (1, 2, 12000, str_to_date('2023-07-07','%Y-%m-%d')); 
insert into orders(customer_id, book_id, o_saleprice, o_orderdate) values (4, 8, 13000, str_to_date( '2023-07-07','%Y-%m-%d')); 
insert into orders(customer_id, book_id, o_saleprice, o_orderdate) values (3, 10, 12000, str_to_date('2023-07-08','%Y-%m-%d')); 
insert into orders(customer_id, book_id, o_saleprice, o_orderdate) values (2, 10, 7000, str_to_date('2023-07-09','%Y-%m-%d')); 
insert into orders(customer_id, book_id, o_saleprice, o_orderdate) values (3, 8, 13000, str_to_date('2023-07-10','%Y-%m-%d')); 

select * from book;
select * from customer;
select * from orders;

select b_price, b_bookname from book;
select b_publisher from book;
select distinct b_publisher from book;
select * from book;
select * from book where  b_price <20000;
select * from book where  b_price > 10000 and b_price < 20000;
select * from book where b_publisher = '좋은출판사' or '대한출판사';
select * from book where b_bookname like '%축구%';
select * from book where b_bookname like '_구%';
select * from book where b_bookname like '%축구%' and b_price > 20000;
select * from book order by b_bookname asc;
select * from book order by b_price asc , b_bookname asc; 

select sum(o_saleprice) from orders;
select sum(o_saleprice) from orders where customer_id = 1;
select avg(o_saleprice), max(o_saleprice), min(o_saleprice) from orders;
select customer_id,count(book_id)as '주문 도서 수량' , sum(o_saleprice) from orders group by customer_id;
#
select customer_id, count(book_id) as '주문 도서 수량' from orders where o_saleprice >8000 group by customer_id having count(book_id) >= 2;
select sum(o_saleprice) from orders where customer_id = 2;
select count(book_id) from orders where customer_id = 2;
select count(id) from book;
select count( b_publisher) from book;
#
select id from orders where '2023-07-04' < o_orderdate > '2023-07-07';  -- 불가 
select id from orders where '2023-07-04' <= o_orderdate and  o_orderdate <='2023-07-07'; 
select id from orders where not ('2023-07-04' < o_orderdate and  o_orderdate <'2023-07-07'); 
























