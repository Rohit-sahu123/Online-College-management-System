<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <title>Add Student</title>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>

<body class="bg-light">
<div class="container mt-5 col-md-6">

    <h2 class="text-center mb-4">➕ Add New Student</h2>

    <form action="/teacher/students/save" method="post" class="card p-4 shadow">

        <label>Name:</label>
        <input type="text" name="name" class="form-control mb-3" required>

        <label>Email:</label>
        <input type="email" name="email" class="form-control mb-3" required>

        <label>Password:</label>
        <input type="password" name="password" class="form-control mb-3" required>

        <label>Course:</label>
        <input type="text" name="course" class="form-control mb-3" required>

        <label>Phone:</label>
        <input type="text" name="phone" class="form-control mb-3">

        <label>Address:</label>
        <textarea name="address" class="form-control mb-3"></textarea>

        <button class="btn btn-success w-100">Save Student</button>
    </form>
</div>
</body>
</html>
