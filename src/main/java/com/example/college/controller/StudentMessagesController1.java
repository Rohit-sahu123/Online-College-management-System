package com.example.college.controller;

import com.example.college.repository.TeacherMessageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/student1")
public class StudentMessagesController1 {

    @Autowired
    private TeacherMessageRepository teacherMessageRepository;

    // 💬 Show all messages sent by teachers
    @GetMapping("/messages")
    public String messages(Model model) {

        model.addAttribute("msgList", teacherMessageRepository.findAll());

        return "student/student1-messages";
    }
}
