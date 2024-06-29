# 东软医院HIS管理系统

## 项目简介

东软医院HIS管理系统是一个基于SpringBoot+Vue的前后端分离的医院管理系统，包括了医生、患者、药品、科室、挂号、收费、检查、检验、住院、报表等模块。

## 项目功能

- 医生管理
- 护士管理
- 科室管理
- 药品管理
- 挂号管理
- 收费管理
- 检查管理
- 检验管理
- 住院管理
- 报表管理

## 项目结构

```
## springboot后端
├─src
│  ├─main
│  │  ├─java
│  │  │  └─com
│  │  │      └─example
│  │  │          └─springboot_vue3
│  │  │              ├─controller
│  │  │              ├─model
│  │  │              ├─repository
│  │  │              ├─SpringbootVue3Application.java
│  │  ├-resources
│  │  │  ├─static
│  │  │  │  ├─css
│  │  │  │  ├─img
│  │  │  │  └─js
│  │  │  ├─templates
│  │  │  └──mapper
│  │  └─webapp


## vue3 前端
├─app
│  ├─public
│  ├─src

## sql 数据库脚本文件
├─nurse
├─doctor
├─department
├─drug
├─register
```

## 技术栈

- 后端：SpringBoot
- 前端：Vue3
- 数据库：MySQL
- 前端UI：ElementUI
- 数据库连接池：Mybatis-Plus
- 数据库连接：Druid

## 项目运行

1. 后端运行

   - 导入sql文件夹下的数据库脚本文件
   - 修改application.properties中的数据库连接信息
   - 运行SpringbootVue3Application.java

2. 前端运行

   - 进入vue3文件夹
   - npm install
   - npm run serve

3. 数据库连接

   - 数据库连接信息在application.properties中配置
   - 默认数据库连接信息：
     - 数据库：hospital
     - 用户名：root
     - 密码：123456
     - 数据库连接地址：jdbc:mysql://localhost:3306/hospital?useUnicode=true&characterEncoding=utf-8&useSSL=false&serverTimezone=GMT%2B8
     - 数据库驱动：com.mysql.cj.jdbc.Driver
     - 数据库连接池：com.alibaba.druid.pool.DruidDataSource
     - 数据库方言：org.hibernate.dialect.MySQL5Dialect

4. 项目访问

   - 访问http://localhost:5173
   - 默认账号：admin 密码：123456
   - 默认账号：doctor 密码：123456
   - 默认账号：nurse 密码：123456
   - 默认账号：patient 密码：123456
   - 默认账号：pharmacy 密码：123456

## 项目打包

1. 后端打包

    - mvn clean package

2. 前端打包
    - npm run build

3. 部署

    - 将打包后的前端文件放入后端的resources/static文件夹下
    - 运行后端的jar包
    - 访问http://localhost:5173


## 项目截图




