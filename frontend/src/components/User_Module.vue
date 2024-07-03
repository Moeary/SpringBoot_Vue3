<template>
  <div class="container">
    <User_Sidebar />
    <div class="right">
          <el-button type="danger" @click="logout">安全登出</el-button>
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

.right {
  padding: 20px;
  background-color: #f5f5f5;
}
</style>
