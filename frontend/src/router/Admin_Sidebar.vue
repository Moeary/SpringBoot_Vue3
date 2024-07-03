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
        <div class="title" style="text-align: center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;管理员菜单 </div>
      </div>
      <el-menu-item index="/admin" @click="navigate('/admin')">
        <template #title>
          <i class="el-icon-setting"></i>
          <span>界面首页</span>
        </template>
      </el-menu-item>
      <el-menu-item index="/admin/nurse" @click="navigate('/admin/nurse')">
        <template #title>
          <i class="el-icon-user"></i>
          <span>护士查看</span>
        </template>
      </el-menu-item>
      <el-menu-item index="/admin/doctor" @click="navigate('/admin/doctor')">
        <template #title>
          <i class="el-icon-setting"></i>
          <span>医生查看</span>
        </template>
      </el-menu-item>
      <el-menu-item index="/admin/appointment" @click="navigate('/admin/appointment')">
        <template #title>
          <i class="el-icon-setting"></i>
          <span>用户预约单管理</span>
        </template>
      </el-menu-item>
      <el-menu-item index="/admin/user" @click="navigate('/admin/user')">
        <template #title>
          <i class="el-icon-setting"></i>
          <span>用户信息管理</span>
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

.el-menu-item i {
  margin-right: 10px;
}

</style>
