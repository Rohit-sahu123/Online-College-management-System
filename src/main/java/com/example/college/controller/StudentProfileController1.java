package com.example.college.controller;

import com.example.college.model.Student1;
import com.example.college.service.StudentService1;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/student1")
public class StudentProfileController1 {

    @Autowired
    private StudentService1 service;

    // VIEW PROFILE
    @GetMapping("/profile")
    public String profile(Model model, HttpSession session) {

        Student1 st = (Student1) session.getAttribute("student1");
        if (st == null) return "redirect:/student1/login";

        //Student1 st = service.getByEmail(email);

        model.addAttribute("student", st);

        return "student/student1-profile";
    }


    // EDIT PAGE
    @GetMapping("/profile/edit")
    public String editProfile(Model model, HttpSession session) {

        Student1 st = (Student1) session.getAttribute("student1");

        // Student1 st = service.getByEmail(email);

        if (st == null) {
            return "redirect:/student1/login";
        }

        model.addAttribute("student", st);

        return "student/student1-profile-edit";
    }

    // UPDATE
//    @PostMapping("/profile/update")
//    public String updateProfile(Student1 form, HttpSession session) {
//
//        String email = (String) session.getAttribute("studentEmail");
//
//        Student1 st = service.getByEmail(email);
//
//        st.setName(form.getName());
//        st.setPhone(form.getPhone());
//        st.setAddress(form.getAddress());
//
//        service.save(st);
//
//        return "redirect:/student1/profile";
//    }
}
