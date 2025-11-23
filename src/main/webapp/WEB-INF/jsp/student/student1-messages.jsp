<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Messages</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/student/student-bg.css">

</head>
<body class="bg-light">

<div class="container mt-4">
    <h2 class="mb-4">💬 Messages From Teachers</h2>

    <c:forEach var="m" items="${msgList}">
        <div class="card mb-3 shadow-sm">
            <div class="card-body">
                <h5 class="card-title">Subject: ${m.subject}</h5>
                <p class="card-text">${m.message}</p>
                <span class="badge bg-info text-dark">From: ${m.studentName}</span>
            </div>
        </div>
    </c:forEach>

</div>

</body>
</html>
