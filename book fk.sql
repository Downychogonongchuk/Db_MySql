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


-- 1. 모든 도서의 가격과 도서명 조회 
select b_price, b_bookname from book;
-- 2. 모든 출판사 이름 조회 
select b_publisher from book;
-- 2.1 중복값을 제외한 출판사 이름 조회 
select distinct b_publisher from book;
-- 3. BOOK테이블의 모든 내용 조회 
select * from book;
-- 4. 20000원 미만의 도서만 조회 
select * from book where  b_price <20000;
#
-- 5. 10000원 이상 20000원 이하인 도서만 조회
select * from book where  b_price > 10000 and b_price < 20000;
-- 6. 출판사가 좋은출판사 또는 대한출판사인 도서 조회 
select * from book where b_publisher = '좋은출판사' or '대한출판사';
-- 7. 도서명에 축구가 포함된 모든 도서를 조회
select * from book where b_bookname like '%축구%';
-- 8. 도서명의 두번째 글자가 구인 도서 조회
select * from book where b_bookname like '_구%';
-- 9. 축구 관련 도서 중 가격이 20000원 이상인 도서 조회
select * from book where b_bookname like '%축구%' and b_price > 20000;
#
-- 10. 책 이름순으로 전체 도서 조회
select * from book order by b_bookname asc;
-- 11. 도서를 가격이 낮은 것 부터 조회하고 같은 가격일 경우 도서명을 가나다 순으로 조회
select * from book order by b_price asc , b_bookname asc; 



-- 12. 주문 도서의 총 판매액 조회 
select sum(o_saleprice) from orders;
-- 13. 1번 고객이 주문한 도서 총 판매액 조회 
select sum(o_saleprice) from orders where customer_id = 1;
-- 14. ORDERS 테이블로 부터 평균판매가, 최고판매가, 최저판매가 조회 
select avg(o_saleprice), max(o_saleprice), min(o_saleprice) from orders;
-- 15. 고객별로 주문한 도서의 총 수량과 총 판매액 조회 (GROUP BY 활용)
select customer_id,count(book_id)as '주문 도서 수량' , sum(o_saleprice) from orders group by customer_id;
#

-- 16. 가격이 8,000원 이상인 도서를 구매한 고객에 대해 고객별 주문 도서의 총 수량 조회 (GROUP BY 활용)
--    (단, 8,000원 이상 도서 두 권 이상 구매한 고객만) 
select customer_id, count(book_id) as '주문 도서 수량' from orders where o_saleprice >8000 group by customer_id having count(book_id) >= 2;
-- 17. 김연아고객(고객번호 : 2) 총 구매액
select sum(o_saleprice) from orders where customer_id = 2;
-- 18. 김연아고객(고객번호 : 2)이 구매한 도서의 수
select count(book_id) from orders where customer_id = 2;
-- 19. 서점에 있는 도서의 총 권수
select count(id) from book;
select count(*) from book;
-- 20. 출판사의 총 수 
select count(b_publisher) from book;
select count(distinct b_publisher) from book;

select id from orders where '2023-07-04' < o_orderdate > '2023-07-07';  -- 불가 
-- 21. 7월 4일 ~ 7일 사이에 주문한 도서의 주문번호 조회 
select id from orders where '2023-07-04' <= o_orderdate and  o_orderdate <='2023-07-07'; 
-- 22. 7월 4일 ~ 7일 사이에 주문하지 않은 도서의 주문번호 조회
select id from orders where not ('2023-07-04' < o_orderdate and  o_orderdate <'2023-07-07'); 


-- 23. 고객, 주문 테이블 조인하여 고객번호 순으로 정렬
	select * from customer c , orders o order by customer_id asc;
-- 24. 고객이름(CUSTOMER), 고객이 주문한 도서 가격(ORDERS) 조회 
	select c.c_name, o.o_saleprice,c.id from customer c, orders o; 
-- 25. 고객별(GROUP)로 주문한 도서의 총 판매액(SUM)과 고객이름을 조회하고 조회 결과를 가나다 순으로 정렬 
	select sum(o.o_saleprice),c.c_name from customer c,orders o where c.id = o.customer_id group by c.id  order by c.c_name asc; 
-- 26. 고객명과 고객이 주문한 도서명을 조회(3테이블 조인)
	select c.c_name, b.b_bookname from customer c, orders o, book b where c.id = o.customer_id and b.id = o.book_id;
    select c.c_name, b.b_bookname from customer c, orders o, book b;
-- 27. 2만원(SALEPRICE) 이상 도서를 주문한 고객의 이름과 도서명을 조회 
	select c.c_name, b.b_bookname from customer c, orders o, book b where  c.id = o.customer_id and b.id = o.book_id and o.o_saleprice > 20000 ; 
-- 28. 손흥민 고객의 총 구매액과 고객명을 함께 조회
	select sum(o.o_saleprice), c.c_name from customer c, book b, orders o where c.id = o.customer_id and b.id = o.book_id and c.c_name ='손흥민';
-- 29. 손흥민 고객의 총 구매수량과 고객명을 함께 조회
	select count(*),c.c_name from customer c, book b , orders o where c.id = o.customer_id and b.id = o.book_id and c.c_name = '손흥민'; 

-- ------------- -- 2024.01.05 
 
-- 30. 가장 비싼 도서의 이름을 조회
	select b_bookname from book where b_price = (select max(b_price) from book where b_price );
    -- 
    SELECT max(b_price) from book;
    select b_bookname from book where b_price = (SELECT max(b_price) from book);
    
-- 31. 책을 구매한 이력이 있는 고객의 이름을 조회
	select distinct c.c_name from customer c, orders o where c.id = o.customer_id and o.id >0;
    
-- 32. 도서의 가격(PRICE)과 판매가격(SALEPRICE)의 차이가 가장 많이 나는 주문 조회  ##
    select o.* from orders o, book b where b.id = o.book_id and (b.b_price - o.o_saleprice) = (select max(b.b_price - o.o_saleprice) from book b , orders o where b.id= o.book_id);
	
-- 33. 고객별 평균 구매 금액이 도서의 판매 평균 금액 보다 높은 고객의 이름 조회 
	select c.c_name from customer c , orders o where c.id = o.customer_id group by c.id having avg(o.o_saleprice) > (select avg(o_saleprice) from orders);
	-- 도서 판매 평균
    select avg(o_saleprice) from orders;
    -- 고객별 평균 구매 금액 (group by)
    select c.c_name, avg(o.o_saleprice) from orders o, customer c where c.id=o.customer_id group by c.c_name;
	
-- 34. 고객번호가 5인 고객의 주소를 대한민국 인천으로 변경 
	update customer set c_address = '인천'where id = 5;
-- 35. 김씨 성을 가진 고객이 주문한 총 판매액 조회
	select sum(o.o_saleprice) from customer c, orders o where c.id = o.customer_id and c.c_name like '김__';

-- alter : 테이블의 구조를 변경할 때 (컬럼 이름 변경 , 타입 변경, 컬럼 삭제 , 제약조건 추가 등)
create table student(
	id bigint,
    s_name varchar(20),
    s_mobile int 
);

-- 테이블으 ㅣ구조 확인
	desc student;
    desc book;
    
-- 기존 컬럼에 제약조건 추가 추가 add / pk키 constraint + 
	alter table student add constraint primary key(id);
-- 기존 컬럼 타입 변경  수정 modify
	alter table student modify s_mobile varchar(30);
-- 컬럼 추가
	alter table student add s_major varchar(30);
-- 컬럼 이름 변경
	alter table student change s_mobile s_phone varchar(30);







