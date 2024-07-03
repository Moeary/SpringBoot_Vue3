<template>
  <div>
    <router-view />
    <MainPage_Headbar></MainPage_Headbar>
    <img class="backgroundImage" :src="currentBackground" alt="Background Image">
  </div>
</template>

<script>
import MainPage_Headbar from "@/router/MainPage_Headbar.vue";

export default {
  components: {
    MainPage_Headbar,
  },
  data() {
    return {
      backgrounds: [
        require('@/assets/13.png'), // 修改为正确的图片引用方式
        require('@/assets/14.png'),
        require('@/assets/15.png'),
      ],
      currentIndex: 0,
    };
  },
  computed: {
    currentBackground() {
      return this.backgrounds[this.currentIndex];
    },
  },
  created() {
    // 添加定时器，每隔一定时间切换背景图片
    setInterval(() => {
      this.currentIndex = (this.currentIndex + 1) % this.backgrounds.length;
    }, 5000); // 每5秒钟切换一次图片，您可以根据需要调整时间间隔
  },
};
</script>

<style>
.backgroundImage {
  position: fixed;
  top: 0;
  left: 0;
  z-index: -1; /* 将图片放在最底层 */
  width: 100vw;
  height: 100vh;
  object-fit: cover; /* 图片填充整个元素 */
}
</style>
