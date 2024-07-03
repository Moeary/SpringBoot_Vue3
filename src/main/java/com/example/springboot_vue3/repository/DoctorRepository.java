package com.example.springboot_vue3.repository;

import com.example.springboot_vue3.model.Doctor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface DoctorRepository extends JpaRepository<Doctor, Long> {
    @Query("SELECT n FROM Doctor n " +
            "WHERE (:id is null or n.id = :id) " +
            "and (:name is null or n.name like %:name%) " + // 模糊查询姓名
            "and (:sex is null or n.sex = :sex) " +
            "and (:room is null or n.room like %:room%) " + // 模糊查询科室
            "and (:grade is null or n.grade = :grade)")
    Page<Doctor> findByIdAndNameAndSexAndRoomAndGradeContaining(
            @Param("id") Long id,
            @Param("name") String name,
            @Param("sex") String sex,
            @Param("room") String room,
            @Param("grade") String grade,
            Pageable pageable
    );
}
