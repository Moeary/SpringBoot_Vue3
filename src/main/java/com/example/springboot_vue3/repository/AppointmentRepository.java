package com.example.springboot_vue3.repository;

import com.example.springboot_vue3.model.Appointment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface AppointmentRepository extends JpaRepository<Appointment, Long> {
    // 根据用户 ID 和分页参数获取预约信息
    Page<Appointment> findByUserId(Long userId, Pageable pageable);

    Page<Appointment> findByUserIdNumber(String idNumber, Pageable pageable);

    void deleteAllByIdNumber(String idNumber);

    void deleteAppointmentsByIdNumber(String idNumber);
}
