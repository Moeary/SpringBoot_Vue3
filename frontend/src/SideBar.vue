<template>
  <el-container>
    <el-aside width="200px" class="sidebar-container">
      <el-menu
          class="sidebar"
          router
          :default-active="$route.path"
          background-color="#f9f9f9"
          text-color="#333"
          active-text-color="#409EFF"
      >
        <div class="sidebar-header">
          <div class="title">乐软云医院HIS系统</div>
        </div>
        <el-menu-item
            v-for="route in $router.options.routes"
            :key="route.path"
            :index="route.path"
        >
          <template #title>
            <i :class="route.meta.icon"></i>
            <span>{{ route.meta.title }}</span>
            <i
                v-if="route.children && route.children.length > 0"
                class="el-icon-arrow-down"
            ></i>
          </template>
          <el-menu-item-group
              v-if="route.children && route.children.length > 0"
          >
            <el-menu-item
                v-for="subRoute in route.children"
                :key="subRoute.path"
                :index="subRoute.path"
            >
              <router-link :to="subRoute.path">{{
                  subRoute.meta.title
                }}</router-link>
            </el-menu-item>
          </el-menu-item-group>
        </el-menu-item>
      </el-menu>
    </el-aside>
    <el-main class="main-content">
      <router-view />
    </el-main>
  </el-container>
</template>

<script>
export default {
  // ...
};
</script>

<style>
.main-content {
  margin-left: 200px;
}
.sidebar-container {
  position: fixed;
  left: 0;
  top: 0;
  height: 100%;
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
