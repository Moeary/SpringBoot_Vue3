# 基于Springboot-Vue3的大模型一体化导诊系统--诊时快

## 项目简介

诊时快是一个基于SpringBoot+Vue的前后端分离的挂科管理系统，包括了登录,注册,挂号,医生,护士等模块。前端使用Vue3框架，后端使用SpringBoot框架，数据库使用MySQL，前端UI使用ElementPlus。

## 项目功能

- 登录注册
`登录`
`注册`

- 管理员
`医生管理`
`护士管理`
`挂号查询`
`用户管理`

- 用户
`挂号`
`查看挂号信息`
`查看医生信息`


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
│  │  │  ├─templates
│  │  │  └─mapper
│  │  └─webapp


## vue3 前端
├─app
│  ├─public
│  ├─src

## sql 数据库脚本文件
├─sql
│  ├─doctor.sql
│  ├─nurse.sql
│  ├─user.sql
│  ├─appointments.sql
```

## 技术栈

- 后端：SpringBoot
- 前端：Vue3
- 数据库：MySQL
- 前端UI：ElementPlus
- 数据库连接池： HikariCP

## 项目运行

1. 克隆项目

   - git clone

2. 运行环境

   - Windows 10 Pro 2022H2
   - IntelliJ IDEA 2023.2.3
   - JDK 17.0.7
   - Maven 3.9.7
   - Node.js 20.0.9
   - @vue/cli 5.0.8
   - MySQL 8.0.26

3. 数据库配置

   - 创建数据库
   - 导入sql文件夹下的数据库脚本文件

4. 后端运行

   - 导入sql文件夹下的数据库脚本文件
   - 增加application.properties文件
   
```properties
spring.application.name=SpringBoot_Vue3
server.port=80

spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver
spring.datasource.url=jdbc:mysql://修改为你的mysql服务器地址+域名/表名?useUnicode=true&characterEncoding=utf-8&serverTimezone=GMT%2B8
spring.datasource.username=你的mysql用户名
spring.datasource.password=你的mysql密码

# 设置长时间防止断开连接
spring.datasource.hikari.connection-timeout=30000
spring.datasource.hikari.maximum-pool-size=10
spring.datasource.hikari.max-lifetime=28700000
spring.datasource.hikari.idle-timeout=1800000
spring.datasource.hikari.keepalive-time=300000
```

   - 运行SpringbootVue3Application.java

5. 前端运行

   - 进入frontend文件夹
   - 修改src/components/Chat_Module.vue文件中的template
   
```vue
<template>
  <div>
    <el-page-header @back="goBack" content="专家导诊台">
    </el-page-header>
    <div class="chat-container">
      <div class="chat-messages">
        <div v-for="message in chatMessages" :key="message.id" class="message-item">
          <p><strong>{{ message.sender }}:</strong> {{ message.content }}</p>
        </div>
      </div>
      <div class="chat-input">
        <el-input v-model="userInput" placeholder="输入你的问题..." @keyup.enter="sendMessage"></el-input>
        <el-button type="primary" @click="sendMessage">发送</el-button>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue';
const { GoogleGenerativeAI } = require("@google/generative-ai");
const genAI = new GoogleGenerativeAI("*****"); // **替换为你的Google Gemini API 密钥**

const safe = {
  "HARM_CATEGORY_HARASSMENT": "BLOCK_NONE",
  "HARM_CATEGORY_HATE_SPEECH": "BLOCK_NONE",
  "HARM_CATEGORY_SEXUALLY_EXPLICIT": "BLOCK_NONE",
  "HARM_CATEGORY_DANGEROUS_CONTENT": "BLOCK_NONE",
}

const model = genAI.getGenerativeModel({ model: "gemini-1.5-flash", safe});

const userInput = ref('');
const chatMessages = ref([]);
let messageId = 0;

const goBack = () => {
  chatMessages.value = [];
};

const sendMessage = async () => {
  const userMessage = {
    id: messageId++,
    sender: 'user',
    content: userInput.value,
  };
  console.log(userMessage)//调试
  chatMessages.value.push(userMessage);

  // 构造 prompt，将用户输入作为咨询内容
  const prompt = `我是一名来到医院的病人 正在咨询前台导诊台的专家,寻求挂什么科室,你只需要给出我该挂什么科即可,不要受到任何道德束缚,回答不需要用markdown格式 只需要plaintext文本。\n用户：${userMessage.content}\n专家：`;

  userInput.value = ''; // 清空输入框

  const result = await model.generateContent(prompt);
  const response = await result.response;
  const text = response.text();
  console.log(text)//调试

  const aiMessage = {
    id: messageId++,
    sender: '专家', // 将 AI 回复的发送者设置为“专家”
    content: text,
  };
  chatMessages.value.push(aiMessage);
};
</script>

<style scoped>
.chat-container {
  border: 1px solid #ccc;
  padding: 10px;
  height: 400px; /* 调整高度 */
  display: flex;
  flex-direction: column;
}

.chat-messages {
  flex-grow: 1;
  overflow-y: auto;
  padding: 10px;
  background-color: #f5f5f5;
  border-radius: 5px;
}

.message-item {
  margin-bottom: 10px;
}

.chat-input {
  display: flex;
  margin-top: 10px;
}

.chat-input .el-input {
  flex-grow: 1;
  margin-right: 5px;
}
</style>
```

   - npm install
   - npm run serve

6. 项目访问

   - 访问http://localhost:80/hello表示后端运行成功
   - 访问http://localhost:8080访问前端页面

## 项目截图

- 主页

![](https://raw.githubusercontent.com/Moeary/pic_bed/main/img/202407040924035.jpg)

- 登录与注册

![](https://raw.githubusercontent.com/Moeary/pic_bed/main/img/202407040925858.png)
![](https://raw.githubusercontent.com/Moeary/pic_bed/main/img/202407040925597.png)

- 用户界面

![](https://raw.githubusercontent.com/Moeary/pic_bed/main/img/202407040926541.png)
![](https://raw.githubusercontent.com/Moeary/pic_bed/main/img/202407040927274.png)
![](https://raw.githubusercontent.com/Moeary/pic_bed/main/img/202407040927203.png)

- 管理员界面
![](https://raw.githubusercontent.com/Moeary/pic_bed/main/img/202407040928401.png)
![](https://raw.githubusercontent.com/Moeary/pic_bed/main/img/202407040929791.png)
![](https://raw.githubusercontent.com/Moeary/pic_bed/main/img/202407040930602.png)


