<template>
  <div class="login-container">
    <el-card class="login-card">
      <template #header>
        <span>{{ showRegister ? '注册' : '账号密码登陆' }}</span>
      </template>
      <el-form
          v-if="!showRegister"
          ref="loginFormRef"
          :model="loginForm"
          :rules="loginRules"
          label-position="top"
      >
        <el-form-item prop="idNumber" label="身份证号">
          <el-input v-model="loginForm.idNumber" placeholder="请输入身份证号" />
        </el-form-item>
        <el-form-item prop="password" label="密码">
          <el-input
              v-model="loginForm.password"
              placeholder="请输入密码"
              type="password"
              show-password
          />
        </el-form-item>
        <el-form-item>
          <el-checkbox v-model="loginForm.rememberMe"
          >是否自动登陆</el-checkbox
          >
        </el-form-item>
        <el-form-item>
          <el-button type="primary" style="width: 100%" @click="handleLogin"
          >登陆</el-button
          >
        </el-form-item>
      </el-form>

      <el-form
          v-else
          ref="registerFormRef"
          :model="registerForm"
          :rules="registerRules"
          label-position="top"
      >
        <el-form-item prop="idNumber" label="身份证号">
          <el-input
              v-model="registerForm.idNumber"
              placeholder="请输入身份证号"
          />
        </el-form-item>
        <el-form-item prop="password" label="密码">
          <el-input
              v-model="registerForm.password"
              placeholder="请输入密码"
              type="password"
              show-password
          />
        </el-form-item>
        <el-form-item prop="confirmPassword" label="确认密码">
          <el-input
              v-model="registerForm.confirmPassword"
              placeholder="请再次输入密码"
              type="password"
              show-password
          />
        </el-form-item>
        <el-form-item>
          <el-button type="primary" style="width: 100%" @click="handleRegister"
          >注册</el-button
          >
        </el-form-item>
      </el-form>

      <div class="login-card-footer">
        <span v-if="!showRegister">没有账号？</span>
        <el-link
            type="primary"
            @click="showRegister = !showRegister"
        >{{ showRegister ? '返回登录' : '点击注册' }}</el-link
        >
      </div>
    </el-card>
  </div>
</template>

<script>
import { reactive, ref } from 'vue';
import router from "@/router";
import axios from 'axios';

export default {
  setup() {
    const showRegister = ref(false);

    const loginForm = reactive({
      idNumber: '',
      password: '',
      rememberMe: false,
    });

    const loginRules = {
      idNumber: [
        { required: true, message: '请输入身份证号', trigger: 'blur' },
        {
          validator: (rule, value, callback) => {
            if (!/^[1-9]\d{5}(18|19|20)\d{2}((0[1-9])|(1[0-2]))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$/.test(value)) {
              callback(new Error('请输入正确的身份证号'));
            } else {
              callback();
            }
          },
          trigger: 'blur',
        },
      ],
      password: [
        { required: true, message: '请输入密码', trigger: 'blur' },
        { min: 6, message: '密码长度不能小于6位', trigger: 'blur' },
      ],
    };

    const registerForm = reactive({
      idNumber: '',
      password: '',
      confirmPassword: '',
    });

    const registerRules = {
      idNumber: [
        { required: true, message: '请输入身份证号', trigger: 'blur' },
        {
          validator: (rule, value, callback) => {
            if (!/^[1-9]\d{5}(18|19|20)\d{2}((0[1-9])|(1[0-2]))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$/.test(value)) {
              callback(new Error('请输入正确的身份证号'));
            } else {
              callback();
            }
          },
          trigger: 'blur',
        },
      ],
      password: [
        { required: true, message: '请输入密码', trigger: 'blur' },
        { min: 6, message: '密码长度不能小于6位', trigger: 'blur' },
      ],
      confirmPassword: [
        { required: true, message: '请再次输入密码', trigger: 'blur' },
        {
          validator: (rule, value, callback) => {
            if (value !== registerForm.password) {
              callback(new Error('两次输入的密码不一致'));
            } else {
              callback();
            }
          },
          trigger: 'blur',
        },
      ],
    };

    const loginFormRef = ref(null);
    const registerFormRef = ref(null);

    const handleLogin = async () => {
      try {
        const valid = await loginFormRef.value.validate();

        if (valid) {
          const response = await axios.post('/api/user/search', { // 修改这个 URL
            idNumber: loginForm.idNumber,
            password: loginForm.password,
          });

          if (response.data.success) {
            console.log('登录成功', response.data);

            // 存储用户信息到 sessionStorage
            sessionStorage.setItem('idNumber', loginForm.idNumber);
            sessionStorage.setItem('username', response.data.username);
            sessionStorage.setItem('isAdmin', response.data.isAdmin); // 存储 isAdmin 信息

            // 根据用户类型跳转路由
            if (response.data.isAdmin) {
              await router.push('/admin'); // 直接跳转到 /admin
            } else {
              await router.push('/home'); // 直接跳转到 /home
            }
          } else {
            console.log('登录失败', response.data.message);
            alert(response.data.message);
          }
        } else {
          console.log('登录失败：表单校验未通过');
          return false;
        }
      } catch (error) {
        console.error('登录过程中出现错误：', error);
      }
    };

    const handleRegister = async () => {
      try {
        const valid = await registerFormRef.value.validate();

        if (valid) {
          const response = await axios.post('/api/user/register', { // 修改为注册 API 的 URL
            idNumber: registerForm.idNumber,
            password: registerForm.password,
            // ...其他注册信息
          });

          if (response.data.success) {
            console.log('注册成功', response.data);
            // 可以选择在这里自动登录，或者提示用户注册成功
            alert('注册成功！');
            // ...其他操作，例如清空表单
            await router.push('/login');
          } else {
            console.log('注册失败', response.data.message);
            alert(response.data.message);
          }
        } else {
          console.log('注册失败：表单校验未通过');
          return false;
        }
      } catch (error) {
        console.error('注册过程中出现错误：', error);
      }
    };


    return {
      showRegister,
      loginForm,
      loginRules,
      registerForm,
      registerRules,
      loginFormRef,
      registerFormRef,
      handleLogin,
      handleRegister,
    };
  },
};
</script>

<style scoped>
.login-container {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
  background-color: #e5f3ff; /* 设置背景颜色 */
}

.login-card {
  width: 400px;
  border-radius: 10px;
}

.login-card-header-right {
  float: right;
  font-size: 14px;
  color: #909399;
}

.login-card-footer {
  text-align: center;
  margin-top: 20px;
  font-size: 14px;
  color: #909399;
}
</style>
