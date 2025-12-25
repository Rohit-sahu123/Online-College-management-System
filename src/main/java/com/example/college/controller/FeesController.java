package com.example.college.controller;

import com.example.college.model.Fees;
import com.example.college.model.Student;
import com.example.college.model.Student1;
import com.example.college.repository.FeesRepository;
import com.example.college.repository.StudentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

@Controller
public class FeesController {

    @Autowired
    private FeesRepository feesRepository;

    @Autowired
    private StudentRepository studentRepository;

    // Show all fees records
    @GetMapping("/admin/fees")
    public String listFees(Model model) {
        List<Fees> feesList = feesRepository.findAll();
        List<Student1> students = studentRepository.findAll();  // 👈 dropdown ke liye student list
        model.addAttribute("feesList", feesList);
        model.addAttribute("students", students);
        model.addAttribute("fees", new Fees());
        return "fees";
    }

    // Save new fees record
    @PostMapping("/admin/save-fees")
    public String saveFees(@ModelAttribute Fees fees) {
        feesRepository.save(fees);
        return "redirect:/admin/fees";
    }
}
