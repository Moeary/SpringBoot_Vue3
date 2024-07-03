// Admin_Module.vue
<template>
  <div>
    <Admin_Sidebar/>
    <div class="admin-content">
      <h1>Hello,World!</h1>
      <el-button type="danger" @click="logout">安全登出</el-button>
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
  router.push('/');
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