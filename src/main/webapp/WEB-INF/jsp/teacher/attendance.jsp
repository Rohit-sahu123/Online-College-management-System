<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Attendance Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <h2 class="mb-4 text-center">📘 Attendance Management</h2>

    <!-- Attendance Form -->
    <form action="${attendance != null ? '/teacher/attendance/update' : '/teacher/attendance'}" method="post"
          class="mb-4 border rounded p-3 bg-white shadow-sm">

        <input type="hidden" name="id" value="${attendance.id}"/>

        <div class="row">
            <div class="col-md-4 mb-2">
                <input type="text" name="studentName" class="form-control" placeholder="Student Name"
                       value="${attendance.studentName}" required>
            </div>
            <div class="col-md-3 mb-2">
                <input type="text" name="rollNo" class="form-control" placeholder="Roll No"
                       value="${attendance.rollNo}" required>
            </div>
            <div class="col-md-3 mb-2">
                <input type="text" name="subject" class="form-control" placeholder="Subject"
                       value="${attendance.subject}" required>
            </div>
            <div class="col-md-2 mb-2">
                <input type="date" name="date" class="form-control" value="${attendance.date}" required>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3 mb-2">
                <select name="status" class="form-select">
                    <option value="Present" ${attendance.status eq 'Present' ? 'selected' : ''}>Present</option>
                    <option value="Absent" ${attendance.status eq 'Absent' ? 'selected' : ''}>Absent</option>
                    <option value="Late" ${attendance.status eq 'Late' ? 'selected' : ''}>Late</option>
                </select>
            </div>
            <div class="col-md-5 mb-2">
                <input type="email" name="teacherEmail" class="form-control" placeholder="Teacher Email"
                       value="${attendance.teacherEmail}" required>
            </div>
            <div class="col-md-4 mb-2 text-end">
                <button type="submit" class="btn btn-${attendance != null ? 'warning' : 'success'} px-4">
                    ${attendance != null ? 'Update' : 'Mark Attendance'}
                </button>
            </div>
        </div>
    </form>
        <!-- Filter Section -->
        <div class="card mb-4 p-3 bg-white shadow-sm">
            <h5>🔍 Filter Attendance</h5>
            <form action="/teacher/attendance/filter/subject" method="get" class="d-inline-block me-3">
                <input type="text" name="subject" class="form-control d-inline-block w-auto" placeholder="Enter Subject">
                <button type="submit" class="btn btn-outline-primary btn-sm">Search by Subject</button>
            </form>

            <form action="/teacher/attendance/filter/date" method="get" class="d-inline-block">
                <input type="date" name="date" class="form-control d-inline-block w-auto">
                <button type="submit" class="btn btn-outline-success btn-sm">Search by Date</button>
            </form>

            <a href="/teacher/attendance" class="btn btn-outline-dark btn-sm float-end">Reset</a>
        </div>

        <c:if test="${not empty filterApplied}">
            <div class="alert alert-info">Filter Applied → ${filterApplied}</div>
        </c:if>
        <c:if test="${not empty error}">
            <div class="alert alert-danger">${error}</div>
        </c:if>

    <!-- Attendance Table -->
    <div class="table-responsive">
        <table class="table table-bordered table-striped shadow-sm">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Student</th>
                    <th>Roll No</th>
                    <th>Subject</th>
                    <th>Date</th>
                    <th>Status</th>
                    <th>Teacher</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="a" items="${attendanceList}">
                    <tr>
                        <td>${a.id}</td>
                        <td>${a.studentName}</td>
                        <td>${a.rollNo}</td>
                        <td>${a.subject}</td>
                        <td>${a.date}</td>
                        <td>
                            <c:choose>
                                <c:when test="${a.status eq 'Present'}">
                                    <span class="badge bg-success">${a.status}</span>
                                </c:when>
                                <c:when test="${a.status eq 'Absent'}">
                                    <span class="badge bg-danger">${a.status}</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="badge bg-warning text-dark">${a.status}</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>${a.teacherEmail}</td>
                        <td>
                            <a href="/teacher/attendance/edit/${a.id}" class="btn btn-sm btn-primary">Edit</a>
                            <a href="/teacher/attendance/delete/${a.id}" class="btn btn-sm btn-danger"
                               onclick="return confirm('Are you sure?')">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <a href="/teacher/attendance/export/excel" class="btn btn-success btn-sm">📗 Export Excel</a>
        <a href="/teacher/attendance/export/pdf" class="btn btn-danger btn-sm">📕 Export PDF</a>

    </div>
</div>

</body>
</html>
