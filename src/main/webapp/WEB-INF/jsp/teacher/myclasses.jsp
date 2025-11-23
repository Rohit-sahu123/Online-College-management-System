<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>My Classes & Timetable</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #2b5876, #4e4376);
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
        <h2 class="text-center mb-3">📘 My Classes & Timetable</h2>

        <table class="table table-bordered table-hover text-center">
            <thead>
                <tr>
                    <th>Day</th>
                    <th>Time</th>
                    <th>Subject</th>
                    <th>Batch</th>
                    <th>Room</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="cls" items="${classList}">
                    <tr>
                        <td>${cls.day}</td>
                        <td>${cls.time}</td>
                        <td>${cls.subject}</td>
                        <td>${cls.batch}</td>
                        <td>${cls.room}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
