package com.example.college.model;

public class Exam {
    private String studentName;
    private String subject;
    private int marks;
    private String grade;

    public Exam(String studentName, String subject, int marks, String grade) {
        this.studentName = studentName;
        this.subject = subject;
        this.marks = marks;
        this.grade = grade;
    }

    public String getStudentName() {
        return studentName;
    }

    public String getSubject() {
        return subject;
    }

    public int getMarks() {
        return marks;
    }

    public String getGrade() {
        return grade;
    }
}
