<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>All Students</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-dark text-white">

<div class="container mt-5">

    <h2 class="text-center mb-4">📚 Registered Students</h2>

<h2>All Registered Students</h2>

<table border="1" width="100%">
    <tr>
        <th>Name</th>
        <th>Email</th>
        <th>Course</th>
    </tr>

    <c:forEach var="s" items="${students}">
        <tr>
            <td>${s.name}</td>
            <td>${s.email}</td>
            <td>${s.course}</td>
        </tr>
    </c:forEach>
</table>
<form action="/teacher/students/save" method="post">
    <input type="text" name="name" required>
    <input type="email" name="email" required>
    <input type="text" name="course" required>
    <input type="password" name="password" required>
    <button type="submit">Save</button>
</form>




</div>

</body>
</html>
