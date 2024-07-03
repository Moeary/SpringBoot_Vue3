<template>
  <div class="headBar">
    <div class="headBarItem" v-for="item in items" :key="item.name">
      <div class="headBarItemTitle"
           @mouseover="toggleDropdown(item.name)"
           @mouseleave="closeDropdown(item.name)">
        {{ item.name }}
      </div>
      <transition name="dropdown">
        <div class="headBarDropdown" v-show="item.dropdownOpen">
          <ul>
            <li v-for="subItem in item.subItems" :key="subItem.name">{{ subItem.name }}</li>
          </ul>
        </div>
      </transition>
    </div>

    <a href="/login" class="loginButton">登录</a>
  </div>
</template>

<script>
export default {
  data() {
    return {
      items: [
        {
          name: '医院概况',
          dropdownOpen: false,
          subItems: [
            { name: '医院介绍' },
            { name: '医院领导' }
          ]
        },
        {
          name: '新闻公告',
          dropdownOpen: false,
          subItems: [
            { name: '医院公告' },
            { name: '新闻动态' }
          ]
        },
        {
          name: '就医指南',
          dropdownOpen: false,
          subItems: [
            { name: '就医流程' },
            { name: '院内布局' },
            { name: '地理位置' }
          ]
        },
        {
          name: '医疗特色',
          dropdownOpen: false,
          subItems: [
            { name: '临床医计科室' },
            { name: '专家介绍' }
          ]
        },
        {
          name: '信息公开',
          dropdownOpen: false,
          subItems: [
            { name: '执业信息' },
            { name: '服务公告' }
          ]
        },
        {
          name: '党务公开',
          dropdownOpen: false,
          subItems: [
            { name: '建党信息' },
            { name: '党风廉政建设' }
          ]
        },
        {
          name: '医院管理',
          dropdownOpen: false,
          subItems: [
            { name: '罕见病注册登记平台' },
            { name: '伦理委员会' }
          ]
        }
      ]
    };
  },
  methods: {
    toggleDropdown(itemName) {
      this.items.forEach(item => {
        item.dropdownOpen = item.name === itemName;
      });
    },
    closeDropdown(itemName) {
      const item = this.items.find(item => item.name === itemName);
      item.dropdownOpen = false;
    }
  }
};
</script>

<style scoped>
.headBar {
  display: flex;
}

.headBarItem {
  position: relative;
  padding: 10px;
  cursor: pointer;
}

.headBarItemTitle {
  font-weight: bold;
}

.headBarDropdown {
  position: absolute;
  top: 100%;
  left: 0;
  z-index: 1000;
  background-color: #fff;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
}

.headBarDropdown ul {
  list-style-type: none;
  padding: 0;
  margin: 0;
}

.headBarDropdown ul li {
  padding: 10px;
}

.dropdown-enter-active,
.dropdown-leave-active {
  transition: opacity 0.2s ease;
}

.dropdown-enter,
.dropdown-leave-to {
  opacity: 0;
}

.loginButton {
  padding: 10px 20px;
  text-decoration: none;
  color: #333;
  font-weight: bold;
}
</style>
