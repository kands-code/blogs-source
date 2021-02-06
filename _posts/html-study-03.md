---
title: html学习03
date: 2020-07-12 21:01:12
tags: [html, learning, programming]
categories: html
---

# html学习03

<!--more-->

## 语义化

### 什么是语义化

1. 基本上，绝大多数html元素都有自己特殊（具体）的含义

a元素：超链接

```html
<a href="https://cn.bing.com/">bing查询</a>
```

p元素：段落，paragraph

```html
<p>This is a paragraph</p>
```

h元素：标题，heading

```html
<h1>H1 heading</h1>
<h2>H2 heading</h2>
...
<h6>H6 heading</h6>
```

2. **所有元素与展示效果无关**

所有元素的展示效果都是默认CSS决定的，而非自带的效果，所有显示效果都可以通过调整CSS代码得到

> 选择什么元素，取决于内容的含义，而不是显示出来的效果

### 为什么需要语义化

1. 为了搜索引擎优化（SEO）

搜索引擎举例：Google，百度，Bing...

每隔一段时间，搜索引擎会从整个互联网中，抓取源代码并进行分析，将结果存储到数据库，方便搜索

2. 为了让浏览器理解网页

阅读模式、语音模式...

## 文本元素

HTML5中支持的元素，[HTML5元素周期表](http://www.html5star.com/manual/html5label-meaning/)

### h元素

标题：headinng

h1～h6：表现了六个不同等级的标题，常用h1～h4

### p元素

段落：paragraph

> lorem：在vscode（或其他支持emmet的编辑器）可以使用lorem生成一段*乱数假文*，即没有意义的文字，可用来测试外观

### span元素

无语义，仅用于设置样式

```html
<p>这是一个红色的<span style="color:red">花</span>，这里的<span style="color:green">草</span>真绿啊！</p>
```

演示效果：

<p>这是一个红色的<span style="color:red">花</span>，这里的<span style="color:green">草</span>真绿啊！</p>

> 某些元素在显示时会占用一行，而有些不会，在以前，常将占用一行的元素称为块元素（容器），不占一行的被称为行内元素（inline），在H5,这个概念已经过期，被`内容类别`这个概念所取代

### pre元素

预格式化文本元素

>  空白折叠：在源代码里的*连续*空白字符在页面显示时会显示成一个空格

而使用pre元素内部，内容会按照源代码*格式*显示，但是**实体字符需要另行处理**

pre元素通常用来显示代码，还可以套用`<code>`来规范字体，即

```html
<code>
	<pre>
		...
	</pre>
</code>
```



#### 本质

pre元素之所以能够做到这个，全是因为其默认CSS：`white-space:pre;`

故也可以认为**其为无语义元素**
