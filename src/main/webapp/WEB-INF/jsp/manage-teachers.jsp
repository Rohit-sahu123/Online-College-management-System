<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Teachers</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(120deg, #f8f9fc, #e3f2fd);
            animation: fadeIn 0.7s ease-out;
        }

        @keyframes fadeIn {
            from {opacity: 0; transform: translateY(10px);}
            to {opacity: 1; transform: translateY(0);}
        }

        h2 {
            font-weight: 700;
            color: #2c3e50;
            letter-spacing: 1px;
        }

        .btn-primary {
            border-radius: 25px;
            padding: 8px 20px;
        }

        .card {
            border-radius: 15px;
            padding: 15px;
            box-shadow: 0px 5px 12px rgba(0,0,0,0.15);
            animation: slide 0.6s ease-out;
            background: white;
        }

        @keyframes slide {
            from {opacity: 0; transform: translateY(20px);}
            to {opacity: 1; transform: translateY(0);}
        }

        .table-hover tbody tr:hover {
            background-color: #e8f5ff !important;
            transform: scale(1.01);
            transition: 0.2s ease-in-out;
        }

        .table thead {
            border-radius: 10px;
        }
    </style>
</head>
<body>

<div class="container mt-4">

    <h2 class="mb-4 text-center">📚 Manage Teachers</h2>

    <div class="d-flex justify-content-end mb-3">
        <a href="/admin/add-teacher" class="btn btn-primary">➕ Add Teacher</a>
    </div>

    <div class="card">
        <table class="table table-bordered table-hover text-center mb-0">
            <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Subject</th>
                <th>Password</th>
            </tr>
            </thead>

            <tbody>
            <c:forEach var="t" items="${teachers}">
                <tr>
                    <td>${t.id}</td>
                    <td>${t.name}</td>
                    <td>${t.email}</td>
                    <td>${t.subject}</td>
                    <td>${t.password}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <c:if test="${empty teachers}">
            <p class="text-center text-muted mt-3">No teachers found. Try adding one!</p>
        </c:if>
    </div>

</div>

</body>
</html>
