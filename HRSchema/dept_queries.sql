--select * from dept;
--insert into dept values(50, 'FINANCE', 'NEW YORK');
--insert into dept values(60, 'ACCOUNTING', 'CHICAGO');
--select * from dept;
--select * from emp;
--insert into emp values(7736, 'ALBERT', 'CLERK', 7902, '1982-10-18', 950, NULL, NULL );
--insert into emp values(7739, 'JOSEPH', 'SALESMAN', 7902, '1982-11-18', 1350, NULL, NULL );


--INNER JOIN;


/* INNER JOIN (Intersection) - Only records meeting the join conditions will appear in the output.
                               Inner join is the default join */


-- List emp and dept details:
--SELECT emp.ename, emp.job, emp.sal, dept.deptno, dept.dname, dept.loc
--FROM emp INNER JOIN dept ON (emp.deptno = dept.deptno) 
--where emp.ename = 'SMITH'
--	order by deptno;

-- List details of emps who working in CHICAGO
SELECT  emp.ename, emp.job, emp.sal, dept.deptno, dept.dname, dept.loc
FROM emp JOIN dept ON (emp.deptno = dept.deptno)
WHERE dept.loc = 'CHICAGO';


--issue
-- List details of emps and their departments working in CHICAGO
SELECT EMP.ename, emp.job, emp.sal, dept.dname, dept.deptno 
from emp, dept 
where ename ='SMITH';


/* OUTER JOINs - LEFT, RIGHT & FULL */

--SELECT emp.ename, emp.job, emp.sal, dept.deptno, dept.dname, dept.loc
--FROM emp LEFT OUTER JOIN dept ON (emp.deptno = dept.deptno) order by deptno;

--SELECT emp.empno, emp.ename, emp.job, emp.sal, dept.deptno, dept.dname, dept.loc
--FROM emp RIGHT OUTER JOIN dept ON (emp.deptno = dept.deptno) order by deptno;

--SELECT emp.empno, emp.ename, emp.job, emp.sal, dept.deptno, dept.dname, dept.loc
--FROM emp FULL OUTER JOIN dept ON (emp.deptno = dept.deptno) order by deptno;
----------------------------------------------------------------------------------------------------------------------------------------------


-- Join with table alias:
--SELECT x.empno, x.ename, x.job, x.sal, d.deptno, d.dname, d.loc
--FROM emp x INNER JOIN dept d ON (x.deptno = d.deptno) order by deptno;

-- Joining more than 2 tables:
-- List emp details along with dname, loc & the grade of the emps:




--SELECT e.empno, e.ename, e.job, d.deptno, d.dname, d.loc, e.sal, g.grade
--FROM emp e 	JOIN dept d  	ON (e.deptno = d.deptno)     
--		JOIN salgrade g 	ON (e.sal BETWEEN g.losal AND g.hisal);

--NOTE: When joining N tables, N-1 join conditions are required. 

-- List the name of grade 4 emps working at loc of Dallas:




--SELECT e.empno, e.ename, e.job, d.deptno, d.dname, d.loc, e.sal, g.grade
--FROM emp e 	JOIN dept d  	ON (e.deptno = d.deptno)     
--		JOIN salgrade g 	ON (e.sal BETWEEN g.losal AND g.hisal)
--WHERE g.grade = 4
--AND d.loc = 'DALLAS';


--------------------------- SUB QUERIES ---------------------------

--SELECT CLAUSE
--FROM CLAUSE
--WHERE CLAUSE
--HAVING CLAUSE


--WHERE CLAUSE
--List all employees whose salary is greater than average salary of all employees
--select ename, sal, job from emp where sal > (select avg(sal) from emp);

-- List all emps working in the same dept as SCOTT
--SELECT ename, deptno FROM emp
--WHERE deptno = (SELECT deptno FROM emp WHERE ename = 'SCOTT');

-- List all emps working in Chicago
--SELECT ename, deptno FROM emp
--WHERE deptno = (SELECT deptno FROM dept WHERE loc = 'CHICAGO');

--FROM CLAUSE
--SELECT max(sal) FROM (select * from emp where deptno = 10) "Employees in dept 10";

--SELECT CLAUSE
--SELECT ename, (SELECT dname FROM dept WHERE dept.deptno = emp.deptno) AS department_name
--FROM emp;




----Extras

-- Other comparison Operators in JOIN condition:
--select * from salgrade;

--SELECT x.ename, x.sal, g.grade, g.losal,g.hisal
--FROM emp x  INNER JOIN  salgrade g ON (x.sal BETWEEN g.losal AND g.hisal);

--SELECT x.ename, x.sal, g.grade
--FROM emp x  INNER JOIN  salgrade g ON (x.sal >= g.losal AND x.sal <= g.hisal)




-- List all grade 3 emps:
--SELECT x.ename, x.sal, g.grade
--FROM emp x  INNER JOIN  salgrade g ON (x.sal BETWEEN g.losal AND g.hisal)
--WHERE g.grade = 3;

/* SELF JOIN */

--SELECT employee.ename "Emp Name", manager.ename "Manager Name"
--FROM emp employee INNER JOIN emp manager ON (employee.mgr = manager.empno);

/* NATURAL JOIN */
--SELECT * FROM emp INNER JOIN dept ON (emp.deptno = dept.deptno);
--SELECT * FROM emp NATURAL JOIN dept;
--SELECT * FROM emp NATURAL LEFT JOIN dept;

/* EXPLICIT vs IMPLICIT JOIN */

-- Explicit Join using "JOIN" keyword:
--SELECT emp.empno, emp.ename, emp.job, emp.sal, dept.deptno, dept.dname, dept.loc
--FROM emp JOIN dept ON (emp.deptno = dept.deptno);

-- Implicit Join using "Where" clause:
--SELECT emp.empno, emp.ename, emp.job, emp.sal, dept.deptno, dept.dname, dept.loc
--FROM emp, dept 
--WHERE emp.deptno = dept.deptno;

--SUBQUERIES
--Select max(sal) from emp group by deptno;
--WHERE sal  >= 2000
--	order by deptno;

--HAVING CLAUSE
--SELECT deptno, AVG(sal)
--FROM emp
--GROUP BY deptno
--HAVING AVG(sal) > (SELECT AVG(sal) FROM emp);


select distinct airports.name, airlines.name,aircrafts.description
from aircrafts join route_aircrafts on aircrafts.id = route_aircrafts.aircraft_id
 join routes on route_aircrafts.id = routes.id
 join airports on routes.source_airport_id = airports.id
 join  airlines on routes.airline_id = airlines.id 
