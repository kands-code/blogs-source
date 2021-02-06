---
title: chapter12学习笔记（三）
date: 2020-07-29 20:28:09
tags: [C, programming, learning]
categories: C Primer Plus
---

# chapter12学习笔记（三）

<!--more-->

## 章节概要

### Storage Duration

之前提到的作用域以及链接方式(linkage)都是描述标识符的可见性的，而这次要讲的存储时间(duration)则是描述这些能够通过标识符访问的实体(或对象，object)所能够坚持(persistence)的时间，存储时间可分为一下几类：

- static storage duration
- thread storage duration
- automatic storage duration
- allocated storage duration

> 我只所以没有全翻译，部分搬抄原文，是因为我的翻译水平远远不够，部分翻译为个人理解，存在偏差，一些可能存在歧义或多重含义的语句或词语我就留下了原文，以供参考，出现过原文的部分之后就会改为我自己的理解式翻译，希望大家见谅

拥有静态存储时间说明这个实体在程序的运行(execution)期间是一直存在的，有文本作用域(file scope)的变量具有静态存储时间

> 注意，static只是作用域，与存储时间无关，但凡是file scope都有static storage duration，不论是internal还是external

进程(thread)存储时间这个概念在并发式程序上才有，并发式程序就是一个程序在运行时能够被分成多个进程，一个拥有进程存储时间的实体存在于从它被声明起到进程结束这个时间段里

想要创建这样一个实体，你需要声明一个file scope variable，但这还不够，单是文本作用域会被认为是静态存储时间的，还需要在声明时加上关键字`_Thread_local`才行，注意下划线和大小写，这样创建的变量在每个进程启动时都会得到这个变量的一个私有副本，在每个线程中独立存在

一般而言，块作用域的变量一般默认含有自动存储时间，在进入代码块时为这些变量分配内存，一旦出了代码块，变量就会被释放，即变量消失，所对应的实体也被清除

这些变量就好比一个可以重复使用(reused)的工作区或是暂存器(scratch pad)，运行时使用，不用了就放弃

这里要注意，变长数组(VLA)是自其被声明起到代码块结束为止存在，而不是进入代码块就分配内存

> 可以说到目前为止，我们使用的c语言变量都是自动存储时间的

当然，存在一种比较特殊的类型，它们即是块作用域，还是静态存储时间，在代码块内使用`static`关键字来实现

```c
void more(int number)
{
    int index;
    static int ct = 0;
    ...
    return 0;
}
```

变量`ct`就是这样一个变量，我们在`more`函数代码块外无法使用`ct`标识符来访问`ct`的空间(实体)，但可以使用指针的方式在外面间接的`ct`变量所对应的实体

## 阶段总结

由于_C primer plus_这本书没有并发式编程的内容，所以不会涉及线程存储时间相关的知识，仅作了解即可，感兴趣的可以自己去百度 (bing)查询

那么，剩下的部分根据c语言的存储体系(scheme)可分为五类

|        Storage Class         | Duration  | Scope | Linkage  |                    How Declared                    |
| :--------------------------: | :-------: | :---: | :------: | :------------------------------------------------: |
|          automatic           | Automatic | Block |   None   |                     In a block                     |
|           register           | Automatic | Block |   None   |       In a block with the keyword `register`       |
| static with external linkage |  Static   | File  | External |              Outside of all functions              |
| static with internal linkage |  Static   | File  | Internal | Outside of all functions with the keyword `static` |
|    static with no linkage    |  Static   | Block |   None   |        In a block with the keyword `static`        |

---

本次博客到此结束了，谢谢大家阅读！
