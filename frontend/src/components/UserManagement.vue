<template>
  <div class="container">
    <User_Sidebar />
    <div>
      <h1 class="right">我是Home</h1>
    </div>
  </div>
</template>

<script>
import User_Sidebar from "@/router/User_Sidebar.vue";
export default {
  components: {
    User_Sidebar,
  },
};
</script>

<style scoped>
.container {
  display: flex;
}

.right{
  position: fixed;
  left: 220px;
  top: 10px;
  height: 100%;
}
.main-content {
  flex-grow: 1; /* 让主要内容区域占据剩余空间 */
  padding: 20px; /* 可选：添加一些内边距 */
}
</style>
