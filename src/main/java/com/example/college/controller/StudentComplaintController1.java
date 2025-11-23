package com.example.college.controller;

import com.example.college.model.StudentComplaintEntity;
import com.example.college.repository.StudentComplaintRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/student1")
public class StudentComplaintController1 {

    @Autowired
    private StudentComplaintRepository repo;

    @GetMapping("/complaints")
    public String complaintForm(Model model) {
        model.addAttribute("complaint", new StudentComplaintEntity());
        return "student/student1-complaints";
    }

    @PostMapping("/complaints/save")
    public String saveComplaint(@ModelAttribute StudentComplaintEntity complaint) {
        repo.save(complaint);
        return "redirect:/student1/complaints";
    }

    @GetMapping("/complaints/all")
    public String viewAllComplaints(Model model) {
        model.addAttribute("list", repo.findAll());
        return "student/student1-complaints-list";
    }
}
