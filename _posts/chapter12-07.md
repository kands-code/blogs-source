---
title: chapter12学习笔记（七）
date: 2021-02-05 08:10:49
tags: [C, programming, learning]
categories: C Primer Plus
---

# chapter12学习笔记（七）

这次我们来总结一下，再继续学习下面的内容

<!--more-->

## 阶段总结

### Storage Classes 存储类别

#### Scope

Scope，直译就是范围，能力的意思，在这的中文意思是作用域

很好理解，就是说的这个变量所能够影响的范围，影响能力有多大

对于一个C语言变量来说，拥有以下四种作用域的一种：

- block scope 块作用域
- function scope 函数作用域
- function prototype scope 函数原型作用域
- file scope 文件作用域，全局作用域

块，即代码块，一般就是说的一对大括号的范围，当然，在比较简单的语句是可以省略掉大括号的，但依旧是代码块，其中定义的的变量依旧具有 *该代码块的作用域*

而函数原型作用域和函数作用域分别指的是函数原型中代表输入的变量的作用域和函数定义中所定义的变量的作用域，例如：

```c
void test(int n); // 此处n具有函数原型作用域

...

void test(int n) {
    int i = 8; // 此处i具有函数作用域
    
    return i + n;
}
```

`n`在脱离函数原型后就失效了，而`i`在离开函数的定义范围后就失效了

file scope就是文件作用域，即对于该文件，这个变量在这个文件内都是有效的

##### Translation Units and Files

这里提到了一个很重要的概念，编译单元

我们使用`#include`来引入头文件时，这个头文件同时可能引入了其他头文件，使得你这个文件与很多实实在在的文件相关联

在预处理(preprocessing)步骤中，这些`#include`语句往往会被引入的内容(contents)所替代，完成所有预处理步骤后的文件就被称为一个编译单元

我们所谓的文件作用域，文件指的并不是原本的文件，而是预编译后产生的编译单元这样一个文件，而每个编译单元与其源文件和关联的头文件相关

#### Linkage

对于一个C语言变量来说，它可以是外部链接的(external linkage)，也可是内部链接的(internal linkage)，甚至可以是无链接的（no linkage）

内部链接说的是这个变量可以在一个编译单元内使用，而外部链接变量可以在其他编译单元使用

要辨别一个文件作用域变量是否是内部链接，可以看**Storage Classes Keywords**`static`

`static`的文件作用域变量具有内部链接

而对于一个块作用域的变量，它的连接属性都是`None`

#### Storage Duration

存储周期说白了就是这个变量的存在时间，对于一个C语言变量来说，它可以有一下四种存储周期：

- static storage duration
- thread storage duration
- automatic storage duration
- allocated storage duration

一个拥有文件作用域的变量有静态存储周期

> `static`只标注了链接，而非存储周期

而线程存储周期是对于一个在线程定义的变量来说的，这样的一个变量是通过`_Thread_local`关键字修饰的全局变量，每个线程拥有一个这个变量的私有的(private)副本（copy）

被`static`修饰的块作用域变量具有静态存储周期，除此之外，一般情况下，块作用域变量是自动存储周期的，在大括号开始到结束

> vla略有区别，它是从定义处到大括号结束为他的作用域，也是自动存储类型

而分配存储周期需要手动释放(free)或者到程序结束自动释放

#### Automatic Variables

一般对于变量，默认是auto类型，无需写出，`auto`为其标识符，但是由于C和C++的auto并不一样，为了兼容，最好不要用`auto`这个内存标识符了

#### Register Variables

如果你想要一个变量快速读取，你可以试着将它存到寄存器中，使用`register`关键字，当然，具体是否放进去还是要看你的硬件和编译器了

#### Static Variables with External Linkage

一个具有外部链接属性且是静态的变量具有全局作用域，有时候也称为*external storage class*

定义一个外部链接的变量，如果在代码块外，则需要你在其他地方（指其他文件定义过），而代码块内，则表明你用的是外部（指代码块外，可能是其他文件）定义过的变量。

## Storage Classes

### Static Variables with Internal Linkage

根据之前的表格可知，内部链接的静态变量指的是由`static`修饰的代码块外的变量，例如：
```c
static int svil = 1;    // static variables, internal linkage
int main(void) 
{
    ...
}
```

这种变量用术语说叫做`external static variables`，但是这个变量是内部链接的，所以我们称他`Static Variables with Internal Linkage`

对于这样一个例子：
```c
int taveler = 1;    // external
static int stayhome = 1;    // internal
int main(void)
{
    extern int taveler;
    extern int stayhome;    // stayhome依旧是internal
    ...
}
```

### Multiple Files 多文件

内部链接与外部链接的区别仅在多文件程序中体现

外部链接的变量使得你无法定义其他同名的变量，只能显式的声明（extern）这个变量

有些Unix的编译器允许你在多文件中不带`extern`声明多个同名变量，一旦有个变量被初始化，那么这将会被视作定义，其他的则会被认为是声明

### Storage-Class Specifier Roundup

C语言中（目前）有六个存储类别标识符，分别是`auto`，`register`，`static`，`extern`，**`_Thread_local`**以及<mark>**`typedef`**</mark>

在这其中，除了`_Thread_local`外，其他的标识符都无法和另外的标识符连用，`_Thread_local`偶尔和`static`和`extern`连用

`auto`标识符实际上只有记号作用，应为他只能用于块变量，而代码块内的变量已经是`automatic`的了

`register`基本一样且也只能用于块变量，他用于需要快速存取的变量，但只是有可能会被放进寄存器中，且这种的变量无法获取地址

> 自动变量就是说在程序离开相应代码块后会被自动释放(free)掉的变量，如果未初始化默认为垃圾值（garbage value）
> 静态变量在程序编译时就已完成赋值，且如果未初始化，默认赋值为0

**一个好的设计是不需要全局变量的**

a better design wouldn't need the file-scope variables

---
本次博客到此结束，谢谢大家的阅读
