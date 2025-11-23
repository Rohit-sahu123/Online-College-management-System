package com.example.college.repository;

import com.example.college.model.TeacherEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TeacherModuleRepository extends JpaRepository<TeacherEntity, Long> {
    TeacherEntity findByEmailAndPassword(String email, String password);
}
