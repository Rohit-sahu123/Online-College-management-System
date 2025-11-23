
package com.example.college.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.example.college.model.Teacher;

public interface TeacherRepository extends JpaRepository<Teacher, Integer> {
}
