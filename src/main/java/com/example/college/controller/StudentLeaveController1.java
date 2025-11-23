package com.example.college.controller;

import com.example.college.model.TeacherLeaveEntity;
import com.example.college.repository.TeacherLeaveRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/student1")
public class StudentLeaveController1 {

    @Autowired
    private TeacherLeaveRepository leaveRepo;

    // Leave Form Page
    @GetMapping("/leave")
    public String leaveForm(Model model) {
        model.addAttribute("leave", new TeacherLeaveEntity());
        return "student/student1-leave";
    }

    // Save Leave Request
    @PostMapping("/leave/save")
    public String saveLeave(@ModelAttribute TeacherLeaveEntity leave, HttpSession session) {
        leave.setStatus("Pending");
        leaveRepo.save(leave);
        session.setAttribute("msg", "Leave request submitted!");
        return "redirect:/student1/leave";
    }

    // View All Leave Requests
    @GetMapping("/leave/history")
    public String leaveHistory(Model model) {
        model.addAttribute("leaveList", leaveRepo.findAll());
        return "student/student1-leave-history";
    }
}
