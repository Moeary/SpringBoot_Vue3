// Admin_Module.vue
<template>
  <div>
    <Admin_Sidebar/>
    <div class="admin-content">
      <h1>我是admin</h1>
      <button @click="logout">登出</button>
    </div>
  </div>
</template>

<script setup>
import { useRouter } from 'vue-router';
import Admin_Sidebar from "@/router/Admin_Sidebar.vue";
import {ref, watch} from "vue";
import {useRoute} from "vue-router";

const router = useRouter();
const route = useRoute();

const showAdminContent = ref(false);

const logout = () => {
  sessionStorage.clear();
  router.push('/login');
};

watch(
    () => route.path,
    (newPath) => {
      showAdminContent.value = newPath === '/';
    },
    { immediate: true }
);
</script>

<style scoped>
.admin-content {
  margin-left: 200px;
}
</style>