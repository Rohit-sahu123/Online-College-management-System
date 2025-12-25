/// /package com.example.college.model;
/// /
/// /import jakarta.persistence.*;
/// /
/// /import java.time.LocalDate;
/// /import java.time.LocalDateTime;
/// /
/// /@Entity
/// /public class Attendance {
/// /
/// /
/// /    @Id
/// /    @GeneratedValue(strategy = GenerationType.IDENTITY)
/// // /    private Long studentId;
/// /
/// // /    public Long getStudentId() {
/// // /        return studentId;
/// // /    }
/// // /
/// // /    public void setStudentId(Long studentId) {
/// // /        this.studentId = studentId;
/// // /    }
/// /
/// /    //private LocalDate date;
/// /    //private boolean present;
/// /    private LocalDateTime scanTime;
/// /
/// /    public LocalDateTime getScanTime() {
/// /        return scanTime;
/// /    }
/// /
/// /    public void setScanTime(LocalDateTime scanTime) {
/// /        this.scanTime = scanTime;
/// /    }
/// /
/// /
/// /    @Id
/// /    @GeneratedValue(strategy = GenerationType.IDENTITY)
/// /    private Long id;
/// /
/// /    private LocalDate date;
/// /    private boolean present;
/// /
/// /    @ManyToOne
/// /    @JoinColumn(name = "student_id")
/// /    // private Student student; // 👈 ye line important hai!
/// /
/// /    // Getters and Setters
/// /    public Long getId() {
/// /        return id;
/// /    }
/// /
/// /    public void setId(Long id) {
/// /        this.id = id;
/// /    }
/// /
/// /    public LocalDate getDate() {
/// /        return date;
/// /    }
/// /
/// /    public void setDate(LocalDate date) {
/// /        this.date = date;
/// /    }
/// /
/// /    public boolean isPresent() {
/// /        return present;
/// /    }
/// /
/// /    public void setPresent(boolean present) {
/// /        this.present = present;
/// /    }
/// /
/// // /    public Student getStudent() {
/// // /        return student;
/// // /    }
/// // /
/// // /    public void setStudent(Student student) {
/// // /        this.student = student;
/// // /    }
/// /}
//
//
//package com.example.college.model;
//
//import jakarta.persistence.*;
//
//import java.time.LocalDate;
//import java.time.LocalDateTime;
//
//@Entity
//@Table(name = "attendance")
//public class Attendance {
//
//    @Id
//    @GeneratedValue(strategy = GenerationType.IDENTITY)
//    private Long id;
//
//    @Column(name = "student_id")
//    private Long studentId;
//
//    private LocalDate date;
//
//    private boolean present;
//
//    private LocalDateTime scanTime;
//
//    // ===== Getters & Setters =====
//
//    public Long getId() {
//        return id;
//    }
//
//    public Long getStudentId() {
//        return studentId;
//    }
//
//    public void setStudentId(Long studentId) {
//        this.studentId = studentId;
//    }
//
//    public LocalDate getDate() {
//        return date;
//    }
//
//    public void setDate(LocalDate date) {
//        this.date = date;
//    }
//
//    public boolean isPresent() {
//        return present;
//    }
//
//    public void setPresent(boolean present) {
//        this.present = present;
//    }
//
//    public LocalDateTime getScanTime() {
//        return scanTime;
//    }
//
//    public void setScanTime(LocalDateTime scanTime) {
//        this.scanTime = scanTime;
//    }
//
//    public void setTeacherId(Long teacherId) {
//    }
//
//    public void setSubject(String subject) {
//    }
//
//    public void setStatus(String present) {
//    }
//}


package com.example.college.model;

import jakarta.persistence.*;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Entity
@Table(name = "attendance")
public class Attendance {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Long studentId;
    private String subject;
    private boolean present;
    private LocalDate date;
    private LocalDateTime scanTime;
    private String status;

    public String getStatus() {
        return status;
    }

    public Long getTeacherId() {
        return teacherId;
    }

    private Long teacherId;

    // ✅ GETTERS
    public Long getId() {
        return id;
    }

    public Long getStudentId() {
        return studentId;
    }

    public String getSubject() {
        return subject;
    }

    public boolean isPresent() {
        return present;
    }

    public LocalDate getDate() {
        return date;
    }

    public LocalDateTime getScanTime() {
        return scanTime;
    }

    // ✅ SETTERS
    public void setStudentId(Long studentId) {
        this.studentId = studentId;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public void setPresent(boolean present) {
        this.present = present;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public void setScanTime(LocalDateTime scanTime) {
        this.scanTime = scanTime;
    }

    // OPTIONAL (agar kahin status use ho raha)
    public void setStatus(String status) {
        this.present = "PRESENT".equalsIgnoreCase(status);
    }

    public void setTeacherId(Long teacherId) {
    }
}