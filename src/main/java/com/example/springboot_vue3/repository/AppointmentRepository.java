package com.example.springboot_vue3.repository;

import com.example.springboot_vue3.model.Appointment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface AppointmentRepository extends JpaRepository<Appointment, Long> {
    // 根据用户 ID 和分页参数获取预约信息
    Page<Appointment> findByUserId(Long userId, Pageable pageable);

    // 根据用户 ID、科室名称、支付金额和分页参数获取预约信息
    @Query("SELECT a FROM Appointment a WHERE a.user.id = :userId AND a.roomName = :roomName AND a.paymentAmount = :pay")
    Page<Appointment> findByUserIdAndRoomNameAndPaymentAmount(
            @Param("userId") Long userId,
            @Param("roomName") String roomName,
            @Param("pay") BigDecimal paymentAmount,
            Pageable pageable);

    Page<Appointment> findByUserIdNumber(String idNumber, Pageable pageable);
}
