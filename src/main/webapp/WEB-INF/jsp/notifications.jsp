<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Notifications</title>
    <style>
        /* 🌈 Background animation */
        @keyframes gradientAnimation {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            height: 100vh;
            background: linear-gradient(-45deg, #6a11cb, #2575fc, #ff6a00, #ee0979);
            background-size: 400% 400%;
            animation: gradientAnimation 12s ease infinite;
            color: #fff;
        }

        h1 {
            text-align: center;
            margin-top: 30px;
            font-size: 2.2em;
            text-shadow: 2px 2px 10px rgba(0,0,0,0.3);
        }

        .notification-box {
            width: 60%;
            margin: 30px auto;
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(10px);
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
            padding: 20px 30px;
            transition: transform 0.3s;
        }

        .notification-box:hover {
            transform: scale(1.02);
        }

        .notification-item {
            border-bottom: 1px solid rgba(255,255,255,0.2);
            padding: 12px 0;
            font-size: 1.1em;
            display: flex;
            align-items: center;
            gap: 10px;
            animation: fadeInUp 0.8s ease;
        }

        .notification-item:last-child {
            border-bottom: none;
        }

        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .back-btn {
            display: block;
            width: 200px;
            text-align: center;
            margin: 20px auto;
            background: #fff;
            color: #2575fc;
            font-weight: bold;
            padding: 10px;
            border-radius: 25px;
            text-decoration: none;
            transition: all 0.3s;
        }

        .back-btn:hover {
            background: #2575fc;
            color: #fff;
            transform: translateY(-3px);
            box-shadow: 0 4px 10px rgba(0,0,0,0.2);
        }
    </style>
</head>
<body>

    <h1>📢 Admin Notifications</h1>

    <div class="notification-box">
        <div class="notification-item">🎓 New student <b>Rohit Sahu</b> registered successfully!</div>
        <div class="notification-item">📅 Attendance report updated for <b>10 Nov 2025</b>.</div>
        <div class="notification-item">💰 Fee payment received from Roll No. <b>101</b>.</div>
        <div class="notification-item">🧾 Result for <b>Maths-3</b> uploaded successfully.</div>
    </div>

    <a href="/admin/dashboard" class="back-btn">⬅ Back to Dashboard</a>


</body>
</html>
