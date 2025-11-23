package com.example.college.controller;

import com.example.college.model.Attendance;
import com.example.college.repository.AttendanceRepository;
import com.example.college.repository.StudentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class AttendanceController {

    @Autowired
    private AttendanceRepository attendanceRepository;

    @Autowired
    private StudentRepository studentRepository;

    @GetMapping("/admin/attendance")
    public String listAttendance(Model model) {
        model.addAttribute("attendanceList", attendanceRepository.findAll());
        model.addAttribute("students", studentRepository.findAll());
        return "attendance";  // ← ye JSP ka naam hai (attendance.jsp)
    }

    @PostMapping("/admin/attendance")
    public String addAttendance(Attendance attendance) {
        attendanceRepository.save(attendance);
        return "redirect:/admin/attendance";
    }
}
