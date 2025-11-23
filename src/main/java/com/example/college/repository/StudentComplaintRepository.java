package com.example.college.repository;

import com.example.college.model.StudentComplaintEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface StudentComplaintRepository extends JpaRepository<StudentComplaintEntity, Long> {
}
