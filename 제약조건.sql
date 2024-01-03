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
    insert into member1 values(2, 'bb@bb.com', null);
    