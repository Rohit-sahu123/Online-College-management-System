<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Teacher Dashboard - BIST College</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(120deg, #0f172a, #1e293b, #0a1124);
            color: white;
            overflow-x: hidden;
        }

        .sidebar {
            width: 250px;
            background: rgba(255,255,255,0.05);
            backdrop-filter: blur(8px);
            height: 100vh;
            position: fixed;
            top: 0;
            left: 0;
            padding: 20px 0;
            box-shadow: 2px 0 8px rgba(0,0,0,0.2);
            transition: 0.3s;
        }

        .sidebar h3 {
            text-align: center;
            color: #38bdf8;
            margin-bottom: 30px;
        }

        .sidebar a {
            display: block;
            color: #e2e8f0;
            text-decoration: none;
            padding: 12px 20px;
            font-size: 15px;
            transition: 0.3s;
        }

        .sidebar a:hover, .sidebar a.active {
            background: rgba(56,189,248,0.15);
            color: #38bdf8;
            border-left: 4px solid #38bdf8;
        }

        .main {
            margin-left: 250px;
            padding: 20px;
            animation: fadeIn 0.5s ease-in-out;
        }

        .topbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: rgba(255,255,255,0.08);
            padding: 12px 25px;
            border-radius: 10px;
            margin-bottom: 25px;
        }

        .btn-logout {
            background: #ef4444;
            border: none;
            color: white;
            padding: 8px 16px;
            border-radius: 6px;
            font-weight: 500;
            transition: 0.3s;
        }

        .btn-logout:hover {
            background: #dc2626;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(15px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .card {
            background: rgba(255,255,255,0.05);
            border: 1px solid rgba(255,255,255,0.08);
            color: white;
            border-radius: 12px;
            transition: 0.3s;
        }

        .card:hover {
            transform: translateY(-5px);
            background: rgba(255,255,255,0.08);
        }

        .card-title {
            color: #38bdf8;
            font-weight: 600;
        }

        canvas#bg {
            position: fixed;
            top: 0; left: 0;
            width: 100%; height: 100%;
            z-index: -1;
        }
    </style>
</head>
<body>
<canvas id="bg"></canvas>

<!-- Sidebar -->
<div class="sidebar">
    <h3><i class="bi bi-mortarboard"></i> Teacher Panel</h3>
    <a href="#" class="active"><i class="bi bi-house"></i> Dashboard</a>
    <a href="/teacher/myclasses" class="list-group-item list-group-item-action">📘 My Classes & Timetable</a>
    <a href="/teacher/attendance"><i class="bi bi-clipboard-check"></i> Attendance Management</a>
   <a href="/teacher/exams" class="list-group-item list-group-item-action">📊 Exams & Evaluation</a>
   <a href="/teacher/exam-entry" class="list-group-item list-group-item-action">📝 Exam Marks Entry</a>
    <a href="/teacher/assignments"><i class="bi bi-pencil-square"></i> Assignments</a>
    <a href="/teacher/assignments" class="list-group-item list-group-item-action">📚 Assignments & Study Material</a>
    <a href="/teacher/announcements"><i class="bi bi-megaphone"></i> Announcements</a>
    <a href="/teacher/announcements" class="list-group-item list-group-item-action">📢 Announcements</a>
    <a href="/teacher/students" class="list-group-item list-group-item-action">👨‍🎓 View Student Profiles</a>
    <a href="/teacher/messages" class="list-group-item list-group-item-action">💬 Message Students</a>
    <a href="/teacher/profile" class="list-group-item list-group-item-action">👨‍🏫 My Profile</a>
    <a href="/teacher/leaves" class="list-group-item list-group-item-action">📅 Manage Leave</a>
    <a href="/teacher/students" class="btn btn-primary">View All Students</a>
    <a href="/teacher/students/add" class="btn btn-success">Add New Student</a>
</div>

<!-- Main content -->
<div class="main">
    <div class="topbar">
        <h4>Welcome, Teacher 👩‍🏫</h4>
        <a href="/logout"><button class="btn-logout">Logout</button></a>
    </div>

    <div class="row g-4">
        <div class="col-md-4">
            <div class="card p-3">
                <h5 class="card-title"><i class="bi bi-clipboard-check"></i> Attendance</h5>
                <p>Mark and view attendance for your classes.</p>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card p-3">
                <h5 class="card-title"><i class="bi bi-pencil-square"></i> Assignments</h5>
                <p>Post and review student assignments easily.</p>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card p-3">
                <h5 class="card-title"><i class="bi bi-megaphone"></i> Announcements</h5>
                <p>Share important updates with students instantly.</p>
            </div>
        </div>
    </div>
</div>
<h3>Total Registered Students: ${totalStudents}</h3>
<!-- Background animation -->
<script>
    const canvas = document.getElementById('bg');
    const ctx = canvas.getContext('2d');
    let w, h;
    const particles = [];

    function resize() {
        w = canvas.width = window.innerWidth;
        h = canvas.height = window.innerHeight;
    }

    function rand(min, max) {
        return Math.random() * (max - min) + min;
    }

    function init() {
        resize();
        for (let i = 0; i < 70; i++) {
            particles.push({
                x: rand(0, w),
                y: rand(0, h),
                r: rand(1, 3),
                vx: rand(-0.5, 0.5),
                vy: rand(-0.5, 0.5),
            });
        }
    }

    function draw() {
        ctx.clearRect(0, 0, w, h);
        ctx.fillStyle = 'rgba(56,189,248,0.1)';
        for (let p of particles) {
            ctx.beginPath();
            ctx.arc(p.x, p.y, p.r, 0, Math.PI * 2);
            ctx.fill();
            p.x += p.vx;
            p.y += p.vy;
            if (p.x < 0 || p.x > w) p.vx *= -1;
            if (p.y < 0 || p.y > h) p.vy *= -1;
        }
        requestAnimationFrame(draw);
    }

    window.addEventListener('resize', resize);
    init();
    draw();
</script>
</body>
</html>
