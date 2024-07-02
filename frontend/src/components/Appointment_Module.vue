<template>
  <div class="container">
    <User_Sidebar />
    <div class="right">
      <h1>我的预约</h1>
      <table class="table table-striped">
        <thead>
        <tr>
          <th>预约时间</th>
          <th>科室</th>
          <th>支付金额</th>
        </tr>
        </thead>
        <tbody>
        <tr v-for="appointment in appointments" :key="appointment.id">
          <td>{{ appointment.appointmentDate }}</td>
          <td>{{ appointment.roomName }}</td>  <!-- Use roomName instead of department -->
          <td>{{ appointment.paymentAmount }}</td>
        </tr>
        </tbody>
      </table>
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
