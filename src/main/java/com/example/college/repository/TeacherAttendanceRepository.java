package com.example.college.repository;

import com.example.college.model.TeacherAttendanceEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;

@Repository
public interface TeacherAttendanceRepository extends JpaRepository<TeacherAttendanceEntity, Long> {

    // 🔍 Filter by Subject
    List<TeacherAttendanceEntity> findBySubjectContainingIgnoreCase(String subject);

    // 🔍 Filter by Date (as String)
    List<TeacherAttendanceEntity> findByDate(String date);
}

