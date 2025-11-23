<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
  <title>Students</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

  <style>
      body {
          background: linear-gradient(120deg, #f0f4ff, #e8f5e9);
          animation: fadeIn 0.7s ease-out;
      }

      @keyframes fadeIn {
          from {opacity: 0; transform: translateY(10px);}
          to {opacity: 1; transform: translateY(0);}
      }

      .table-hover tbody tr:hover {
          background-color: #e3f2fd !important;
          transform: scale(1.01);
          transition: 0.2s ease-in-out;
      }

      .card {
          border-radius: 15px;
          box-shadow: 0px 4px 12px rgba(0,0,0,0.1);
          animation: slide 0.6s ease-out;
      }

      @keyframes slide {
          from {opacity: 0; transform: translateY(20px);}
          to {opacity: 1; transform: translateY(0);}
      }

      h3 {
          font-weight: 700;
          color: #2c3e50;
      }

      .btn-primary {
          border-radius: 50px;
          padding: 8px 20px;
      }
  </style>
</head>
<body>

<div class="container mt-4">

  <div class="d-flex justify-content-between mb-3">
    <h3>Students</h3>
    <a href="${pageContext.request.contextPath}/admin/students/add" class="btn btn-primary">
       ➕ Add Student
    </a>
  </div>

  <div class="card p-3">
    <table class="table table-bordered table-hover">
      <thead class="table-dark">
        <tr>
          <th>ID</th>
          <th>Name</th>
          <th>Email</th>
          <th>Course</th>
          <th>Contact</th>
          <th>Address</th>
        </tr>
      </thead>

      <tbody>
        <c:forEach var="s" items="${students}">
          <tr>
            <td>${s.id}</td>
            <td>${s.name}</td>
            <td>${s.email}</td>
            <td>${s.course}</td>
            <td>${s.contact}</td>
            <td>${s.address}</td>
          </tr>
        </c:forEach>
      </tbody>

    </table>
  </div>

</div>

</body>
</html>
