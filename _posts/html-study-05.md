---
title: html学习05
date: 2020-07-28 21:01:18
tags: [html, learning, programming]
categories: html
---

# html学习05

<!--more-->

## 列表

使用`<li>`可以设置列表元素

### 有序列表`<ol>`

`ol`，即ordered list，有序列表，使用案例如下

```html
<html>
    <head>
        <title>first page</title>
    </head>
    <body>
        <ol>
            <li>Red</li>
            <li>Blue</li>
            <li>Green</li>
        </ol>
    </body>
</html>
```

>效果如下
>
><ol>
>    <li>Red</li>
>       <li>Blue</li>
>    <li>Green</li>
></ol>

### 无序列表`<ul>`

`ul`，即unordered list，无序列表，例子

```html
<html>
    <head>
        <title>first page</title>
    </head>
    <body>
        <ul>
            <li>Red</li>
            <li>Blue</li>
            <li>Green</li>
        </ul>
    </body>
</html>
```

>效果如下
>
><ul>
>            <li>Red</li>
>            <li>Blue</li>
>            <li>Green</li>
>        </ul>

### 混合使用举例

#### 与`<a>`混合使用

```html
<ul>
    <li><a href="https://qarks.top">Qarks</a></li>
    <li>B</li>
</ul>
```

> 效果如下
>
> <ul>
>     <li><a href="https://qarks.top">Qarks</a></li>
>     <li>B</li>
> </ul>

## 表格

### 基本结构

在html中，你可以实现很复杂的表格，但是他们都有一个基本的表格结构

```html
<table>
    <tr>
        <td>a</td>
        <td>b</td>
        <td>c</td>
    </tr>
    <tr>
        <td>1</td>
        <td>2</td>
        <td>3</td>
    </tr>
</table>
```

> 效果如下
>
> <table>
>     <tr>
>         <td>a</td>
>         <td>b</td>
>         <td>c</td>
>     </tr>
>     <tr>
>         <td>1</td>
>         <td>2</td>
>         <td>3</td>
>     </tr>
> </table>

这就是一个最基本的表格，首先使用`<table>`元素来创建出一个表格

再使用`<tr>`来在表格内创造出一行（row）

最后使用`<td>`来将一行划分（divide）成几个小格子

这样，一个表格就算完成了

### 边框

可以使用`border`属性来决定是否有边框，值可以选择`""`（不写）或者`1`，即有边框和无边框，边框样式建议使用CSS调整

> 我的博客默认使用typora提供的主题css，体现不出来边框差距，各位可以自己试试

```html
<table border="1">
    <tr>
        <td>RED</td>
        <td>BLUE</td>
        <td>GREEN</td>
    </tr>
</table>
<table>
    <tr>
        <td>RED</td>
        <td>BLUE</td>
        <td>GREEN</td>
    </tr>
</table>
```

### 多列

有些时候我们想要有多列合成一格，可以使用`colspan`属性来实现，这个属性的值为number，即数字，跨越的列数

```html
<table border="1">
    <tr>
        <td>Red</td>
        <td>Blue</td>
        <td>Green</td>
    </tr>
    <tr>
        <td><br /></td>
        <td colspan="2"><br /></td>
    </tr>
</table>
```

> 使用效果
>
> <table border="1">
>     <tr>
>         <td>Red</td>
>         <td>Blue</td>
>         <td>Green</td>
>     </tr>
>     <tr>
>         <td><br /></td>
>         <td colspan="2"><br /></td>
>     </tr>
> </table>

可以看到后面两个合成了一格

> 类似`colspan`，行合成可以使用`rowspan`来实现

### 文字排列和背景颜色

> H5已经废弃

可以使用`align`属性来指定文字排列的位置，还可以使用`bgcolor`来指定单元格的背景颜色

---

本篇博客到此结束，谢谢大家阅读！
