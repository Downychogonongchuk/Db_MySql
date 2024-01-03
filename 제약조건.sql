-- 제약 조건 
-- id, member_email, member_password 컬럼이 있는 테이블
	
    drop table if exists member1; -- 만약 이미 있는 테이블이면 drop
    create table member1(
		id bigint,
        member_email varchar(20),
        member_password varchar(20)
    );
    insert into member1(id, member_email, member_password) values(1, 'aa@aa.com', '1234');
    -- 모든 컬럼에 값을 다 넣을 때는 컬럼이름 생략 가능
    insert into member1 values(2, 'bb@bb.com', '1234');
	-- 특정 컬럼만 값을 넣을 때는 
    insert into member1(id, member_email) values(3, 'cc@cc.com');
    select * from member1;
    insert into member1 values(4, 'dd@d.com', null);
    
    -- not null
      drop table if exists member2;
      create table member2(
		id bigint not null,
        member_email varchar(20),
        member_password varchar(20)
    );
    insert into member2(id, member_email, member_password) values(1, 'aa@aa.com', '1234');
    insert into member2(id, member_email, member_password) values(null, 'cc@aa.com', '1234');
    insert into member2(id, member_email, member_password) values(1, null, '1234');
    
    -- unique
    drop table if exists member3;
      create table member3(
		id bigint not null unique,
        member_email varchar(20) not null,
        member_password varchar(20) not null
    );
    insert into member2(id, member_email, member_password) values(1, 'aa@aa.com', '1234');
    insert into member2(id, member_email, member_password) values(null, 'cc@aa.com', '1234');
    insert into member2(id, member_email, member_password) values(1, null, '1234');
    
    -- 
    
     drop table if exists member4;
      create table member4(
		id bigint not null unique,
        member_email varchar(20) not null unique,
        member_password varchar(20) not null,
        created_at datetime
    );
    insert into member4(id,member_email, member_password, created_at)
		values(1,'aa@','1234',now()); 
        -- now() 함수 쿼리 실행 시간 시분초. 
    insert into member4(id,member_email, member_password)
		values(2,'bb@','1234'); 	
    
    -- default 시간 자동 저장
     drop table if exists member5;
      create table member5(
		id bigint not null unique,
        member_email varchar(20) not null unique,
        member_password varchar(20) not null,
        created_at datetime default now()
    );
    -- default 로 지정한 컬럼은 따로 값을 주지 않아도 값이 default로 지정한 값으로 저장됨
    select * from member5;
    insert into member5(id,member_email, member_password, created_at)
		values(1,'aa@','1234',now()); 
    insert into member5(id,member_email, member_password)
		values(2,'bb@','1234'); 	
    
    -- primary key
    drop table if exists member6;
      create table member6(
		id bigint primary key,
        member_email varchar(20) not null unique,
        member_password varchar(20) not null,
        created_at datetime default now()
    );
    -- default 로 지정한 컬럼은 따로 값을 주지 않아도 값이 default로 지정한 값으로 저장됨
    select * from member6;
    insert into member6(id,member_email, member_password) values(1,'aa@','1234'); 
    insert into member6(id,member_email, member_password) values(2,'bb@','1234'); 	
    insert into member6(id,member_email, member_password) values(2,'bb@','1234'); 	
 
 drop table if exists member7;
    create table member7(
		id bigint,
        member_email varchar(20) not null unique,
        member_password varchar(20) not null,
        created_at datetime default now(),
        constraint pk_member7 primary key(id)
    );
 
 
 -- 자동 번호 적용하기
 drop table if exists member8;
    create table member8(
		id bigint auto_increment,
        member_email varchar(20) not null unique,
        member_password varchar(20) not null,
        created_at datetime default now(),
        constraint pk_member8 primary key(id)
    );
    select * from member8;
-- auto_increment를 지정하면 값을 따로 주지 않아도 됨
	insert into member8(member_email, member_password) values('aa@','1234'); 
    insert into member8(member_email, member_password) values('bb@','1234'); 	
    insert into member8(member_email, member_password) values('bg@','1234'); 	
 
 
 --  자동번호 적용하기 테이블당 하나의 컬럼에만 적용가능 (auto_increment 는 pk 컬럼에만 지정가능) 
  drop table if exists member9;
    create table member9(
		id bigint auto_increment,
        member_email varchar(20) not null unique,
        member_password varchar(20) not null,
        created_at datetime default now(),
        constraint pk_member9 primary key(id),
		id2 bigint auto_increment
    );
    select * from member9;
-- auto_increment를 지정하면 값을 따로 주지 않아도 됨
	insert into member9(member_email, member_password) values('aa@','1234'); 
    insert into member9(member_email, member_password) values('bb@','1234'); 	
    insert into member9(member_email, member_password) values('bg@','1234'); 	
 
 
 
 
 
 
 
 
 
 
 
    
    
    
    
    
    
    
    
    
    
    