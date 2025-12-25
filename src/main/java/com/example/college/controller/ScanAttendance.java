package com.example.college.controller;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.college.model.Attendance;
import com.example.college.repository.AttendanceRepository;

@Controller
public class ScanAttendance {

    @Autowired
    private AttendanceRepository attendanceRepository;

    @PostMapping("/scan-attendance")
    @ResponseBody
    public String scanAttendance(@RequestParam("data") String data) {

        try {
            // QR format: studentId|yyyy-MM-dd
            String[] arr = data.split("\\|");

            Long studentId = Long.parseLong(arr[0]);
            LocalDate date = LocalDate.parse(arr[1]);
            Optional<Attendance> existing =
                    attendanceRepository.findByStudentIdAndDate(studentId, date);

            if (existing.isPresent() && existing.get().getScanTime() != null) {
                return "Attendance already marked";
            }
            // ⏱ Time window (09:00–09:10)
            LocalTime start = LocalTime.of(9, 0);
            LocalTime end = LocalTime.of(9, 10);
            LocalTime now = LocalTime.now();

            if (now.isBefore(start) || now.isAfter(end)) {
                return "Time Over – Attendance Closed";
            }


            Optional<Attendance> optionalAttendance =
                    attendanceRepository.findByStudentIdAndDate(studentId, date);

            Attendance attendance;

            if (optionalAttendance.isPresent()) {
                attendance = optionalAttendance.get();
            } else {
                attendance = new Attendance();
                attendance.setStudentId(studentId);
                attendance.setDate(date);
            }

            attendance.setPresent(true);
            attendance.setScanTime(LocalDateTime.now());

            attendanceRepository.save(attendance);

            return "Attendance Marked PRESENT";

        } catch (Exception e) {
            return "Error : " + e.getMessage();
        }
    }

    @PostMapping("/student/attendance")
    public String markAttendance(@RequestParam Long studentId,
                                 @RequestParam Long teacherId,
                                 @RequestParam String subject) {

        Attendance a = new Attendance();
        a.setStudentId(studentId);
        a.setTeacherId(teacherId);
        a.setSubject(subject);
        a.setDate(LocalDate.now());
        a.setStatus("PRESENT");

        attendanceRepository.save(a);

        return "Attendance Marked";
    }


}
