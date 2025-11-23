package com.example.college.service;

import com.example.college.model.StudentFee1;
import com.example.college.repository.StudentFeeRepository1;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class StudentFeeService1 {

    private final StudentFeeRepository1 repo;

    public StudentFeeService1(StudentFeeRepository1 repo) {
        this.repo = repo;
    }

    public Optional<StudentFee1> getByEmail(String email) {
        return repo.findByStudentEmail(email);
    }

    public StudentFee1 save(StudentFee1 fee) {
        return repo.save(fee);
    }
}
