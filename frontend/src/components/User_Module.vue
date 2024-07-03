<template>
  <div class="container">
    <User_Sidebar />
    <div class="right">
      <h1 >我是Home</h1>
      <button @click="logout">登出</button>
      <Chat_Module />
    </div>
  </div>
</template>

<script setup>
import User_Sidebar from "@/router/User_Sidebar.vue";
import Chat_Module from "@/components/Chat_Module.vue";
import { useRouter } from 'vue-router';

const router = useRouter();

const logout = () => {
  sessionStorage.clear();
  router.push('/');
};
</script>

<style scoped>
  .container {
  display: flex;
}

  .right {
  position: fixed;
  left: 220px;
  top: 10px;
  height: 100%;
}
</style>
