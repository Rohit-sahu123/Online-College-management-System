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

<table border="1" cellpadding="8" cellspacing="0" width="100%">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Action</th>
    </tr>

    <c:forEach var="s" items="${students}">
        <tr>
            <td>${s.id}</td>
            <td>${s.name}</td>
            <td>${s.email}</td>

            <td>
                <a href="/student/delete/${s.id}"
                   onclick="return confirm('Are you sure you want to delete this student?');"
                   style="
                     color:white;
                     background:red;
                     padding:5px 10px;
                     text-decoration:none;
                     border-radius:4px;">
                   Delete
                </a>
            </td>
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
