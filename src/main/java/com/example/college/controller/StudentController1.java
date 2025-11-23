/// /package com.example.college.controller;
/// /
/// /import com.example.college.model.Student1;
/// /import com.example.college.service.StudentService1;
/// /import org.springframework.beans.factory.annotation.Autowired;
/// /import org.springframework.stereotype.Controller;
/// /import org.springframework.ui.Model;
/// /import org.springframework.web.bind.annotation.*;
/// /import jakarta.servlet.http.HttpSession;
/// /import com.example.college.service.ResultService;
/// /
/// /import java.io.File;
/// /import java.nio.file.Files;
/// /import java.nio.file.Path;
/// /import java.nio.file.Paths;
/// /import java.nio.file.StandardCopyOption;
/// /
/// /import org.springframework.web.multipart.MultipartFile;
/// /
/// /@Controller
/// /@RequestMapping("/student1")
/// /public class StudentController1 {
/// /
/// /    @Autowired
/// /    private StudentService1 service;
/// /
/// /    @GetMapping("/register")
/// /    public String registerForm() {
/// /        return "student/student1-register";   // <-- UPDATED
/// /    }
/// /
/// /    @PostMapping("/register")
/// /    public String register(@RequestParam String name,
/// /                           @RequestParam String email,
/// /                           @RequestParam String course,
/// /                           @RequestParam String password) {
/// /
/// /        Student1 st = new Student1();
/// /        st.setName(name);
/// /        st.setEmail(email);
/// /        st.setCourse(course);
/// /        st.setPassword(password);
/// /
/// /        service.save(st);
/// /
/// /        return "redirect:/student1/login";
/// /    }
/// /
/// /    @GetMapping("/login")
/// /    public String loginForm() {
/// /        return "student/student1-login";  // <-- UPDATED
/// /    }
/// /
/// // /    @PostMapping("/login")
/// // /    public String login(@RequestParam String email,
/// // /                        @RequestParam String password,
/// // /                        Model m) {
/// // /
/// // /        Student1 st = service.getByEmail(email).orElse(null);
/// // /
/// // /        if (st == null || !st.getPassword().equals(password)) {
/// // /            m.addAttribute("error", "Invalid Email or Password");
/// // /            return "student/student1-login";   // <-- UPDATED
/// // /        }
/// // /
/// // /        m.addAttribute("student", st);
/// // /        return "student/student1-dashboard";  // <-- UPDATED
/// // /    }
/// /
/// /    @GetMapping("/dashboard")
/// /    public String dashboard() {
/// /        return "student/student1-dashboard"; // <-- UPDATED
/// /    }
/// /
/// // /    @PostMapping("/login")
/// // /    public String login(@RequestParam String email,
/// // /                        @RequestParam String password,
/// // /                        Model m,
/// // /                        HttpSession session) {
/// // /
/// // /        Student1 st = service.getByEmail(email);
/// // /
/// // /
/// // /        if (st == null || !st.getPassword().equals(password)) {
/// // /            m.addAttribute("error", "Invalid Email or Password");
/// // /            return "student/student1-login";
/// // /        }
/// // /
/// // /        // Save email in session for later pages
/// // /        session.setAttribute("studentEmail", st.getEmail());
/// // /
/// // /        m.addAttribute("student", st);
/// // /        return "student/student1-dashboard";
/// // /    }
/// /
/// /    @GetMapping("/logout")
/// /    public String logout(HttpSession session) {
/// /        session.invalidate();
/// /        return "redirect:/student1/login";
/// /    }
/// /
/// /    @Controller
/// /    public class StudentDashboardController {
/// /
/// /        @GetMapping("/dashboard")
/// /        public String dashboard(Model model, HttpSession session) {
/// /            String email = (String) session.getAttribute("studentEmail");
/// /
/// /            if (email == null) {
/// /                return "redirect:/student1/login";
/// /            }
/// /
/// /            Student1 st = service.getByEmail(email);
/// /            model.addAttribute("student", st);
/// /
/// /            return "student/student1-dashboard";
/// /        }
/// /
/// /    }
/// /    // Dashboard
/// // /    @GetMapping("/dashboard")
/// // /    public String dashboard() {
/// // /        return "student/student1-dashboard";
/// // /    }
/// /
/// /    // 1️⃣ My Profile
/// // /    @GetMapping("/profile")
/// // /    public String profile(Model model) {
/// // /        return "student/student1-profile";
/// // /    }
/// /
/// /    // 2️⃣ Fee Details
/// /    @GetMapping("/fee")
/// /    public String feeDetails(Model model) {
/// /        return "student/student1-fee";
/// /    }
/// /
/// /    // 3️⃣ Timetable
/// /    @GetMapping("/timetable")
/// /    public String timetable(Model model) {
/// /        return "student/student1-timetable";
/// /    }
/// /
/// // /    // 4️⃣ Results
/// // /    @GetMapping("/results")
/// // /    public String results(Model model) {
/// // /        return "student/student1-results";
/// // /    }
/// /
/// /    // 5️⃣ Attendance
/// /    @GetMapping("/attendance")
/// /    public String attendance(Model model) {
/// /        return "student/student1-attendance";
/// /    }
/// /
/// /    // 6️⃣ Assignments
/// /    @GetMapping("/assignments")
/// /    public String assignments(Model model) {
/// /        return "student/student1-assignments";
/// /    }
/// /
/// /    @GetMapping("/study-material")
/// /    public String studyMaterial() {
/// /        return "student/student1-study-material";
/// /    }
/// /
/// /    //
/// // /    @GetMapping("/announcements")
/// // /    public String announcements(Model model) {
/// // /        model.addAttribute("annList", repo.findAll());
/// // /        return "student/student1-announcements";
/// // /    }
/// // /
/// // /    @GetMapping("/messages")
/// // /    public String messages(Model model) {
/// // /        model.addAttribute("messages", messageRepo.findAll());
/// // /        return "student/student1-messages";
/// // /    }
/// // /    @GetMapping("/profile")
/// // /    public String profile(Model model, HttpSession session) {
/// // /
/// // /        // Get email from session
/// // /        String email = (String) session.getAttribute("studentEmail");
/// // /
/// // /        if (email == null) {
/// // /            return "redirect:/student1/login";
/// // /        }
/// // /
/// // /        // Fetch student from DB
/// // /        Student1 st = service.getByEmail(email);
/// // /
/// // /        // Pass to JSP
/// // /        model.addAttribute("student", st);
/// // /
/// // /        return "student/student1-profile";
/// // /    }
/// /    @PostMapping("/login")
/// /    public String login(@RequestParam String email,
/// /                        @RequestParam String password,
/// /                        HttpSession session,
/// /                        Model model) {
/// /
/// /        Student1 st = service.getByEmail(email);
/// /
/// /        if (st == null) {
/// /            model.addAttribute("error", "Email not registered!");
/// /            return "student/student1-login";
/// /        }
/// /
/// /        if (!st.getPassword().equals(password)) {
/// /            model.addAttribute("error", "Incorrect password!");
/// /            return "student/student1-login";
/// /        }
/// /
/// /        // ✔ IMPORTANT — Session me save
/// /        session.setAttribute("studentEmail", email);
/// /
/// /        // Dashboard me student name show karne ke liye
/// /        model.addAttribute("student", st);
/// /
/// /        return "student/student1-dashboard";
/// /    }
/// /
/// /
/// /    @Autowired
/// /    private ResultService resultService;
/// /
/// /    @GetMapping("/results")
/// /    public String viewResults(Model model, HttpSession session) {
/// /
/// /        String email = (String) session.getAttribute("studentEmail");
/// /
/// /        if (email == null) {
/// /            return "redirect:/student1/login";
/// /        }
/// /
/// /        model.addAttribute("results", resultService.getByEmail(email));
/// /
/// /        return "student/student1-results";
/// /    }
/// /
/// /    @GetMapping("/idcard")
/// /    public String idcard(Model model, HttpSession session) {
/// /
/// /        String email = (String) session.getAttribute("studentEmail");
/// /
/// /        if (email == null) {
/// /            System.out.println("NO EMAIL—LOGIN FIRST");
/// /            return "redirect:/student1/login";
/// /        }
/// /
/// /        Student1 st = service.getByEmail(email);
/// /        model.addAttribute("student", st);
/// /
/// /        return "student/student1-idcard";
/// /    }
/// /
/// /
/// // /    @Autowired
/// // /    private StudentService1 studentService;
/// /
/// /
/// /    @PostMapping("/profile/update")
/// /    public String updateProfile(@RequestParam("photo") MultipartFile file,
/// /                                HttpSession session,
/// /                                Model model) {
/// /
/// /        String email = (String) session.getAttribute("studentEmail");
/// /        if (email == null) {
/// /            return "redirect:/student1/login";
/// /        }
/// /
/// /        try {
/// /            String uploadDir = "uploads/";
/// /
/// /            File folder = new File(uploadDir);
/// /            if (!folder.exists()) {
/// /                folder.mkdirs();
/// /            }
/// /
/// /            String fileName = email + "_" + file.getOriginalFilename();
/// /            Path path = Paths.get(uploadDir + fileName);
/// /
/// /            Files.copy(file.getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
/// /
/// /            // DB update
/// /            Student1 st = service.findByEmail(email);
/// /            st.setPhoto(fileName);
/// /            service.save(st);
/// /
/// /            model.addAttribute("student", st);
/// /            model.addAttribute("msg", "Photo uploaded successfully!");
/// /
/// /        } catch (Exception e) {
/// /            e.printStackTrace();
/// /            model.addAttribute("error", "Upload failed!");
/// /        }
/// /
/// /        return "student/student1-idcard";
/// /    }
/// /
/// // /    @Autowired
/// // /    private StudentService1 studentService1;
/// /
/// /    @PostMapping("/idcard/upload")
/// /    public String uploadIdCardPhoto(@RequestParam("photo") MultipartFile file,
/// /                                    HttpSession session) {
/// /
/// /        String email = (String) session.getAttribute("studentEmail");
/// /
/// /        if (email == null) {
/// /            System.out.println("UPLOAD ERROR — SESSION EMAIL NULL");
/// /            return "redirect:/student1/login";
/// /        }
/// /
/// /        Student1 st = service.findByEmail(email);
/// /
/// /        if (st == null) {
/// /            System.out.println("UPLOAD ERROR — STUDENT NOT FOUND");
/// /            return "redirect:/student1/idcard";
/// /        }
/// /
/// /        try {
/// /
/// /            // 🔥 Upload folder path — always correct
/// /            String uploadDir = System.getProperty("user.dir") + "/uploads/";
/// /
/// /            File dir = new File(uploadDir);
/// /            if (!dir.exists()) dir.mkdirs();
/// /
/// /            // 🔥 File Name
/// /            String fileName = email + "_" + file.getOriginalFilename();
/// /
/// /            // 🔥 Target path
/// /            Path filePath = Paths.get(uploadDir + fileName);
/// /
/// /            // 🔥 Upload file
/// /            Files.copy(file.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);
/// /
/// /            // 🔥 Save only file name in DB
/// /            st.setPhotoPath(fileName);
/// /            service.save(st);
/// /
/// /            System.out.println("UPLOAD SUCCESS: " + filePath);
/// /
/// /        } catch (Exception e) {
/// /            e.printStackTrace();
/// /        }
/// /
/// /        return "redirect:/student1/idcard";
/// /    }
/// /
/// /}
//
//
//package com.example.college.controller;
//
//import com.example.college.model.Student1;
//import com.example.college.service.ResultService;
//import com.example.college.service.StudentService1;
//import jakarta.servlet.http.HttpSession;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.*;
//import org.springframework.web.multipart.MultipartFile;
//
//import java.io.File;
//import java.nio.file.Files;
//import java.nio.file.Path;
//import java.nio.file.Paths;
//import java.nio.file.StandardCopyOption;
//
//@Controller
//@RequestMapping("/student1")
//public class StudentController1 {
//
//    @Autowired
//    private StudentService1 service;
//
//    @Autowired
//    private ResultService resultService;
//
//    /* -------------------- REGISTER -------------------- */
//    @GetMapping("/register")
//    public String registerForm() {
//        return "student/student1-register";
//    }
//
//    @PostMapping("/register")
//    public String register(@RequestParam String name,
//                           @RequestParam String email,
//                           @RequestParam String course,
//                           @RequestParam String password) {
//
//        Student1 st = new Student1();
//        st.setName(name);
//        st.setEmail(email);
//        st.setCourse(course);
//        st.setPassword(password);
//
//        service.save(st);
//        return "redirect:/student1/login";
//    }
//
//    /* -------------------- LOGIN -------------------- */
//    @PostMapping("/login")
//    public String login(@RequestParam String email,
//                        @RequestParam String password,
//                        HttpSession session,
//                        Model model) {
//
//        // Student fetch from DB
//        Student1 st = service.login(email, password);
//
//        // If not found
//        if (st == null) {
//            model.addAttribute("error", "Invalid Email or Password!");
//            return "student/student1-login";
//        }
//
//        // Save session
//        session.setAttribute("studentEmail", st.getEmail());
//
//        // Redirect to dashboard
//        return "redirect:/student1/dashboard";
//    }
//
//
//    /* -------------------- DASHBOARD -------------------- */
//    @GetMapping("/dashboard")
//    public String dashboard(Model model, HttpSession session) {
//        String email = (String) session.getAttribute("studentEmail");
//
//        if (email == null) return "redirect:/student1/login";
//
//        Student1 st = service.findByEmail(email);
//        model.addAttribute("student", st);
//
//        return "student/student1-dashboard";
//    }
//
//    /* -------------------- RESULTS -------------------- */
//    @GetMapping("/results")
//    public String viewResults(Model model, HttpSession session) {
//        String email = (String) session.getAttribute("studentEmail");
//        if (email == null) return "redirect:/student1/login";
//
//        model.addAttribute("results", resultService.getByEmail(email));
//        return "student/student1-results";
//    }
//
//    /* -------------------- ID CARD PAGE -------------------- */
//    @GetMapping("/idcard")
//    public String idcard(Model model, HttpSession session) {
//
//        String email = (String) session.getAttribute("studentEmail");
//        if (email == null) return "redirect:/student1/login";
//
//        Student1 st = service.findByEmail(email);
//        model.addAttribute("student", st);
//
//        return "student/student1-idcard";
//    }
//
//    /* -------------------- PHOTO UPLOAD -------------------- */
//    @PostMapping("/idcard/upload")
//    public String uploadIdCardPhoto(@RequestParam("photo") MultipartFile file,
//                                    HttpSession session) {
//
//        String email = (String) session.getAttribute("studentEmail");
//
//        if (email == null) return "redirect:/student1/login";
//
//        Student1 st = service.findByEmail(email);
//        if (st == null) return "redirect:/student1/idcard";
//
//        try {
//            String uploadDir = "uploads/";
//
//            File dir = new File(uploadDir);
//            if (!dir.exists()) dir.mkdirs();
//
//            String fileName = email + "_" + file.getOriginalFilename();
//
//            Path filePath = Paths.get(uploadDir + fileName);
//
//            Files.copy(file.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);
//
//            // FIX: DB me correct path save
//            st.setPhotoPath("uploads/" + fileName);
//
//            service.save(st);
//
//            System.out.println("UPLOAD SUCCESS: " + filePath.toAbsolutePath());
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//
//        return "redirect:/student1/idcard";
//    }
//
//
//    /* -------------------- LOGOUT -------------------- */
//    @GetMapping("/logout")
//    public String logout(HttpSession session) {
//        session.invalidate();
//        return "redirect:/student1/login";
//    }
//
//    //2️⃣ Fee Details
//    @GetMapping("/fee")
//    public String feeDetails(Model model) {
//        return "student/student1-fee";
//    }
//
//    // 3️⃣ Timetable
//    @GetMapping("/timetable")
//    public String timetable(Model model) {
//        return "student/student1-timetable";
//    }
//
//    //  5️⃣ Attendance
//    @GetMapping("/attendance")
//    public String attendance(Model model) {
//        return "student/student1-attendance";
//    }
//
//    //
/// /    // 6️⃣ Assignments
//    @GetMapping("/assignments")
//    public String assignments(Model model) {
//        return "student/student1-assignments";
//    }
//
//    @GetMapping("/study-material")
//    public String studyMaterial() {
//        return "student/student1-study-material";
//    }
//
//    @Autowired
//    private StudentService1 studentService1;
//
//    @PostMapping("/student/login")
//    public String loginStudent(@RequestParam String email,
//                               @RequestParam String password,
//                               Model model) {
//
//        Student1 st = studentService1.login(email, password);
//
//        if (st == null) {
//            model.addAttribute("error", "Invalid Email or Password!");
//            return "student/login";  // same page
//        }
//
//        model.addAttribute("student", st);
//        return "student/student-dashboard";  // login success
//    }
//
//}

package com.example.college.controller;

import com.example.college.model.Student1;
import com.example.college.service.ResultService;
import com.example.college.service.StudentService1;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

@Controller
@RequestMapping("/student1")
public class StudentController1 {

    @Autowired
    private StudentService1 service;

    @Autowired
    private ResultService resultService;




    /* -------------------- REGISTER PAGE -------------------- */

    @GetMapping("/register")
    public String registerForm() {
        return "student/student1-register";
    }

    @PostMapping("/register")
    public String register(@RequestParam String name,
                           @RequestParam String email,
                           @RequestParam String course,
                           @RequestParam String password) {

        Student1 st = new Student1();
        st.setName(name);
        st.setEmail(email);
        st.setCourse(course);
        st.setPassword(password);

        service.save(st);
        return "redirect:/student1/login";
    }





    /* -------------------- LOGIN PAGE -------------------- */

    @GetMapping("/login")
    public String loginForm() {
        return "student/student1-login";
    }

    @PostMapping("/login")
    public String login(
            @RequestParam String email,
            @RequestParam String password,
            HttpSession session,
            Model model) {

        Student1 st = service.login(email, password);

        if (st == null) {
            model.addAttribute("error", "Invalid Email or Password!");
            return "student/student1-login";
        }

        session.setAttribute("studentEmail", st.getEmail());

        return "redirect:/student1/dashboard";
    }



    /* -------------------- DASHBOARD -------------------- */

    @GetMapping("/dashboard")
    public String dashboard(Model model, HttpSession session) {

        String email = (String) session.getAttribute("studentEmail");
        if (email == null) return "redirect:/student1/login";

        Student1 st = service.findByEmail(email);
        model.addAttribute("student", st);

        return "student/student1-dashboard";
    }





    /* -------------------- RESULTS -------------------- */

    @GetMapping("/results")
    public String viewResults(Model model, HttpSession session) {

        String email = (String) session.getAttribute("studentEmail");
        if (email == null) return "redirect:/student1/login";

        model.addAttribute("results", resultService.getByEmail(email));
        return "student/student1-results";
    }





    /* -------------------- ID CARD PAGE -------------------- */

    @GetMapping("/idcard")
    public String idcard(Model model, HttpSession session) {

        String email = (String) session.getAttribute("studentEmail");
        if (email == null) return "redirect:/student1/login";

        Student1 st = service.findByEmail(email);
        model.addAttribute("student", st);

        return "student/student1-idcard";
    }





    /* -------------------- PHOTO UPLOAD -------------------- */

    @PostMapping("/idcard/upload")
    public String uploadIdCardPhoto(@RequestParam("photo") MultipartFile file,
                                    HttpSession session) {

        String email = (String) session.getAttribute("studentEmail");
        if (email == null) return "redirect:/student1/login";

        Student1 st = service.findByEmail(email);
        if (st == null) return "redirect:/student1/idcard";

        try {
            String uploadDir = "uploads/";

            File dir = new File(uploadDir);
            if (!dir.exists()) dir.mkdirs();

            String fileName = email + "_" + file.getOriginalFilename();
            Path filePath = Paths.get(uploadDir + fileName);

            Files.copy(file.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);

            st.setPhotoPath("uploads/" + fileName);
            service.save(st);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return "redirect:/student1/idcard";
    }





    /* -------------------- LOGOUT -------------------- */

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/student1/login";
    }





    /* -------------------- OTHER PAGES -------------------- */

    @GetMapping("/fee")
    public String feeDetails() {
        return "student/student1-fee";
    }

    @GetMapping("/timetable")
    public String timetable() {
        return "student/student1-timetable";
    }

    @GetMapping("/attendance")
    public String attendance() {
        return "student/student1-attendance";
    }

    @GetMapping("/assignments")
    public String assignments() {
        return "student/student1-assignments";
    }

    @GetMapping("/study-material")
    public String studyMaterial() {
        return "student/student1-study-material";
    }

    @GetMapping("/login-default")
    public String loginDefault() {
        return "student/student1-login";
    }

    //    @GetMapping("/login")
//    public String loginRedirect() {
//        return "student/student1-login";
//    }
    @PostMapping("/profile/update")
    public String updateProfile(
            @RequestParam String name,
            @RequestParam String phone,
            @RequestParam String address,
            @RequestParam String rollNo,
            HttpSession session,
            Model model
    ) {

        // Session email
        String email = (String) session.getAttribute("studentEmail");

        if (email == null) {
            return "redirect:/student1/login";
        }

        // Fetch student
        Student1 st = service.findByEmail(email);

        if (st == null) {
            return "redirect:/student1/login";
        }

        // UPDATE FIELDS
        st.setName(name);
        st.setPhone(phone);
        st.setAddress(address);
        st.setRollNo(rollNo);

        // SAVE to DB
        service.save(st);

        model.addAttribute("student", st);
        model.addAttribute("msg", "Profile Updated Successfully!");

        return "student/student1-profile";  // Profile page refresh
    }

}

