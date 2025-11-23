<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Contact Us | College Management System</title>
    <style>
        /* Animated gradient background */
        body {
            margin: 0;
            height: 100vh;
            overflow: hidden;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(-45deg, #ff9966, #ff5e62, #24c6dc, #514a9d);
            background-size: 400% 400%;
            animation: gradientFlow 10s ease infinite;
            color: #fff;
        }

        @keyframes gradientFlow {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        /* Floating bubbles animation */
        .bubble {
            position: absolute;
            bottom: -100px;
            background: rgba(255, 255, 255, 0.15);
            border-radius: 50%;
            animation: rise 10s infinite ease-in;
        }

        @keyframes rise {
            0% { transform: translateY(0) scale(1); opacity: 1; }
            100% { transform: translateY(-110vh) scale(1.3); opacity: 0; }
        }

        .bubble:nth-child(1) { width: 80px; height: 80px; left: 20%; animation-delay: 0s; }
        .bubble:nth-child(2) { width: 40px; height: 40px; left: 40%; animation-delay: 2s; }
        .bubble:nth-child(3) { width: 60px; height: 60px; left: 60%; animation-delay: 4s; }
        .bubble:nth-child(4) { width: 100px; height: 100px; left: 80%; animation-delay: 6s; }
        .bubble:nth-child(5) { width: 30px; height: 30px; left: 50%; animation-delay: 3s; }

        /* Glassmorphic form container */
        .contact-box {
            background: rgba(255, 255, 255, 0.15);
            border-radius: 20px;
            backdrop-filter: blur(12px);
            padding: 40px 60px;
            max-width: 600px;
            text-align: center;
            box-shadow: 0 0 25px rgba(0,0,0,0.25);
            z-index: 10;
        }

        h1 {
            font-size: 2.2rem;
            margin-bottom: 20px;
        }

        form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        input, textarea {
            width: 100%;
            margin: 10px 0;
            padding: 12px;
            border: none;
            border-radius: 10px;
            outline: none;
            font-size: 1rem;
            font-family: 'Poppins', sans-serif;
        }

        input {
            background: rgba(255,255,255,0.85);
            color: #333;
        }

        textarea {
            background: rgba(255,255,255,0.85);
            color: #333;
            resize: none;
        }

        button {
            background: #00c9ff;
            border: none;
            color: white;
            padding: 12px 30px;
            border-radius: 25px;
            font-size: 1rem;
            margin-top: 10px;
            cursor: pointer;
            transition: 0.3s;
        }

        button:hover {
            background: #0097e6;
            transform: translateY(-3px);
        }

        /* Navigation buttons */
        .nav-links {
            margin-top: 25px;
        }

        .nav-links a {
            text-decoration: none;
            color: #fff;
            margin: 0 15px;
            font-weight: 500;
            transition: 0.3s;
        }

        .nav-links a:hover {
            text-decoration: underline;
        }

        /* Success message */
        .success-msg {
            color: #d4ffd4;
            margin-top: 10px;
            font-weight: 500;
        }
    </style>
</head>
<body>

    <!-- Floating bubbles -->
    <div class="bubble"></div>
    <div class="bubble"></div>
    <div class="bubble"></div>
    <div class="bubble"></div>
    <div class="bubble"></div>

    <!-- Contact Form -->
    <div class="contact-box">
        <h1>📩 Contact Us</h1>
        <p>Have any questions or feedback? Drop us a message below!</p>

        <form action="/submit-contact" method="post">
            <input type="text" name="name" placeholder="Your Name" required>
            <input type="email" name="email" placeholder="Your Email" required>
            <textarea name="message" rows="4" placeholder="Your Message..." required></textarea>
            <button type="submit">Send Message</button>
        </form>

        <c:if test="${not empty msg}">
            <p class="success-msg">${msg}</p>
        </c:if>

        <div class="nav-links">
            <a href="/about">🏠 About</a>
            <a href="/help">❓ Help</a>
            <a href="/login">🔐 Login</a>
        </div>
    </div>

</body>
</html>
