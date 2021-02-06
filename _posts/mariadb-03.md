---
title: mariadb数据库学习03
date: 2021-01-19 07:07:55
tags: [mariadb, learning]
categories: mariadb 
---

# mariadb数据库学习03

<!--more-->

## 简单的查询语句(DQL)

### 语法格式

```sql
select 字段名1,字段名2,... from 表名;
```

> 注意，每条sql语句要以分号`;`结尾

#### 提示(tips)

sql语句是<mark>**不分**</mark>大小写的，大家一定要注意

但标准形式应当为**全大写**

### 示例：查询员工表的员工工号(EMPNO)和名字(ENAME)

```sql
SELECT EMPNO, ENAME FROM EMP;
```

以上就是一条标准的查询语句，效果如下

```
MariaDB [learn_sql]> SELECT EMPNO, ENAME FROM EMP;
+-------+--------+
| EMPNO | ENAME  |
+-------+--------+
|  7369 | SMITH  |
|  7499 | ALLEN  |
|  7521 | WARD   |
|  7566 | JONES  |
|  7654 | MARTIN |
|  7698 | BLAKE  |
|  7782 | CLARK  |
|  7788 | SCOTT  |
|  7839 | KING   |
|  7844 | TURNER |
|  7876 | ADAMS  |
|  7900 | JAMES  |
|  7902 | FORD   |
|  7934 | MILLER |
+-------+--------+
14 rows in set (0.000 sec)
```

如果要查询员工的年薪

```sql
MariaDB [learn_sql]> SELECT ENAME, SAL * 12 FROM EMP;
```

结果如下：

```
+--------+----------+
| ENAME  | SAL * 12 |
+--------+----------+
| SMITH  |  9600.00 |
| ALLEN  | 19200.00 |
| WARD   | 15000.00 |
| JONES  | 35700.00 |
| MARTIN | 15000.00 |
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
14 rows in set (0.008 sec)
```

之所以要`SAL * 12`，是因为表里的`SAL`记录的是员工一个月的薪水（月薪），要取年薪，自然要乘以12

> 当然，这个只是简单估算，现实的年薪应该还包括奖金之类的东西，一般要比月薪×12要高一点

这个例子很直观的表明了查询的字段可以直接参与数学运算，同时，对于表中的`SAL * 12`，SQL中还可以对查询结果的表的字段重命名

```sql
SELECT ENAME, SAL * 12 AS YEAR_SAL FROM EMP;
```

通过`AS`关键字就可以起别名了

> 有点Python那味了，import numpy as np

自然，结果如下：

```
MariaDB [learn_sql]> SELECT ENAME, SAL * 12 AS YEAR_SAL FROM EMP;
+--------+----------+
| ENAME  | YEAR_SAL |
+--------+----------+
| SMITH  |  9600.00 |
| ALLEN  | 19200.00 |
| WARD   | 15000.00 |
| JONES  | 35700.00 |
| MARTIN | 15000.00 |
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
14 rows in set (0.000 sec)
```

> 在mysql（mariadb）中，字符串可以用单双引号，但其他sql要求单引号括起来

```sql
SELECT ENAME '员工姓名', SAL * 12 AS '年薪' FROM EMP;
```

> `AS`关键字可以省略

结果如下：

```
MariaDB [learn_sql]> SELECT ENAME '员工姓名', SAL * 12 AS '年薪' FROM EMP;
+--------------+----------+
| 员工姓名     | 年薪     |
+--------------+----------+
| SMITH        |  9600.00 |
| ALLEN        | 19200.00 |
| WARD         | 15000.00 |
| JONES        | 35700.00 |
| MARTIN       | 15000.00 |
| BLAKE        | 34200.00 |
| CLARK        | 29400.00 |
| SCOTT        | 36000.00 |
| KING         | 60000.00 |
| TURNER       | 18000.00 |
| ADAMS        | 13200.00 |
| JAMES        | 11400.00 |
| FORD         | 36000.00 |
| MILLER       | 15600.00 |
+--------------+----------+
14 rows in set (0.001 sec)
```

## 条件查询

### 语法格式

```sql
SELECT 字段1, 字段2,... FROM 表名 WHERE 条件;
```

执行顺序为 `from->where->select`

### 查询案例

#### 工资等于5000的工资的员工姓名

```sql
SELECT ENAME FROM EMP WHERE SAL = 5000;
```

> 注意这里，sql中等于不是双等号，是一个等号

结果如下：

```
MariaDB [learn_sql]> SELECT ENAME FROM EMP WHERE SAL = 5000;
+-------+
| ENAME |
+-------+
| KING  |
+-------+
1 row in set (0.000 sec)
```

#### 查询SMITH的工资

```sql
SELECT SAL FROM EMP WHERE ENAME = 'SMITH';
```

```
MariaDB [learn_sql]> SELECT SAL FROM EMP WHERE ENAME = 'SMITH';
+--------+
| SAL    |
+--------+
| 800.00 |
+--------+
1 row in set (0.001 sec)
```

#### 工资大于等于3000的员工

```sql
SELECT ENAME FROM EMP WHERE SAL >= 3000;
```

结果如下：

```
MariaDB [learn_sql]> SELECT ENAME FROM EMP WHERE SAL >= 3000;
+-------+
| ENAME |
+-------+
| SCOTT |
| KING  |
| FORD  |
+-------+
3 rows in set (0.001 sec)
```

> 不等于：`<>` 或者 `!=`，在两个值之间的数据：`between ... and ...` 或者 ` ... >= ... and ... <= ...` (闭区间)

示例如下：

```sql
SELECT ENAME FROM EMP WHERE SAL >= 1100 AND SAL <= 3000;

或者

SELECT ENAME FROM EMP WHERE SAL BETWEEN 1100 AND 3000;
```

> 注意，between and 一定要小数在前大数在后

结果：

```
MariaDB [learn_sql]> SELECT ENAME FROM EMP WHERE SAL >= 1100 AND SAL <= 3000;
+--------+
| ENAME  |
+--------+
| ALLEN  |
| WARD   |
| JONES  |
| MARTIN |
| BLAKE  |
| CLARK  |
| SCOTT  |
| TURNER |
| ADAMS  |
| FORD   |
| MILLER |
+--------+
11 rows in set (0.001 sec)
```

对应的条件还有`is null`, `and`, `or`, `in`, `not`, `like`

都是字面意思，很好理解，其中`like`对应了模糊查询，`in`表示包含就行，相当于多个`or`

#### 查询薪资 大于1000 且 部门编号 是20或30 的部门员工

```sql
MariaDB [learn_sql]> SELECT ENAME, SAL, DEPTNO FROM EMP WHERE SAL > 1000 AND (DEPTNO = 20 OR DEPTNO = 30);
+--------+---------+--------+
| ENAME  | SAL     | DEPTNO |
+--------+---------+--------+
| ALLEN  | 1600.00 |     30 |
| WARD   | 1250.00 |     30 |
| JONES  | 2975.00 |     20 |
| MARTIN | 1250.00 |     30 |
| BLAKE  | 2850.00 |     30 |
| SCOTT  | 3000.00 |     20 |
| TURNER | 1500.00 |     30 |
| ADAMS  | 1100.00 |     20 |
| FORD   | 3000.00 |     20 |
+--------+---------+--------+
9 rows in set (0.001 sec)

MariaDB [learn_sql]> SELECT ENAME, SAL, DEPTNO FROM EMP WHERE SAL > 1000 AND DEPTNO = 20 OR DEPTNO = 30;
+--------+---------+--------+
| ENAME  | SAL     | DEPTNO |
+--------+---------+--------+
| ALLEN  | 1600.00 |     30 |
| WARD   | 1250.00 |     30 |
| JONES  | 2975.00 |     20 |
| MARTIN | 1250.00 |     30 |
| BLAKE  | 2850.00 |     30 |
| SCOTT  | 3000.00 |     20 |
| TURNER | 1500.00 |     30 |
| ADAMS  | 1100.00 |     20 |
| JAMES  |  950.00 |     30 |
| FORD   | 3000.00 |     20 |
+--------+---------+--------+
10 rows in set (0.001 sec)
```

上面两个例子说明了`and`和`or`的优先级，`and`大于`or`

> 实在不确定，直接加括号就行了

还可以用`in`改写

```sql
MariaDB [learn_sql]> SELECT ENAME, SAL, DEPTNO FROM EMP WHERE SAL > 1000 AND DEPTNO IN(20, 30);
+--------+---------+--------+
| ENAME  | SAL     | DEPTNO |
+--------+---------+--------+
| ALLEN  | 1600.00 |     30 |
| WARD   | 1250.00 |     30 |
| JONES  | 2975.00 |     20 |
| MARTIN | 1250.00 |     30 |
| BLAKE  | 2850.00 |     30 |
| SCOTT  | 3000.00 |     20 |
| TURNER | 1500.00 |     30 |
| ADAMS  | 1100.00 |     20 |
| FORD   | 3000.00 |     20 |
+--------+---------+--------+
9 rows in set (0.001 sec)
```

在模糊查找中，`%`表示**任意多字符**，`_`表示**一个字符**

例如找第二个字母是`A`的：

```sql
MariaDB [learn_sql]> SELECT ENAME FROM EMP WHERE ENAME LIKE '_A%';
+--------+
| ENAME  |
+--------+
| WARD   |
| MARTIN |
| JAMES  |
+--------+
3 rows in set (0.001 sec)
```

> 如果要查找含下划线的，需要转义，如：`%\_%`

---

好，数据库的查询笔记到此为止，谢谢大家阅读！
