<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login - BIST</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        /* Full-screen background canvas */
        html, body {
            height: 100%;
            margin: 0;
            font-family: Inter, system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue", Arial;
        }
        canvas#bg {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: 0;
            display: block;
            background: linear-gradient(120deg,#0f172a 0%, #0b1220 50%, #071124 100%);
        }

        /* Card on top */
        .card-overlay {
            position: relative;
            z-index: 5; /* above canvas */
            background: rgba(255,255,255,0.06);
            backdrop-filter: blur(6px);
            border: 1px solid rgba(255,255,255,0.06);
            color: #fff;
        }

        .role-btns .btn {
            margin-right: 8px;
        }

        .brand {
            font-weight: 700;
            letter-spacing: 0.6px;
        }

        /* small glow for buttons */
        .btn-glow {
            box-shadow: 0 6px 18px rgba(99,102,241,0.12);
        }

        /* responsive tweaks */
        @media (max-width: 576px) {
            .col-md-5 { max-width: 92%; }
        }
    </style>
</head>
<body>
<canvas id="bg"></canvas>

<div class="container h-100 d-flex align-items-center justify-content-center">
    <div class="row w-100">
        <div class="col-md-5 mx-auto">
            <div class="card p-4 shadow card-overlay">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <div>
                        <h3 class="mb-0 brand">BIST College</h3>
                        <small class="text-muted">Student - Teacher - Admin Portal</small>
                    </div>
                    <div class="text-end">
                        <small class="text-muted">Not registered? <a href="/signup" class="text-decoration-none">Sign up</a></small>
                    </div>
                </div>

                <!-- Role buttons -->
                <div class="mb-3 role-btns text-center">
                    <button id="role-student" class="btn btn-outline-light btn-sm">Student</button>
                    <button id="role-teacher" class="btn btn-outline-light btn-sm">Teacher</button>
                    <button id="role-admin" class="btn btn-primary btn-sm btn-glow">Admin</button>
                </div>

                <!-- Login form -->
                <form id="loginForm" method="post" action="/login">
                    <input type="hidden" name="role" id="roleInput" value="admin">
                    <div class="mb-3">
                        <input name="email" class="form-control form-control-lg" placeholder="Email" required>
                    </div>
                    <div class="mb-3">
                        <input name="password" type="password" class="form-control form-control-lg" placeholder="Password" required>
                    </div>
                    <button class="btn btn-primary w-100 btn-lg">Login</button>
                </form>

                <c:if test="${not empty error}">
                    <div class="text-danger mt-2">${error}</div>
                </c:if>

                <hr class="my-3" style="border-color: rgba(255,255,255,0.06);">

                <div class="text-center">
                    <a href="/about" class="text-white text-opacity-85">About College</a> ·
                    <a href="/contact" class="text-white text-opacity-85">Contact</a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Particle / floating circles script -->
<script>
    // Simple canvas particles (floating circles)
    (function() {
        const canvas = document.getElementById('bg');
        const ctx = canvas.getContext('2d');
        let w = canvas.width = innerWidth;
        let h = canvas.height = innerHeight;
        const particles = [];
        const colors = ['rgba(255,182,193,0.12)','rgba(173,216,230,0.12)','rgba(144,238,144,0.12)','rgba(255,255,255,0.08)'];

        function rand(min, max){ return Math.random() * (max - min) + min; }

        function createParticles(count = Math.round((w*h)/80000)) {
            particles.length = 0;
            for (let i = 0; i < count; i++) {
                particles.push({
                    x: rand(0, w),
                    y: rand(0, h),
                    r: rand(8, 40),
                    vx: rand(-0.3, 0.3),
                    vy: rand(-0.15, 0.15),
                    color: colors[Math.floor(Math.random()*colors.length)],
                    angle: rand(0, Math.PI*2),
                    angularSpeed: rand(-0.005, 0.005)
                });
            }
        }

        function draw() {
            ctx.clearRect(0,0,w,h);
            // subtle gradient overlay under particles
            const grd = ctx.createLinearGradient(0,0,w,h);
            grd.addColorStop(0, 'rgba(7,12,36,0.3)');
            grd.addColorStop(1, 'rgba(12,18,30,0.35)');
            ctx.fillStyle = grd;
            ctx.fillRect(0,0,w,h);

            for (let p of particles) {
                p.x += p.vx;
                p.y += p.vy;
                p.angle += p.angularSpeed;

                // wrap-around
                if (p.x < -50) p.x = w + 50;
                if (p.x > w + 50) p.x = -50;
                if (p.y < -50) p.y = h + 50;
                if (p.y > h + 50) p.y = -50;

                ctx.save();
                ctx.translate(p.x, p.y);
                ctx.rotate(p.angle);
                ctx.beginPath();
                // draw soft circle using radial gradient for glow look
                const rg = ctx.createRadialGradient(0,0,p.r*0.1, 0,0,p.r);
                rg.addColorStop(0, p.color.replace(/[\d\.]+\)$/,'0.9)'));
                rg.addColorStop(1, p.color.replace(/[\d\.]+\)$/,'0.02)'));
                ctx.fillStyle = rg;
                ctx.arc(0,0,p.r,0,Math.PI*2);
                ctx.fill();
                ctx.restore();
            }
            requestAnimationFrame(draw);
        }

        // resize handler
        function onResize() {
            w = canvas.width = innerWidth;
            h = canvas.height = innerHeight;
            createParticles();
        }
        window.addEventListener('resize', onResize);
        createParticles();
        draw();

        // optional: subtle mouse repulse
        let mouse = {x:-9999,y:-9999};
        window.addEventListener('mousemove', e => { mouse.x = e.clientX; mouse.y = e.clientY; });
        window.addEventListener('mouseout', () => { mouse.x = -9999; mouse.y = -9999; });

        // make particles drift slightly away from mouse
        setInterval(() => {
            for (let p of particles) {
                const dx = p.x - mouse.x;
                const dy = p.y - mouse.y;
                const dist = Math.sqrt(dx*dx + dy*dy);
                if (dist < 140) {
                    const push = (140 - dist) / 140 * 0.6;
                    p.vx += (dx/dist) * push;
                    p.vy += (dy/dist) * push;
                }
                // damp velocities to keep slow motion
                p.vx *= 0.985;
                p.vy *= 0.985;
            }
        }, 30);
    })();
</script>

<!-- small script to set role from buttons -->
<script>
    document.getElementById('role-student').addEventListener('click', () => {
        document.getElementById('roleInput').value = 'student';
        document.getElementById('role-student').classList.add('btn-primary');
        document.getElementById('role-student').classList.remove('btn-outline-light');
        document.getElementById('role-teacher').classList.remove('btn-primary');
        document.getElementById('role-teacher').classList.add('btn-outline-light');
        document.getElementById('role-admin').classList.remove('btn-primary');
        document.getElementById('role-admin').classList.add('btn-outline-light');
    });
    document.getElementById('role-teacher').addEventListener('click', () => {
        document.getElementById('roleInput').value = 'teacher';
        document.getElementById('role-teacher').classList.add('btn-primary');
        document.getElementById('role-teacher').classList.remove('btn-outline-light');
        document.getElementById('role-student').classList.remove('btn-primary');
        document.getElementById('role-student').classList.add('btn-outline-light');
        document.getElementById('role-admin').classList.remove('btn-primary');
        document.getElementById('role-admin').classList.add('btn-outline-light');
    });
    document.getElementById('role-admin').addEventListener('click', () => {
        document.getElementById('roleInput').value = 'admin';
        document.getElementById('role-admin').classList.add('btn-primary');
        document.getElementById('role-admin').classList.remove('btn-outline-light');
        document.getElementById('role-student').classList.remove('btn-primary');
        document.getElementById('role-student').classList.add('btn-outline-light');
        document.getElementById('role-teacher').classList.remove('btn-primary');
        document.getElementById('role-teacher').classList.add('btn-outline-light');
    });
</script>
</body>
</html>
