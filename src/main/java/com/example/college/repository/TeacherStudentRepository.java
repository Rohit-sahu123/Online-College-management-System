package com.example.college.repository;

import com.example.college.model.TeacherStudentEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface TeacherStudentRepository extends JpaRepository<TeacherStudentEntity, Long> {
    List<TeacherStudentEntity> findByBatchContainingIgnoreCase(String batch);

    List<TeacherStudentEntity> findByNameContainingIgnoreCase(String name);
}

