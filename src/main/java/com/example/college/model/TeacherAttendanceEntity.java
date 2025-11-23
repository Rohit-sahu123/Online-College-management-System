package com.example.college.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "teacher_attendance")
@Getter
@Setter
public class TeacherAttendanceEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String studentName;
    private String rollNo;
    private String subject;
    private String date;
    private String status;
    private String teacherEmail;
}
