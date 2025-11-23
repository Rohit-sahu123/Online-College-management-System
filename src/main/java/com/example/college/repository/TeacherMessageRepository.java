package com.example.college.repository;

import com.example.college.model.TeacherMessageEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TeacherMessageRepository extends JpaRepository<TeacherMessageEntity, Long> {
}
