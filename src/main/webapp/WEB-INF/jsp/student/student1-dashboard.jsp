<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="student1-style.jsp" %>

<html>
<head>
<title>Student Dashboard</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>

<body>

<div class="container mt-5">
    <h2 class="text-center text-white mb-4">🎓 <h2>Welcome, ${student.name}</h2>
    </h2>

    <div class="row g-4">

        <div class="col-md-3">
            <a href="/student1/profile" style="text-decoration:none;">
                <div class="tile">👤 Profile</div>
            </a>
        </div>

        <div class="col-md-3">
            <a href="/student1/fee" style="text-decoration:none;">
                <div class="tile">💰 Fee Details</div>
            </a>
        </div>

        <div class="col-md-3">
            <a href="/student1/timetable" style="text-decoration:none;">
                <div class="tile">📅 Timetable</div>
            </a>
        </div>

        <div class="col-md-3">
            <a href="/student1/results" style="text-decoration:none;">
                <div class="tile">📊 Results</div>
            </a>
        </div>

        <div class="col-md-3">
            <a href="/student1/attendance" style="text-decoration:none;">
                <div class="tile">📝 Attendance</div>
            </a>
        </div>

        <div class="col-md-3">
            <a href="/student1/assignments" style="text-decoration:none;">
                <div class="tile">📘 Assignments</div>
            </a>
        </div>

        <div class="col-md-3">
            <a href="/student1/study-material" style="text-decoration:none;">
                <div class="tile">📚 Study Material</div>
            </a>
        </div>

        <div class="col-md-3">
            <a href="/student1/announcements" style="text-decoration:none;">
                <div class="tile">📢 Announcements</div>
            </a>
        </div>

        <div class="col-md-3">
            <a href="/student1/messages" style="text-decoration:none;">
                <div class="tile">💬 Messages</div>
            </a>
        </div>

        <div class="col-md-3">
            <a href="/student1/leave" style="text-decoration:none;">
                <div class="tile">📝 Leave Application</div>
            </a>
        </div>

        <div class="col-md-3">
            <a href="/student1/complaints" style="text-decoration:none;">
                <div class="tile">⚠ Complaints</div>
            </a>
        </div>

        <div class="col-md-3">
            <a href="/student1/idcard" style="text-decoration:none;">
                <div class="tile">🆔 ID Card</div>
            </a>
        </div>

    </div>

</div>

</body>
</html>
