package com.example.college.repository;

import com.example.college.model.Student1;
import org.springframework.data.jpa.repository.JpaRepository;

public interface StudentRepository1 extends JpaRepository<Student1, Long> {

    Student1 findByEmail(String email);

    Student1 findByEmailAndPassword(String email, String password);

    Student1 findById(long id);  // <-- ADD THIS
}
