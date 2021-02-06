---
title: chapter12学习笔记（一）
date: 2020-07-26 20:28:02
tags: [C, programming, learning]
categories: C Primer Plus
---

# chapter12学习笔记（一）

> chapter02\~chapter11的课后习题，我的答案都已经上传github了，有兴趣的可以看看

<!--more-->

## 概览

### 标题

Strorage Classes, Linkage, and Memory Management

存储分类，链接，以及内存管理

> 从标题就可以看出，这一章讲得是c语言的一个核心部分，数据存储

### 要求

#### 关键字

auto, extern, static, register, const, volatile, restricted, \_Thread\_local, \_Atomic

#### 函数

rand(), srand(), time(), malloc(), calloc(), free()

#### 关键点

- c语言是如何让你决定一个变量的作用域以及其生命周期的呢？
- 设计复杂程序

## 章节概要

### Storage Classes

c语言为我们提供了许多的存储类型用于对数据进行分类排序

> 术语表：
>
> object（实体）：一块内存，可存储一个或多个值，可以没有保存任何值，但要有合适的大小来存储合适的值

在硬件层面，object就是一块物理内存

在软件层面，我们要访问object，我们可以通过定义变量来实现，我们定义的变量就指向了一个object，对应一块内存空间，但这并不是唯一的方法，例如

```c
int * pt = &entity;
int rank[10];
```

`*pt`并不是一个变量名，但是它指向了一个object，即`entity`所指向的object

>术语表：
>
>lvalue（左值）：一般指的是计算机内存的object，l对应location，即内存地址

```c
// 在本例中
rank + 2 * entity; // 不是一个左值，也不是变量名
*(rank + 2 * entity); // 是一个左值
```

一般而言，你可以通过左值来修改object中存储的值，即_可修改左值_,但是

```c
const char * pc = "Behold a string iteral!";
```

pc为可修改左值，`const`保护的是pc指向的值，而不是pc所存放的内存地址，而`*pc`是不可修改的左值

一般而言，我们可以用存储周期来描述object

> 一个变量名依据他的作用域和链接来访问object

---

本篇博客到此结束，谢谢大家的阅读
