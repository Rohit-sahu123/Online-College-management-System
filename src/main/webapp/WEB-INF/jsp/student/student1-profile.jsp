<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="student1-style.jsp" %>

<html>
<head>
<title>My Profile</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>

<body>

<div class="container mt-5">
    <h2 class="text-center text-white mb-4">👤 My Profile</h2>

    <div class="glass-card">

        <h4 class="text-white mb-3">Student Details</h4>

        <table class="table table-borderless text-white">
            <tr>
                <th>Name:</th>
                <td>${student.name}</td>
            </tr>
            <tr>
                <th>Email:</th>
                <td>${student.email}</td>
            </tr>
            <tr>
                <th>Course:</th>
                <td>${student.course}</td>
            </tr>
            <tr>
                <th>Roll No:</th>
                <td>${student.rollNo}</td>
            </tr>
            <tr>
                <th>Phone:</th>
                <td>${student.phone}</td>
            </tr>
            <tr>
                <th>Address:</th>
                <td>${student.address}</td>
            </tr>
        </table>

        <div class="text-center mt-3">
            <a href="/student1/profile/edit" class="btn btn-glass">✏ Edit Profile</a>
            <a href="/student1/dashboard" class="btn btn-glass">⬅ Back to Dashboard</a>
        </div>

    </div>
</div>

</body>
</html>
