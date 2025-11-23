<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Apply Leave</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background: linear-gradient(135deg, #43cea2, #185a9d); color: white; font-family: 'Poppins', sans-serif; }
        .card { background: rgba(255,255,255,0.1); padding: 25px; border-radius: 12px; }
        input, textarea { color: black !important; }
    </style>
</head>
<body>
<div class="container mt-5">
    <a href="/teacher/leaves" class="text-light">⬅ Back to Leave List</a>
    <div class="card mt-3">
        <h2 class="text-center mb-3">📩 Apply for Leave</h2>
        <form action="/teacher/leaves/save" method="post">
            <div class="mb-3">
                <label>Teacher Name</label>
                <input type="text" name="teacherName" class="form-control" required>
            </div>
            <div class="mb-3">
                <label>Reason</label>
                <textarea name="reason" rows="3" class="form-control" required></textarea>
            </div>
            <div class="mb-3">
                <label>Start Date</label>
                <input type="date" name="startDate" class="form-control" required>
            </div>
            <div class="mb-3">
                <label>End Date</label>
                <input type="date" name="endDate" class="form-control" required>
            </div>
            <div class="text-center">
                <button class="btn btn-light px-4">Submit</button>
            </div>
        </form>
    </div>
</div>
</body>
</html>
