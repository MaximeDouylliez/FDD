q1.1

select deptno,ename, sal,
RANK ()  OVER(PARTITION BY deptno ORDER BY sal DESC )  "Rang"
from Dept natural join Emp
where deptno=10 OR deptno=30 
order by  deptno,sal desc ;

q1.2

select deptno,ename,sal,
DENSE_RANK ()  OVER(PARTITION BY deptno ORDER BY sal DESC )  "Rang"
from Dept natural join Emp
where deptno=10 OR deptno=30 
order by  deptno,sal desc;


q1.3
select deptno,ename, sal,
DENSE_RANK ()  OVER(PARTITION BY deptno ORDER BY sal DESC )  "Rang"
from (select *from emp a where not exists (select * from emp b where b.sal=a.sal and b.ename<> a.ename  )) natural join dept
where deptno=10 OR deptno=30
order by  deptno,sal desc ;



q1.6
select deptno,job, sum(sal)
from Dept natural join Emp
group by rollup (deptno, job);


q1.7

select COALESCE (deptno,666)as dept,COALESCE (job,'Tous employes')as job, sum(sal) as a
from Dept natural join Emp
group by rollup (deptno, job);

3.2.1
select annee, CL_R, CATEGORY, AVG((QTE*PU)/365)
from PRODUITS natural join(select * from CLIENTS natural join VENTES natural JOIN TEMPS) where annee = 2009 or annee = 2010 group by ROLLUP (annee, CL_R,CATEGORY)
;
3.2.2
select annee, CL_R, AVG((QTE*PU)/365)
from PRODUITS natural join(select * from CLIENTS natural join VENTES natural JOIN TEMPS) where annee = 2009 or annee = 2010 group by ROLLUP (annee, CL_R)
;
3.2.3
select annee, AVG((QTE*PU)/365)
from PRODUITS natural join(select * from CLIENTS natural join VENTES natural JOIN TEMPS) where annee = 2009 or annee = 2010 group by ROLLUP (annee)
;
3.3
select annee, CL_R, CATEGORY, AVG((QTE*PU)/365)
from PRODUITS natural join(select * from CLIENTS natural join VENTES natural JOIN TEMPS) where annee = 2009 or annee = 2010 group by cube (annee, CL_R,CATEGORY)
;





