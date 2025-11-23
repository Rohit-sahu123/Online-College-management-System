<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Edit Profile</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #5563DE, #74ABE2);
            color: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        form {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            padding: 30px 40px;
            border-radius: 20px;
            width: 400px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.3);
            animation: popIn 1s ease;
        }

        @keyframes popIn {
            from { transform: scale(0.8); opacity: 0; }
            to { transform: scale(1); opacity: 1; }
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            font-size: 26px;
        }

        label {
            font-weight: 500;
            display: block;
            margin-top: 10px;
        }

        input, textarea {
            width: 100%;
            padding: 8px 10px;
            border: none;
            border-radius: 10px;
            margin-top: 5px;
            outline: none;
        }

        button {
            background: #fff;
            color: #5563DE;
            padding: 10px 20px;
            border: none;
            border-radius: 25px;
            font-weight: 600;
            cursor: pointer;
            width: 100%;
            margin-top: 15px;
            transition: 0.3s;
        }

        button:hover {
            background: #5563DE;
            color: #fff;
            box-shadow: 0 0 15px #fff;
        }

        a {
            color: #fff;
            text-decoration: none;
            display: block;
            text-align: center;
            margin-top: 15px;
        }
    </style>
</head>
<body>
<form action="/teacher/profile/save" method="post">
    <h2>Edit Profile</h2>
    <input type="hidden" name="id" value="${profile.id}" />

    <label>Name:</label>
    <input type="text" name="name" value="${profile.name}" required />

    <label>Email:</label>
    <input type="email" name="email" value="${profile.email}" required />

    <label>Qualification:</label>
    <input type="text" name="qualification" value="${profile.qualification}" />

    <label>Phone:</label>
    <input type="text" name="phone" value="${profile.phone}" />

    <label>Address:</label>
    <textarea name="address">${profile.address}</textarea>

    <button type="submit">💾 Save</button>
    <a href="/teacher/profile">⬅️ Back to Profile</a>
</form>
</body>
</html>
