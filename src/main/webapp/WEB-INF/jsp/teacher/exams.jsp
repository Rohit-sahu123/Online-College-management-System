<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Exams & Evaluation</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #283c86, #45a247);
            color: white;
            font-family: 'Poppins', sans-serif;
        }
        .card {
            background: rgba(255,255,255,0.08);
            border: 1px solid rgba(255,255,255,0.1);
            backdrop-filter: blur(6px);
            color: white;
        }
        th, td { color: white; }
        a.btn-back {
            color: white;
            text-decoration: none;
            margin-bottom: 10px;
            display: inline-block;
        }
        a.btn-back:hover {
            color: #0dcaf0;
        }
    </style>
</head>
<body>
<div class="container mt-4">
    <a href="/teacher/dashboard" class="btn-back">⬅ Back to Dashboard</a>

    <div class="card p-4 shadow">
        <h2 class="text-center mb-3">📊 Exams & Evaluation</h2>

        <table class="table table-bordered text-center">
            <thead>
                <tr>
                    <th>Student Name</th>
                    <th>Subject</th>
                    <th>Marks</th>
                    <th>Grade</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="exam" items="${examList}">
                    <tr>
                        <td>${exam.studentName}</td>
                        <td>${exam.subject}</td>
                        <td>${exam.marks}</td>
                        <td>${exam.grade}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
