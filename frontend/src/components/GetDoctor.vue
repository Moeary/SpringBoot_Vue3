<template>
  <Admin_Sidebar/>
  <div class="right">
    <form @submit.prevent="searchDoctors">
      <label>ID: <input v-model="id" type="text"></label>
      <label>姓名: <input v-model="name" type="text"></label>
      <label>性别:
        <select v-model="sex">
          <option value="">全部</option>
          <option value="男">男</option>
          <option value="女">女</option>
        </select>
      </label>
      <label>科室: <input v-model="room" type="text"></label>
      <label>级别:
        <select v-model="grade">
          <option value="">全部</option>
          <option value="初级">初级</option>
          <option value="中级">中级</option>
          <option value="高级">高级</option>
        </select>
      </label>
      <button type="submit">查询</button>
      <button @click="showAddDoctorModal = true">添加医生</button>
    </form>

    <div v-if="showAddDoctorModal" class="modal">
      <div class="modal-content">
        <form @submit.prevent="addDoctor">
          <h2>添加医生</h2>
          <label>姓名: <input v-model="newDoctor.name" type="text" required></label>
          <label>性别:
            <select v-model="newDoctor.sex" required>
              <option value="男">男</option>
              <option value="女">女</option>
            </select>
          </label>
          <label>科室: <input v-model="newDoctor.room" type="text" required></label>
          <label>级别:
            <select v-model="newDoctor.grade" required>
              <option value="初级">初级</option>
              <option value="中级">中级</option>
              <option value="高级">高级</option>
            </select>
          </label>
          <button type="submit">提交</button>
          <button @click="showAddDoctorModal = false">取消</button>
        </form>
      </div>
    </div>

    <table>
      <thead>
      <tr>
        <th>ID</th>
        <th>姓名</th>
        <th>性别</th>
        <th>科室</th>
        <th>级别</th>
        <th>操作</th>
      </tr>
      </thead>
      <tbody>
      <tr v-for="doctor in doctors" :key="doctor.id">
        <td>{{ doctor.id }}</td>
        <td>{{ doctor.name }}</td>
        <td>{{ doctor.sex }}</td>
        <td>{{ doctor.room }}</td>
        <td>{{ doctor.grade }}</td>
        <td>
          <button @click="showEditDoctorModal(doctor)">修改</button>
          <button @click="deleteDoctor(doctor.id)">删除</button>
        </td>
      </tr>
      </tbody>
    </table>
    <button @click="prevPage" :disabled="page === 0">上一页</button>
    <button @click="nextPage" :disabled="page === totalPages - 1">下一页</button>

    <div v-if="showEditModal" class="modal">
      <div class="modal-content">
        <form @submit.prevent="updateDoctor">
          <h2>修改医生信息</h2>
          <input type="hidden" v-model="editingDoctor.id">
          <label>姓名: <input v-model="editingDoctor.name" type="text" required></label>
          <label>性别:
            <select v-model="editingDoctor.sex" required>
              <option value="男">男</option>
              <option value="女">女</option>
            </select>
          </label>
          <label>科室: <input v-model="editingDoctor.room" type="text" required></label>
          <label>级别:
            <select v-model="editingDoctor.grade" required>
              <option value="初级">初级</option>
              <option value="中级">中级</option>
              <option value="高级">高级</option>
            </select>
          </label>
          <button type="submit">保存</button>
          <button @click="showEditModal = false">取消</button>
        </form>
      </div>
    </div>
  </div>
</template>

<script>
import { ref, onMounted } from 'vue';
import axios from 'axios';
import Admin_Sidebar from "@/router/Admin_Sidebar.vue";

export default {
  components: {Admin_Sidebar},
  setup() {
    const showAddDoctorModal = ref(false);
    const showEditModal = ref(false);
    const newDoctor = ref({
      name: '',
      sex: '男',
      room: '',
      grade: '初级'
    });
    const editingDoctor = ref({});
    const doctors = ref([]);
    const page = ref(0);
    const totalPages = ref(0);

    const id = ref(null);
    const name = ref(null);
    const sex = ref(null);
    const room = ref(null);
    const grade = ref(null);

    const searchDoctors = () => {
      page.value = 0;
      loadDoctors();
    };

    const loadDoctors = () => {
      axios.get('http://localhost:80/api/doctors/search', {
        params: {
          page: page.value,
          size: 10,
          id: id.value,
          name: name.value,
          sex: sex.value,
          room: room.value,
          grade: grade.value,
        },
      }).then(response => {
        doctors.value = response.data.content;
        totalPages.value = response.data.totalPages;
      }).catch(error => {
        console.error('请求出现问题:', error);
        alert('获取医生列表失败，请稍后重试');
      });
    };

    const addDoctor = () => {
      axios.post('http://localhost:80/api/doctors', newDoctor.value)
          .then(() => {
            showAddDoctorModal.value = false;
            newDoctor.value = {
              name: '',
              sex: '男',
              room: '',
              grade: '初级'
            };
            loadDoctors();
          })
          .catch(error => {
            console.error('请求出现问题:', error);
            alert('添加医生失败，请稍后重试');
          });
    };

    const showEditDoctorModal = (doctor) => {
      editingDoctor.value = { ...doctor };
      showEditModal.value = true;
    };

    const updateDoctor = () => {
      axios.put(`http://localhost:80/api/doctors/${editingDoctor.value.id}`, editingDoctor.value)
          .then(() => {
            showEditModal.value = false;
            loadDoctors();
          })
          .catch(error => {
            console.error('请求出现问题:', error);
            alert('更新医生信息失败，请稍后重试');
          });
    };

    const deleteDoctor = (doctorId) => {
      if (confirm('确定要删除该医生吗？')) {
        axios.delete(`http://localhost:80/api/doctors/${doctorId}`)
            .then(() => {
              loadDoctors();
            })
            .catch(error => {
              console.error('请求出现问题:', error);
              alert('删除医生失败，请稍后重试');
            });
      }
    };

    const nextPage = () => {
      if (page.value < totalPages.value - 1) {
        page.value++;
        loadDoctors();
      }
    };

    const prevPage = () => {
      if (page.value > 0) {
        page.value--;
        loadDoctors();
      }
    };

    onMounted(() => {
      loadDoctors();
    });

    return {
      showAddDoctorModal,
      showEditModal,
      newDoctor,
      editingDoctor,
      doctors,
      page,
      totalPages,
      id,
      name,
      sex,
      room,
      grade,
      searchDoctors,
      addDoctor,
      showEditDoctorModal,
      updateDoctor,
      deleteDoctor,
      nextPage,
      prevPage,
    };
  },
};
</script>

<style scoped>
.modal {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.5);
  display: flex;
  justify-content: center;
  align-items: center;
}

.modal-content {
  background-color: #fff;
  padding: 20px;
  border-radius: 5px;
}
.right{
  position: fixed;
  left: 220px;
  top: 10px;
  height: 100%;
}
</style>
