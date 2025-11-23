<!DOCTYPE html>
<html>
<head>
<title>Teacher Login</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
  <h2 class="text-center mb-4">Teacher Login</h2>
  <form action="/login" method="post" class="col-md-4 mx-auto border p-4 bg-white rounded shadow-sm">

      <input type="hidden" name="role" value="teacher">

      <div class="mb-3">
          <label>Email</label>
          <input type="email" name="email" class="form-control" required>
      </div>

      <div class="mb-3">
          <label>Password</label>
          <input type="password" name="password" class="form-control" required>
      </div>

      <button type="submit" class="btn btn-primary w-100">Login</button>

      <c:if test="${not empty error}">
          <div class="text-danger mt-2">${error}</div>
      </c:if>
  </form>

</div>
</body>
</html>
