<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Exam Marks Entry</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #2C5364, #203A43, #0F2027);
            color: white;
            font-family: 'Poppins', sans-serif;
        }
        .card {
            background: rgba(255,255,255,0.08);
            border-radius: 15px;
            padding: 20px;
            color: white;
        }
        a, a:hover { color: #0dcaf0; text-decoration: none; }
        th, td { color: white; }
        input, select { color: black !important; }
    </style>
</head>
<body>
<div class="container mt-4">
    <a href="/teacher/dashboard" class="text-light mb-3 d-inline-block">⬅ Back to Dashboard</a>

    <div class="card shadow">
        <h2 class="text-center mb-3">
            📝 ${editExam != null ? "Edit Exam Marks" : "Add Exam Marks"}
        </h2>

        <form action="${editExam != null ? '/teacher/exam-entry/update' : '/teacher/exam-entry'}" method="post" class="row g-3">
            <c:if test="${editExam != null}">
                <input type="hidden" name="id" value="${editExam.id}" />
            </c:if>

            <div class="col-md-4">
                <label>Student Name</label>
                <input type="text" name="studentName" class="form-control"
                       value="${editExam != null ? editExam.studentName : ''}" required>
            </div>
            <div class="col-md-4">
                <label>Subject</label>
                <input type="text" name="subject" class="form-control"
                       value="${editExam != null ? editExam.subject : ''}" required>
            </div>
            <div class="col-md-2">
                <label>Marks</label>
                <input type="number" name="marks" class="form-control"
                       value="${editExam != null ? editExam.marks : ''}" required>
            </div>
            <div class="col-md-2">
                <label>Grade</label>
                <input type="text" name="grade" class="form-control"
                       value="${editExam != null ? editExam.grade : ''}" required>
            </div>
            <div class="col-12 text-center">
                <button type="submit" class="btn btn-light px-5">
                    ${editExam != null ? "Update Marks" : "Save Marks"}
                </button>
                <c:if test="${editExam != null}">
                    <a href="/teacher/exam-entry" class="btn btn-secondary ms-2">Cancel</a>
                </c:if>
            </div>
        </form>

        <hr>

        <h4 class="mt-4">📊 Marks Records</h4>
        <table class="table table-bordered text-white text-center align-middle">
            <thead>
                <tr>
                    <th>ID</th><th>Student Name</th><th>Subject</th><th>Marks</th><th>Grade</th><th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="e" items="${examList}">
                    <tr>
                        <td>${e.id}</td>
                        <td>${e.studentName}</td>
                        <td>${e.subject}</td>
                        <td>${e.marks}</td>
                        <td>${e.grade}</td>
                        <td>
                            <a href="/teacher/exam-entry/edit/${e.id}" class="btn btn-sm btn-warning">✏ Edit</a>
                            <a href="/teacher/exam-entry/delete/${e.id}" class="btn btn-sm btn-danger"
                               onclick="return confirm('Are you sure you want to delete this record?');">🗑 Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
