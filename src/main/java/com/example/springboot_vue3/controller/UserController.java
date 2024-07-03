// UserController.java
package com.example.springboot_vue3.controller;

import com.example.springboot_vue3.model.User;
import com.example.springboot_vue3.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import com.example.springboot_vue3.repository.AppointmentRepository;

import java.util.HashMap;
import java.util.Map;
import java.util.List;

@CrossOrigin(origins = {
        "http://localhost:8080",
        "http://192.168.1.104:8080",
        "http://localhost",
})
@RestController
public class UserController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private AppointmentRepository appointmentRepository; // 注入 AppointmentRepository

    @PostMapping("/user/search")
    public ResponseEntity<Map<String, Object>> queryUser(@RequestBody User loginUser) {
        Map<String, Object> response = new HashMap<>();

        User user = userRepository.findByIdNumber(loginUser.getIdNumber());
        if (user != null && user.getPassword().equals(loginUser.getPassword())) {
            response.put("success", true);
            response.put("message", "登录成功");
            response.put("username", user.getIdNumber());
            response.put("isAdmin", user.getIsAdmin());
        } else {
            response.put("success", false);
            response.put("message", "用户名或密码错误");
        }
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    @PostMapping("/user/register")
    public ResponseEntity<Map<String, Object>> registerUser(@RequestBody User newUser) {
        Map<String, Object> response = new HashMap<>();

        // 检查用户名是否已存在
        if (userRepository.findByIdNumber(newUser.getIdNumber()) != null) {
            response.put("success", false);
            response.put("message", "该身份证号码已被注册");
            return new ResponseEntity<>(response, HttpStatus.BAD_REQUEST);
        }

        // 设置默认值
        newUser.setIsAdmin(false); // 默认不是管理员

        // 保存用户信息到数据库
        User savedUser = userRepository.save(newUser);

        response.put("success", true);
        response.put("message", "注册成功");
        response.put("userId", savedUser.getId()); // 可以返回新用户的 ID
        return new ResponseEntity<>(response, HttpStatus.CREATED);
    }

    @GetMapping("/user/all")
    public ResponseEntity<List<User>> queryAllUsers() {
        List<User> users = userRepository.findAll();
        return new ResponseEntity<>(users, HttpStatus.OK);
    }

    @GetMapping("/api/users")
    public ResponseEntity<List<User>> getAllUsers() {
        List<User> users = userRepository.findAll();
        return new ResponseEntity<>(users, HttpStatus.OK);
    }

    @DeleteMapping("/api/users/{id}")
    public ResponseEntity<Map<String, Object>> deleteUser(@PathVariable Long id) {
        Map<String, Object> response = new HashMap<>();
        User user = userRepository.findById(id).orElse(null);
        if (user == null) {
            response.put("success", false);
            response.put("message", "用户不存在");
            return new ResponseEntity<>(response, HttpStatus.NOT_FOUND);
        }

        if (user.getIsAdmin()) {
            response.put("success", false);
            response.put("message", "不能删除管理员用户");
            return new ResponseEntity<>(response, HttpStatus.BAD_REQUEST);
        }

        try {
            // 1. 删除相关预约信息
            appointmentRepository.deleteAllByIdNumber(user.getIdNumber());

            // 2. 删除用户信息
            userRepository.deleteById(id);

            response.put("success", true);
            response.put("message", "用户删除成功");
            return new ResponseEntity<>(response, HttpStatus.OK);
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "删除用户失败");
            return new ResponseEntity<>(response, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}

