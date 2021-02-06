---
title: html学习02
date: 2020-07-11 21:01:10
tags: [html, learning, programming]
categories: html
---

# html学习02

<!--more-->

## 必要的元素（标签）

### 水平线元素

```html
<hr>
```

这个又是一个单目标签，可选属性在H5中<mark>基本被废除</mark>，但是，还是可以支持一些html的**全局属性**以及一些**事件属性**，具体内容可以自行翻阅手册

### 预处理标签

```html
<pre>
#include &lt;stdio.h&gt;
int main(void)
{
	printf("hello world.\n");
	
	return 0;
}
</pre>
```

如演示所示，这个预处理标签可以保留住源文件的基本格式，包括<mark>缩进以及空格</mark>，注意到演示中，尖括号使用了`&lt;`以及`&gt; `来表现，这涉及到html中的<mark>实体字符</mark>相关知识，，即有些字符由于html的标签特性，不能够直接出现在内容当中，只能通过所谓的实体字符来展现，具体的实体字符可以参考手册内容

> 对于代码显示，html还有`<code>`标签专门对于代码的显示做出了一定的优化，例如使用等宽字体等

### 上下标标签

```html
<p>e<sup>-2</sup></p>
<p>Fe<sub>2</sub></p>
```

上标`<sup>`以及下标`<sub>`主要可以用来在一定范围内书写公式，一些复杂的公式不建议使用html书写，因为会变的很复杂，建议通过图片展现

## 实体符号

由于不能够直接展现或者无法由键盘直接输入，所以设计了一套实体字符专门用来处理该类字符，典型的有空格`&nbsp;`，大小写`&gt;`和`&lt;`等等

不需要记背，遇到不会的翻手册即可

## 表格初步

html中的表格通过一下标签实现

```html
<table>
    <tr>
        <td>1</td><td>2</td><td>3</td>
    </tr>
    <tr>
        <td>a</td><td>b</td><td>c</td>
    </tr>
</table>
```

上述代码实现了下面这样一个表格：

<table>
    <tr>
        <td>1</td><td>2</td><td>3</td>
    </tr>
    <tr>
        <td>a</td><td>b</td><td>c</td>
    </tr>
</table>

### table常用属性

#### border

设置表格的边框宽度

> 除了这个属性外，其他属性除全局属性以及事件属性外基本都被H5废除，表格样式由CSS提供

### td常用属性

#### colspan

规定了单元格可横跨的列数

#### rowspan

设置单元格可横跨的行数
