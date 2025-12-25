package com.example.college.model;

import jakarta.persistence.*;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Entity
@Table(name = "scan_attendance")
public class ScanAttendance {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Long studentId;
    private String subject;
    private boolean present;
    private LocalDate date;
    private LocalDateTime scanTime;

    // ===== GETTERS =====
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

    // ===== SETTERS =====
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

    // OPTIONAL (agar status string use hota ho)
    public void setStatus(String status) {
        this.present = "PRESENT".equalsIgnoreCase(status);
    }
}
