package com.example.college.controller;

import com.example.college.model.*;
import com.example.college.repository.*;
import com.itextpdf.text.pdf.PdfPTable;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.time.LocalDate;
import java.util.*;

// iText PDF imports
//import com.itextpdf.kernel.pdf.PdfDocument;
//import com.itextpdf.kernel.pdf.PdfWriter;
//import com.itextpdf.layout.Document;
//import com.itextpdf.layout.element.Paragraph;
import org.springframework.web.multipart.MultipartFile;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.web.multipart.MultipartFile;
import com.itextpdf.text.Document;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.text.Paragraph;
import com.example.college.service.StudentService1;
import com.example.college.service.StudentService1;
import com.example.college.service.ResultService;

import java.nio.file.*;

@Controller
@RequestMapping("/teacher")
public class TeacherModuleController {
    @Autowired
    private AttendanceRepository attendanceRepository;

    @Autowired
    private TeacherAttendanceRepository teacherAttendanceRepository;
    @Autowired
    private StudentService1 studentService;

    // ✅ Attendance page
    @GetMapping("/attendance")
    public String attendancePage(Model model) {
        model.addAttribute("attendanceList", teacherAttendanceRepository.findAll());
        return "teacher/attendance";
    }

//    @GetMapping("/dashboard")
//    public String dashboard() {
//        return "teacher/teacher-dashboard"; // JSP path
//    }

    // ✅ Add new attendance
    @PostMapping("/attendance")
    public String saveAttendance(TeacherAttendanceEntity attendance) {
        teacherAttendanceRepository.save(attendance);
        return "redirect:/teacher/attendance";
    }

    // ✅ Edit Attendance (load existing data)
    @GetMapping("/attendance/edit/{id}")
    public String editAttendance(@PathVariable Long id, Model model) {
        TeacherAttendanceEntity existing = teacherAttendanceRepository.findById(id).orElse(null);
        model.addAttribute("attendance", existing);
        model.addAttribute("attendanceList", teacherAttendanceRepository.findAll());
        return "teacher/attendance"; // same page with pre-filled form
    }

    // ✅ Update Attendance
    @PostMapping("/attendance/update")
    public String updateAttendance(@ModelAttribute TeacherAttendanceEntity attendance) {
        teacherAttendanceRepository.save(attendance);
        return "redirect:/teacher/attendance";
    }

    // ✅ Delete Attendance
    @GetMapping("/attendance/delete/{id}")
    public String deleteAttendance(@PathVariable Long id) {
        teacherAttendanceRepository.deleteById(id);
        return "redirect:/teacher/attendance";
    }

    // ✅ Filter by Subject
    @GetMapping("/attendance/filter/subject")
    public String filterBySubject(@RequestParam String subject, Model model) {
        model.addAttribute("attendanceList", teacherAttendanceRepository.findBySubjectContainingIgnoreCase(subject));
        model.addAttribute("filterApplied", "Subject: " + subject);
        return "teacher/attendance";
    }

    // ✅ Filter by Date
    @GetMapping("/attendance/filter/date")
    public String filterByDate(@RequestParam String LocalDate, Model model) {
        if (LocalDate == null || LocalDate.trim().isEmpty()) {
            model.addAttribute("error", "Please select a valid date!");
            return "teacher/attendance";
        }

        model.addAttribute("attendanceList", teacherAttendanceRepository.findByDate(java.time.LocalDate.parse(LocalDate)));
        model.addAttribute("filterApplied", "Date: " + LocalDate);
        return "teacher/attendance";
    }

    // ✅ Export Excel
    @GetMapping("/attendance/export/excel")
    public void exportAttendanceToExcel(HttpServletResponse response) throws IOException {
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        response.setHeader("Content-Disposition", "attachment; filename=teacher_attendance.xlsx");

        List<TeacherAttendanceEntity> list = teacherAttendanceRepository.findAll();

        try (Workbook workbook = new XSSFWorkbook()) {
            Sheet sheet = workbook.createSheet("Attendance");

            Row header = sheet.createRow(0);
            header.createCell(0).setCellValue("ID");
            header.createCell(1).setCellValue("Student Name");
            header.createCell(2).setCellValue("Subject");
            header.createCell(3).setCellValue("Status");
            header.createCell(4).setCellValue("Date");

            int rowCount = 1;
            for (TeacherAttendanceEntity record : list) {
                Row row = sheet.createRow(rowCount++);
                row.createCell(0).setCellValue(record.getId());
                row.createCell(1).setCellValue(record.getStudentName());
                row.createCell(2).setCellValue(record.getSubject());
                row.createCell(3).setCellValue(record.getStatus());
                row.createCell(4).setCellValue(record.getDate());
            }

            workbook.write(response.getOutputStream());
        }
    }

    // ✅ Export PDF
    @GetMapping("/attendance/export/pdf")
    public void exportAttendanceToPdf(HttpServletResponse response) throws IOException {

        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=teacher_attendance.pdf");

        List<TeacherAttendanceEntity> list = teacherAttendanceRepository.findAll();

        try {
            Document document = new Document();
            PdfWriter.getInstance(document, response.getOutputStream());

            document.open();
            document.add(new Paragraph("Teacher Attendance Report\n\n"));

            for (TeacherAttendanceEntity record : list) {

                String line = record.getStudentName() + " - " +
                        record.getSubject() + " - " +
                        record.getStatus() + " (" + record.getDate() + ")";

                document.add(new Paragraph(line));
            }

            document.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    @GetMapping("/myclasses")
    public String myClasses(Model model) {
        model.addAttribute("classList", List.of(
                new Timetable("Monday", "10:00 - 11:00 AM", "Java Programming", "CSE-A", "Room 204"),
                new Timetable("Tuesday", "11:00 - 12:00 PM", "DBMS", "CSE-B", "Room 205"),
                new Timetable("Wednesday", "9:00 - 10:00 AM", "Data Structures", "CSE-A", "Room 201"),
                new Timetable("Thursday", "2:00 - 3:00 PM", "Operating System", "CSE-C", "Room 207"),
                new Timetable("Friday", "12:00 - 1:00 PM", "Computer Networks", "CSE-A", "Room 208")
        ));
        return "teacher/myclasses";
    }

    @GetMapping("/exams")
    public String examsPage(Model model) {
        // Dummy data फिलहाल
        model.addAttribute("examList", List.of(
                new Exam("Rohit Sahu", "Java Programming", 45, "A"),
                new Exam("Amit Patel", "DBMS", 39, "B+"),
                new Exam("Neha Sharma", "Data Structures", 48, "A+"),
                new Exam("Kiran Meena", "Operating System", 42, "A"),
                new Exam("Ankit Singh", "Computer Networks", 35, "B")
        ));
        return "teacher/exams";
    }

    @Autowired
    private TeacherExamRepository teacherExamRepository;

    @GetMapping("/exam-entry")
    public String examEntryPage(Model model) {
        model.addAttribute("examList", teacherExamRepository.findAll());
        return "teacher/exam-entry";
    }

    @PostMapping("/exam-entry")
    public String saveExam(@RequestParam String studentName,
                           @RequestParam String subject,
                           @RequestParam int marks,
                           @RequestParam String grade) {
        TeacherExamEntity exam = new TeacherExamEntity();
        exam.setStudentName(studentName);
        exam.setSubject(subject);
        exam.setMarks(marks);
        exam.setGrade(grade);
        teacherExamRepository.save(exam);
        return "redirect:/teacher/exam-entry";
    }

    // ✅ Edit Marks (load data in form)
    @GetMapping("/exam-entry/edit/{id}")
    public String editExam(@PathVariable Long id, Model model) {
        TeacherExamEntity exam = teacherExamRepository.findById(id).orElse(null);
        model.addAttribute("editExam", exam);
        model.addAttribute("examList", teacherExamRepository.findAll());
        return "teacher/exam-entry";
    }

    // ✅ Update Marks (form submit)
    @PostMapping("/exam-entry/update")
    public String updateExam(@ModelAttribute TeacherExamEntity updatedExam) {
        teacherExamRepository.save(updatedExam);
        return "redirect:/teacher/exam-entry";
    }

    // ✅ Delete Marks
    @GetMapping("/exam-entry/delete/{id}")
    public String deleteExam(@PathVariable Long id) {
        teacherExamRepository.deleteById(id);
        return "redirect:/teacher/exam-entry";
    }

    @Autowired
    private TeacherAssignmentRepository teacherAssignmentRepository;

    // 📚 Assignment Page
    @GetMapping("/assignments")
    public String assignmentsPage(Model model) {
        model.addAttribute("assignments", teacherAssignmentRepository.findAll());
        return "teacher/assignments";
    }

    // 📤 Upload Assignment
    @PostMapping("/assignments/upload")
    public String uploadAssignment(@RequestParam String title,
                                   @RequestParam String description,
                                   @RequestParam String dueDate,
                                   @RequestParam("file") MultipartFile file) {
        try {
            String uploadDir = "uploads/";
            Path uploadPath = Paths.get(uploadDir);

            if (!Files.exists(uploadPath)) {
                Files.createDirectories(uploadPath);
            }

            String fileName = file.getOriginalFilename();
            Path filePath = uploadPath.resolve(fileName);
            Files.copy(file.getInputStream(), filePath);

            TeacherAssignmentEntity assignment = new TeacherAssignmentEntity();
            assignment.setTitle(title);
            assignment.setDescription(description);
            assignment.setDueDate(LocalDate.parse(dueDate));
            assignment.setFileName(fileName);

            teacherAssignmentRepository.save(assignment);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/teacher/assignments";
    }

    // 🗑 Delete Assignment
    @GetMapping("/assignments/delete/{id}")
    public String deleteAssignment(@PathVariable Long id) {
        teacherAssignmentRepository.deleteById(id);
        return "redirect:/teacher/assignments";
    }

    @Autowired
    private TeacherAnnouncementRepository teacherAnnouncementRepository;

    // 🗣 Announcement Page
    @GetMapping("/announcements")
    public String announcementsPage(Model model) {
        model.addAttribute("announcements", teacherAnnouncementRepository.findAll());
        return "teacher/announcements";
    }

    // 📢 Add Announcement
    @PostMapping("/announcements")
    public String addAnnouncement(@RequestParam String title,
                                  @RequestParam String message,
                                  @RequestParam String audience) {

        TeacherAnnouncementEntity ann = new TeacherAnnouncementEntity();
        ann.setTitle(title);
        ann.setMessage(message);
        ann.setAudience(audience);

        teacherAnnouncementRepository.save(ann);

        return "redirect:/teacher/announcements";
    }


    // 🗑 Delete Announcement
    @GetMapping("/announcements/delete/{id}")
    public String deleteAnnouncement(@PathVariable Long id) {
        teacherAnnouncementRepository.deleteById(id);
        return "redirect:/teacher/announcements";
    }

    @Autowired
    private TeacherMessageRepository teacherMessageRepository;

    // 💬 Message Students Page
    @GetMapping("/messages")
    public String messagesPage(Model model) {
        model.addAttribute("messages", teacherMessageRepository.findAll());
        return "teacher/messages";
    }

    // 📩 Send Message
    @PostMapping("/messages/send")
    public String sendMessage(@RequestParam String studentName,
                              @RequestParam String subject,
                              @RequestParam String message) {
        TeacherMessageEntity msg = new TeacherMessageEntity();
        msg.setStudentName(studentName);
        msg.setSubject(subject);
        msg.setMessage(message);
        teacherMessageRepository.save(msg);
        return "redirect:/teacher/messages";
    }

    // 🗑 Delete Message
    @GetMapping("/messages/delete/{id}")
    public String deleteMessage(@PathVariable Long id) {
        teacherMessageRepository.deleteById(id);
        return "redirect:/teacher/messages";
    }

    @Autowired
    private TeacherStudentRepository teacherStudentRepository;

    // 👨‍🎓 View All Students
//    @GetMapping("/students")
//    public String viewStudents(Model model) {
//        model.addAttribute("students", teacherStudentRepository.findAll());
//        return "teacher/students";
//    }

    // 🔍 Filter by Batch
    @GetMapping("/students/filter/batch")
    public String filterByBatch(@RequestParam String batch, Model model) {
        model.addAttribute("students", teacherStudentRepository.findByBatchContainingIgnoreCase(batch));
        model.addAttribute("filterApplied", "Batch: " + batch);
        return "teacher/students";
    }

    // 🔍 Search by Name
    @GetMapping("/students/search")
    public String searchByName(@RequestParam String name, Model model) {
        model.addAttribute("students", teacherStudentRepository.findByNameContainingIgnoreCase(name));
        model.addAttribute("filterApplied", "Search: " + name);
        return "teacher/students";
    }

    // 👨‍🎓 Add New Student Form
    @GetMapping("/students/add")
    public String addStudentForm(Model model) {
        model.addAttribute("student", new TeacherStudentEntity());
        return "teacher/student-form";
    }

    // 💾 Save or Update Student
//    @PostMapping("/students/save")
//    public String saveStudent(@ModelAttribute TeacherStudentEntity student) {
//        teacherStudentRepository.save(student);
//        return "redirect:/teacher/students";
//    }

    // ✏️ Edit Student
    @GetMapping("/students/edit/{id}")
    public String editStudent(@PathVariable Long id, Model model) {
        TeacherStudentEntity student = teacherStudentRepository.findById(id).orElse(null);
        model.addAttribute("student", student);
        return "teacher/student-form";
    }

    // 🗑 Delete Student
    @GetMapping("/students/delete/{id}")
    public String deleteStudent(@PathVariable Long id) {
        teacherStudentRepository.deleteById(id);
        return "redirect:/teacher/students";
    }

    @Autowired
    private TeacherLeaveRepository teacherLeaveRepository;

    // ✅ Leave List Page
    @GetMapping("/leaves")
    public String leaveList(Model model) {
        model.addAttribute("leaves", teacherLeaveRepository.findAll());
        return "teacher/leaves";
    }

    // ✅ Apply Leave Form
    @GetMapping("/leaves/apply")
    public String applyLeaveForm(Model model) {
        model.addAttribute("leave", new TeacherLeaveEntity());
        return "teacher/leave-form";
    }

    // ✅ Save Leave
    @PostMapping("/leaves/save")
    public String saveLeave(@ModelAttribute TeacherLeaveEntity leave) {
        teacherLeaveRepository.save(leave);
        return "redirect:/teacher/leaves";
    }

    // ✅ Cancel Leave
    @GetMapping("/leaves/delete/{id}")
    public String deleteLeave(@PathVariable Long id) {
        teacherLeaveRepository.deleteById(id);
        return "redirect:/teacher/leaves";
    }

//    @Autowired
//    private TeacherProfileRepository teacherProfileRepository;

    // 👨‍🏫 View Profile Page
    @Autowired
    private TeacherProfileRepository teacherProfileRepository;

    // 👨‍🏫 View Profile
    @GetMapping("/profile")
    public String viewProfile(Model model) {
        TeacherProfileEntity profile = teacherProfileRepository.findAll()
                .stream()
                .findFirst()
                .orElse(new TeacherProfileEntity());
        model.addAttribute("profile", profile);
        return "teacher/profile";
    }

    // ✏️ Edit Profile Form
    @GetMapping("/profile/edit/{id}")
    public String editProfile(@PathVariable Long id, Model model) {
        TeacherProfileEntity profile = teacherProfileRepository.findById(id)
                .orElse(new TeacherProfileEntity());
        model.addAttribute("profile", profile);
        return "teacher/profile-form";
    }

    // 💾 Save/Update Profile
    @PostMapping("/profile/save")
    public String saveProfile(@ModelAttribute("profile") TeacherProfileEntity profile) {
        teacherProfileRepository.save(profile);
        return "redirect:/teacher/profile";
    }

    @GetMapping("/students")
    public String viewStudents(Model model) {
        List<Student1> list = studentService.getAllStudents();
        System.out.println("Total Students = " + list.size());
        model.addAttribute("students", list);
        return "teacher/student-list";
    }

    @Autowired
    private ResultService resultService;

    @GetMapping("/result/upload")
    public String uploadResultForm(Model model) {

        // 🔥 All registered students send to JSP
        model.addAttribute("students", studentService.getAllStudents());

        return "teacher/result-upload";
    }


    @PostMapping("/result/upload")
    public String saveResult(
            @RequestParam Long studentId,
            @RequestParam String subject,
            @RequestParam double marks,
            @RequestParam String grade
    ) {

        Result r = new Result();
        // r.setStudentId(studentId);   // ✔ Correct
        r.setSubject(subject);
        r.setMarks(marks);
        r.setGrade(grade);

        resultService.saveResult(r);   // ✔ Correct

        return "redirect:/teacher/result/upload?success";
    }


//    @GetMapping("/dashboard")
//    public String dashboard(Model model) {
//
//        LocalDate today = LocalDate.now();
//
//        model.addAttribute("date", today);
//        model.addAttribute("totalStudents", studentService.getAllStudents().size());
//
//        return "teacher-dashboard";   // JSP path
//    }


    //private StudentService1 studentService;  @Autowired
    //  private StudentService1 studentService1;
    @Autowired
    private StudentService1 studentService1;
    // Show all students page
//    @GetMapping("/students")
//    public String viewAllStudents(Model model) {
//        model.addAttribute("students", studentService1.getAllStudents());
//        return "teacher/student-list";
//    }

    // Add new student
    @PostMapping("/add-student")
    public String addStudent(@RequestParam String name,
                             @RequestParam String email,
                             @RequestParam String course,
                             @RequestParam String password) {

        Student1 st = new Student1();
        st.setName(name);
        st.setEmail(email);
        st.setCourse(course);
        st.setPassword(password);

        studentService1.save(st);

        return "redirect:/teacher/students";
    }
    //OPEN FORM
//    @GetMapping("/students/add")
//    public String addStudentForm(Model model) {
//        model.addAttribute("student", new Student1());
//        return "teacher/add-student";
//    }

    // SAVE STUDENT
    @PostMapping("/students/save")
    public String saveStudent(Student1 student) {
        studentService.save(student);
        return "redirect:/teacher/students";
    }

    @GetMapping("/today-attendance")
    public String todayAttendance(Model model) {

        LocalDate today = LocalDate.now();

        // 🔹 Sirf PRESENT students
        List<Attendance> presentList =
                attendanceRepository.findByDateAndPresent(today, true);

        // 🔹 Table ke liye data list
        List<Map<String, Object>> tableList = new ArrayList<>();

        for (Attendance a : presentList) {

            Student1 st = studentService.getStudentById(a.getStudentId());
            if (st == null) continue;

            Map<String, Object> row = new HashMap<>();
            row.put("studentId", st.getId());
            row.put("studentName", st.getName());
            row.put("subject", a.getSubject());
            row.put("scanTime", a.getScanTime());
            row.put("status", a.isPresent() ? "Present" : "Absent");

            tableList.add(row);
        }

        model.addAttribute("todayList", tableList);
        model.addAttribute("presentCount", tableList.size());
        model.addAttribute("date", today);

        return "teacher/today-attendance";
    }


//    @GetMapping("/dashboard")
//    public String dashboard(Model model) {
//
//        Long teacherId = 1L;
//        LocalDate today = LocalDate.now();
//
//        List<Attendance> list =
//                attendanceRepository.findByTeacherIdAndDate(teacherId, today);
//
//        //  LinkedList<Object> list = new LinkedList<>();
//        model.addAttribute("totalStudents", studentService.getAllStudents().size());
//        LinkedList<Object> todayList = new LinkedList<>();
//        model.addAttribute("presentCount", todayList.size());
//        model.addAttribute("date", today);
//
//        return "teacher/dashboard";   // 👈 FIX 2
//    }

    @GetMapping("/dashboard")
    public String dashboard(Model model) {

        LocalDate today = LocalDate.now();

        // 1️⃣ TOTAL STUDENTS (student table se)
        long totalStudents = studentService.getTotalStudents();

        // 2️⃣ PRESENT TODAY (attendance table se)
        int presentCount =
                attendanceRepository.findByDateAndPresent(today, true).size();

        // 3️⃣ ABSENT = TOTAL - PRESENT
        int absentCount = (int) totalStudents - presentCount;
        double presentPercent = 0;
        if (totalStudents > 0) {
            presentPercent = (presentCount * 100.0) / totalStudents;
        }

        // 4️⃣ JSP ko bhejo
        model.addAttribute("totalStudents", totalStudents);
        model.addAttribute("presentCount", presentCount);
        model.addAttribute("absentCount", absentCount);
        model.addAttribute("date", today);
        model.addAttribute("presentPercent", presentPercent);

        // 🔎 DEBUG (console me check)
        System.out.println(
                "TOTAL=" + totalStudents +
                        ", PRESENT=" + presentCount +
                        ", ABSENT=" + absentCount
        );

        return "teacher/dashboard";
    }

    @GetMapping("/monthly-report")
    public String monthlyReport(Model model) {

        int month = LocalDate.now().getMonthValue();
        int year = LocalDate.now().getYear();

        LocalDate start = LocalDate.of(year, month, 1);
        LocalDate end = start.withDayOfMonth(start.lengthOfMonth());

        List<Student1> students = studentService.getAllStudents();

        // 🔹 ek list banayenge table ke liye
        List<Map<String, Object>> reportList = new ArrayList<>();

        for (Student1 st : students) {

            long presentDays =
                    attendanceRepository
                            .countByStudentIdAndDateBetweenAndPresent(
                                    st.getId(), start, end, true);

            long totalCollegeDays =
                    attendanceRepository.countCollegeDays(start, end);

            double percent = 0;
            if (totalCollegeDays > 0) {
                percent = (presentDays * 100.0) / totalCollegeDays;
            }

            Map<String, Object> row = new HashMap<>();
            row.put("studentId", st.getId());
            row.put("studentName", st.getName());
            row.put("month", month + "/" + year);
            row.put("totalAttendance", presentDays);
            row.put("totalDays", totalCollegeDays);   // 🔥 NEW
            row.put("percent", String.format("%.2f", percent));

            reportList.add(row);
        }


        model.addAttribute("reportList", reportList);
        model.addAttribute("month", month);
        model.addAttribute("year", year);

        return "teacher/monthly-report";
    }


//    @GetMapping("/monthly-report/pdf")
//    public void downloadMonthlyReportPdf(
//            @RequestParam Long studentId,
//            @RequestParam int month,
//            @RequestParam int year,
//            HttpServletResponse response) throws Exception {
//
//        LocalDate start = LocalDate.of(year, month, 1);
//        LocalDate end = start.withDayOfMonth(start.lengthOfMonth());
//
//        List<Attendance> list =
//                attendanceRepository.findByStudentIdAndDateBetween(
//                        studentId, start, end);
//
//        response.setContentType("application/pdf");
//        response.setHeader("Content-Disposition",
//                "attachment; filename=monthly-attendance.pdf");
//
//        Document document = new Document();
//        PdfWriter.getInstance(document, response.getOutputStream());
//        document.open();
//
//        document.add(new Paragraph("Monthly Attendance Report"));
//        document.add(new Paragraph("Student ID: " + studentId));
//        document.add(new Paragraph("Month: " + month + "/" + year));
//        document.add(new Paragraph(" "));
//
//        PdfPTable table = new PdfPTable(2);
//        table.addCell("Date");
//        table.addCell("Status");
//
//        for (Attendance a : list) {
//            table.addCell(a.getDate().toString());
//            table.addCell(a.isPresent() ? "Present" : "Absent");
//        }
//
//        document.add(table);
//        document.close();
//    }
//
//    @GetMapping("/monthly-report/all/pdf")
//    public void downloadAllStudentsMonthlyPdf(
//            @RequestParam int month,
//            @RequestParam int year,
//            HttpServletResponse response) throws Exception {
//
//        LocalDate start = LocalDate.of(year, month, 1);
//        LocalDate end = start.withDayOfMonth(start.lengthOfMonth());
//
//        List<Student1> students = studentService.getAllStudents();
//
//        response.setContentType("application/pdf");
//        response.setHeader("Content-Disposition",
//                "attachment; filename=all-students-attendance.pdf");
//
//        Document document = new Document();
//        PdfWriter.getInstance(document, response.getOutputStream());
//        document.open();
//
//        document.add(new Paragraph(
//                "All Students Monthly Attendance Report"));
//        document.add(new Paragraph(
//                "Month: " + month + "/" + year));
//        document.add(new Paragraph(" "));
//
//        // 🔁 Har student ke liye section
//        for (Student1 st : students) {
//
//            document.add(new Paragraph(
//                    "Student: " + st.getName()
//                            + " (ID: " + st.getId() + ")"));
//            document.add(new Paragraph(" "));
//
//            List<Attendance> list =
//                    attendanceRepository.findByStudentIdAndDateBetween(
//                            st.getId(), start, end);
//
//            PdfPTable table = new PdfPTable(2);
//            table.addCell("Date");
//            table.addCell("Status");
//
//            for (Attendance a : list) {
//                table.addCell(a.getDate().toString());
//                table.addCell(a.isPresent() ? "Present" : "Absent");
//            }
//
//            document.add(table);
//            document.add(new Paragraph(" "));
//            document.add(new Paragraph("-----------------------------------"));
//            document.add(new Paragraph(" "));
//        }
//
//        document.close();
//    }

    @GetMapping("/monthly-report/present-percent/pdf")
    public void downloadPresentPercentPdf(
            @RequestParam int month,
            @RequestParam int year,
            HttpServletResponse response) throws Exception {

        LocalDate start = LocalDate.of(year, month, 1);
        LocalDate end = start.withDayOfMonth(start.lengthOfMonth());

        List<Student1> students = studentService.getAllStudents();

        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition",
                "attachment; filename=present-percent-report.pdf");

        Document document = new Document();
        PdfWriter.getInstance(document, response.getOutputStream());
        document.open();

        document.add(new Paragraph(
                "Present Percentage Report (All Students)"));
        document.add(new Paragraph(
                "Month: " + month + "/" + year));
        document.add(new Paragraph(" "));

        // 🔥 TABLE with required columns
        PdfPTable table = new PdfPTable(6);
        table.setWidthPercentage(100);

        table.addCell("Student ID");
        table.addCell("Student Name");
        table.addCell("Month");
        table.addCell("Total Attendance");
        table.addCell("Total Days");
        table.addCell("Percent %");

        for (Student1 st : students) {

            long presentDays =
                    attendanceRepository
                            .countByStudentIdAndDateBetweenAndPresent(
                                    st.getId(), start, end, true);

            long totalCollegeDays =
                    attendanceRepository.countCollegeDays(start, end);

            double percent = 0;
            if (totalCollegeDays > 0) {
                percent = (presentDays * 100.0) / totalCollegeDays;
            }

            table.addCell(String.valueOf(st.getId()));
            table.addCell(st.getName());
            table.addCell(month + "/" + year);
            table.addCell(String.valueOf(presentDays));
            table.addCell(String.valueOf(totalCollegeDays)); // 🔥 NEW
            table.addCell(String.format("%.2f", percent));
        }


        document.add(table);
        document.close();
    }

}
