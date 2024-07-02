<template>
  <div class="container">
    <Admin_Sidebar/>
    <div>
      <h1 class="right">我是系统设置页面</h1>
    </div>
  </div>
</template>

<script>
import Admin_Sidebar from "@/router/Admin_Sidebar.vue";
export default {
  components: {
    Admin_Sidebar,
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

</style>
