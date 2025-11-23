package com.example.college.controller;

import com.example.college.model.Student1;
import com.example.college.model.StudentFee1;
import com.example.college.service.StudentFeeService1;
import com.example.college.service.StudentService1;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/student1")
public class StudentFeeController1 {

    @Autowired
    private StudentFeeService1 feeService;

    @Autowired
    private StudentService1 studentService;

    //    @GetMapping("/fee")
//    public String studentFeeDetails(HttpSession session, Model model) {
//        String email = (String) session.getAttribute("studentEmail");
//
//        if (email == null) {
//            return "redirect:/student1/login";
//        }
//
//        Student1 st = studentService.getByEmail(email).orElse(null);
//        StudentFee1 fee = feeService.getByEmail(email).orElse(null);
//
//        model.addAttribute("student", st);
//        model.addAttribute("fee", fee);
//
//        return "student/student1-fee-details";
//    }
    @GetMapping("/fees")
    public String studentFeeDetails(HttpSession session, Model model) {

        String email = (String) session.getAttribute("studentEmail");

        if (email == null) {
            return "redirect:/student1/login";
        }

        // Student1 returns direct object
        Student1 st = studentService.findByEmail(email);


        // StudentFee1 returns Optional
        StudentFee1 fee = feeService.getByEmail(email).orElse(null);

        model.addAttribute("student", st);
        model.addAttribute("fee", fee);

        return "student/student1-fees";
    }

}
