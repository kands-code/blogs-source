---
title: mariadb数据库学习01
date: 2020-07-25 22:25:12
tags: [mariadb, learning]
categories: mariadb
---

# mariadb数据库学习01

> 本文基于北京动力节点老杜的mysql课程，大家可以直接看视频或者看我的博客，都算差不多的，这个系列的博客只是作为我的学习记录，仅供大家参考

<!--more-->

## 简单介绍mariadb

mariadb是mysql的一个分支，是一个<mark>开源</mark>的数据库管理系统

### 什么是数据库

数据库，说白了就是一个用来存储数据的仓库，而数据库管理系统就是用来管理数据库的，方便我们进行增删改查操作

### 为什么选择mariadb

最主要的点就是，免费！开源！

## 入门

### sql语句

简单过了一遍数据库和数据库管理系统，我们现在来讲讲sql语句，所谓的sql语句，就是在数据库管理系统中用来操作系统的语句，对应我们要实现的功能，我们通过sql语句来与数据库进行交互

### 数据库 表

数据库就是一堆数据组成的一个仓库，仓库可以有多个

而表，就是数据库里用来组织文件的一种方式具体有一下要点

- 列

列，又叫作字段，就是一组数据，一类数据，包含<mark>字段名</mark>、<mark>数据类型</mark>、<mark>相关约束</mark>

- 行

一行就是一条数据，或者说一条记录

- 主键

就是最关键的列，表依据主键组织数据

### sql语句分类

|分类|描述|举例|
|:--:|:--:|:--:|
|DQL|数据查询：查询语句|select语句都算DQL|
|DML|数据操作：对<mark>表数据</mark>进行增删改|insert、delete、update|
|DDL|数据定义：对<mark>表结构</mark>进行增删改|create、drop、alter|
|TCL|事务控制|commit、rollback|
|DCL|数据控制|grant（授权）、revoke（撤销权限）|

## 准备工作

### 安装

这个大家就不用我说了吧

win的直接安装即可，linux安装`mariadb-sever`和`mariadb-client`即可

> 不同发行版可能不太一样

之后对数据库进行初始化，这个步骤每个系统都不太一样，大家自行bing，我在这里就不多言了

### 登录

安装好，初始化完毕，我们就可以正式地使用mariadb了

在terminal窗口或者cmd窗口输入命令

```bash
sudo mysql -u root -p
```

输入以上命令即可以root用户身份登录，密码什么的自行输入，之后就会出现下列提示

```bash
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 38
Server version: 10.3.22-MariaDB-1ubuntu1 Ubuntu 20.04

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> 
```

不同版本可能在细微之处有所差异，但大体上是没有太大差别的

### 查看已有数据库

要查看已有数据库，可以使用<mark>mysql命令</mark>来查看

> 要注意，这个是mysql命令，不是通用sql语句，在其他数据库系统，如oracle，可能无法使用，看具体情况吧

命令是

```mysql
show databases;
```

要注意，语句都是要用英文分号`;`结尾的，输入后，就会出现一下输出

> 我这个不是初始化的数据库了，所以有不同的没问题

```bash
MariaDB [(none)]> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mydatabase         |
| mysql              |
| performance_schema |
+--------------------+
4 rows in set (0.001 sec)

MariaDB [(none)]> 
```

### 创建数据库

使用mysql命令

> 对于其他的数据库不一定适用

```mysql
create database mydatabase;
```

即可创建出一个数据库，输出如下

```bash
MariaDB [(none)]> create database mydatabase2;
Query OK, 1 row affected (0.001 sec)

MariaDB [(none)]> 
```

### 使用数据库

使用mysql命令

```mysql
use mydatabase;
```

输出如下

```bash
MariaDB [(none)]> use mydatabase2;
Database changed
MariaDB [mydatabase2]> 
```

注意到方括号内由`(none)`变成了`mydatabase2`，数据库切换成功

> 由于我已经创建过了<mark>mydatabase</mark>数据库，故在此我使用<mark>mydatabase2</mark>作为替代

### 查看数据库里的表

使用mysql命令

```mysql
show tables;
```

可看到我们新创建的数据库里是什么也没有的

```bash
MariaDB [mydatabase2]> show tables;
Empty set (0.001 sec)

MariaDB [mydatabase2]> 
```

而在一个已经创建了表的数据库内，输出结果如下

```bash
MariaDB [mydatabase]> show tables;
+----------------------+
| Tables_in_mydatabase |
+----------------------+
| DEPT                 |
| EMP                  |
| SALGRADE             |
+----------------------+
3 rows in set (0.001 sec)

MariaDB [mydatabase]> 
```

这就是我们要创建的数据库的样子

### 初始化数据

同样是mysql命令，执行一个[脚本](https://cdn.jsdelivr.net/gh/kands-code/blogs-source@main/bjpowernode.sql)来初始化我们的数据库

```mysql
source [文件路径]
```

执行效果如下（有点长，大家见谅）

```bash
MariaDB [mydatabase2]> source /home/kands/文档/资料/动力节点_郭鑫_03_MySQL_资料/bjpowernode.sql
Query OK, 0 rows affected, 1 warning (0.002 sec)

Query OK, 0 rows affected, 1 warning (0.001 sec)

Query OK, 0 rows affected, 1 warning (0.000 sec)

Query OK, 0 rows affected (0.011 sec)

Query OK, 0 rows affected (0.008 sec)

Query OK, 0 rows affected (0.007 sec)

Query OK, 1 row affected (0.001 sec)

Query OK, 1 row affected (0.001 sec)

Query OK, 1 row affected (0.001 sec)

Query OK, 1 row affected (0.001 sec)

Query OK, 0 rows affected (0.000 sec)

Query OK, 1 row affected (0.001 sec)

Query OK, 1 row affected (0.001 sec)

Query OK, 1 row affected (0.001 sec)

Query OK, 1 row affected (0.001 sec)

Query OK, 1 row affected (0.001 sec)

Query OK, 1 row affected (0.001 sec)

Query OK, 1 row affected (0.001 sec)

Query OK, 1 row affected (0.001 sec)

Query OK, 1 row affected (0.001 sec)

Query OK, 1 row affected (0.001 sec)

Query OK, 1 row affected (0.001 sec)

Query OK, 1 row affected (0.001 sec)

Query OK, 1 row affected (0.001 sec)

Query OK, 1 row affected (0.001 sec)

Query OK, 0 rows affected (0.000 sec)

Query OK, 1 row affected (0.002 sec)

Query OK, 1 row affected (0.001 sec)

Query OK, 1 row affected (0.002 sec)

Query OK, 1 row affected (0.001 sec)

Query OK, 1 row affected (0.001 sec)

Query OK, 0 rows affected (0.000 sec)

MariaDB [mydatabase2]> 
```

此时我们再看我们的数据库内，已经建好了我们联系所需要的表了

```bash
MariaDB [mydatabase2]> show tables;
+-----------------------+
| Tables_in_mydatabase2 |
+-----------------------+
| DEPT                  |
| EMP                   |
| SALGRADE              |
+-----------------------+
3 rows in set (0.001 sec)

MariaDB [mydatabase2]> 
```

> 注意到我这里是mydatabse2，成功初始化了

#### sql脚本

刚刚我们导入数据所用到的，以`.sql`结尾的脚本文件就是sql脚本，内含了大量sql语句，算是批量化导入数据的利器

### 删除数据库

```mysql
drop database mydatabase2;
```

> 我这里使用mydatabase2，大家使用自己的命名

效果如下

```bash
MariaDB [mydatabase2]> drop database mydatabase2;
Query OK, 3 rows affected (0.017 sec)

MariaDB [(none)]> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mydatabase         |
| mysql              |
| performance_schema |
+--------------------+
4 rows in set (0.001 sec)

MariaDB [(none)]> 
```

可见，新创建的mydatabase2已经不见了，数据库被删除

> 如果删除了数据库的同学麻烦再做一遍，之后的博客会基于我们所创建出来的这个数据库进行练习

---

这篇博客就到这里了，大概讲了一下数据库系统的一些操作要领，重点是sql语句的分类以及数据库的操作

谢谢大家的阅读！
