package com.example.college.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.example.college.model.ContactMessage;

public interface ContactRepository extends JpaRepository<ContactMessage, Integer> {
}
