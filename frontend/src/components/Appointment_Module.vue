<template>
  <div class="container">
    <User_Sidebar />
    <div class="right">
      <el-page-header content="我的预约" /> <el-table :data="appointments" stripe style="width: 100%">
      <el-table-column prop="appointmentDate" label="预约时间" width="180" />
      <el-table-column prop="roomName" label="科室" width="180" />
      <el-table-column prop="paymentAmount" label="支付金额" width="180" />
    </el-table>
    </div>
  </div>
</template>


<script>
import User_Sidebar from "@/router/User_Sidebar.vue";
import axios from "axios";

export default {
  components: {
    User_Sidebar,
  },
  data() {
    return {
      appointments: [],
    };
  },
  mounted() {
    this.fetchAppointments();
  },
  methods: {
    fetchAppointments() {
      const idNumber = sessionStorage.getItem('idNumber');
      console.log("idNumber:", idNumber);
      axios.get(`http://localhost:80/api/appointments/query?idNumber=${idNumber}`)
          .then(response => {
            this.appointments = response.data.content;
          })
          .catch(error => {
            console.error("获取预约信息失败:", error);
          });
    },
  },
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
