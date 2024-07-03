<template>
  <div class="container">
    <Admin_Sidebar />
    <div class="right">
      <h1>用户预约单查看</h1>
      <el-select v-model="selectedUserId" placeholder="请选择用户ID" @change="fetchAppointments">
        <el-option
            v-for="user in userList"
            :key="user.idNumber"
            :label="user.idNumber"
            :value="user.idNumber">
        </el-option>
      </el-select>
      <table class="table table-striped">
        <thead>
        <tr>
          <th>预约ID</th>
          <th>用户ID</th>
          <th>预约时间</th>
          <th>科室</th>
          <th>支付金额</th>
        </tr>
        </thead>
        <tbody>
        <tr v-for="appointment in appointments" :key="appointment.id">
          <td>{{ appointment.id }}</td>
          <td>{{ appointment.idNumber }}</td>
          <td>{{ appointment.appointmentDate }}</td>
          <td>{{ appointment.roomName }}</td>
          <td>{{ appointment.paymentAmount }}</td>
        </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>

<script>
import Admin_Sidebar from "@/router/Admin_Sidebar.vue";
import axios from "axios";

export default {
  components: {
    Admin_Sidebar,
  },
  data() {
    return {
      appointments: [],
      userList: [],
      selectedUserId: null,
    };
  },
  mounted() {
    this.fetchUserList();
  },
  methods: {
    fetchUserList() {
      axios.get('http://localhost:80/user/all') // 获取所有用户列表
          .then(response => {
            this.userList = response.data;
          })
          .catch(error => {
            console.error("获取用户列表失败:", error);
          });
    },
    fetchAppointments() {
      if (this.selectedUserId) {
        axios.get(`http://localhost:80/api/appointments/query?idNumber=${this.selectedUserId}`)
            .then(response => {
              this.appointments = response.data.content;
            })
            .catch(error => {
              console.error("获取预约信息失败:", error);
            });
      } else {
        this.appointments = []; // 清空预约列表
      }
    },
  },
};
</script>

<style scoped>
.container {
  left: 220px;
}

.right {
  position: fixed;
  left: 220px;
  top: 10px;
  height: 100%;
}
</style>
