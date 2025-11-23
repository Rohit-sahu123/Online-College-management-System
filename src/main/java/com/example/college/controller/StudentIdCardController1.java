package com.example.college.controller;

import com.example.college.model.Student1;
import com.example.college.repository.StudentRepository1;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/student1")
public class StudentIdCardController1 {

    @Autowired
    private StudentRepository1 repo;

//    @GetMapping("/idcard")
//    public String idCard(Model model, HttpSession session) {
//
//        String email = (String) session.getAttribute("student_email");
//
//        // 🔥 FIX: Optional handle
//        Student1 st = repo.findByEmail(email);
//
//
//        model.addAttribute("student", st);
//
//        return "student/student1-idcard";
//    }
}
