package com.example.springboot_vue3.controller;

import com.example.springboot_vue3.model.Nurse;
import com.example.springboot_vue3.repository.NurseRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@CrossOrigin(origins = {
        "http://localhost:8080",
        "http://192.168.1.104:8080"
})
@RestController
@RequestMapping("/api/nurses") // 为所有护士相关的 API 添加统一的前缀
public class NurseController {
    private final NurseRepository nurseRepository;

    @Autowired
    public NurseController(NurseRepository nurseRepository) {
        this.nurseRepository = nurseRepository;
    }

    @GetMapping
    public List<Nurse> getAllNurses() {
        return nurseRepository.findAll();
    }

    @GetMapping("/search")
    public Page<Nurse> searchNurses(
            @RequestParam(required = false) Long id,
            @RequestParam(required = false) String name,
            @RequestParam(required = false) String sex,
            @RequestParam(required = false) String room,
            @RequestParam(required = false) String grade,
            Pageable pageable
    ) {
        return nurseRepository.findByIdAndNameAndSexAndRoomAndGrade(
                id, name, sex, room, grade, pageable
        );
    }

    @PostMapping
    public ResponseEntity<Nurse> addNurse(@RequestBody Nurse nurse) {
        try {
            Nurse savedNurse = nurseRepository.save(nurse);
            return new ResponseEntity<>(savedNurse, HttpStatus.CREATED);
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PutMapping("/{id}")
    public ResponseEntity<Nurse> updateNurse(@PathVariable("id") long id, @RequestBody Nurse nurse) {
        Optional<Nurse> nurseData = nurseRepository.findById((int) id);

        if (nurseData.isPresent()) {
            Nurse _nurse = nurseData.get();
            _nurse.setName(nurse.getName());
            _nurse.setSex(nurse.getSex());
            _nurse.setRoom(nurse.getRoom());
            _nurse.setGrade(nurse.getGrade());
            return new ResponseEntity<>(nurseRepository.save(_nurse), HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<HttpStatus> deleteNurse(@PathVariable("id") long id) {
        try {
            nurseRepository.deleteById((int) id);
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
