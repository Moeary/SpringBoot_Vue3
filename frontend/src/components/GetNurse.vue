<template>
  <Admin_Sidebar/>
  <div class="right">
    <div>
      <h2>护士管理</h2>
      <form @submit.prevent="searchNurses">
        <label>ID: <input v-model="searchId" type="text"></label>
        <label>姓名: <input v-model="searchName" type="text"></label>
        <label>性别:
          <select v-model="searchSex">
            <option value="">全部</option>
            <option value="男">男</option>
            <option value="女">女</option>
          </select>
        </label>
        <label>科室: <input v-model="searchRoom" type="text"></label>
        <label>级别:
          <select v-model="searchGrade">
            <option value="">全部</option>
            <option value="初级">初级</option>
            <option value="中级">中级</option>
            <option value="高级">高级</option>
          </select>
        </label>
        <button type="submit">查询</button>
      </form>
      <button @click="showAddModal = true">添加护士</button>
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
      <tr v-for="nurse in nurses" :key="nurse.id">
        <td>{{ nurse.id }}</td>
        <td>{{ nurse.name }}</td>
        <td>{{ nurse.sex }}</td>
        <td>{{ nurse.room }}</td>
        <td>{{ nurse.grade }}</td>
        <td>
          <button @click="SshowEditModal(nurse)">编辑</button>
          <button @click="deleteNurse(nurse.id)">删除</button>
        </td>
      </tr>
      </tbody>
    </table>
    <button @click="prevPage" :disabled="page === 0">上一页</button>
    <button @click="nextPage" :disabled="page >= totalPages - 1">下一页</button>

    <!-- 添加护士弹窗 -->
    <el-dialog v-model="showAddModal" title="添加护士">
      <el-form :model="newNurse" label-width="80px">
        <el-form-item label="姓名">
          <el-input v-model="newNurse.name" />
        </el-form-item>
        <el-form-item label="性别">
          <el-select v-model="newNurse.sex">
            <el-option label="男" value="男" />
            <el-option label="女" value="女" />
          </el-select>
        </el-form-item>
        <el-form-item label="科室">
          <el-input v-model="newNurse.room" />
        </el-form-item>
        <el-form-item label="级别">
          <el-select v-model="newNurse.grade">
            <el-option label="初级" value="初级" />
            <el-option label="中级" value="中级" />
            <el-option label="高级" value="高级" />
          </el-select>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="addNurse">确定</el-button>
          <el-button @click="showAddModal = false">取消</el-button>
        </el-form-item>
      </el-form>
    </el-dialog>

    <!-- 编辑护士弹窗 -->
    <el-dialog v-model="showEditModal" title="编辑护士">
      <el-form :model="currentNurse" label-width="80px">
        <el-form-item label="姓名">
          <el-input v-model="currentNurse.name" />
        </el-form-item>
        <el-form-item label="性别">
          <el-select v-model="currentNurse.sex">
            <el-option label="男" value="男" />
            <el-option label="女" value="女" />
          </el-select>
        </el-form-item>
        <el-form-item label="科室">
          <el-input v-model="currentNurse.room" />
        </el-form-item>
        <el-form-item label="级别">
          <el-select v-model="currentNurse.grade">
            <el-option label="初级" value="初级" />
            <el-option label="中级" value="中级" />
            <el-option label="高级" value="高级" />
          </el-select>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="updateNurse">确定</el-button>
          <el-button @click="showEditModal = false">取消</el-button>
        </el-form-item>
      </el-form>
    </el-dialog>
  </div>
</template>

<script>
import { ref, onMounted } from 'vue';
import axios from 'axios';
import Admin_Sidebar from "@/router/Admin_Sidebar.vue";

export default {
  components: {Admin_Sidebar},
  setup() {
    const nurses = ref([]);
    const page = ref(0);
    const totalPages = ref(0);

    const searchId = ref(null);
    const searchName = ref(null);
    const searchSex = ref(null);
    const searchRoom = ref(null);
    const searchGrade = ref(null);

    const showAddModal = ref(false);
    const showEditModal = ref(false); // 定义为 ref
    const newNurse = ref({
      name: '',
      sex: '',
      room: '',
      grade: '',
    });
    const currentNurse = ref({});

    const searchNurses = () => {
      axios.get('http://localhost:80/api/nurses/search', {
        params: {
          page: page.value,
          size: 10,
          id: searchId.value,
          name: searchName.value,
          sex: searchSex.value,
          room: searchRoom.value,
          grade: searchGrade.value,
        },
      }).then(response => {
        if (response.data.content.length === 0) {
          alert("没有找到匹配的护士");
          nurses.value = [];
          totalPages.value = 0;
        } else {
          nurses.value = response.data.content;
          totalPages.value = response.data.totalPages;
        }
      }).catch(error => {
        console.error('请求出错:', error);
      });
    };

    const nextPage = () => {
      if (page.value < totalPages.value - 1) {
        page.value++;
        searchNurses();
      }
    };

    const prevPage = () => {
      if (page.value > 0) {
        page.value--;
        searchNurses();
      }
    };

    const addNurse = () => {
      axios.post('http://localhost:80/api/nurses', newNurse.value)
          .then(() => {
            showAddModal.value = false;
            searchNurses(); // 刷新护士列表
            newNurse.value = { // 清空表单
              name: '',
              sex: '',
              room: '',
              grade: '',
            };
          })
          .catch(error => {
            console.error('添加护士出错:', error);
          });
    };

    const SshowEditModal = (nurse) => { // 注意这里，去掉了重复定义
      currentNurse.value = { ...nurse }; // 复制护士信息到编辑表单
      showEditModal.value = true;
    };

    const updateNurse = () => {
      axios.put(`http://localhost:80/api/nurses/${currentNurse.value.id}`, currentNurse.value)
          .then(() => {
            showEditModal.value = false;
            searchNurses(); // 刷新护士列表
          })
          .catch(error => {
            console.error('更新护士信息出错:', error);
          });
    };

    const deleteNurse = (nurseId) => {
      if (confirm('确定要删除该护士吗？')) {
        axios.delete(`http://localhost:80/api/nurses/${nurseId}`)
            .then(() => {
              searchNurses(); // 刷新护士列表
            })
            .catch(error => {
              console.error('删除护士出错:', error);
            });
      }
    };

    onMounted(() => {
      searchNurses();
    });

    return {
      nurses,
      page,
      totalPages,
      searchId,
      searchName,
      searchSex,
      searchRoom,
      searchGrade,
      showAddModal,
      newNurse,
      currentNurse,
      searchNurses,
      nextPage,
      prevPage,
      addNurse,
      showEditModal,
      SshowEditModal,
      updateNurse,
      deleteNurse,
    };
  },
};
</script>

<style>
.right{
  position: fixed;
  left: 220px;
  top: 10px;
  height: 100%;
}
</style>