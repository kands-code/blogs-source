---
title: html学习04
date: 2020-07-26 21:01:15
tags: [html, learning, programming]
categories: html
---

# html学习04

<!--more-->

## 格式元素

> 在H5, 语义化是很重要的，有关于外观，应该交由CSS来解决，但大家还是要了解一下这些元素

### `<b>`

粗体，bold的缩写，作用是加粗字体

### `<big>`

> H5已经弃用

加大，用于放大字体

### `<i>`

斜体，italic的缩写，作用是使字体变成斜体

### `<small>`

缩小，用于缩小字体，常用于注白

### `<strong>`

强调，表明其内容十分重要，通常表现为粗体，但是与`<b>`的含义不一样

### `<sub>`

<mark>下标</mark>，用于化学公式等

### `<sup>`

<mark>上标</mark>，用于次方等的表示

### `<ins>`

插入，insert的缩写，作用是表明是插入或者修改的内容，表现为<mark>下划线</mark>

### `<del>`

删除，delete的缩写，作用是表明是废弃或者是错误的内容，表现为<mark>修改线</mark>

## 注释

HTML同样是编程开发很重要的一员，注释的作用就十分大

```html
<!-- comment -->
```

这个就是注释的语法了，可以单行，也可以多行

## 元素的概念

HTML文档由HTML元素组成

一般而言，HTML元素包含<mark>开标签</mark>，<mark>内容</mark>，<mark>闭标签</mark>

但是有些元素，如`<br />`就是没有开标签，闭标签和元素的区别的，这样的元素被称为单元素，single element

## 属性的概念

属性的存在为元素或者标签提供了额外的信息，同时还对元素或者标签本身起到了一个调整作用，modify

大部分元素是有<mark>值</mark>的，例如

```html
<p align="center">
    This text is aligned to center
</p>
```

> 注意，align这个属性已经被H5废弃了

值得注意的是，属性基本上是在开标签内的，一般为键值对的形式

简单来说，属性对标签起到了调整作用

### 属性的衡量

例如，`width`属性，可以由`px`修饰，即像素，还可以由`%`修饰，即视窗大小百分比

不同的衡量标准得到的效果也不同，类似的还有`align`属性

> 现在推荐用CSS来表示外观

## 图片的使用

想要在网页中插入图片，可以使用`<img>`标签，这个标签是一个单元素，只包含属性，不包含内容，更没有闭标签

```html
<img src="url/to/image" />
```

URL就是指图片的地址，可以是网站项目内的位置，也可以是网络图片

一般而言，还会配合`alt`即alter属性使用，用于在图片显示错误的情况下输出相关的描述信息或者提示信息

```html
<html>
    <head>
        <title>first page</title>
    </head>
    <body>
        <img src="tree.jpg" alt="a tree" />
    </body>
</html>
```

你还可以使用`height`和`width`属性来定义图片的大小，同样可以使用`px`或者`%`来衡量，百分比是指和图片原来的大小的比较

## 使用链接

想要在网页中使用链接来实现跳转功能，可以使用`<a>`标签

```html
<a href="https://www.cn.bing.com">Bing</a>
```

> 效果：<a href="https://www.cn.bing.com">Bing</a>

上面这个例子就是一个链接，跳转向BIng搜索引擎，而`href`属性决定了你这个链接跳转的地址

### 打开位置

我们平时浏览网页时，会注意到这样一件事，有的链接会打开一个新标签，而有的则只是在原来的标签内改变页面

这就要用到`target`属性了

```html
<a href="https://www.cn.bing.com" target="_blank">Bing</a>
```

这样，就会在一个新的标签页打开网站

对应的还有

- \_blank
- \_parent
- \_self
- \_top
- framename

大家可以自行尝试\~

---

好了，这次博客就到这里了，谢谢大家的阅读
