<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Help & Support | College Management System</title>
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
            background: linear-gradient(-45deg, #8e2de2, #4a00e0, #00c6ff, #0072ff);
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

        /* Glassmorphic container */
        .help-box {
            background: rgba(255, 255, 255, 0.15);
            border-radius: 20px;
            backdrop-filter: blur(12px);
            padding: 40px 50px;
            max-width: 700px;
            text-align: center;
            box-shadow: 0 0 25px rgba(0,0,0,0.25);
            z-index: 10;
        }

        h1 {
            font-size: 2.3rem;
            margin-bottom: 10px;
        }

        p {
            font-size: 1.1rem;
            color: #e9e9e9;
        }

        /* Accordion FAQ */
        .faq {
            text-align: left;
            margin-top: 25px;
        }

        .faq-item {
            margin-bottom: 10px;
            background: rgba(255,255,255,0.1);
            border-radius: 10px;
            padding: 10px 15px;
            cursor: pointer;
            transition: 0.3s;
        }

        .faq-item:hover {
            background: rgba(255,255,255,0.2);
        }

        .faq-item h3 {
            margin: 0;
            font-size: 1.1rem;
        }

        .faq-item p {
            display: none;
            margin-top: 5px;
            font-size: 0.95rem;
            color: #f1f1f1;
        }

        /* Navigation links */
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
    </style>
</head>
<body>

    <!-- Floating bubbles -->
    <div class="bubble"></div>
    <div class="bubble"></div>
    <div class="bubble"></div>
    <div class="bubble"></div>
    <div class="bubble"></div>

    <!-- Help Content -->
    <div class="help-box">
        <h1>❓ Help & Support</h1>
        <p>We’re here to help! Below are some frequently asked questions.</p>

        <div class="faq">
            <div class="faq-item">
                <h3>🧾 How do I register a new student?</h3>
                <p>Login as an admin, go to “Students” section, and click on “Add Student”. Fill in the details and submit.</p>
            </div>
            <div class="faq-item">
                <h3>💰 How to check or update fee payment status?</h3>
                <p>In the admin dashboard, open the “Fees” tab to view and update student payments.</p>
            </div>
            <div class="faq-item">
                <h3>📧 I forgot my password. What should I do?</h3>
                <p>Contact your system administrator or use the password reset option if available.</p>
            </div>
            <div class="faq-item">
                <h3>⚙️ Facing technical issues?</h3>
                <p>Reach out to our support team at <strong>support@college.com</strong>.</p>
            </div>
        </div>

        <div class="nav-links">
            <a href="/about">🏠 About</a>
            <a href="/contact">📞 Contact</a>
            <a href="/login">🔐 Login</a>
        </div>
    </div>

    <script>
        // Simple accordion toggle
        document.querySelectorAll('.faq-item').forEach(item => {
            item.addEventListener('click', () => {
                const answer = item.querySelector('p');
                const isVisible = answer.style.display === 'block';
                document.querySelectorAll('.faq-item p').forEach(p => p.style.display = 'none');
                answer.style.display = isVisible ? 'none' : 'block';
            });
        });
    </script>
</body>
</html>
