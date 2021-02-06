---
title: mariadb数据库学习02
date: 2020-08-17 22:25:15
tags: [mariadb, learning]
categories: mariadb
---

# mariadb数据库学习02

<!--more-->

## 查看表结构

首先切换到我们自己导入创建好的数据库，通过`show tables`命令，我们可以看到数据库有哪些表

```mysql
MariaDB [mydatabase]> show tables;
+----------------------+
| Tables_in_mydatabase |
+----------------------+
| dept                 |
| emp                  |
| salgrade             |
+----------------------+
3 rows in set (0.007 sec)
```

要查看每张表的结构，我们可以使用`desc`命令来实现

- dept

```mysql
MariaDB [mydatabase]> desc dept;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| DEPTNO | int(2)      | NO   | PRI | NULL    |       |
| DNAME  | varchar(14) | YES  |     | NULL    |       |
| LOC    | varchar(13) | YES  |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+
3 rows in set (0.031 sec)
```

- emp

```mysql
MariaDB [mydatabase]> desc emp;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| EMPNO    | int(4)      | NO   | PRI | NULL    |       |
| ENAME    | varchar(10) | YES  |     | NULL    |       |
| JOB      | varchar(9)  | YES  |     | NULL    |       |
| MGR      | int(4)      | YES  |     | NULL    |       |
| HIREDATE | date        | YES  |     | NULL    |       |
| SAL      | double(7,2) | YES  |     | NULL    |       |
| COMM     | double(7,2) | YES  |     | NULL    |       |
| DEPTNO   | int(2)      | YES  |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+
8 rows in set (0.015 sec)
```

- salgrade

```mysql
MariaDB [mydatabase]> desc salgrade;
+-------+---------+------+-----+---------+-------+
| Field | Type    | Null | Key | Default | Extra |
+-------+---------+------+-----+---------+-------+
| GRADE | int(11) | YES  |     | NULL    |       |
| LOSAL | int(11) | YES  |     | NULL    |       |
| HISAL | int(11) | YES  |     | NULL    |       |
+-------+---------+------+-----+---------+-------+
3 rows in set (0.011 sec)
```

> 以上的内容为各个表的结构，说明了表有哪几项以及每项的情况，比如每项的名称，类型，是否为主键等等

## 查看表格数据

之前的我们输入的如`source`，`show`，以及`use`等等，都是mysql（maraidb）的命令，其他的数据库管理系统是不一定有的，可能在Oracle数据库又是另一套命令

现在，我们要接触到第一个sql语句了，那就是`select`

```mysql
MariaDB [mydatabase]> select * from emp;
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
14 rows in set (0.023 sec)
```

这句指令的意思就是从<mark>emp</mark>表中选取**所有**内容，展现出来的就是emp表中的具体数据

> 要注意的是，mysql或者mariadb是关系型数据库，表中的各个元素，不同的表之间，都是有相互联系的，而非完全独立的，所以要完整的分析数据库里的元素，需要看所有表的一个整体效果

## mariadb中的常用命令/语句

1. 查看mariadb的版本

```bash
PS C:\Users\31280> mariadb --version
C:\Program Files\MariaDB 10.5\bin\mariadb.exe  Ver 15.1 Distrib 10.5.5-MariaDB, for Win64 (AMD64), source revision 5b3d3792e28fc7a875c7060f772e42a9cd922f83
```

   或者

```bash
PS C:\Users\31280> mariadb -V
C:\Program Files\MariaDB 10.5\bin\mariadb.exe  Ver 15.1 Distrib 10.5.5-MariaDB, for Win64 (AMD64), source revision 5b3d3792e28fc7a875c7060f772e42a9cd922f83
```

   这就是长选项(GNU风格)和短选项(UNIX风格)的区别而已，效果一致，注意，短选项是大写`V`，不是小写

2. 创建数据库

```mysql
create database xxx;
```

   这样，你就创建出来了一个叫<mark>xxx</mark>的数据库了

3. 查询正在使用的数据库

   > 这个在mariadb显得有点多余，因为mariadb自带显示

```mysql
MariaDB [mydatabase]> select database();
+------------+
| database() |
+------------+
| mydatabase |
+------------+
1 row in set (0.001 sec)
```

4. 终止语句

   可以使用`\c`来终止语句

```bash
MariaDB [mydatabase]> select *
-> from
->
->
-> \c
MariaDB [mydatabase]>
```

5. 退出

   可以使用`\q`或者`quit`，`exit`来退出mariadb

## 查看表的创建语句

可以使用mariadb的命令`show`来查看表的创建语句，来了解表是如何创建出来的

```mysql
MariaDB [mydatabase]> show create table emp;
+-------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table | Create Table


                                                                             |
+-------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| emp   | CREATE TABLE `emp` (
  `EMPNO` int(4) NOT NULL,
  `ENAME` varchar(10) DEFAULT NULL,
  `JOB` varchar(9) DEFAULT NULL,
  `MGR` int(4) DEFAULT NULL,
  `HIREDATE` date DEFAULT NULL,
  `SAL` double(7,2) DEFAULT NULL,
  `COMM` double(7,2) DEFAULT NULL,
  `DEPTNO` int(2) DEFAULT NULL,
  PRIMARY KEY (`EMPNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 |
+-------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.003 sec)
```

由此，我们知道了，emp是怎么创建出来的了

---

好了，本篇博客就到此结束了，谢谢各位的阅读
