package com.example.college.controller;

import com.example.college.model.Result;
import com.example.college.model.Student1;
import com.example.college.service.ResultService;
import com.example.college.service.StudentService1;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class ResultController {

    @Autowired
    private ResultService resultService;

    @Autowired
    private StudentService1 studentService;

    // Show results page

    @GetMapping("/admin/results")
    public String listResults(Model model) {
        model.addAttribute("results", resultService.getAllResults());
        model.addAttribute("students", studentService.getAllStudents());
        return "results";   // JSP file name
    }

    // Save new result
    @PostMapping("/admin/save-result")
    public String saveResult(
            @RequestParam Long studentId,
            @RequestParam String subject,
            @RequestParam Double marks,
            @RequestParam String grade
    ) {

        Student1 st = studentService.getStudentById(studentId);

        Result r = new Result();
        r.setStudent(st);
        r.setSubject(subject);
        r.setMarks(marks.floatValue());
        r.setGrade(grade);

        resultService.saveResult(r);

        return "redirect:/admin/results";
    }

}
