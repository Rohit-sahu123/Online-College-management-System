<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>All Students</title>

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

</head>

<body class="bg-light">

<div class="container mt-4">

    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2>📘 All Registered Students</h2>

        <!-- ADD STUDENT BUTTON -->
        <a href="/teacher/students/add" class="btn btn-primary">
            ➕ Add New Student
        </a>
    </div>

    <!-- STUDENT TABLE -->
    <table class="table table-bordered table-striped shadow">
        <thead class="table-dark">
        <tr>
            <th>#</th>
            <th>Name</th>
            <th>Email</th>
            <th>Course</th>
            <th>Phone</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach var="s" items="${students}">
            <tr>
                <td>${s.id}</td>
                <td>${s.name}</td>
                <td>${s.email}</td>
                <td>${s.course}</td>
                <td>${s.phone}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

</div>

</body>
</html>
