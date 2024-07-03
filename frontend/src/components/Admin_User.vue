<template>
  <div class="right">
    <Admin_Sidebar></Admin_Sidebar>
    <h2>用户管理</h2>
    <el-table :data="users" style="width: 100%">
      <el-table-column prop="id" label="ID" width="180" />
      <el-table-column prop="idNumber" label="身份证号" width="180" />
      <el-table-column prop="isAdmin" label="是否为管理员">
        <template #default="scope">
          {{ scope.row.isAdmin ? '是' : '否' }}
        </template>
      </el-table-column>
      <el-table-column label="操作">
        <template #default="scope">
          <el-button size="small" type="danger" @click="handleDelete(scope.row)">删除</el-button>
        </template>
      </el-table-column>
    </el-table>
  </div>
</template>

<script>
import axios from 'axios';
import { ElMessage } from 'element-plus';
import { onMounted, ref } from 'vue';
import Admin_Sidebar from "@/router/Admin_Sidebar.vue";

export default {
  components: {Admin_Sidebar},
  setup() {
    const users = ref([]);

    const fetchUsers = async () => {
      try {
        const response = await axios.get("http://localhost:80/user/all");
        users.value = response.data;
      } catch (error) {
        console.error("获取用户列表失败:", error);
        ElMessage.error("获取用户列表失败");
      }
    };

    const handleDelete = async (user) => {
      if (user.isAdmin) {
        ElMessage.warning("不能删除管理员用户");
        return;
      }

      try {
        // 1. 删除预约信息 (根据 idNumber 删除)
        await axios.delete(`/http://localhost:80/api/appointments/id_number/${user.idNumber}`);

        // 2. 删除用户信息
        await axios.delete(`/http://localhost:80/api/users/${user.id}`);

        // 3. 更新用户列表
        await fetchUsers();

        ElMessage.success("用户删除成功");
      } catch (error) {
        console.error("删除用户失败:", error);
        ElMessage.error("删除用户失败");
      }
    };

    onMounted(fetchUsers);

    return {
      users,
      handleDelete,
    };
  },
};
</script>


<style scoped>
.right {
  position: fixed;
  left: 220px;
  width: calc(100% - 220px);
}
</style>
