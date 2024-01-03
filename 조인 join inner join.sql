
-- join 조인  inner join
-- 두 개 이상의 테이블을 하나의 테이블처럼 사용할 때
select * from emp, dept;

-- 내부조인
-- 조인하려는 두 테이블에 공통 컬럼이 존재해야 함.
select * from emp, dept where emp.deptno = dept.deptno;

-- 테이블 이름을 줄여서 사용
select * from emp e, dept d where e.deptno = d.deptno;
-- deptno 컬럼은 두 테이블에 모두 있기 때문에 ambiguous 에러
select e.empno, e.ename, e.job, e.deptno, d.dname, d.loc
 from emp e, dept d where e.deptno = d.deptno;
-- emp 테이블 전체 조회
select e.* from emp e, dept d where e.deptno = d.deptno;

-- emp, dept를 조인하여 empno, ename, deptno, dname, loc 조회
-- (단, 급여가 2500 이상인 사원만 조회하고 , 조회결과는 사원이름 기준으로 오름차순 정렬)

select e.empno, e.ename, e.deptno, d.dname, d.loc 
	from emp e, dept d where e.deptno = d.deptno and e.sal >= 2500
		order by d.dname asc;

-- emp, dept 테이블을 조인하여 emp테이블의 hiredate, job, sal, deptno 와 dept 테이블의 dname, 평균급여 avg(sal)를 조회
-- (단, 급여가 2000 이상인 사원만 가지고 부서별, 입사시기 (YYYY)별 그룹화를 하고 평균급여가 3500 이상인 결과 조회하고, 
-- 평균 급여는 소수점 1번째 자리에서 버림, 조회 결과는 입사시기를 기준으로 내림차순 정렬 ) 
select date_format( e.hiredate, '%Y'), e.job, e.sal,e.deptno, d.dname, truncate(avg(e.sal), 1) from emp e, dept d where e.deptno = d.deptno
and e.sal >=2000 group by e.job, e.deptno, date_format(e.hiredate, '%Y') having avg(e.sal)>= 3500 order by date_format(e.hiredate, '%Y') desc;





