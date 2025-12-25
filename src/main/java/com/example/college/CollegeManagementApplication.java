package com.example.college;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication(scanBasePackages = "com.example.college")
@EnableScheduling

public class CollegeManagementApplication {
    public static void main(String[] args) {
        SpringApplication.run(CollegeManagementApplication.class, args);
    }
}