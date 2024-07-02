// Admin_Sidebar.vue
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
        <div class="title">管理员菜单</div>
      </div>
      <el-menu-item index="/admin/users" @click="navigate('/admin/users')">
        <template #title>
          <i class="el-icon-user"></i>
          <span>用户管理</span>
        </template>
      </el-menu-item>
      <el-menu-item index="/admin/settings" @click="navigate('/admin/settings')">
        <template #title>
          <i class="el-icon-setting"></i>
          <span>系统设置</span>
        </template>
      </el-menu-item>
    </el-menu>
  </el-aside>
</template>

<script>
import { useRouter } from 'vue-router';

export default {
  name: "Admin_Sidebar",
  setup() {
    const router = useRouter();

    const navigate = (path) => {
      router.push(path);
    };

    return {
      navigate
    };
  }
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
  position: fixed;
  top: 0;
  height: 100%;
  width: 200px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  overflow-y: auto;
}

.sidebar-header {
  height: 60px;
  background-color: #409eff;
  color: #fff;
  display: flex;
  align-items: center;
  padding-left: 20px;
}

.sidebar-header .title {
  font-size: 18px;
  font-weight: bold;
}

.el-menu-item {
  height: 50px;
  line-height: 50px;
  padding: 0 20px;
}

.el-menu-item i {
  margin-right: 10px;
}

.el-menu-item.is-active {
  background-color: #e6f7ff;
}
</style>
