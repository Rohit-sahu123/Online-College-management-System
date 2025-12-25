//package com.example.college.controller;
//
//import com.example.college.model.Student;
//import com.example.college.service.StudentService;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.*;
//import org.springframework.web.multipart.MultipartFile;
//
//
//@Controller
//@RequestMapping("/admin/students")   // class-level: सारे routes इसी base के अंदर
//public class StudentController {
//    private final StudentService studentService;
//
//    public StudentController(StudentService studentService) {
//        this.studentService = studentService;
//    }
//
//    @GetMapping
//    public String listStudents(Model model) {
//        model.addAttribute("students", studentService.getAll());
//        return "students"; // /WEB-INF/views/students.jsp
//    }
//
//    @GetMapping("/add")
//    public String showAddForm(Model model) {
//        model.addAttribute("student", new Student());
//        return "add-student";
//    }
//
//    @PostMapping("/add")
//    public String addStudent(@ModelAttribute Student student) {
//        studentService.save(student);
//        return "redirect:/admin/students";
//    }
//
//    @GetMapping("/edit/{id}")
//    public String showEdit(@PathVariable Long id, Model model) {
//        Student s = studentService.getById(id).orElseThrow();
//        model.addAttribute("student", s);
//        return "add-student";
//    }
//
//    @PostMapping("/update")
//    public String updateStudent(@ModelAttribute Student student) {
//        studentService.save(student);
//        return "redirect:/admin/students";
//    }
//
//    @GetMapping("/delete/{id}")
//    public String deleteStudent(@PathVariable Long id) {
//        studentService.deleteById(id);
//        return "redirect:/admin/students";
//    }
//
//
//}


package com.example.college.controller;

import com.example.college.model.Student1;
import com.example.college.service.StudentService1;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/student")
public class StudentController {

    @Autowired
    private StudentService1 studentService;

    // 🔹 LIST ALL STUDENTS
    @GetMapping("/list")
    public String listStudents(Model model) {
        model.addAttribute("students", studentService.getAllStudents());
        return "student/list";
    }

    // 🔹 SAVE STUDENT
    @PostMapping("/save")
    public String saveStudent(@ModelAttribute Student1 student) {
        studentService.save(student);
        return "redirect:/student/list";
    }

    // 🔹 EDIT STUDENT
    @GetMapping("/edit/{id}")
    public String editStudent(@PathVariable Long id, Model model) {
        Student1 student = studentService.getStudentById(id);
        model.addAttribute("student", student);
        return "student/edit";
    }

    // 🔹 DELETE STUDENT
    @GetMapping("/delete/{id}")
    public String deleteStudent(@PathVariable("id") Long id) {
        System.out.println("DELETE ID = " + id); // 🔍 DEBUG
        studentService.deleteById(id);
        return "redirect:/student/list";
    }

}
