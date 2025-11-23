<!DOCTYPE html>
<html>
<head>
<title>Complaint / Suggestion</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/student/student-bg.css">

</head>
<body class="bg-light">

<div class="container mt-4 col-md-6">
    <h2>🗣 Complaint / Suggestion</h2>

    <form action="/student1/complaints/save" method="post" class="border p-4 bg-white shadow">

        <label>Your Name</label>
        <input type="text" name="studentName" class="form-control mb-2" required>

        <label>Complaint / Suggestion</label>
        <textarea name="message" class="form-control mb-3" required></textarea>

        <button class="btn btn-primary w-100">Submit</button>
    </form>

    <a href="/student1/complaints/all" class="btn btn-info mt-3">View My Complaints</a>

</div>

</body>
</html>
