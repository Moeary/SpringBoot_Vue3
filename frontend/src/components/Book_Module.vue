<template>
  <div class="container">
    <User_Sidebar />
    <div class="right">
      <div v-if="step === 1">
        <label for="department">选择科室:</label>
        <select id="department" v-model="selectedDepartment">
          <option value="">请选择科室</option>
          <option v-for="department in departments" :key="department" :value="department">
            {{ department }}
          </option>
        </select>
        <br />
        <label for="expert">专家号:</label>
        <input type="checkbox" id="expert" v-model="isExpert">
        <label for="expert"> 是</label>
        <br />
        <label for="date">选择日期:</label>
        <input type="date" id="date" v-model="selectedDate">
        <br />
        <button @click="nextStep">下一步</button>
      </div>
      <div v-if="step === 2">
        <h2>确认预约信息</h2>
        <p>科室: {{ selectedDepartment }}</p>
        <p>专家号: {{ isExpert ? '是' : '否' }}</p>
        <p>日期: {{ selectedDate }}</p>
        <button @click="pay">支付</button>
        <button @click="backToStep1">返回</button>
      </div>
      <div v-if="step === 3">
        <h2>支付</h2>
        <p>请扫描下方二维码支付</p>
        <img :src="paymentQrCode" alt="支付二维码" width="40%" height="60%">
        <p>支付金额: {{ paymentAmount }} 元</p>
        <button @click="confirmPayment">确认支付</button>
      </div>
      <div v-if="step === 4">
        <h2>支付成功</h2>
        <p>您的预约已成功提交！</p>
        <button @click="backToStep1">返回</button>
      </div>
    </div>
  </div>
</template>

<script>
import User_Sidebar from "@/router/User_Sidebar.vue";
import axios from 'axios'; // 引入axios

export default {
  components: {
    User_Sidebar,
  },
  data() {
    return {
      departments: ["内科", "外科", "妇科", "儿科"], // 科室列表register
      selectedDepartment: "",
      isExpert: false,
      selectedDate: new Date(), // 初始化为当前日期
      step: 1, // 1: 选择科室 2: 确认信息 3: 支付 4: 支付成功
      paymentQrCode: 'https://raw.githubusercontent.com/Moeary/pic_bed/main/img/202407021852841.jpg', // 替换成你的支付二维码图片地址
      paymentAmount: 0, // 支付金额
    };
  },
  methods: {
    nextStep() {
      if (this.selectedDepartment && this.selectedDate) {
        this.step = 2;
      } else {
        alert("请选择科室和日期");
      }
    },
    pay() {
      this.step = 3; // 进入支付页面
      this.paymentAmount = this.isExpert ? 50 : 25; // 计算支付金额
    },
    confirmPayment() {
      // 模拟支付成功，实际需要调用支付接口
      // ...
      this.step = 4; // 支付成功
      this.submitAppointment();
    },
    backToStep1() {
      this.step = 1;
    },
    submitAppointment() {
      const appointmentData = {
        department: this.selectedDepartment, // 添加科室字段
        isExpert: this.isExpert ? 1 : 0, // 转换为数字 0 或 1
        appointmentDate: this.selectedDate, // 保持字符串类型
        idNumber: sessionStorage.getItem('idNumber'), // 获取用户 idNumber
        paymentAmount: this.paymentAmount, // 支付金额
        room_name: this.selectedDepartment // 将科室名作为 room_name
      };

      axios.post('/api/user/appointments', appointmentData) // 替换成你的后端接口地址
          .then(response => {
            alert('预约成功');
            console.log('预约成功', response);
          })
          .catch(error => {
            alert('预约失败');
            console.error('预约失败', error);
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
