---
title: chapter12学习笔记（二）
date: 2020-07-27 20:28:06
tags: [C, programming, learning]
categories: C Primer Plus
---

# chapter12学习笔记（二）

> 继续上一篇文章

<!--more-->

## 章节概要

### Scope

scope（作用域）是用来说明一个标识符的作用范围的，在什么范围内程序能够访问到这个标识符，那这个范围就是这个标识符的作用域

一个c语言变量有如下作用域范围：

- block scope
- function scope
- function prototype scope
- file scope

一个变量，如果在代码块内定义，那么它就只有block scope，自它被定义到代码块结束，它都可以被访问到，函数的小括号内定义的变量也是block scope，是包含在函数的代码块内的

```c
double blocky(double cleo)
{
    double patrick = 0.0;
    ...
    return patrick;
}
```

>cleo和patrick都算block scope

如果是在`if`或者`for`之类的代码块内定义的变量，范围只在那个代码块内

```c
double blocky(double cleo)
{
    double patrick = 0.0;
    int i;
    for (i = 0; i < 10; i++)
    {
        double q = cleo * i;	// start of scope for q
        ...
        patrick *= q;
    }							// end of scope for q
    
    return patrick;
}
```

> C99之前，你需要将block scope的变量定义在block的开始，之后，放松了标准，可以在任一位置定义

```c
// after C99
for (int i = 0; i < 10; i++)
    printf("A C99 feature: i = %d\n", i);
```

function scope只对于labels有用，即`goto`语句配合使用，表明这个标签的范围是整个函数/代码块，而不是从它第一次出现开始（类比block scope），这防止了两个代码块内的相同标签引起的冲突

function prototype scope只针对于函数原型内定义的变量，例如

```c
int mighty(int mouse, double large);
```

> 说白了，就是说在函数原型里，变量名不重要，到分号就结束了，重要的是变量个数和类型，但是在使用变长数组时要注意一下
>
> ```c
> void use_a_VLA(int n, int m, int ar[n][m]);
> ```
>
> 变长数组方括号内的变量需要在之前就定义好

在block之外定义的变量具有file scope（或称_global variable_，全局变量)，自它定义到文件结束都有效（可见）

```c
#include <stdio.h>
int units = 0;		/* a variable with file scope */
void critic(void);
int main(void)
{
    ...
}
void critic(void)
{
    ...
}
```

> 这里，main和critic都可以使用units，file scope with external linkage

### linkage

c语言变量含有以下链接方式：

- external linkage
- internal linkage

- no linkage

block scope，function scope或者function prototype scope的变量都<mark>no linkage</mark>是意味着他们是私有的，独属于block，函数，或原型

而file scope则还含有external linkage或者internal linkage，有external linkage的变量可以在其他文件内使用，而internal linkage可以在单个编译单元（single translation unit）内使用（一般为单个文件）

>Formal and Informal Terms
>
>The C standard uses "file scope with internal linkage" to describe scope limited to one translation unit (a source file plus its include header files) and "file scope with external linkage" to describe scope that, at least potentially, extends to other translation units. But programmers don't always have the time or patience to use those terms. Some common short cuts are to use "file scope" for "file scope with internal linkage" and "gobal scope" or "program scope" for "file scope with external linkage."

区分一个file scope变量是`internal linkage`还是`external linkage`，可以看是否加了`static`存储分类标识符（storage class specifier），有`static`的就是`internal linkage`，例如

```c
int giants = 5;			// file scope, external linkage
static int dodgers = 3;	// file scope, internal linkage
int main()
{
    ...
}
...
```

---

好了，本次博客就到这里结束了，谢谢大家阅读
