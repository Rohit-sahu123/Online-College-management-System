package com.example.college.service;

import com.example.college.model.Student;
import com.example.college.model.Student1;
import com.example.college.repository.StudentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class StudentService {

    @Autowired
    private StudentRepository studentRepository;

    public List<Student1> getAllStudents() {
        return studentRepository.findAll();
    }

    public long getTotalStudents() {
        return studentRepository.count();
    }

    public Student1 getStudentById(Long id) {
        return studentRepository.findById(id).orElse(null);
    }

    public Student1 save(Student1 student) {
        return studentRepository.save(student);
    }
}
