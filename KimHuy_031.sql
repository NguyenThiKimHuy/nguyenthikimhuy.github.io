
--cau 1
select E.LAST_NAME,HIRE_DATE,E.JOB_ID
FROM HR.EMPLOYEES E, HR.JOBS J
WHERE E.JOB_ID=J.JOB_ID
AND E.HIRE_DATE>='20/02/2000' AND E.HIRE_DATE<='01/05/2006'
ORDER BY E.HIRE_DATE DESC;
--CAU 2
SELECT * FROM HR.EMPLOYEES WHERE SUBSTR(FIRST_NAME,3,1)='a';
--cau 3
select LAST_NAME,J.JOB_ID,SALARY
from HR.EMPLOYEES E, HR.JOBS J
WHERE  E.JOB_ID=J.JOB_ID
AND J.JOB_TITLE IN('Sales representative','Stock clert')
AND E.SALARY!=2500
AND E.SALARY!=3500;
--CAU 4
SELECT EMPLOYEE_ID,LAST_NAME,ROUND (SALARY*0.15,0) AS NEWSALARY
FROM HR.EMPLOYEES;
--CAU 5
SELECT EMPLOYEE_ID,LAST_NAME,D.MANAGER_ID
FROM HR.EMPLOYEES E,HR.DEPARTMENTS D
WHERE E.MANAGER_ID=D.MANAGER_ID;
--CAU 6
SELECT TO_CHAR(HIRE_DATE,'YYYY') AS NAM,COUNT(*)
FROM HR.EMPLOYEES
WHERE TO_CHAR(HIRE_DATE,'YYYY') IN ('1995','1996')
GROUP BY TO_CHAR(HIRE_DATE,'YYYY');
--CAU 7
SELECT * FROM HR.EMPLOYEES E
WHERE E.DEPARTMENT_ID IN( SELECT DEPARTMENT_ID FROM HR.EMPLOYEES E WHERE E.LAST_NAME LIKE('%n'))
                        AND E.SALARY>(SELECT AVG(E.SALARY) FROM HR.EMPLOYEES);
--CAU 8
SELECT * FROM (SELECT * FROM HR.EMPLOYEES E 
                ORDER BY E.SALARY DESC)
WHERE ROWNUM<4;
--CAU 9

                        
