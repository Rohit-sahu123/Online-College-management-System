<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
  <title><c:out value='${student.id == null ? "Add Student" : "Edit Student"}'/></title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-4">
  <div class="card p-4">
    <h4>${student.id == null ? 'Add Student' : 'Edit Student'}</h4>
   <form action="/add-student" method="post" class="container mt-4">

     <div class="mb-3">
       <label>Name:</label>
       <input type="text" name="name" class="form-control" required>
     </div>

     <div class="mb-3">
       <label>Email:</label>
       <input type="email" name="email" class="form-control" required>
     </div>

     <div class="mb-3">
       <label>Course:</label>
       <input type="text" name="course" class="form-control" required>
     </div>

     <!-- नए fields -->
     <div class="mb-3">
       <label>Contact Number:</label>
       <input type="text" name="contact" class="form-control">
     </div>

     <div class="mb-3">
       <label>Address:</label>
       <textarea name="address" class="form-control"></textarea>
     </div>

     <button class="btn btn-primary">Save Student</button>
   </form>

  </div>
</div>
</body>
</html>
