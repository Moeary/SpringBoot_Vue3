//UserRepository.java
package com.example.springboot_vue3.repository;

import com.example.springboot_vue3.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

    User findByIdNumber(String idNumber);
}