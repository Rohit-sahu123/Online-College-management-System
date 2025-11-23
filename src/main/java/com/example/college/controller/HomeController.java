package com.example.college.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @GetMapping("/")
    public String home() {
        return "about"; // WEB-INF/jsp/about.jsp khulega sabse pehle
    }

    @GetMapping("/about")
    public String about() {
        return "about";
    }

    @GetMapping("/contact")
    public String contact() {
        return "contact"; // WEB-INF/jsp/contact.jsp
    }

    @GetMapping("/help")
    public String help() {
        return "help"; // WEB-INF/jsp/help.jsp
    }
//    @GetMapping("/login")
//    public String loginPage() {
//        return "login";
//    }

}

