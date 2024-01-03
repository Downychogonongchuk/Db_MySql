
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




