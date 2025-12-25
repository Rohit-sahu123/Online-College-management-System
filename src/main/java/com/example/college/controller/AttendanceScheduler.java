package com.example.college.controller;

import com.example.college.repository.AttendanceRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.time.LocalDate;

@Component
public class AttendanceScheduler {

    @Autowired
    AttendanceRepository attendanceRepository;

    // रोज 09:15 पर
    @Scheduled(cron = "0 15 9 * * ?")
    public void markAbsent() {
        LocalDate today = LocalDate.now();
        attendanceRepository.markAbsentIfNotScanned(today);
    }
}
