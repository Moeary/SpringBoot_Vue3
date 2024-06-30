// NurseController.java
package com.example.springboot_vue3.controller;

import com.example.springboot_vue3.model.Nurse;
import com.example.springboot_vue3.repository.NurseRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.data.jpa.repository.JpaRepository;
// 导入分页相关的类
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

@CrossOrigin(origins = "http://localhost:8080") // 允许跨域请求
@RestController
public class NurseController {
    private final NurseRepository nurseRepository;

    @Autowired
    public NurseController(NurseRepository nurseRepository) {
        this.nurseRepository = nurseRepository;
    }

    @GetMapping("/nurses")
    public List<Nurse> getNurses() {
        return nurseRepository.findAll();
    }

    @GetMapping("/nurses/search")
    public Page<Nurse> searchNurses(
            @RequestParam(required = false) Long id,
            @RequestParam(required = false) String name,
            @RequestParam(required = false) String sex,
            @RequestParam(required = false) String room,
            @RequestParam(required = false) String grade,
            Pageable pageable
    ) {
        return nurseRepository.findByIdAndNameAndSexAndRoomAndGrade(id, name, sex, room, grade, pageable);
    }

    @GetMapping("/nurses/all")
    public Page<Nurse> getAllNurses(Pageable pageable) {
        return nurseRepository.findAll(pageable);
    }
}