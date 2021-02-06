---
title: 浅谈gdb与makefile
date: 2020-07-15 19:17:08
tags: [tools, programming, C, C++]
categories: programming
---

# 浅谈gdb与makefile

介绍几个C语言工具

<!--more-->

## gdb

### 什么是gdb

GNU所使用的一个debugger工具叫做gdb

### 为什么要用gdb

- 原始debug：printf

缺点：无法直观地获得错误信息

- 交给编译器debug

缺点：只能检查语法错误

- 使用debug工具：gdb

优点：直观，详细，功能相对丰富

缺点：麻烦，没有gui，对新手不友好

### 怎么使用gdb

- 编译过程：`gcc -g`
- 展示代码：`list `
- 设置断点：`b 行号`
- 执行程序：`run`
- 展示断点信息：`info b`
- 展示特定变量信息：`print [变量名\表达式]`
- 设置观测点：`display 变量名`
- 取消观测点：`undisplay 观测点编号 变量名`
- 退出gdb：`q`

## makefile

### 什么是makefile

- make

gnu工具组件，用于管理程序，组织编译过程

- makefile

一个脚本文件，用于配合make命令来编译或组织程序

### 为什么要用makefile

文件多，难以管理，需要使用makefile来协调依赖关系

### 怎么使用

#### 基本写法

```makefile
main: main.c
	gcc main.c -o main
	
目标: 依赖文件
	命令
```

makefile最大的作用：组织程序

#### 多文件

```makefile
main: main.c hello.c
	gcc main.c hello.c -o main
```

#### 规范一点

```makefile
main: main.o hello.o
	gcc main.o hello.o -o main
main.o: main.c
	gcc -c main.c
hello.o: hello.c
	gcc -c hello.c

clean:
	rm *.o main
```

#### makefile的变量

```makefile
exec=main
obj=main.o hello.o
cc=gcc
cflags=-Wall -g

$(exec): $(obj)
	$(cc) $(obj) -o $(exec) $(cflags)
main.o: main.c
	$(cc) -c main.c $(cflags)
hello.o: hello.c
	$(cc) -c hello.c $(cflags)
	
clean:
	rm *.o main
```

优点：方便我们修改makefile文件

---

好了，对于gdb和makefile就讲这么多，谢谢大家的阅读
