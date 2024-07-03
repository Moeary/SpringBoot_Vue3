<template>
  <div class="header">
    <div class="headBar">
      <el-menu mode="horizontal" class="navMenu">
        <el-sub-menu v-for="item in items" :key="item.name" :index="item.name">
          <template #title>{{ item.name }}</template>
          <el-menu-item v-for="subItem in item.subItems" :key="subItem.name" :index="subItem.name">
            {{ subItem.name }}
          </el-menu-item>
        </el-sub-menu>
      </el-menu>
      <el-button type="primary" class="loginButton" @click="handleLogin">登录</el-button>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      items: [
        {
          name: '医院概况',
          dropdownOpen: false,
          subItems: [
            { name: '医院介绍' },
            { name: '医院领导' }
          ]
        },
        {
          name: '新闻公告',
          dropdownOpen: false,
          subItems: [
            { name: '医院公告' },
            { name: '新闻动态' }
          ]
        },
        {
          name: '就医指南',
          dropdownOpen: false,
          subItems: [
            { name: '就医流程' },
            { name: '院内布局' },
            { name: '地理位置' }
          ]
        },
        {
          name: '医疗特色',
          dropdownOpen: false,
          subItems: [
            { name: '临床医计科室' },
            { name: '专家介绍' }
          ]
        },
        {
          name: '信息公开',
          dropdownOpen: false,
          subItems: [
            { name: '执业信息' },
            { name: '服务公告' }
          ]
        },
        {
          name: '党务公开',
          dropdownOpen: false,
          subItems: [
            { name: '建党信息' },
            { name: '党风廉政建设' }
          ]
        },
        {
          name: '医院管理',
          dropdownOpen: false,
          subItems: [
            { name: '罕见病注册登记平台' },
            { name: '伦理委员会' }
          ]
        }
      ]
    };
  },
  methods: {
    handleLogin() {
      // 处理登录逻辑，例如跳转到登录页面
      window.location.href = '/login';
    }
  }
};
</script>

<style scoped>
.header {
  width: 80%;
  background-color: #fff;
}

.headBar {
  align-items: center;
  width: 80%;
  max-width: 1000px; /* 可选：限制最大宽度 */
}

.navMenu {
  margin: 0;
}

.loginButton {
  margin-left: 20px; /* 可选：调整按钮与菜单的间距 */
}
</style>
