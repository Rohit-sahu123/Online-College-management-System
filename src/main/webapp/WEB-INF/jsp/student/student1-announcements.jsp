<!DOCTYPE html>
<html>
<head>
    <title>Announcements</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: #141E30;
            color: white;
            font-family: 'Poppins', sans-serif;
        }
        .announce-card {
            background: rgba(255,255,255,0.10);
            padding: 20px;
            border-radius: 12px;
            margin-bottom: 15px;
        }
        .badge-custom {
            background: #00c6ff;
            padding: 5px 12px;
            border-radius: 15px;
        }
    </style>
</head>

<body>

<div class="container mt-4">

    <h2 class="text-center mb-4">📢 Latest Announcements</h2>

    <c:forEach var="a" items="${annList}">
        <div class="announce-card">
            <h4>${a.title}</h4>
            <p>${a.message}</p>
            <span class="badge-custom">${a.audience}</span>
        </div>
    </c:forEach>

</div>

</body>
</html>
