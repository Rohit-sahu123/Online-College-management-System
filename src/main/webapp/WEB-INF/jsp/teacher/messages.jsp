<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Message Students</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background: linear-gradient(135deg, #1f4037, #99f2c8); color: white; font-family: 'Poppins', sans-serif; }
        .card { background: rgba(255,255,255,0.1); border-radius: 12px; padding: 20px; color: white; }
        th, td { color: white; }
        a, a:hover { color: #0dcaf0; text-decoration: none; }
        input, textarea { color: black !important; }
    </style>
</head>
<body>
<div class="container mt-4">
    <a href="/teacher/dashboard" class="text-light mb-3 d-inline-block">⬅ Back to Dashboard</a>

    <div class="card">
        <h2 class="text-center mb-3">💬 Message Students</h2>

        <form action="/teacher/messages/send" method="post" class="row g-3">
            <div class="col-md-4">
                <label>Student Name / Batch</label>
                <input type="text" name="studentName" class="form-control" placeholder="e.g. Rohit Sahu / CSE-A" required>
            </div>
            <div class="col-md-4">
                <label>Subject</label>
                <input type="text" name="subject" class="form-control" required>
            </div>
            <div class="col-md-4">
                <label>Message</label>
                <textarea name="message" class="form-control" rows="1" required></textarea>
            </div>
            <div class="col-12 text-center">
                <button class="btn btn-light mt-2 px-4">Send Message</button>
            </div>
        </form>

        <hr>

        <h4 class="mt-4">📩 Sent Messages</h4>
        <table class="table table-bordered text-center">
            <thead>
            <tr>
                <th>ID</th><th>Student/Batch</th><th>Subject</th><th>Message</th><th>Sent On</th><th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="m" items="${messages}">
                <tr>
                    <td>${m.id}</td>
                    <td>${m.studentName}</td>
                    <td>${m.subject}</td>
                    <td>${m.message}</td>
                    <td>${m.sentAt}</td>
                    <td>
                        <a href="/teacher/messages/delete/${m.id}" class="btn btn-danger btn-sm"
                           onclick="return confirm('Delete this message?');">🗑 Delete</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
