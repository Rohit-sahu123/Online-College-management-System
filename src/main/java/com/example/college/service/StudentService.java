package com.example.college.service;

import com.example.college.model.Student;
import com.example.college.repository.StudentRepository;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;

@Service
public class StudentService {
    private final StudentRepository repo;
    public StudentService(StudentRepository repo){ this.repo = repo; }

    public List<Student> getAll(){ return repo.findAll(); }
    public Optional<Student> getById(Long id){ return repo.findById(id); }
    public Student save(Student s){ return repo.save(s); }
    public void deleteById(Long id){ repo.deleteById(id); }
}
