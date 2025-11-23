package com.example.college.service;

import com.example.college.model.Result;
import com.example.college.repository.ResultRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ResultService {

    @Autowired
    private ResultRepository repo;

    public Result saveResult(Result r) {
        return repo.save(r);
    }

    public List<Result> getAllResults() {
        return repo.findAll();
    }


    public List<Result> getByEmail(String email) {
        return repo.findByStudentEmail(email);
    }

}
