<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Attendance</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
body{
    font-family: Inter, Arial;

    /* ✨ New Attractive Background */
    background: linear-gradient(135deg, #4c6ef5, #6a4fff, #8a5cf0, #4c6ef5);
    background-size: 400% 400%;
    animation: bgMove 10s ease infinite;

    color: #eef3ff;
    padding: 30px;
}

/* Animation */
@keyframes bgMove{
    0% { background-position: 0% 50%; }
    50% { background-position: 100% 50%; }
    100% { background-position: 0% 50%; }
}

.card{
    max-width: 1000px;
    margin: 0 auto;
    padding: 20px;
    border-radius: 12px;
    backdrop-filter: blur(10px);
    background: rgba(255,255,255,0.08);
}

.legend{display:flex;gap:12px}
.dot{width:12px;height:12px;border-radius:50%;display:inline-block}
.dot.present{background:#22c55e}
.dot.absent{background:#ff6b6b}
</style>

</head>
<body>
<div class="card">
<div class="d-flex justify-content-between align-items-center mb-3">
<h3>Attendance</h3>
<!-- ===== QR Attendance Section ===== -->
<div class="text-center my-4">
    <h5 class="mb-2">Scan this QR to mark your attendance</h5>

    <div style="background:#fff;padding:12px;border-radius:12px;display:inline-block">
        <img src= "${qrUrl}"
             alt="Attendance QR"
             style="width:220px;height:220px"/>
    </div>

    <p class="mt-2 small text-light">
        QR code refreshes automatically
    </p>
</div>
<!-- ===== QR Attendance Section END ===== -->
<!-- ===== Student Details ===== -->
<div class="mt-3 text-center">
    <h6>Student Details</h6>
    <p><b>Name:</b> ${student.name}</p>
    <p><b>Roll No:</b> ${student.rollNo}</p>
    <p><b>Course:</b> ${student.course}</p>
</div>



<a href="/student1/dashboard" class="btn btn-light btn-sm">Back</a>
</div>


<div class="mb-3 legend">
<div><span class="dot present"></span> Present</div>
<div><span class="dot absent"></span> Absent</div>
</div>


<table class="table table-borderless text-light">
<thead class="small text-muted">
<tr><th>Date</th><th>Subject</th><th>Status</th></tr>
</thead>
<tbody>

<c:if test="${not empty attendanceList}">
    <c:forEach var="a" items="${attendanceList}">
        <tr>
            <td>${a.date}</td>
            <td>--</td>
            <td>
                <c:choose>
                    <c:when test="${a.present}">
                        <span class="badge bg-success">Present</span>
                    </c:when>
                    <c:otherwise>
                        <span class="badge bg-danger">Absent</span>
                    </c:otherwise>
                </c:choose>
            </td>
        </tr>
    </c:forEach>
</c:if>

<c:if test="${empty attendanceList}">
    <tr>
        <td colspan="3" class="text-center text-muted">
            No attendance records found
        </td>
    </tr>
</c:if>

</tbody>

</table>
</div>
<p>DEBUG STUDENT ID = ${student.id}</p>

<script>
    setTimeout(function () {
        location.reload();
    }, 50000); // 5 seconds
</script>

</body>
</html>