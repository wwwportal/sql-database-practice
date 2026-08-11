
--Select ename, job, sal, deptno, hiredate from emp
--	order by deptno;


/* Character Functions: UPPER, LOWER, INITCAP */
--SELECT ename, INITCAP(ename) "INITIAL CAPS" from emp; 





--SELECT INITCAP(ename), UPPER(ename), LOWER(job) FROM emp;




-- Character Functions are very useful in where clause
--SELECT * FROM emp WHERE initcap(ename) = 'Jones';




/* Number Functions: ROUND & TRUNC */

--SELECT ename, sal/30 "Daily Sal", ROUND(sal/30), TRUNC(sal/30) FROM emp;

--SELECT ename, sal/30 "Daily Sal", ROUND(sal/30, 2), TRUNC(sal/30, 2) FROM emp;



/* DATE FUNCTIONS */

--SELECT current_date "DATE Today"
--SELECT ename, hiredate, EXTRACT(month FROM hiredate) FROM emp
--WHERE EXTRACT(month FROM hiredate) = 4;

--SELECT ename, hiredate, EXTRACT(year FROM hiredate) FROM emp
--WHERE EXTRACT(year FROM hiredate) = 1981;



/*			AGGREGATE / GROUP FUNCTION*/
-- SUM, AVG, MIN, MAX & COUNT
--Select count(empno) from emp;
--select count(*) from emp;



--SELECT COUNT(sal) "Number of Employees", SUM(sal) "Total Salary", AVG(sal) "Average Salary", MIN(sal) "Minimum Salary", MAX(sal) "Maximum Salary"  FROM emp;

--SELECT COUNT(empno), COUNT(comm), SUM(comm), AVG(comm), AVG(COALESCE(comm,0)) FROM emp; 





/*		GROUP BY & HAVING */

-- List deptno wise total salary of each dept.
--SELECT deptno, COUNT(empno) "No of Emp", SUM(sal) "Total Sal" FROM emp
--GROUP BY deptno



-- List the number of emps and their avg salary for each job. 








--SELECT job, COUNT(job) "Number of Emp", ROUND(AVG(sal)) "Avg Sal/Job" FROM emp GROUP BY job;
--ORDER BY job;





/* HAVING CLAUSE - used with aggregate functions as a condition */

-- List the dept where the total salary is more than 10000
--SELECT deptno, SUM(sal) "Total Sal"
--FROM emp 
--GROUP BY deptno
--HAVING SUM(sal) > 10000;

-- List the dept where the Average salary is more than 1500
--SELECT deptno, AVG(sal) "Average Salary"
--FROM emp 
--GROUP BY deptno
--HAVING AVG(sal) < 1500;


--SELECT job, COUNT(job) "Number of Emp", ROUND(AVG(sal)) "Avg Sal/Job"
--FROM emp
--GROUP BY job
--having AVG(sal)>2000;

-- List the dept where 5 or more emps are working









--SELECT deptno, COUNT(deptno) "No of Emp"
--FROM emp
--GROUP BY deptno
--HAVING count(deptno) >= 5;


--SELECT deptno, job,COUNT(job), SUM(sal)
--FROM emp
--GROUP BY deptno, job
--ORDER BY deptno, job;


--Performing Calculations Using the S Q L COUNT and DISTINCT Functions
--SELECT	DISTINCT Deptno AS 	Dept FROM	emp;


--SELECT	count(DISTINCT Deptno) AS 	DeptCount FROM	emp;



--Extras

/* NULL FUNCTION */
--SELECT ename, sal, comm, sal+comm from emp;
--SELECT ename, sal, comm, sal+comm, COALESCE(comm,0)  AS "Comm" FROM emp;


--be careful
--SELECT count(*), sum(comm) "total commission", AVG(comm) "Average commission" from emp;




-- Agg Func ignore nulls. Hence, use coalesce when calc avg. 
--SELECT count(*), count(comm) "total commission", AVG(coalesce(comm,0)) "Average commission" from emp;

--delete from emp where deptno is null;
--More complex
--List number of jobs, their salaries for each job dept wise

--SELECT job, deptno, count(job), sum(sal) "SUM Salary"
--from emp
--group by job, deptno;
