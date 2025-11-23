package com.example.college.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.college.model.ContactMessage;
import com.example.college.repository.ContactRepository;

@Controller
public class ContactController {

    @Autowired
    private ContactRepository contactRepo;

    @PostMapping("/submit-contact")
    public String submitContact(@RequestParam String name,
                                @RequestParam String email,
                                @RequestParam String message,
                                Model model) {

        ContactMessage contact = new ContactMessage();
        contact.setName(name);
        contact.setEmail(email);
        contact.setMessage(message);

        contactRepo.save(contact);

        model.addAttribute("msg", "✅ Your message has been sent successfully!");
        return "contact";
    }
}
