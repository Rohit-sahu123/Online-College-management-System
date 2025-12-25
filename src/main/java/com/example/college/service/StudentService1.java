package com.example.college.service;

import com.example.college.model.Student1;
import com.example.college.repository.AttendanceRepository;
import com.example.college.repository.StudentRepository;
import com.example.college.repository.StudentRepository1;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudentService1 {

    @Autowired
    private StudentRepository1 repo;

    // SAVE student
    public void save(Student1 st) {
        repo.save(st);
    }

    // Get student by email  <-- ADD THIS
    public Student1 getByEmail(String email) {
        return repo.findByEmail(email);
    }

    // Login
//    public Student1 login(String email, String password) {
//        return repo.findByEmailAndPassword(email, password);
//    }
    public Student1 login(String email, String password) {

        System.out.println("SERVICE LOGIN EMAIL = " + email);

        Student1 student = studentRepository.findByEmail(email).orElse(null);

        if (student == null) {
            System.out.println("❌ STUDENT NOT FOUND");
            return null;
        }

        System.out.println("DB PASSWORD = " + student.getPassword());

        if (!student.getPassword().trim().equals(password.trim())) {
            System.out.println("❌ PASSWORD MISMATCH");
            return null;
        }

        System.out.println("✅ LOGIN OK");
        return student;
    }


    // Get all students
    public List<Student1> getAllStudents() {
        return repo.findAll();
    }

    // Get student by id
    @Autowired
    private StudentRepository studentRepository;

    // 🔥 TOTAL STUDENTS (COUNT)
    public long getTotalStudents() {
        return studentRepository.count();
    }

    // (optional)
    public Student1 getStudentById(Long id) {
        return studentRepository.findById(id).orElse(null);
    }


    //    public Student1 findByEmail(String email) {
//        Student1 student;
//        return studentRepository.save(student);
//    }
    public Student1 getStudentByEmail(String email) {
        return studentRepository.findByEmail(email).orElse(null);
    }


    // 🔹 SAVE

    // 🔹 FIND BY EMAIL
    public Student1 findByEmail(String email) {
        return studentRepository.findByEmail(email).orElse(null);
    }

//    public void deleteById(Long id) {
//    }

    // 🔹 LOGIN (Controller isko call karta hai)


    // 🔹 COUNT (Dashboard ke liye)
    @Autowired
    private AttendanceRepository attendanceRepository;

    @Transactional
    public void deleteById(Long id) {
        //AttendanceRepository attendanceRepository;
        attendanceRepository.deleteByStudentId(id); // 🔥 FIRST
        studentRepository.deleteById(id);           // 🔥 THEN
    }

}



