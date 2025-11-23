<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Attendance Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(135deg, #e8f3ff, #f2faff);
            animation: fadeIn 0.7s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to   { opacity: 1; transform: translateY(0px); }
        }

        h3, h4 {
            font-weight: 700;
            color: #1c3d5a;
        }

        .card-box {
            background: #ffffff;
            padding: 20px;
            border-radius: 18px;
            box-shadow: 0px 5px 18px rgba(0,0,0,0.12);
            margin-bottom: 25px;
            animation: slideUp 0.6s ease-out;
        }

        @keyframes slideUp {
            from { opacity: 0; transform: translateY(20px); }
            to   { opacity: 1; transform: translateY(0); }
        }

        .table-hover tbody tr:hover {
            background-color: #e9f5ff !important;
            transform: scale(1.01);
            transition: 0.2s;
        }

        .btn-primary {
            padding: 8px 25px;
            border-radius: 25px;
        }

        .status-present {
            background: #d4f8d4;
            color: #0b7a0b;
            padding: 5px 12px;
            border-radius: 15px;
            font-weight: 600;
        }

        .status-absent {
            background: #ffd4d4;
            color: #a30000;
            padding: 5px 12px;
            border-radius: 15px;
            font-weight: 600;
        }

    </style>
</head>
<body>

<div class="container mt-4">

    <div class="card-box">
        <h3 class="text-center mb-3">📘 Mark Attendance</h3>

        <form method="post" action="/admin/attendance">
            <div class="mb-3">
                <label class="fw-bold">Student:</label>
                <select name="student.id" class="form-control" required>
                    <option value="">-- Select Student --</option>
                    <c:forEach var="s" items="${students}">
                        <option value="${s.id}">${s.name}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="mb-3">
                <label class="fw-bold">Date:</label>
                <input type="date" name="date" class="form-control" required>
            </div>

            <div class="mb-3">
                <label class="fw-bold">Status:</label>
                <select name="present" class="form-control">
                    <option value="true">Present</option>
                    <option value="false">Absent</option>
                </select>
            </div>

            <button class="btn btn-primary">Submit</button>
        </form>
    </div>

    <div class="card-box">
        <h4 class="mb-3">📄 Attendance Records</h4>

        <table class="table table-bordered table-hover text-center">
            <thead class="table-primary">
                <tr>
                    <th>ID</th>
                    <th>Student</th>
                    <th>Date</th>
                    <th>Status</th>
                </tr>
            </thead>

            <tbody>
                <c:forEach var="a" items="${attendanceList}">
                    <tr>
                        <td>${a.id}</td>
                        <td>${a.student.name}</td>
                        <td>${a.date}</td>
                        <td>
                            <c:choose>
                                <c:when test="${a.present}">
                                    <span class="status-present">Present</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="status-absent">Absent</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

</div>

</body>
</html>
