<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Student Login</title>

    <!-- Bootstrap -->
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap"
          rel="stylesheet">

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            height: 100vh;
            margin: 0;
            background: linear-gradient(135deg, #1e3c72, #2a5298);
            display: flex;
            justify-content: center;
            align-items: center;
            overflow: hidden;
        }

        /* Floating Animation BG Circles */
        .circle {
            position: absolute;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.08);
            animation: float 6s infinite ease-in-out;
        }

        @keyframes float {
            0% { transform: translateY(0px); }
            50% { transform: translateY(-20px); }
            100% { transform: translateY(0px); }
        }

        .circle:nth-child(1){ width:120px; height:120px; top:10%; left:5%; animation-duration:7s; }
        .circle:nth-child(2){ width:200px; height:200px; bottom:15%; right:10%; animation-duration:5s; }
        .circle:nth-child(3){ width:90px; height:90px; top:60%; left:20%; animation-duration:6s; }

        /* Login Card */
        .login-card {
            width: 400px;
            padding: 35px;
            border-radius: 20px;
            backdrop-filter: blur(10px);
            background: rgba(255,255,255,0.15);
            box-shadow: 0 8px 25px rgba(0,0,0,0.2);
            animation: fadeIn 1s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(40px); }
            to { opacity: 1; transform: translateY(0px); }
        }

        .login-card h2 {
            color: #fff;
            font-weight: 600;
            text-align: center;
            margin-bottom: 25px;
        }

        .form-control {
            border-radius: 10px;
            height: 45px;
        }

        .btn-login {
            width: 100%;
            height: 45px;
            border-radius: 10px;
            font-weight: 600;
            background: #ffffff;
            color: #1e3c72;
            transition: 0.3s;
        }

        .btn-login:hover {
            background: #dfe6fd;
        }

        a {
            color: #fff;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        .error-message {
            color: #ffb3b3;
            font-size: 14px;
            text-align: center;
            margin-top: 10px;
        }

    </style>
</head>

<body>

    <!-- Background Animation Circles -->
    <div class="circle"></div>
    <div class="circle"></div>
    <div class="circle"></div>

    <!-- Login Card -->
    <div class="login-card">
        <h2>Student Login</h2>

 <form action="/student1/login" method="post">

           <input type="email" name="email" placeholder="Email" required>
           <input type="password" name="password" placeholder="Password" required>
           <button type="submit">Login</button>
       </form>

       <c:if test="${not empty error}">
           <p style="color:red;">${error}</p>
       </c:if>

        <div class="text-center mt-3">
            <a href="/student1/register">New Student? Create Account</a>
        </div>



    </div>

</body>
</html>
