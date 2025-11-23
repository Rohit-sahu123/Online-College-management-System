package com.example.college.controller;

import com.example.college.repository.TeacherAnnouncementRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/student1")
public class StudentAnnouncementsController1 {

    @Autowired
    private TeacherAnnouncementRepository teacherAnnouncementRepository;

    @GetMapping("/announcements")
    public String announcements(Model model) {

        // IMPORTANT: JSP annList expect करता है
        model.addAttribute("annList", teacherAnnouncementRepository.findAll());

        return "student/student1-announcements";
    }
}
