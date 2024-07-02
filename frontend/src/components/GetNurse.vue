<template>
  <Sidebar_Setting/>
  <div>
    <form @submit.prevent="searchNurses">
      <label>ID: <input v-model="id" type="text"></label>
      <label>姓名: <input v-model="name" type="text"></label>
      <label>性别:
        <select v-model="sex">
          <option value="男">男</option>
          <option value="女">女</option>
        </select>
      </label>
      <label>科室: <input v-model="room" type="text"></label>
      <label>级别:
        <select v-model="grade">
          <option value="初级">初级</option>
          <option value="中级">中级</option>
          <option value="高级">高级</option>
        </select>
      </label>
      <button type="submit">查询</button> <!-- 移除了 @click="searchNurses" -->
    </form>

    <table>
      <thead>
      <tr>
        <th>ID</th>
        <th>姓名</th>
        <th>性别</th>
        <th>科室</th>
        <th>级别</th>
      </tr>
      </thead>
      <tbody>
      <tr v-for="nurse in nurses" :key="nurse.id">
        <td>{{ nurse.id }}</td>
        <td>{{ nurse.name }}</td>
        <td>{{ nurse.sex }}</td>
        <td>{{ nurse.room }}</td>
        <td>{{ nurse.grade }}</td>
      </tr>
      </tbody>
    </table>
    <button @click="prevPage">上一页</button>
    <button @click="nextPage">下一页</button>
  </div>
</template>

<script>
import { ref, onMounted, nextTick } from 'vue';
import axios from 'axios';

export default {
  setup() {
    const nurses = ref([]);
    const page = ref(0);
    const totalPages = ref(0);

    const id = ref(null);
    const name = ref(null);
    const sex = ref(null);
    const room = ref(null);
    const grade = ref(null);

    const searchNurses = () => {
      nurses.value = [];
      console.log("Searching nurses...");
      nextTick().then(() => {
        axios.get('http://localhost:80/api/nurses/search?', {
          params: {
            page: page.value,
            size: 10,
            id: id.value||null,
            name: name.value||null,
            sex:sex.value||null,
            room:room.value||null,
            grade:grade.value||null,
          },
        }).then(response => {
          console.log("Response data: ", response.data);
          if (response.data.content.length === 0) {
            alert("没有找到匹配的护士");
          } else {
            nurses.value = response.data.content;
            totalPages.value = response.data.totalPages;
          }
        }).catch(error => {
          console.error('There was a problem with the request:', error);
        });
      });
    };

    const nextPage = () => {
      if (page.value < totalPages.value - 1) {  // 检查是否已经到达最后一页
        page.value++;
        searchNurses();
      } else {
        alert("已经是最后一页了");
      }
    };

    const prevPage = () => {
      if (page.value > 0) {
        page.value--;
        searchNurses();
      } else {
        alert("已经是第一页了");
      }
    };

    onMounted(() => {
      searchNurses();
    });

    return {
      nurses,
      nextPage,
      prevPage,
      searchNurses,
      id,
      name,
      sex,
      room,
      grade,
    };
  },
};
</script>