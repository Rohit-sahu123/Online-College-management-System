<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard - BIST</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        html, body {
            height: 100%;
            margin: 0;
            font-family: 'Poppins', sans-serif;
            color: #fff;
            overflow-x: hidden;
        }

        /* Glowing Animated Background */
        canvas#bg {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: 0;
            background: linear-gradient(120deg, #1e3a8a, #0f172a, #1e293b);
        }

        .container {
            position: relative;
            z-index: 5;
        }

        .card {
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
            color: #fff;
            backdrop-filter: blur(8px);
            transition: all 0.3s ease;
        }

        .card:hover {
            transform: translateY(-6px);
            box-shadow: 0 10px 25px rgba(255, 255, 255, 0.1);
        }

        .btn {
            font-weight: 500;
            border-radius: 8px;
        }

        .btn-outline-secondary {
            color: white;
            border-color: rgba(255, 255, 255, 0.4);
        }

        .btn-outline-secondary:hover {
            background: rgba(255, 255, 255, 0.2);
        }

        h2, h5 {
            font-weight: 600;
        }
    </style>
</head>

<body>
<canvas id="bg"></canvas>

<div class="container mt-5">
    <div class="text-center mb-4">
        <h2>Welcome to Admin Dashboard</h2>
        <p class="text-light text-opacity-75">Manage all modules of BIST College</p>
    </div>

    <div class="row g-4">
        <!-- Manage Students -->
        <div class="col-md-4">
            <div class="card text-center p-4">
                <h5>👨‍🎓 Manage Students</h5>
                <p>Add, edit, or delete student records</p>
                <a href="/admin/students" class="btn btn-primary">Go</a>
            </div>
        </div>

        <!-- Manage Teachers -->
        <div class="col-md-4">
            <div class="card text-center p-4">
                <h5>👩‍🏫 Manage Teachers</h5>
                <p>Add, edit, or delete teacher records</p>
                <a href="/admin/teachers" class="btn btn-success">Go</a>
            </div>
        </div>

        <!-- Manage Fees -->
        <div class="col-md-4">
            <div class="card text-center p-4">
                <h5>💰 Manage Fees</h5>
                <p>Track student payments and receipts</p>
                <a href="/admin/fees" class="btn btn-info">Go</a>
            </div>
        </div>

        <!-- Attendance -->
        <div class="col-md-4">
            <div class="card text-center p-4">
                <h5>📅 Attendance</h5>
                <p>Mark and view attendance records</p>
                <a href="/admin/attendance" class="btn btn-warning">Go</a>
            </div>
        </div>

        <!-- Results -->
        <div class="col-md-4">
            <div class="card text-center p-4">
                <h5>📊 Manage Results</h5>
                <p>Upload and check student results</p>
                <a href="/admin/results" class="btn btn-danger">Go</a>
            </div>
        </div>

        <!-- Notifications -->
        <div class="col-md-4">
            <div class="card text-center p-4">
                <h5>🔔 Notifications</h5>
                <p>Send updates or alerts to students/teachers</p>
                <a href="/notifications" class="btn btn-dark">Go</a>
            </div>
        </div>
    </div>

    <div class="text-center mt-5">
       <a href="/logout"
          style="display:inline-block; padding:10px 20px; background:#ff4b5c; color:#fff; border-radius:8px; text-decoration:none;">
          🔒 Logout
       </a>

    </div>
</div>

<!-- Floating Particle Glow Script -->
<script>
    (function () {
        const canvas = document.getElementById('bg');
        const ctx = canvas.getContext('2d');
        let w = canvas.width = innerWidth;
        let h = canvas.height = innerHeight;
        const particles = [];
        const colors = ['rgba(0,255,255,0.1)', 'rgba(255,105,180,0.1)', 'rgba(255,255,255,0.08)'];

        function random(min, max) { return Math.random() * (max - min) + min; }

        function createParticles(num) {
            for (let i = 0; i < num; i++) {
                particles.push({
                    x: random(0, w),
                    y: random(0, h),
                    r: random(10, 50),
                    dx: random(-0.2, 0.2),
                    dy: random(-0.2, 0.2),
                    color: colors[Math.floor(Math.random() * colors.length)]
                });
            }
        }

        function draw() {
            ctx.clearRect(0, 0, w, h);
            for (let p of particles) {
                ctx.beginPath();
                const gradient = ctx.createRadialGradient(p.x, p.y, 0, p.x, p.y, p.r);
                gradient.addColorStop(0, p.color);
                gradient.addColorStop(1, 'transparent');
                ctx.fillStyle = gradient;
                ctx.arc(p.x, p.y, p.r, 0, Math.PI * 2);
                ctx.fill();

                p.x += p.dx;
                p.y += p.dy;

                if (p.x < 0 || p.x > w) p.dx *= -1;
                if (p.y < 0 || p.y > h) p.dy *= -1;
            }
            requestAnimationFrame(draw);
        }

        createParticles(60);
        draw();

        window.addEventListener('resize', () => {
            w = canvas.width = innerWidth;
            h = canvas.height = innerHeight;
        });
    })();
</script>

</body>
</html>
