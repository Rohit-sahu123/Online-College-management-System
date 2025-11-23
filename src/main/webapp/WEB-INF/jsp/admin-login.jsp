<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Login - BIST</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-5">
            <div class="card p-4 shadow">
                <h3 class="text-center mb-3">Admin Login</h3>
                <form method="post" action="/admin/login">
                    <input name="email" class="form-control mb-3" placeholder="Email" required>
                    <input name="password" type="password" class="form-control mb-3" placeholder="Password" required>
                    <button class="btn btn-primary w-100">Login</button>
                </form>
                <c:if test="${not empty error}">
                    <div class="text-danger mt-2">${error}</div>
                </c:if>
            </div>
        </div>
    </div>
</div>
</body>
</html>
