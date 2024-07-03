<template>
  <div>
    <router-view />
    <MainPage_HeadBar/>

  </div>
</template>

<script>
import MainPage_HeadBar from "@/router/MainPage_Headbar.vue";
export default {
  // ...
  components:{
    MainPage_HeadBar,
  }
}
</script>
<style>

</style>
