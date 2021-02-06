---
title: chapter12学习笔记（五）
date: 2020-08-18 20:28:15
tags: [C, learning, programming]
categories: C Primer Plus
---

# chapter12学习笔记（五）

<!--more-->

## 章节概要

### Register Variables

*register*，就是我们平常说的寄存器，可以说是计算机存取最快的内存了（the fastest memory）

一般的变量都是存放在计算机的内存中的，但是 *register variable* 和他们就不一样，寄存器变量比较幸运（with lucky），它能够存储在寄存器中！这通常意味着这个变量需要频繁访问，读取

但是这也是有代价的，你无法读取寄存器变量的内存地址（address）

除此之外，他们与自动型变量（automatic variable）没什么区别，甚至可能就是自动型变量，因为编译器会进行优化，如果我们对于一个定义为寄存器类型的变量访问不是很频繁，它就会把这个变量变成自动型变量

这也是为什么我们要说 *幸运* 这个词了，因为**即便是寄存器变量，也只是有一定几率会存放进寄存器**

使用寄存器变量可以使用如下形式：

```c
int main(void)
{
    register int quick;
```

也就是：

```c
register 类型 标识符;
```

这样就完成了寄存器变量的声明（declare）

### Static Variables with Block Scope

关于静态变量，要注意的是静态变量，*静* 的是<mark>内存地址</mark>（stays put in memory），而非变量的<mark>值</mark>

一般而言，全局变量（file scope）具有且一定具有静态属性，但是，我们也可以手动创建具有静态属性的本地变量，这些变量不会在函数结束后或括号范围外自动消失，块级作用域，没有连接属性（no linkage），但是有静态存储的生命周期（duration），例如：

```c
/* loc_stat.c -- using a local static variable */
#include <stdio.h>
void trystat(void);

int main(void)
{
    int count;
    
    for (count = 1; count <= 3; count++)
    {
        printf("Here comes iteration %d:\n", count);
        trystat();
    }
    
    return 0;
}

void trystat(void)
{
    int fade = 1;
    static int stay = 1;
    
    printf("fade = %d and stay = %d\n", fade++, stay++);
}
```

输出效果如下：

```bash
Here comes iteration 1:
fade = 1 and stay = 1
Here comes iteration 2:
fade = 1 and stay = 2
Here comes iteration 3:
fade = 1 and stay = 3
```

可见，变量`stay`只被初始化了一次，函数结束时内存地址被保留，其中的值自然也被留下，但是变量`fade`则是每次唤起函数`trystat`时重新分配地址赋值，所以才会产生这样的输出

我们看到这两个声明：

```c
int fade = 1;
static int stay = 1;
```

通过调试，我们可以知道，第一句是函数的一部分，每次函数执行时都会执行，而第二句就不同了，在调试时我们可以看到，我们似乎是跳过了这一步，事实上，静态变量和external variable在程序被加载到内存时就已经完成初始化了，而将其声明语句放在`trystat`函数内，是为了告诉编译器，只有在这个函数内，这个变量才是可见的

所以，我们是不可以使用静态变量作为函数参数的

```c
int wontwork(static int flu);	// not allowed
```

> 在一些老的C语言文献里，这样的静态变量还被称为<mark>internal static storage class</mark>，当然，这里的internal不是指**internal linkage**，而是**internal to a function**

---

本次博客就写到这里，谢谢大家的阅读与支持
