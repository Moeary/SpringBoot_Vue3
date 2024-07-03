package com.example.springboot_vue3.controller;

import com.example.springboot_vue3.model.Doctor;
import com.example.springboot_vue3.repository.DoctorRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@CrossOrigin(origins = {
        "http://localhost:8080",
        "http://192.168.1.104:8080"
})
@RestController
@RequestMapping("/api/doctors") // 使用 /api/doctors 作为基础路径
public class DoctorController {
    private final DoctorRepository doctorRepository;

    @Autowired
    public DoctorController(DoctorRepository doctorRepository) {
        this.doctorRepository = doctorRepository;
    }


    @PostMapping
    public Doctor addDoctor(@RequestBody Doctor doctor) {
        return doctorRepository.save(doctor);
    }

    @GetMapping("/search")
    public Page<Doctor> searchDoctors(
            @RequestParam(required = false) Long id,
            @RequestParam(required = false) String name,
            @RequestParam(required = false) String sex,
            @RequestParam(required = false) String room,
            @RequestParam(required = false) String grade,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size
    ) {
        PageRequest pageable = PageRequest.of(page, size);
        return doctorRepository.findByIdAndNameAndSexAndRoomAndGradeContaining(
                id, name, sex, room, grade, pageable
        );
    }

    @PutMapping("/{id}") // 更新医生信息
    public ResponseEntity<Doctor> updateDoctor(@PathVariable Long id, @RequestBody Doctor updatedDoctor) {
        Doctor doctor = doctorRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("找不到ID为 " + id + " 的医生"));

        doctor.setName(updatedDoctor.getName());
        doctor.setSex(updatedDoctor.getSex());
        doctor.setRoom(updatedDoctor.getRoom());
        doctor.setGrade(updatedDoctor.getGrade());

        Doctor savedDoctor = doctorRepository.save(doctor);
        return ResponseEntity.ok(savedDoctor);
    }

    @DeleteMapping("/{id}") // 删除医生
    public ResponseEntity<String> deleteDoctor(@PathVariable Long id) {
        doctorRepository.deleteById(id);
        return ResponseEntity.status(HttpStatus.NO_CONTENT).build();
    }
}

