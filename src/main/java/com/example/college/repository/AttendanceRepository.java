//package com.example.college.repository;
//
//import com.example.college.model.Attendance;
//import org.springframework.data.jpa.repository.JpaRepository;
//import org.springframework.data.jpa.repository.Modifying;
//import org.springframework.data.jpa.repository.Query;
//import org.springframework.data.repository.query.Param;
//import org.springframework.stereotype.Repository;
//import org.springframework.transaction.annotation.Transactional;
//
//import java.time.LocalDate;
//import java.util.List;
//import java.util.Optional;
//
//@Repository
//public interface AttendanceRepository extends JpaRepository<Attendance, Long> {
//    Optional<Attendance> findByStudentIdAndDate(Long studentId, LocalDate date);
//
//    List<Attendance> findByStudentId(Long studentId);
//
//    @Modifying
//    @Transactional
//    @Query("update Attendance a set a.present=false where a.date=:d and a.scanTime is null")
//    void markAbsentIfNotScanned(@Param("d") LocalDate d);
//
//    List<Attendance> findByDate(LocalDate d);
//
//    List<Attendance> findByTeacherIdAndDate(Long teacherId, LocalDate today);
//
//    List<Attendance> findByTeacherIdAndDateAndStatus(Long teacherId, LocalDate today, String present);
//
/// /    List<Attendance> findByDateAndPresent(LocalDate date, boolean present);
/// /
/// /    List<Attendance> findByStudentIdAndDateBetween(Long studentId, LocalDate start, LocalDate end, boolean present);
//
//    long countByStudentIdAndDateBetweenAndPresent(Long id, LocalDate start, LocalDate end, boolean present);
//
//    long countByStudentIdAndDateBetween(Long id, LocalDate start, LocalDate end);
//}

package com.example.college.repository;

import com.example.college.model.Attendance;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@Repository
public interface AttendanceRepository extends JpaRepository<Attendance, Long> {

    // 🔹 Single record
    Optional<Attendance> findByStudentIdAndDate(Long studentId, LocalDate date);

    // 🔹 Student all attendance
    List<Attendance> findByStudentId(Long studentId);

    // 🔹 Today present / absent (DASHBOARD + TODAY PAGE)
    List<Attendance> findByDateAndPresent(LocalDate date, boolean present);

    // 🔹 Monthly list (WITHOUT boolean)
    List<Attendance> findByStudentIdAndDateBetween(
            Long studentId,
            LocalDate start,
            LocalDate end
    );

    // 🔹 Auto absent logic
    @Modifying
    @Transactional
    @Query("update Attendance a set a.present=false where a.date=:d and a.scanTime is null")
    void markAbsentIfNotScanned(@Param("d") LocalDate d);

    @Modifying
    @Transactional
    @Query("delete from Attendance a where a.studentId = :id")
    void deleteByStudentId(@Param("id") Long id);


    @Query("""
            SELECT COUNT(DISTINCT a.date)
            FROM Attendance a
            WHERE a.date BETWEEN :start AND :end
            """)
    long countCollegeDays(
            @Param("start") LocalDate start,
            @Param("end") LocalDate end
    );


    // 🔹 Teacher-wise
    List<Attendance> findByTeacherIdAndDate(Long teacherId, LocalDate today);

    List<Attendance> findByTeacherIdAndDateAndStatus(
            Long teacherId,
            LocalDate today,
            String status
    );

    // 🔹 PRESENT % PDF
    long countByStudentIdAndDateBetweenAndPresent(
            Long studentId,
            LocalDate start,
            LocalDate end,
            boolean present
    );

    long countByStudentIdAndDateBetween(
            Long studentId,
            LocalDate start,
            LocalDate end
    );
}
