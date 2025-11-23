package com.example.college.repository;

import com.example.college.model.TeacherLeaveEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TeacherLeaveRepository extends JpaRepository<TeacherLeaveEntity, Long> {
}
