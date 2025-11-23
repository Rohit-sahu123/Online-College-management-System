<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>My Leaves</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background: linear-gradient(135deg, #373b44, #4286f4); color: white; font-family: 'Poppins', sans-serif; }
        .card { background: rgba(255,255,255,0.1); padding: 20px; border-radius: 12px; }
        th, td { color: white; }
        a { text-decoration: none; }
    </style>
</head>
<body>
<div class="container mt-4">
    <a href="/teacher/dashboard" class="text-light">⬅ Back to Dashboard</a>
    <div class="card mt-3">
        <div class="d-flex justify-content-between mb-3">
            <h2>📅 My Leave Applications</h2>
            <a href="/teacher/leaves/apply" class="btn btn-light">➕ Apply Leave</a>
        </div>

        <table class="table table-bordered text-center">
            <thead>
            <tr>
                <th>ID</th><th>Teacher Name</th><th>Reason</th><th>From</th><th>To</th><th>Status</th><th>Action</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="l" items="${leaves}">
                <tr>
                    <td>${l.id}</td>
                    <td>${l.teacherName}</td>
                    <td>${l.reason}</td>
                    <td>${l.startDate}</td>
                    <td>${l.endDate}</td>
                    <td>${l.status}</td>
                    <td>
                        <a href="/teacher/leaves/delete/${l.id}" class="btn btn-danger btn-sm"
                           onclick="return confirm('Cancel this leave?')">🗑 Cancel</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
