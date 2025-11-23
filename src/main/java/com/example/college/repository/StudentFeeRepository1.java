package com.example.college.repository;

import com.example.college.model.StudentFee1;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface StudentFeeRepository1 extends JpaRepository<StudentFee1, Long> {
    Optional<StudentFee1> findByStudentEmail(String studentEmail);
}
