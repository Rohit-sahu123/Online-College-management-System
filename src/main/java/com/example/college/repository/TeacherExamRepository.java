package com.example.college.repository;

import com.example.college.model.TeacherExamEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TeacherExamRepository extends JpaRepository<TeacherExamEntity, Long> {
}
