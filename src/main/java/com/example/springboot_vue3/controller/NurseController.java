// NurseController.java
package com.example.springboot_vue3.controller;

import com.example.springboot_vue3.model.Nurse;
import com.example.springboot_vue3.repository.NurseRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.data.jpa.repository.JpaRepository;
// 导入分页相关的类
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

@CrossOrigin(origins = {
        "http://localhost:8080",
        "http://192.168.1.104:8080"
})// 允许这两个地址访问本接口
@RestController
public class NurseController {
    private final NurseRepository nurseRepository;

    @Autowired
    public NurseController(NurseRepository nurseRepository) {
        this.nurseRepository = nurseRepository;
    }

    @GetMapping("/api/nurses")
    public List<Nurse> getNurses() {
        return nurseRepository.findAll();
    }

    @GetMapping("/api/nurses/search") // 修改这里
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