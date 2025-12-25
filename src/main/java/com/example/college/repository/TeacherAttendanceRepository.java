package com.example.college.repository;

import com.example.college.model.Attendance;
import com.example.college.model.TeacherAttendanceEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;

@Repository
public interface TeacherAttendanceRepository extends JpaRepository<TeacherAttendanceEntity, Long> {
    List<TeacherAttendanceEntity> findBySubjectContainingIgnoreCase(String subject);

    // 🔍 Filter by Subject
    //  List<TeacherAttendanceEntity> findByDate(String date);

    List<TeacherAttendanceEntity> findByDate(LocalDate date);

    void findByTeacherIdAndDateAndStatus(Long teacherId, LocalDate date, String status);

    @Query("""
            SELECT s.name
            FROM Student s
            JOIN Attendance a ON s.id = a.studentId
            WHERE a.date = :date AND a.present = true
            """)
    List<String> findPresentStudentNames(@Param("date") LocalDate date);

    List<Attendance> findByStudentIdAndDateBetween(
            Long studentId,
            LocalDate startDate,
            LocalDate endDate
    );

}

