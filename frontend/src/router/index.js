//index.js
import { createRouter, createWebHistory } from 'vue-router';
import MainPage from '@/components/Main_Page.vue';
import GetNurse from '@/components/GetNurse.vue';
import Login_Module from "@/components/Login_Module.vue";
import Admin_Module from "@/components/Admin_Module.vue";
import UserManagement from "@/components/UserManagement.vue";
import SystemSettings from "@/components/SystemSetting.vue";
import Appointments_Module from "@/components/Appointment_Module.vue";
import Book_Module from "@/components/Book_Module.vue";

const routes = [
    { path: '/', component: MainPage, meta: { title: '主页' } },
    { path: '/login', component: Login_Module, meta: { title: '登录' } },
    {
        path: '/admin',
        component: Admin_Module,
        meta: {
            title: '管理员',
            requiresAuth: true,
            AdminAuth: true
        },
        children: [ // 添加子路由
            {
                path: 'nurses',
                component: GetNurse // 替换为实际的护士管理组件
            },
            {
                path: 'settings',
                component: SystemSettings // 替换为实际的系统设置组件
            }
        ]
    },
    { path: '/home', component: UserManagement,
        meta: {
        title: '家',
        requiresAuth: true,
        },
    },
    {
        path: '/home/appointments', component: Appointments_Module,
        meta: {
            title: '查看预约',
            requiresAuth: true,
        },
    },
    {
      path: '/home/book', component: Book_Module,
        meta: {
            title: '预约',
            requiresAuth: true,
        },
    },
];

const router = createRouter({
    history: createWebHistory(process.env.BASE_URL),
    routes
});

/**
router.beforeEach((to, from, next) => {
    // 在每次路由跳转时都获取最新的 isLoggedIn 状态
    let isLoggedIn = sessionStorage.getItem('token');

    if (to.matched.some(record => record.meta.requiresAuth)) {
        if (!isLoggedIn) {
            next('/login'); // 未登录，直接跳转到 /login
        } else {
            // 已登录，判断是否需要管理员权限
            if (to.matched.some(record => record.meta.AdminAuth) && sessionStorage.getItem('isAdmin') !== 'true') {
                next('/home'); // 如果需要管理员权限但不是管理员，跳转到 /home
            } else {
                next(); // 其他情况，放行
            }
        }
    } else {
        next(); // 无需登录的路由，直接放行
    }
});
 **/

export default router;
