<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Student Profiles</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background: linear-gradient(135deg, #2b5876, #4e4376); color: white; font-family: 'Poppins', sans-serif; }
        .card { background: rgba(255,255,255,0.1); border-radius: 12px; padding: 20px; }
        th, td { color: white; }
        a, a:hover { color: #0dcaf0; text-decoration: none; }
        input { color: black !important; }
    </style>
</head>
<body>
<div class="container mt-4">
    <a href="/teacher/dashboard" class="text-light mb-3 d-inline-block">⬅ Back to Dashboard</a>

    <div class="card">
        <h2 class="text-center mb-3">👨‍🎓 Student Profiles</h2>

        <form class="row mb-4" action="/teacher/students/search" method="get">
            <div class="col-md-4">
                <input type="text" name="name" class="form-control" placeholder="🔍 Search by Name">
            </div>
            <div class="col-md-4">
                <input type="text" name="batch" class="form-control" placeholder="🔍 Filter by Batch">
            </div>
            <div class="col-md-4 text-center">
                <button class="btn btn-light w-50">Search</button>
            </div>
        </form>

        <h5 class="text-info">${filterApplied}</h5>

       <div class="d-flex justify-content-between mb-2">
           <h4>Student List</h4>
           <a href="/teacher/students/add" class="btn btn-light">➕ Add New Student</a>
       </div>

       <table class="table table-bordered text-center">
           <thead>
           <tr>
               <th>ID</th><th>Roll No</th><th>Name</th><th>Course</th><th>Batch</th>
               <th>Email</th><th>Phone</th><th>Attendance (%)</th><th>Marks (%)</th><th>Actions</th>
           </tr>
           </thead>
           <tbody>
           <c:forEach var="s" items="${students}">
               <tr>
                   <td>${s.id}</td>
                   <td>${s.rollNo}</td>
                   <td>${s.name}</td>
                   <td>${s.course}</td>
                   <td>${s.batch}</td>
                   <td>${s.email}</td>
                   <td>${s.phone}</td>
                   <td>${s.attendancePercentage}</td>
                   <td>${s.marks}</td>
                   <td>
                       <a href="/teacher/students/edit/${s.id}" class="btn btn-sm btn-warning">✏ Edit</a>
                       <a href="/teacher/students/delete/${s.id}" class="btn btn-sm btn-danger"
                          onclick="return confirm('Are you sure you want to delete this student?')">🗑 Delete</a>
                   </td>
               </tr>
           </c:forEach>
           </tbody>
       </table>

    </div>
</div>
</body>
</html>
