<script setup>

</script>

<template>
  <el-menu router>
    <el-menu-item v-for="route in $router.options.routes" :key="route.path" :index="route.path">
      <router-link :to="route.path">{{ route.meta.title }}</router-link>
    </el-menu-item>
  </el-menu>
</template>

<style scoped>

</style>