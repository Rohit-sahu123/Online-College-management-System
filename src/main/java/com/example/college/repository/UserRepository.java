package com.example.college.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.example.college.model.User;

public interface UserRepository extends JpaRepository<User, Integer> {
    User findByEmailAndPassword(String email, String password);
}
