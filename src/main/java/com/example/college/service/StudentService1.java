package com.example.college.service;

import com.example.college.model.Student1;
import com.example.college.repository.StudentRepository1;
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
    public Student1 login(String email, String password) {
        return repo.findByEmailAndPassword(email, password);
    }

    // Get all students
    public List<Student1> getAllStudents() {
        return repo.findAll();
    }

    // Get student by id
    public Student1 getStudentById(Long id) {
        return repo.findById(id).orElse(null);
    }

    public Student1 findByEmail(String email) {
        return repo.findByEmail(email);
    }

}
