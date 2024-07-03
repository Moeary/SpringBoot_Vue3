package com.example.springboot_vue3.controller;

import com.example.springboot_vue3.model.Appointment;
import com.example.springboot_vue3.model.User;
import com.example.springboot_vue3.repository.AppointmentRepository;
import com.example.springboot_vue3.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;
import org.springframework.data.domain.Page;

import org.springframework.data.domain.Pageable; // Correct import


@CrossOrigin(origins = {
        "http://localhost:8080",
        "http://192.168.1.104:8080",
        "http://localhost",
})
@RestController
public class AppointmentController {

    @Autowired
    private AppointmentRepository appointmentRepository;

    @Autowired
    private UserRepository userRepository;

    @PostMapping("/user/appointments")
    public ResponseEntity<Map<String, Object>> createAppointment(@RequestBody Appointment appointmentRequest) {
        Map<String, Object> response = new HashMap<>();

        Appointment appointment;

        // 检查用户是否存在
        User user = userRepository.findByIdNumber(appointmentRequest.getIdNumber());
        if (user == null) {
            response.put("success", false);
            response.put("message", "用户不存在");
            return new ResponseEntity<>(response, HttpStatus.BAD_REQUEST);
        }

        // 设置预约信息
        appointment = new Appointment();
        appointment.setUser(user);
        appointment.setIdNumber(appointmentRequest.getIdNumber());
        appointment.setAppointmentDate(appointmentRequest.getAppointmentDate());
        appointment.setIsExpert(appointmentRequest.getIsExpert());
        appointment.setPaymentAmount(appointmentRequest.getIsExpert() ? new BigDecimal("50.00") : new BigDecimal("25.00"));
        appointment.setCreatedAt(LocalDateTime.now());
        appointment.setRoomName("外科");

        // 保存预约信息到数据库
        Appointment savedAppointment = appointmentRepository.save(appointment);

        response.put("success", true);
        response.put("message", "预约成功");
        response.put("appointmentId", savedAppointment.getId());
        return new ResponseEntity<>(response, HttpStatus.CREATED);
    }


    @GetMapping("/api/appointments/user")
    public Page<Appointment> getUserAppointments(
            @RequestParam Long userId, // 获取用户 ID
            Pageable pageable // 分页参数
    ) {
        return appointmentRepository.findByUserId(userId, pageable);
    }
    @GetMapping("/api/appointments/query")
    public Page<Appointment> getUserAppointments(
            @RequestParam String idNumber, // Get idNumber from request parameter
            Pageable pageable // Pagination parameters
    ) {
        return appointmentRepository.findByUserIdNumber(idNumber, pageable);
    }

    @DeleteMapping("/api/appointments/id_number/{idNumber}")
    public ResponseEntity<Map<String, Object>> deleteAppointmentsByIdNumber(@PathVariable String idNumber) {
        Map<String, Object> response = new HashMap<>();
        try {
            // 根据身份证号删除预约信息
            appointmentRepository.deleteAppointmentsByIdNumber(idNumber);
            response.put("success", true);
            response.put("message", "预约信息删除成功");
            return new ResponseEntity<>(response, HttpStatus.OK);
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "预约信息删除失败：" + e.getMessage());
            return new ResponseEntity<>(response, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
