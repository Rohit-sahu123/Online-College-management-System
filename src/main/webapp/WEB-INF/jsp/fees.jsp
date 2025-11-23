<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Fees</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(120deg, #f1f8ff, #e8f0fe);
            animation: fadeIn 0.8s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to   { opacity: 1; transform: translateY(0); }
        }

        h3, h4 {
            font-weight: 700;
            color: #1f3b57;
        }

        .form-card, .table-card {
            background: white;
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0px 5px 15px rgba(0,0,0,0.12);
            animation: slideUp 0.5s ease-out;
        }

        @keyframes slideUp {
            from { opacity: 0; transform: translateY(15px); }
            to   { opacity: 1; transform: translateY(0); }
        }

        .table-hover tbody tr:hover {
            background-color: #e3f3ff !important;
            transform: scale(1.01);
            transition: 0.2s ease-in-out;
        }

        .btn-success {
            border-radius: 25px;
            padding: 8px 25px;
        }

    </style>
</head>
<body class="container mt-4">

<h3 class="text-center mb-4">💰 Fees Management</h3>

<div class="form-card mb-4">
    <form method="post" action="/admin/save-fees" class="mb-3">

        <div class="mb-3">
            <label class="fw-bold">Student:</label>
            <select name="student.id" class="form-control" required>
                <option value="">-- Select Student --</option>
                <c:forEach var="s" items="${students}">
                    <option value="${s.id}">${s.name}</option>
                </c:forEach>
            </select>
        </div>

        <div class="mb-3">
            <label class="fw-bold">Amount:</label>
            <input type="number" name="amount" class="form-control" required>
        </div>

        <div class="mb-3">
            <label class="fw-bold">Date:</label>
            <input type="date" name="date" class="form-control" required>
        </div>

        <button type="submit" class="btn btn-success">Save</button>
    </form>
</div>

<h4 class="mb-3">📄 All Fee Records</h4>

<div class="table-card">
    <table class="table table-bordered table-hover text-center">
        <thead class="table-primary">
        <tr>
            <th>ID</th>
            <th>Student</th>
            <th>Amount</th>
            <th>Date</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="f" items="${feesList}">
            <tr>
                <td>${f.id}</td>
                <td>${f.student.name}</td>
                <td>${f.amount}</td>
                <td>${f.date}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>
