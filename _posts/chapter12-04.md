---
title: chapter12学习笔记（四）
date: 2020-07-29 20:28:12
tags: [C, programming, learning]
categories: C Primer Plus
---

# chapter12学习笔记（四）

<!--more-->

## 章节概念

### Automatic Variable

自动存储类型的变量有自动存储时间，块作用域和无链接方式，一般而言，我们使用的大多数变量都是自动存储类型，但同样，你可以明确的表示出自动存储类型，只需要加上`auto`这个关键字就好

```c
int main(void)
{
    auto int plox;
```

这里这个`auto`就是存储类型指示符(specifier)，但是要注意，在C++里，`auto`被用来做其他事情，所以，最好不要用这个指示符，以此来增加C/C++的兼容性(compatibility)

块作用域和无链接方式说明了(imply)只有在定义该变量的代码块内才能够通过变量名访问该变量

> 可通过函数参数的形式来访问变量的值和地址，但是参数和变量本身，即便名字相同，其含义也是大不一样的，是使用了一个同名的不同存储空间来存放参数值

自动存储类型说明了这个变量在程序进入到声明该变量的代码块内时，这个变量就已经存在(comes into existence)，而离开代码块时，这变量又会消失(不可使用，disappear)

```c
int loop(int n)
{
    int m;		// m in scope
    scanf("%d", &m);
    {
        int i;	// both m and i in scope
        for (i = m; i < n; i++)
            puts("i is local to a sub-block\n");
    }
    return m;	// m in scope, i gone
}
```

如果在内部代码块内再声明一个同名变量会怎么样呢？

```c
// hiding.c -- variables in blocks
#include <stdio.h>
int main()
{
    int x = 30;		// original x
    
    printf("x in outer block: %d at %p\n", x, &x);
    {
        int x = 77;	// new x, hides first x
        printf("x in inner block: %d at %p\n", x, &x);
    }
    printf("x in outer block: %d at %p\n", x, &x);
    while (x++ < 33)	// original x
    {
        int x = 100;	// new x, hides first x
        x++;
        printf("x in while loop: %d at %p\n", x, &x);
    }
	printf("x in outer block: %d at %p\n", x, &x);
    
    return 0;
}
```

> 这个是我的运行结果
>
> ```bash
> x in outer block: 30 at 0x7ffcde217ab0
> x in inner block: 77 at 0x7ffcde217ab4
> x in outer block: 30 at 0x7ffcde217ab0
> x in while loop: 101 at 0x7ffcde217ab4
> x in while loop: 101 at 0x7ffcde217ab4
> x in while loop: 101 at 0x7ffcde217ab4
> x in outer block: 34 at 0x7ffcde217ab0
> ```

可以看出，是有一个覆盖效果的，内部定义的量会暂时覆盖掉外部的同名变量，或者说外部变量会暂时隐藏起来

对于循环和if语句等，要注意，对于循环，整个循环是包括这个循环的代码块的子代码块，而这个循环的循环体则是整个循环的子代码块，if语句也是类似的（C99特性）

```c
// forc88.c -- new C99 block rules
#include <stdio.h>
int main(void)
{
    int n = 8;
    
    printf("  Initially, n = %d at %p\n", n, &n);
    for (int n = 1; n < 3; n++)
        printf("	loop 1: n = %d at %p\n", n, &n);
    printf("After loop 1, n = %d at %p\n", n, &n);
    for (int n = 1; n < 3; n++)
    {
        printf("  loop 2 index n = %d at %p\n", n &n);
        int n = 6;
        printf("	loop 2: n = %d at %p\n", n, &n);
        n++;
    }
    printf("After loop 2, n = %d at %p\n", n, &n);
    
    return 0;
}
```

> 我的效果是这样的
>
> ```bash
>   Initially, n = 8 at 0x7ffcae9d32ec
> 	loop 1: n = 1 at 0x7ffcae9d32f4
> 	loop 1: n = 2 at 0x7ffcae9d32f4
> After loop 1, n = 8 at 0x7ffcae9d32ec
>   loop 2 index n = 1 at 0x7ffcae9d32f0
> 	loop 2: n = 6 at 0x7ffcae9d32f4
>   loop 2 index n = 2 at 0x7ffcae9d32f0
> 	loop 2: n = 6 at 0x7ffcae9d32f4
> After loop 2, n = 8 at 0x7ffcae9d32ec
> ```

可以很清楚的看到每个n分别代表着什么以及其关系

><mark>Note</mark> C99 and C11 Support
>
>Some compilers may not support these C99/C11 scope rules. (At thhis time Microsoft Visual Studio 2012 is one of those compilers.) Others may provide an option for activating these rules. For example, at the time of this writing, GCC supports many C99 features by default but requires using the `-std=c99` option (now, gcc default support c11 and the newest iso standard is c18 --kands-code)  to activate the features used in List 12.2 (forc99.c)
>
>Similarly, version of GCC or Clang may require using the `-std=clx` or `-std=c11` options to recognize C11 features.

在开发时，尽量避免使用相同变量名，但是在遇到这种情况时，我们可以通过这些特性来区分不同变量和解决问题

### 初始化自动变量

自动变量是<mark>不会</mark>自动初始化的，他的默认值完全依赖于编译器以及分配给他的空间中原来的值，所以，我们使用自动变量时，不仅仅要声明它(declare)，还需要定义它(define)，为它初始化，这样我们才能正常使用它

---

本篇到这里就结束了，谢谢大家的阅读
