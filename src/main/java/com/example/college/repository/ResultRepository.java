package com.example.college.repository;

import com.example.college.model.Result;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;


public interface ResultRepository extends JpaRepository<Result, Long> {
    List<Result> findByStudentEmail(String email);
    

}

