<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>My Profile</title>

    <!-- Google Fonts & Simple CSS animation -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #74ABE2, #5563DE);
            margin: 0;
            padding: 0;
            color: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            overflow: hidden;
        }

        .card {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            padding: 30px 40px;
            width: 400px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.3);
            text-align: center;
            animation: slideUp 1s ease;
        }

        @keyframes slideUp {
            from { transform: translateY(50px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }

        h2 {
            margin-bottom: 20px;
            font-weight: 700;
            font-size: 26px;
        }

        p {
            font-size: 16px;
            margin: 10px 0;
            line-height: 1.5;
        }

        .btn {
            background: #fff;
            color: #5563DE;
            text-decoration: none;
            padding: 10px 20px;
            border-radius: 25px;
            font-weight: 600;
            transition: 0.3s;
        }

        .btn:hover {
            background: #5563DE;
            color: #fff;
            box-shadow: 0 0 15px #fff;
        }

        .no-profile {
            font-size: 18px;
            margin-bottom: 15px;
        }

        .fade-in {
            animation: fadeIn 1.5s ease;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: scale(0.95); }
            to { opacity: 1; transform: scale(1); }
        }
    </style>
</head>
<body>
<div class="card fade-in">
    <h2>👩‍🏫 My Profile</h2>

    <c:if test="${profile != null && profile.name != null}">
        <p><b>Name:</b> ${profile.name}</p>
        <p><b>Email:</b> ${profile.email}</p>
        <p><b>Qualification:</b> ${profile.qualification}</p>
        <p><b>Phone:</b> ${profile.phone}</p>
        <p><b>Address:</b> ${profile.address}</p>
        <br>
        <a href="/teacher/profile/edit/${profile.id}" class="btn">✏️ Edit Profile</a>
    </c:if>

    <c:if test="${profile == null || profile.name == null}">
        <p class="no-profile">No profile found.</p>
        <a href="/teacher/profile/edit/0" class="btn">➕ Create Profile</a>
    </c:if>
</div>
</body>
</html>
