---
title: mariadb数据库学习04
date: 2021-01-28 15:01:26
tags: [mariadb, learning]
categories: mariadb 
---

# mariadb数据库学习04

本次我们来学习数据排序

<!--more-->

## 排序

### 升序

#### 案例

按照工资升序，找出员工名和薪资

对于排序，可以使用关键字`order by`

```sql
select
    ename, sal
from
    emp
order by
    sal;
```

默认是升序排列

结果如下

```
MariaDB [learnsql]> select
    ->     ename, sal
    -> from
    ->     emp
    -> order by
    ->     sal;
+--------+---------+
| ename  | sal     |
+--------+---------+
| SMITH  |  800.00 |
| JAMES  |  950.00 |
| ADAMS  | 1100.00 |
| WARD   | 1250.00 |
| MARTIN | 1250.00 |
| MILLER | 1300.00 |
| TURNER | 1500.00 |
| ALLEN  | 1600.00 |
| CLARK  | 2450.00 |
| BLAKE  | 2850.00 |
| JONES  | 2975.00 |
| FORD   | 3000.00 |
| SCOTT  | 3000.00 |
| KING   | 5000.00 |
+--------+---------+
14 rows in set (0.001 sec)
```

### 降序

如果要指定升序还是降序，可以使用关键字`asc`和`desc`，升序和降序

```sql
select ename, sal from emp order by sal desc;
```

结果如下

```
MariaDB [learnsql]> select ename, sal from emp order by sal desc;
+--------+---------+
| ename  | sal     |
+--------+---------+
| KING   | 5000.00 |
| SCOTT  | 3000.00 |
| FORD   | 3000.00 |
| JONES  | 2975.00 |
| BLAKE  | 2850.00 |
| CLARK  | 2450.00 |
| ALLEN  | 1600.00 |
| TURNER | 1500.00 |
| MILLER | 1300.00 |
| MARTIN | 1250.00 |
| WARD   | 1250.00 |
| ADAMS  | 1100.00 |
| JAMES  |  950.00 |
| SMITH  |  800.00 |
+--------+---------+
14 rows in set (0.001 sec)
```

### 需求

#### 按照工资的降序排列，工资一样就按照名字升序排列

```sql
select ename, sal from emp order by sal desc, ename asc;
```

```
MariaDB [learnsql]> select ename, sal from emp order by sal desc, ename asc;
+--------+---------+
| ename  | sal     |
+--------+---------+
| KING   | 5000.00 |
| FORD   | 3000.00 |
| SCOTT  | 3000.00 |
| JONES  | 2975.00 |
| BLAKE  | 2850.00 |
| CLARK  | 2450.00 |
| ALLEN  | 1600.00 |
| TURNER | 1500.00 |
| MILLER | 1300.00 |
| MARTIN | 1250.00 |
| WARD   | 1250.00 |
| ADAMS  | 1100.00 |
| JAMES  |  950.00 |
| SMITH  |  800.00 |
+--------+---------+
14 rows in set (0.001 sec)
```

`order by`可以跟续多个字段需求，放在前面的比较主要，后面辅助判断

> 例如班级考试排名，分数为主，平时表现为辅，两个人同分时如果a的表现比b好，则a的排名在b前面

还可以使用1，2等数字来表明对于筛选出的字段进行排序

如：

```sql
select ename, sal from emp order by 1;
```

就是通过`ename`来进行排序，而`2`的话就是通过`sal`进行排序

#### 找出工作岗位是SALESMAN的员工，并按照薪资降序排列

首先通过`where`来找出职业（JOB）为`SALESMAN`的员工，其次再通过薪资来进行排序，得到如下代码：

```sql
select ename, job, sal from emp where JOB='SALESMAN' order by sal desc;
```

结果如下：

```
MariaDB [learnsql]> select ename, job, sal from emp where JOB='SALESMAN' order by sal desc;
+--------+----------+---------+
| ename  | job      | sal     |
+--------+----------+---------+
| ALLEN  | SALESMAN | 1600.00 |
| TURNER | SALESMAN | 1500.00 |
| WARD   | SALESMAN | 1250.00 |
| MARTIN | SALESMAN | 1250.00 |
+--------+----------+---------+
4 rows in set (0.001 sec)
```

对于上面的那条语句，执行顺序为`from`->`where`->`select`->`order by`

## 分组函数

1. count 计数
2. sum 求和
3. avg 平均值
4. max 最大值
5. min 最小值

**所有的分组函数都是对“某一组”数据进行操作的**

举例

```
MariaDB [learnsql]> select sum(sal) as 'sum of sal' from emp;
+------------+
| sum of sal |
+------------+
|   29025.00 |
+------------+
1 row in set (0.001 sec)
```

找出最高工资

```sql
select max(sal) as 'max of sal' from emp;
```

找出最低工资

```sql
select min(sal) as 'min of sal' from emp;
```

找出平均工资

```
MariaDB [learnsql]> select sum(sal) / count(ename) as 'mean of sal' from emp;
+-------------+
| mean of sal |
+-------------+
| 2073.214286 |
+-------------+
1 row in set (0.001 sec)
```

或者

```
MariaDB [learnsql]> select avg(sal) as 'mean of sal' from emp;
+-------------+
| mean of sal |
+-------------+
| 2073.214286 |
+-------------+
1 row in set (0.001 sec)
```

找出总人数

```sql
select count(ename) from emp;
```

> 分组函数又称多行处理函数，输入多行（指多行工资）到函数里（例如`sum`），输出一行（指总工资）

<mark>分组函数自动忽略`NULL`</mark>

例如

```
MariaDB [learnsql]> select count(comm) from emp;
+-------------+
| count(comm) |
+-------------+
|           4 |
+-------------+
1 row in set (0.001 sec)
```

对比总表，我们知道`count`函数跳过了`NULL`

```
MariaDB [learnsql]> select * from emp;
+-------+--------+-----------+------+------------+---------+---------+--------+
| EMPNO | ENAME  | JOB       | MGR  | HIREDATE   | SAL     | COMM    | DEPTNO |
+-------+--------+-----------+------+------------+---------+---------+--------+
|  7369 | SMITH  | CLERK     | 7902 | 1980-12-17 |  800.00 |    NULL |     20 |
|  7499 | ALLEN  | SALESMAN  | 7698 | 1981-02-20 | 1600.00 |  300.00 |     30 |
|  7521 | WARD   | SALESMAN  | 7698 | 1981-02-22 | 1250.00 |  500.00 |     30 |
|  7566 | JONES  | MANAGER   | 7839 | 1981-04-02 | 2975.00 |    NULL |     20 |
|  7654 | MARTIN | SALESMAN  | 7698 | 1981-09-28 | 1250.00 | 1400.00 |     30 |
|  7698 | BLAKE  | MANAGER   | 7839 | 1981-05-01 | 2850.00 |    NULL |     30 |
|  7782 | CLARK  | MANAGER   | 7839 | 1981-06-09 | 2450.00 |    NULL |     10 |
|  7788 | SCOTT  | ANALYST   | 7566 | 1987-04-19 | 3000.00 |    NULL |     20 |
|  7839 | KING   | PRESIDENT | NULL | 1981-11-17 | 5000.00 |    NULL |     10 |
|  7844 | TURNER | SALESMAN  | 7698 | 1981-09-08 | 1500.00 |    0.00 |     30 |
|  7876 | ADAMS  | CLERK     | 7788 | 1987-05-23 | 1100.00 |    NULL |     20 |
|  7900 | JAMES  | CLERK     | 7698 | 1981-12-03 |  950.00 |    NULL |     30 |
|  7902 | FORD   | ANALYST   | 7566 | 1981-12-03 | 3000.00 |    NULL |     20 |
|  7934 | MILLER | CLERK     | 7782 | 1982-01-23 | 1300.00 |    NULL |     10 |
+-------+--------+-----------+------+------------+---------+---------+--------+
14 rows in set (0.001 sec)
```

### 单行处理函数

单行处理函数就是指输入一行输出一行

计算每个员工的年薪

```
MariaDB [learnsql]> select ename, (sal + ifnull(comm, 0)) * 12 as yearsal from emp;
+--------+----------+
| ename  | yearsal  |
+--------+----------+
| SMITH  |  9600.00 |
| ALLEN  | 22800.00 |
| WARD   | 21000.00 |
| JONES  | 35700.00 |
| MARTIN | 31800.00 |
| BLAKE  | 34200.00 |
| CLARK  | 29400.00 |
| SCOTT  | 36000.00 |
| KING   | 60000.00 |
| TURNER | 18000.00 |
| ADAMS  | 13200.00 |
| JAMES  | 11400.00 |
| FORD   | 36000.00 |
| MILLER | 15600.00 |
+--------+----------+
14 rows in set (0.001 sec)
```

> 数据库中如果运算表达式有NULL，结果就是NULL

其中`ifnull`就是个单行处理函数，基本语法如下

```sql
ifnull(数据, 其他)
```

如果那一行是NULL，就把NULL看作其他

### 证明多行处理函数忽略了NULL

```
MariaDB [learnsql]> select sum(comm) from emp;
+-----------+
| sum(comm) |
+-----------+
|   2200.00 |
+-----------+
1 row in set (0.001 sec)
```

## count所有和count单一字段的区别

### 找出工资高于平均工资的员工

错误示范

```sql
select ename, sal from emp where sal > avg(sal);
```

以上代码是错误的，因为分组函数**不能**直接出现在where子句中

> `group by`会在`where`之后执行，`avg`要在`group by`之后才能执行，这里要`avg`在`where`之前执行，违反顺序，故报错

### count(*) 与 count(字段)

count(*)统计的是记录条数，而count(字段)统计的是某个字段的非NULL的数据量

分组函数可以组合使用

```
MariaDB [learnsql]> select count(*), sum(sal), max(sal), min(sal), avg(sal) from emp;
+----------+----------+----------+----------+-------------+
| count(*) | sum(sal) | max(sal) | min(sal) | avg(sal)    |
+----------+----------+----------+----------+-------------+
|       14 | 29025.00 |  5000.00 |   800.00 | 2073.214286 |
+----------+----------+----------+----------+-------------+
1 row in set (0.001 sec)
```

## group by 和 having

group by：按照某个或某些字段进行分组

having：对分组之后的数据进行再次过滤

### 案例：找出每个工作岗位的最高薪资

可以利用`group by`来进行分组查询

```
MariaDB [learnsql]> select max(sal) from emp group by job;
+----------+
| max(sal) |
+----------+
|  3000.00 |
|  1300.00 |
|  2975.00 |
|  5000.00 |
|  1600.00 |
+----------+
5 rows in set (0.001 sec)
```

分组函数一般都会和group by联合使用

任何一个分组函数都是在`group by`语句结束后才执行

当一条sql语句中无group by的话，整张表自成一组

执行顺序：

```
select      5
    ...
from        1
    ...
where       2
    ...
group by    3
    ...
having      4
    ...
order by    6
    ...
```

### 找出高于平均工资的员工

1. 找出平均工资
   ```sql
   select avg(sal) from emp;
   ```
2. 找出员工
   ```sql
   select ename, sal from emp where sal > (select avg(sal) from emp);
   ```

结果如下
```
MariaDB [learnsql]> select ename, sal from emp where sal > (select avg(sal) from emp);
+-------+---------+
| ename | sal     |
+-------+---------+
| JONES | 2975.00 |
| BLAKE | 2850.00 |
| CLARK | 2450.00 |
| SCOTT | 3000.00 |
| KING  | 5000.00 |
| FORD  | 3000.00 |
+-------+---------+
6 rows in set (0.002 sec)
```

这种方式叫做子嵌套查询

---

好了，本次的mariadb学习就到这里，谢谢各位的阅读
