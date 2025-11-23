package com.example.college.repository;

import com.example.college.model.TeacherAnnouncementEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TeacherAnnouncementRepository extends JpaRepository<TeacherAnnouncementEntity, Long> {
}
