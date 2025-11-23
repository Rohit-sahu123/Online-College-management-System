<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Teacher Announcements</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background: linear-gradient(135deg, #232526, #414345); color: white; font-family: 'Poppins', sans-serif; }
        .card { background: rgba(255,255,255,0.08); border-radius: 12px; padding: 20px; color: white; }
        th, td { color: white; }
        a, a:hover { color: #0dcaf0; text-decoration: none; }
        input, textarea, select { color: black !important; }
    </style>
</head>
<body>
<div class="container mt-4">
    <a href="/teacher/dashboard" class="text-light mb-3 d-inline-block">⬅ Back to Dashboard</a>

    <div class="card shadow">
        <h2 class="text-center mb-3">📢 Teacher Announcements</h2>

        <form action="/teacher/announcements" method="post" class="row g-3">
            <div class="col-md-4">
                <label>Title</label>
                <input type="text" name="title" class="form-control" required>
            </div>
            <div class="col-md-5">
                <label>Message</label>
                <textarea name="message" class="form-control" rows="1" required></textarea>
            </div>
            <div class="col-md-3">
                <label>Audience</label>
               <select name="audience" class="form-control">
                   <option value="Students">Students</option>
                   <option value="Teachers">Teachers</option>
                   <option value="All">All</option>
               </select>

            </div>
            <div class="col-12 text-center">
                <button class="btn btn-light mt-2 px-4">Post Announcement</button>
            </div>
        </form>

        <hr>

        <h4 class="mt-4">📜 Recent Announcements</h4>
        <table class="table table-bordered text-center">
            <thead>
            <tr>
                <th>ID</th><th>Title</th><th>Message</th><th>Audience</th><th>Posted On</th><th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="a" items="${announcements}">
                <tr>
                    <td>${a.id}</td>
                    <td>${a.title}</td>
                    <td>${a.message}</td>
                    <td>${a.audience}</td>
                    <td>${a.createdAt}</td>
                    <td>
                        <a href="/teacher/announcements/delete/${a.id}" class="btn btn-danger btn-sm"
                           onclick="return confirm('Delete this announcement?');">🗑 Delete</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
