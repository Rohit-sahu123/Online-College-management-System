package com.example.college.repository;

import com.example.college.model.TeacherProfileEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TeacherProfileRepository extends JpaRepository<TeacherProfileEntity, Long> {
}
