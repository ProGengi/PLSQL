

三位数加减法题目生成器

--三位数加法

with t as(select level+100 l from dual connect by level<900)
select * from(
select t.l||'+'||t2.l||'='||to_char(t.l+t2.l) from 
(select l,rownum rn from(select l from t order by dbms_random.random))t,
(select l,rownum rn from(select l from t order by dbms_random.random))t2 
where t.rn=t2.rn
)where rownum<=250;

--三位数减法

with t as(select level+100 l from dual connect by level<900)
select * from(
select t.l||'-'||t2.l||'='||to_char(t.l-t2.l) from 
(select l,rownum rn from(select l from t order by dbms_random.random))t,
(select l,rownum rn from(select l from t order by dbms_random.random))t2 
where t.rn=t2.rn and t.l-t2.l>0
)where rownum<=250;
