<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Assignments & Study Material</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        /* 🔥 NEW CLEAN BACKGROUND (Gradient) */
        body {
            background: linear-gradient(135deg, #eef2f3, #dfe9f3);
            color: black;
            font-family: 'Poppins', sans-serif;
        }

        /* Card color unchanged (just made readable) */
        .card {
            background: white;
            border-radius: 12px;
            padding: 20px;
            box-shadow: 0px 4px 15px rgba(0,0,0,0.15);
        }

        th, td {
            color: black;
        }

        a, a:hover {
            color: #0d6efd;
            text-decoration: none;
        }

        input, textarea {
            color: black !important;
        }
    </style>
</head>
<body>
<div class="container mt-4">
    <a href="/teacher/dashboard" class="mb-3 d-inline-block" style="color:#0d6efd;">⬅ Back to Dashboard</a>

    <div class="card">
        <h2 class="text-center mb-4" style="color:#0b3c75;">📚 Assignments & Study Material</h2>

        <form action="/teacher/assignments/upload" method="post" enctype="multipart/form-data" class="row g-3">
            <div class="col-md-4">
                <label>Title</label>
                <input type="text" name="title" class="form-control" required>
            </div>
            <div class="col-md-5">
                <label>Description</label>
                <textarea name="description" class="form-control" rows="1" required></textarea>
            </div>
            <div class="col-md-3">
                <label>Due Date</label>
                <input type="date" name="dueDate" class="form-control" required>
            </div>
            <div class="col-md-8">
                <label>Upload File (PDF, PPT, etc.)</label>
                <input type="file" name="file" class="form-control" required>
            </div>
            <div class="col-md-4 text-center">
                <button class="btn btn-primary w-100 mt-4">Upload</button>
            </div>
        </form>

        <hr>

        <h4 class="mt-4" style="color:#0b3c75;">📁 Uploaded Assignments</h4>

        <table class="table table-bordered text-center">
            <thead class="table-dark">
            <tr>
                <th>ID</th><th>Title</th><th>Description</th><th>Due Date</th><th>File</th><th>Uploaded</th><th>Actions</th>
            </tr>
            </thead>

            <tbody>
            <c:forEach var="a" items="${assignments}">
                <tr>
                    <td>${a.id}</td>
                    <td>${a.title}</td>
                    <td>${a.description}</td>
                    <td>${a.dueDate}</td>
                    <td><a href="/uploads/${a.fileName}" target="_blank">${a.fileName}</a></td>
                    <td>${a.uploadDate}</td>
                    <td>
                        <a href="/teacher/assignments/delete/${a.id}"
                           class="btn btn-danger btn-sm"
                           onclick="return confirm('Delete this assignment?');">
                            🗑 Delete
                        </a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

    </div>
</div>
</body>
</html>
