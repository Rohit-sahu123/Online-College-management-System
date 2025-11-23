<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Leave History</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/student/student-bg.css">

</head>
<body class="bg-light">

<div class="container mt-4">
    <h2>📘 My Leave Requests</h2>

    <table class="table table-bordered table-striped mt-3 bg-white">
        <tr>
            <th>Student</th>
            <th>Reason</th>
            <th>Date</th>
            <th>Status</th>
        </tr>

        <c:forEach var="l" items="${leaveList}">
            <tr>
                <td>${l.studentName}</td>
                <td>${l.reason}</td>
                <td>${l.date}</td>
                <td>
                    <span class="badge bg-warning text-dark">${l.status}</span>
                </td>
            </tr>
        </c:forEach>

    </table>
</div>

</body>
</html>
