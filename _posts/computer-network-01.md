---
title: 计算机网络学习01
date: 2021-01-17 17:14:10
tags: [computer network, learning, 自上而下]
categories: computer network
---

# 计算机网络学习01

## 计算机网络和因特网

这一章的目标的目标是从整体上粗线条地勾勒出计算机网络的概貌，并且描述本书内容的框架

<!--more-->

### 什么是因特网

本书中使用一种特定的计算机网络，即<mark>**公共因特网**</mark>

要回答什么是因特网，可以从两个方面来描述

1. 因特网的具体构成
2. 为分布式应用提供服务的联网基础设施

#### 具体构成描述

**因特网是一个世界范围的计算机网络**

因特网是一个 *互联了* 遍及全世界数十亿计算设备的网络

与互联网相连的设备都叫<mark>**主机(host)**</mark>或<mark>**端系统(end system)**</mark>

端系统通过<mark>**通信链路(communication link)**</mark>和<mark>**分组交换机(packet switch)**</mark>连接到一起

<mark>**传输速率(transmission rate)**</mark>：链路传输数据的速率

<mark>**分组(packet)**</mark>：发送端将数据分段，每段加上 *首部字节* 后形成的**信息包**就叫做分组

分组交换机从它的一条**入通信链路**接收到达的分组，从一条**出通信链路** *转发* 该分组

分组交换机中比较有名的类型有两类：

1. <mark>**路由器(router)**</mark>
2. <mark>**链路层交换机(link-layer switch)**</mark>

链路交换机常用于 *接入网* 中，路由器常用于 *网络核心* 中

**路径(route 或 path)**：一个分组从发送端到接收端所经过的链路和交换机

> **链路**就好比公路，**分组**就是卡车，而**信息**就是卡车上的货物，**交换机**在计算机网络这庞大的交通网络上充当着交叉路口的角色，而**端系统**就是卡车的起始点和目的地，而**路径**就相当于卡车走过的路程和各个关口，交叉点

端系统通过ISP(Internet Service Provider)接入因特网，每个ISP自身就是一个由多台分组交换机和多段通信链路组成的网络，提供不同种类的网络接入，如[线缆调制解调器](https://baike.baidu.com/item/%E7%BA%BF%E7%BC%86%E8%B0%83%E5%88%B6%E8%A7%A3%E8%B0%83%E5%99%A8#:~:text=%E7%BA%BF%E7%BC%86%E8%B0%83%E5%88%B6%E8%A7%A3%E8%B0%83%E5%99%A8%E6%98%AF,%E7%BD%91%E8%BF%9B%E8%A1%8C%E6%95%B0%E6%8D%AE%E4%BC%A0%E8%BE%93%E3%80%82 "百度百科")以及[DSL](https://baike.baidu.com/item/DSL "百度科普")等住宅宽带接入、高速局域网接入和[移动无线接入](https://baike.baidu.com/item/%E6%97%A0%E7%BA%BF%E6%8E%A5%E5%85%A5 "百度百科")，除此之外，ISP还为内容提供者提供因特网接入服务，将Web站点和视频服务器直接连入因特网

**因特网就是将端系统彼此互联，因此为端系统提供接入服务的ISP也必须互联**，较低级的ISP通过*国家*，*国际的*较高层ISP互联

> 例如 Level 3 Communications、AT&T、Sprint 和 NTT

高层ISP通过高速光纤链路互联的**高速路由器**组成的

尽管如此，每个ISP之间是<mark>**独立管理的**</mark>

端系统、分组交换机和其他因特网部件都要运行一系列<mark>**协议**</mark>，这些协议控制因特网中信息的接收和送发

TCP(Transmission Control Protocol)和IP(Internet Protocol)是因特网中两个最重要的协议

**IP定义了在<mark>路由器</mark>和<mark>端系统</mark>间收发的分组格式，因特网的主要协议统称为TCP/IP**

Internet standard由IETF(Internet Engineering Task Force)研发，标准文档为RFC(Request For Comment)

---

本次笔记到此结束，谢谢阅读！
