// NurseRepository.java
package com.example.springboot_vue3.repository;

import com.example.springboot_vue3.model.Nurse;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface NurseRepository extends JpaRepository<Nurse, Integer> {
    @Query("SELECT n FROM Nurse n WHERE (:name is null or n.name = :name) and (:sex is null or n.sex = :sex) and (:room is null or n.room = :room) and (:grade is null or n.grade = :grade)")
    Page<Nurse> findByNameAndSexAndRoomAndGrade(@Param("name") String name, @Param("sex") String sex, @Param("room") String room, @Param("grade") String grade, Pageable pageable);
}