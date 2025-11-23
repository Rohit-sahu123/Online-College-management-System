<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Results Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(135deg, #e9f4ff, #f7fbff);
            animation: fadeIn 0.8s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        h3, h4 {
            font-weight: 700;
            color: #123d6b;
        }

        .card-box {
            background: white;
            padding: 22px;
            border-radius: 18px;
            box-shadow: 0 5px 18px rgba(0,0,0,0.12);
            margin-bottom: 30px;
            animation: slideUp 0.6s ease-out;
        }

        @keyframes slideUp {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .btn-success {
            padding: 8px 28px;
            border-radius: 25px;
        }

        .table-hover tbody tr:hover {
            background: #e9f5ff !important;
            transform: scale(1.01);
            transition: 0.2s;
        }

        th {
            background: #0d6efd !important;
            color: white;
        }

        .grade-box {
            padding: 6px 14px;
            border-radius: 12px;
            font-weight: bold;
        }

        .grade-A { background: #d1ffd1; color: #0b7d0b; }
        .grade-B { background: #fff9d1; color: #927800; }
        .grade-C { background: #ffe1d1; color: #b23800; }
        .grade-F { background: #ffd1d1; color: #a00000; }

    </style>
</head>
<body>

<div class="container mt-4">

    <!-- Card 1: Add Result -->
    <div class="card-box">
        <h3 class="text-center mb-3">📘 Add New Result</h3>

        <form method="post" action="/admin/save-result">
            <div class="mb-3">
                <label class="fw-bold">Student:</label>
                <select name="studentId" class="form-control" required>
                    <option value="">-- Select Student --</option>
                    <c:forEach var="s" items="${students}">
                        <option value="${s.id}">${s.name}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="mb-3">
                <label class="fw-bold">Subject:</label>
                <input type="text" name="subject" class="form-control" required>
            </div>

            <div class="mb-3">
                <label class="fw-bold">Marks:</label>
                <input type="number" step="0.01" name="marks" class="form-control" required>
            </div>

            <div class="mb-3">
                <label class="fw-bold">Grade:</label>
                <input type="text" name="grade" class="form-control" required>
            </div>

            <button type="submit" class="btn btn-success">Save</button>
        </form>
    </div>

    <!-- Card 2: Display Results -->
    <div class="card-box">
        <h4 class="mb-3">📄 All Results</h4>

        <table class="table table-bordered table-hover text-center">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Student</th>
                    <th>Subject</th>
                    <th>Marks</th>
                    <th>Grade</th>
                </tr>
            </thead>

            <tbody>
                <c:forEach var="r" items="${results}">
                    <tr>
                        <td>${r.id}</td>
                        <td>${r.student.name}</td>
                        <td>${r.subject}</td>
                        <td>${r.marks}</td>
                        <td>
                            <span class="
                                grade-box
                                <c:choose>
                                    <c:when test='${r.grade == "A"}'>grade-A</c:when>
                                    <c:when test='${r.grade == "B"}'>grade-B</c:when>
                                    <c:when test='${r.grade == "C"}'>grade-C</c:when>
                                    <c:otherwise>grade-F</c:otherwise>
                                </c:choose>
                            ">
                                ${r.grade}
                            </span>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>

        </table>
    </div>

</div>

</body>
</html>
