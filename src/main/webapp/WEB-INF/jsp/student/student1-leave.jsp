<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Leave Application</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/student/student-bg.css">

</head>
<body class="bg-light">

<div class="container mt-4 col-md-6">

    <h2>📝 Apply for Leave</h2>

    <c:if test="${not empty msg}">
        <div class="alert alert-success">${msg}</div>
    </c:if>

    <form action="/student1/leave/save" method="post" class="border p-4 bg-white shadow">

        <label>Student Name</label>
        <input type="text" name="studentName" class="form-control mb-2" required>

        <label>Reason</label>
        <textarea name="reason" class="form-control mb-2" required></textarea>

        <label>Date</label>
        <input type="date" name="date" class="form-control mb-3" required>

        <button class="btn btn-primary w-100">Submit</button>
    </form>

    <a href="/student1/leave/history" class="btn btn-info mt-3">View Leave History</a>

</div>

</body>
</html>
