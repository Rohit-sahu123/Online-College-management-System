<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Teacher</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
    <h3>Edit Teacher</h3>
    <form method="post" action="/admin/teachers/update">
        <input type="hidden" name="id" value="${teacher.id}">
        <div class="mb-3"><input name="name" value="${teacher.name}" class="form-control" placeholder="Name"></div>
        <div class="mb-3"><input name="email" value="${teacher.email}" class="form-control" placeholder="Email"></div>
        <div class="mb-3"><input name="department" value="${teacher.department}" class="form-control" placeholder="Department"></div>
        <div class="mb-3"><input name="subject" value="${teacher.subject}" class="form-control" placeholder="Subject"></div>
        <div class="mb-3"><input name="contact" value="${teacher.contact}" class="form-control" placeholder="Contact Number"></div>
        <div class="mb-3"><textarea name="address" class="form-control">${teacher.address}</textarea></div>
        <button class="btn btn-primary">Update</button>
    </form>
</div>
</body>
</html>
