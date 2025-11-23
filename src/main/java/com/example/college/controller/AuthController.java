package com.example.college.controller;

import com.example.college.model.User;
import com.example.college.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import jakarta.servlet.http.HttpSession;

@Controller
public class AuthController {

    @Autowired
    private UserRepository userRepository;

    @PostMapping("/login")
    public String login(@RequestParam String email,
                        @RequestParam String password,
                        @RequestParam String role,
                        HttpSession session) {

        // Admin login
        if (role.equalsIgnoreCase("admin")) {
            User admin = userRepository.findByEmailAndPassword(email, password);
            if (admin != null && admin.getRole().equalsIgnoreCase("admin")) {
                session.setAttribute("user", admin);
                return "redirect:/admin/dashboard";
            }
        }

        // Teacher login
        if (role.equalsIgnoreCase("teacher")) {
            User teacher = userRepository.findByEmailAndPassword(email, password);
            if (teacher != null && teacher.getRole().equalsIgnoreCase("teacher")) {
                session.setAttribute("user", teacher);
                return "redirect:/teacher/dashboard";
            }
        }

        // Student login
        if (role.equalsIgnoreCase("student")) {
            User student = userRepository.findByEmailAndPassword(email, password);
            if (student != null && student.getRole().equalsIgnoreCase("student")) {
                session.setAttribute("user", student);
                return "redirect:/student1/dashboard";
            }
        }

        // Invalid credentials
        session.setAttribute("error", "Invalid credentials! Try again.");
        return "redirect:/login";
    }

    @GetMapping("/login")
    public String loginPage() {
        return "login";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }

    // ✅ Sign Up Page Load
    @GetMapping("/signup")
    public String signupPage() {
        return "signup";  // signup.jsp open karega
    }

    // ✅ Sign Up Form Submit
    @PostMapping("/signup")
    public String processSignup(@RequestParam String name,
                                @RequestParam String email,
                                @RequestParam String password) {
        // TODO: yahan database me user save karne ka code likhna hai
        System.out.println("New user signed up: " + name + ", " + email);
        return "redirect:/login"; // signup ke baad wapas login page
    }
//    @GetMapping("/login")
//    public String loginPage() {
//        return "student/student1-login";
//    }

}
