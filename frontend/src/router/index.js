// router/index.js
import { createRouter, createWebHistory } from 'vue-router'
import MainPage from '@/layout/Main_Page.vue'
import GetNurse from '@/components/GetNurse.vue'  // 确保你已经导入了 GetNurse 组件

const routes = [
    { path: '/', component: MainPage, meta: { title: '主页' } },
    { path: '/nurse', component: GetNurse, meta: { title: '护士' } },  // 确保你已经正确地引用了 GetNurse 组件
]

const router = createRouter({
    history: createWebHistory(process.env.BASE_URL),
    routes
})

export default router