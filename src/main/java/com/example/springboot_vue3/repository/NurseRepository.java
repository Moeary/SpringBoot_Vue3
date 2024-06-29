// NurseRepository.java
package com.example.springboot_vue3.repository;

import com.example.springboot_vue3.model.Nurse;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface NurseRepository extends JpaRepository<Nurse, Long> {
    @Query("SELECT n FROM Nurse n WHERE (:name is null or n.name like :name) and(:sex is null or n.sex like :sex) and (:room is null or n.room like :room) and (:grade is null or n.grade like :grade)")
    List<Nurse> findByNameAndSexAndRoomAndGrade(@Param("name") String name, @Param("sex") String sex,@Param("room") String room, @Param("grade") String grade);
}