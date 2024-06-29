// NurseController.java
package com.example.springboot_vue3.repository;

import com.example.springboot_vue3.model.Nurse;
import org.springframework.data.jpa.repository.JpaRepository;

public interface NurseRepository extends JpaRepository<Nurse, Long> {

}