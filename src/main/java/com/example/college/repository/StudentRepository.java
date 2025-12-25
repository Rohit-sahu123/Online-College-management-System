package com.example.college.repository;

import com.example.college.model.Student1;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface StudentRepository extends JpaRepository<Student1, Long> {

    // 🔥 YE METHOD ADD KARO
    Optional<Student1> findByEmail(String email);
}
