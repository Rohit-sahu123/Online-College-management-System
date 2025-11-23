<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Student Login - BIST</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-5">
            <div class="card p-4 shadow">
                <h3 class="text-center mb-3">Student Login</h3>
                <form method="post" action="/student/login">
                    <input name="rollNumber" class="form-control mb-3" placeholder="Roll Number" required>
                    <input name="password" type="password" class="form-control mb-3" placeholder="Password" required>
                    <button class="btn btn-info w-100">Login</button>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
