package com.example.college.controller;

import com.example.college.model.Teacher;
import com.example.college.repository.TeacherRepository;
import com.example.college.service.StudentService1;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class AdminController {

    @Autowired
    private TeacherRepository teacherRepository;

    @Autowired
    private StudentService1 studentService;

    @GetMapping("/admin/teachers")
    public String showTeachers(Model model) {
        model.addAttribute("teachers", teacherRepository.findAll());
        return "manage-teachers";
    }

    @GetMapping("/admin/add-teacher")
    public String addTeacherForm() {
        return "add-teacher";
    }

    @PostMapping("/admin/add-teacher")
    public String saveTeacher(
            @RequestParam String name,
            @RequestParam String email,
            @RequestParam String subject,
            @RequestParam String password) {

        Teacher t = new Teacher();
        t.setName(name);
        t.setEmail(email);
        t.setSubject(subject);
        t.setPassword(password);

        teacherRepository.save(t);
        return "redirect:/admin/teachers";
    }

    @GetMapping("/notifications")
    public String notifications() {
        return "notifications";
    }

    @GetMapping("/admin/dashboard")
    public String adminDashboard() {
        return "admin-dashboard";
    }

    @GetMapping("/students")
    public String viewAllStudents(Model model) {
        model.addAttribute("students", studentService.getAllStudents());
        return "admin/student-list";
    }

    @GetMapping("/college-scanner")
    public String scannerPage() {
        return "collegeScanner";
    }

}
