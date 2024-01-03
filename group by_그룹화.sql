-- 그룹화(grouping, 특정 컬럼을 기준으로 동일한 데이터끼리 묶는것)
-- 그룹화한 결과를 조회할때는 그룹화한 컬럼으로 조회만 가능
-- job을 기준으로 
select * from emp group by job;
select job from emp group by job;

-- 직급별 평균 급여
select job, avg(sal) from emp group by job;
-- 직급이 clerk인 사원들의 평균 급여
select job, avg(sal) from emp where job='clerk';
-- 부서(deptno)별 평균급여
select deptno, avg(sal) from emp group by deptno;
-- 직급별 사원수
select count(*) from emp group by job;
-- 직급별 평균급여, 사원수
select job, avg(sal),count(*) from emp group by job;
-- 위의 결과에서 직급기준 오름차순 정렬
select job, avg(sal),count(*) from emp group by job order by job asc;
-- 위의 결과에서 평균 급여 소수 첫째자리 까지
select job, round(avg(sal),1),count(*) from emp group by job;
-- 위의 결과에서 job은 '직급' 급여 평균값은 '평균급여', 사원수는 '사원수'로 표현하여 조회
select job as '직급', round(avg(sal),1) as '평균급여',count(*) as'사원수' from emp group by job;

-- 두 개 이상 컬럼 그룹화
-- deptno을 기준으로 그룹화하고 그 결과내에서 job을 기준으로 그룹화
select deptno,job from emp group by deptno,job;
select deptno,job,count(*) from emp group by deptno,job;
select deptno,job,count(*),avg(sal) from emp group by deptno,job;


-- 그룹화한 결과에 조건을 적용
-- having 
-- 위의 결과에서 평균 급여가 2000 이상인 결과만 조회
select deptno, job, count(*), avg(sal)
	from emp
		group by deptno, job
			having avg(sal) >= 2000
				order by deptno asc;
                
-- 급여가 3000 이하인 사원만 가지고 부서별, 직급별 그룹화를 하고 평균급여가 2000 이상인 결과 조회 
select deptno, job, avg(sal), count(*)
	from emp
		where sal <= 3000
			group by deptno, job
				having avg(sal) >= 2000
					order by deptno asc;

-- date  타입을 문자로 표현 : date_format()
select date_format(hiredate, '%Y') from emp;
-- ex1
select deptno, round(avg(sal), 2) as '평균 급여', max(sal) as '최고 급여',min(sal) as '최저 급여',count(*) as'사원수' from emp group by deptno;
-- ex2
select job,count(*) from emp group by job having count(*)>=3;
-- ex3
select  date_format(hiredate, '%Y') as '입사년도', count(*) as '사원수' from emp group by date_format(hiredate, '%Y');
-- ex3.1
select  date_format(hiredate, '%Y') as'입사년도' ,deptno as '부서번호', count(*) as'사원수' from emp group by date_format(hiredate, '%Y'),deptno;



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

        -- 서브쿼리 (sub query)
-- 최저 급여를 받는 사원의 이름

-- 최저 급여가 얼마인지 > 800
select min(sal)from emp;
-- 800 급여를 받는 사원의 이름 > 
select ename from emp where sal = 8000;

select ename from emp where sal = (select min(sal) from emp);
-- 최고 급여를 받는 사원의 정보 조회
select * from emp where sal = (select max(sal) from emp);

-- allen 보다 높은 급여를 받는 사원 조회
select sal from emp where ename = 'ellen';
select * from emp where sal > 1600;
select * from emp where sal > (select sal from emp where ename= 'ellen');

-- ex1 
-- clark 보다 늦게 입사한 사원 조회
select * from emp where hiredate < (select hiredate from emp where ename = 'clark');
-- ex2
-- 부서번호가 20인 사원 중에서 전체 사원 평균 급여보다 높은 급여를 받는 사원 조회
select * from emp where deptno = 20 and  sal > (select avg(sal) from emp);
select avg(sal) from emp;
-- ex3
-- 2번 조회 경과에서 부서이름, 부서위치도 함께 조회
select * from emp e, dept d where e.deptno = d.deptno and e.deptno = 20 and sal > (select avg(sal) from emp); 
-- ex4
-- martin 과 같은 부서 사원 중에서 전체 사원 평균 급여보다 높은 급여를 받는 사원 조회
select * from emp where deptno = (select deptno from emp where ename = 'martin') and sal > (select avg(sal) from emp);



















            