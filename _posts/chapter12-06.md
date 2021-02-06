---
title: chapter12学习笔记（六）
date: 2021-01-11 18:30:07
tags: [C, programming, learning]
categories: C Primer Plus
---

# chapter12学习笔记（六）

这回我们来看看有外部链接的静态变量

<!--more-->

## Static Variable with External Linkage

一个静态变量如果拥有外部链接，那么它就有了文件作用域（file scope）以及静态存储周期（static storage duration），意味着它在程序运行期间一直存在

用专业术语，这种类型就是 _external storage class_，对应的变量就是**external variable**，要定义一个这样的外部变量，顾名思义，就是要在函数的外部来定义式地声明（defining declaration）这样一个变量

当然，你可以**额外（addtionally）**在函数里通过关键字`extern`声明（declare）一个外部变量，这主要是为了注释，如果要引用在其他文件内定义的外部变量，则<mark>必须</mark>使用`extern`关键字

> 额外，或是可选（optional）就意味着实际上是不必要的

```c
int Errupt;         /* externally defined variable  */
double Up[100];     /* externally defined array     */
extern char Coal;   /* mandatory declaration if     */
                    /* Coal defined in another file */
void next(void);
int main(void)
{
    extern int Errupt;  /* optional declaration     */
    extern double Up[]; /* optional declaration     */
    ...
}

void next(void)
{
    ...
}
```

> 词汇表:
>
> mandatory adj. 强制的，法定的，义务的  n. 受托者

之所以在函数内声明数组`Up`的时候不需要指明数组内的元素个数，因为这些信息已经在原定义的地方说明了，而且这些声明并非必要的，因为外部变量具有文件作用域，在`main`函数这也是有用的，但是声明也并非毫无作用（serve），可以说明你想在`main`函数内使用这些变量

> 词汇表：
>
> serve v. 对...有用（在这里的含义）

如果你在`main`函数内不使用`extern`来声明变量，而是直接声明一个同名变量，这样就意味着你使用了一个独立的（separate）自动变量（automatic variable）来替换掉`main`函数作用域内的全局变量，即用

```c
int Errupt;
```

来替换

```c
extern int Errupt;
```

这时，`main`函数告诉编译器创造一个叫`Errupt`的独立的（separate），局部的（local），自动的（automatic）变量，与原来的（original）外部变量`Errupt`区分，不过这是在`main`函数范围内，其他函数，例如`next`，依旧在外部变量Errupt的作用域内

如果两个同名变量的作用域相互重叠，那么在那个代码块内，起作用的是作用域小的那个变量，作用域大的变量会被暂时隐藏（hide）起来

一般而言不会这样做，但如果你真的需要用同名的局部变量，你最好用内存标识符`auto`来说明（document）一下

由于外部变量具有静态存储周期，故对于`Up`这个数组，不论（regardless of）程序在执行什么函数，它和它的值（values）都存在

这里有三个例子，说明了自动变量和外部变量的联合使用（combinations）：

例子1中，`main`和`magic`都在外部变量`Hocus`的作用域内

```c
/* Example 1 */
int Hocus;
int magic();
int main(void)
{
    extern int Hocus;   // Hocus declared external
    ...
}
int magic()
{
    extern int Hocus;   // same Hocus as above
    ...
}
```

例子2中，`magic`中虽然没有声明`Hocus`，但是仍是可以使用的

```c
/* Example 2 */
int Hocus;
int magic();
int main(void)
{
    extern int Hocus;   // Hocus declared external
    ...
}
int magic()
{
                        // Hocus not declared but is known
    ...
}
```

例子3中，`main`和`magic`中的外部变量`Hocus`被自动变量`Hocus`覆盖，而且`main`中的`Hocus`和`magic`的是独立的

```c
/* Example 3 */
int Hocus;
int magic();
int main(void)
{
    int Hocus;      // Hocus declared, is auto by default
    ...
}
int Pocus;
int magic()
{
    auto int Hocus; // local Hocus declared automatic
    ...
}
```

> 词汇表：
>
> illustrate v. 说明，解释，加插图于...

### Initializing External Variables

外部变量默认会初始化为该类型的 _0_，但是如果你想要手动初始化也是可以的

```c
int x = 10;             // ok, 10 is constant
int y = 2 + 20;         // ok, a constant expression
size_t z = sizeof(int); // ok, a constant expression
int x2 = 2 * x;         // not ok, x is a variable
```

### Using an External Variable

这里直接看一个例子

```c global.c
/* global.c -- uses an external variable */
#include <stdio.h>
int units = 0;          /* an external variable         */
void critic(void);
int main(void)
{
    extern int units;   /* an optional redeclaration    */

    printf("How many pounds to a firkin of butter?\n");
    scanf("%d", &units);
    while (units != 56)
        critic();
    printf("You must have looked it up!\n");

    return 0;
}

void critic(void)
{
    /* optional redeclaration omitted */
    printf("No luck, my friend. Try again.\n");
    scanf("%d", &units);
}
```

输出效果如下

```shell
How many pounds to a firkin of butter?
14
No luck, my friend. Try again.
56
You must have looked it up!
```

在这里，`main`和`critic`都可以使用`units`

### External Names

现在对于局部的变量有效标识符长度为63个字符，而对于外部变量为31个字符，而在以前，局部是31个，外部为6个

> 词汇表：
>
> revise v. 修正
>
> comply v. 遵守

### Definitions and Declarations

就是要分清楚声明和定义的区别

```c
// file one.c
char permis = 'N';
...

// file two.c
extern char permis = 'Y';   /* error */
```

声明就是告诉编译器这里有个这样的变量，定义就是具体告诉编译器这个变量长什么样子，而且在外部文件引用外部变量时不能赋值，因为你的引用仅为声明，而非定义

---

好的，本次笔记到这里就结束了，谢谢各位的阅读

