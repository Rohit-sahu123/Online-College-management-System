<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add / Edit Student</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background: linear-gradient(135deg, #1f4037, #99f2c8); color: white; font-family: 'Poppins', sans-serif; }
        .card { background: rgba(255,255,255,0.1); border-radius: 12px; padding: 20px; }
        label { color: white; font-weight: 500; }
        input { color: black !important; }
    </style>
</head>
<body>
<div class="container mt-5">
    <a href="/teacher/students" class="text-light mb-3 d-inline-block">⬅ Back to Student List</a>

    <div class="card">
        <h2 class="text-center mb-3">🧾 ${student.id == null ? "Add New Student" : "Edit Student"}</h2>

        <form action="/teacher/students/save" method="post">
            <input type="hidden" name="id" value="${student.id}"/>

            <div class="row g-3">
                <div class="col-md-6">
                    <label>Roll No</label>
                    <input type="text" name="rollNo" value="${student.rollNo}" class="form-control" required>
                </div>
                <div class="col-md-6">
                    <label>Name</label>
                    <input type="text" name="name" value="${student.name}" class="form-control" required>
                </div>
                <div class="col-md-6">
                    <label>Course</label>
                    <input type="text" name="course" value="${student.course}" class="form-control" required>
                </div>
                <div class="col-md-6">
                    <label>Batch</label>
                    <input type="text" name="batch" value="${student.batch}" class="form-control" required>
                </div>
                <div class="col-md-6">
                    <label>Email</label>
                    <input type="email" name="email" value="${student.email}" class="form-control" required>
                </div>
                <div class="col-md-6">
                    <label>Phone</label>
                    <input type="text" name="phone" value="${student.phone}" class="form-control" required>
                </div>
                <div class="col-md-6">
                    <label>Attendance (%)</label>
                    <input type="number" step="0.01" name="attendancePercentage" value="${student.attendancePercentage}" class="form-control">
                </div>
                <div class="col-md-6">
                    <label>Marks (%)</label>
                    <input type="number" step="0.01" name="marks" value="${student.marks}" class="form-control">
                </div>
            </div>

            <div class="text-center mt-4">
                <button class="btn btn-light px-4">${student.id == null ? "Save Student" : "Update Student"}</button>
            </div>
        </form>
        <h2>Add New Student</h2>

        <form action="/teacher/students/save" method="post">

            <label>Name</label>
            <input type="text" name="name" required>

            <label>Email</label>
            <input type="email" name="email" required>

            <label>Course</label>
            <input type="text" name="course" required>

            <label>Password</label>
            <input type="password" name="password" required>

            <button type="submit">Save</button>
        </form>

    </div>
</div>
</body>
</html>
