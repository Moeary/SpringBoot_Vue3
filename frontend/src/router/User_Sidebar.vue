// UserSidebar.vue
<template>
  <el-aside width="200px" class="sidebar-container">
    <el-menu
        class="sidebar"
        :default-active="$route.path"
        background-color="#f9f9f9"
        text-color="#333"
        active-text-color="#409EFF"
    >
      <div class="sidebar-header">
        <div class="title">用户中心</div>
      </div>
      <el-menu-item index="/home" @click="navigate('/home')">
        <template #title>
          <i class="el-icon-s-home"></i>
          <span>首页</span>
        </template>
      </el-menu-item>
      <el-menu-item index="/book" @click="navigate('/home/book')">
        <template #title>
          <i class="el-icon-edit"></i>
          <span>本人挂号</span>
        </template>
      </el-menu-item>
      <el-menu-item index="/appointments" @click="navigate('/home/appointments')">
        <template #title>
          <i class="el-icon-document"></i>
          <span>查看预约</span>
        </template>
      </el-menu-item>
    </el-menu>
  </el-aside>
</template>

<script>
import { useRouter } from 'vue-router';

export default {
  setup() {
    const router = useRouter();

    const navigate = (route) => {
      router.push(route);
    };

    return {
      navigate,
    };
  },
};
</script>

<style scoped>
.sidebar-container {
  position: fixed;
  left: 0;
  top: 0;
  height: 100%;
  background-color: #545c64;
  color: #fff;
}

.sidebar {
  height: 100%;
}

.sidebar-header {
  height: 60px;
  display: flex;
  align-items: center;
  justify-content: center;
  background-color: #409eff;
  color: white;
}

.title {
  font-size: 18px;
  font-weight: bold;
}

.user-title {
  position: fixed;
  left: 200px;
  top: 10px;
  height: 100%;
  background-color: #545c64;
  color: #fff;
}
</style>

