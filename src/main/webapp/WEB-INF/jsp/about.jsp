<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>About | College Management System</title>
<style>
/* ===== GLOBAL ===== */
body {
  margin:0; font-family:'Poppins',sans-serif; color:#fff;
  background:linear-gradient(-45deg,#6a11cb,#2575fc,#00c9ff,#92fe9d);
  background-size:400% 400%; animation:gradientMove 10s ease infinite;
  overflow-x:hidden;
}
@keyframes gradientMove {
  0%{background-position:0% 50%;}
  50%{background-position:100% 50%;}
  100%{background-position:0% 50%;}
}
section {
  padding:80px 10%; text-align:center;
}
h1,h2{margin-bottom:20px;}
p{max-width:800px;margin:0 auto 25px;line-height:1.6;color:#f5f5f5;}
/* ===== SECTION STYLES ===== */
.hero {
  min-height:100vh;display:flex;flex-direction:column;
  justify-content:center;align-items:center;
}
.hero h1{font-size:3rem;margin-bottom:10px;}
.hero p{font-size:1.2rem;}
.about, .departments, .faculty, .campus, .vision, .achievements {
  background:rgba(255,255,255,0.1);margin:40px auto;border-radius:20px;
  backdrop-filter:blur(12px);box-shadow:0 0 25px rgba(0,0,0,0.25);
  padding:50px 30px;
}
.cards {
  display:flex;flex-wrap:wrap;justify-content:center;gap:20px;margin-top:30px;
}
.card {
  background:rgba(255,255,255,0.15);border-radius:15px;padding:25px;
  width:250px;transition:0.3s;
}
.card:hover {transform:translateY(-10px);background:rgba(255,255,255,0.3);}
.card img{width:80px;height:80px;margin-bottom:10px;border-radius:50%;}
/* ===== NAVIGATION ===== */
.nav {
  text-align:center;margin:40px 0 20px;
}
.nav a {
  text-decoration:none;color:#fff;margin:0 15px;font-weight:500;
}
.nav a:hover{text-decoration:underline;}
/* ===== BUBBLES ===== */
.bubble{
  position:absolute;bottom:-100px;background:rgba(255,255,255,0.15);
  border-radius:50%;animation:rise 10s infinite ease-in;
}
@keyframes rise{
  0%{transform:translateY(0) scale(1);opacity:1;}
  100%{transform:translateY(-110vh) scale(1.3);opacity:0;}
}
.bubble:nth-child(1){width:80px;height:80px;left:20%;animation-delay:0s;}
.bubble:nth-child(2){width:40px;height:40px;left:40%;animation-delay:2s;}
.bubble:nth-child(3){width:60px;height:60px;left:60%;animation-delay:4s;}
.bubble:nth-child(4){width:100px;height:100px;left:80%;animation-delay:6s;}
.bubble:nth-child(5){width:30px;height:30px;left:50%;animation-delay:3s;}
</style>
</head>
<body>

<!-- Floating bubbles -->
<div class="bubble"></div><div class="bubble"></div>
<div class="bubble"></div><div class="bubble"></div><div class="bubble"></div>

<!-- Navigation -->
<div class="nav">
  <a href="/contact">📞 Contact</a>
  <a href="/help">❓ Help</a>
  <a href="/login">🔐 Login</a>
</div>

<!-- Hero -->
<section class="hero">
  <h1>Welcome to <span style="color:#ffeb3b;">Bansal Institute of Science & Technology</span></h1>
  <p>Empowering students through innovation, excellence, and education since 2000.</p>
</section>

<!-- About -->
<section class="about">
  <h2>About Our College</h2>
  <p>Our college is a premier institution known for academic excellence and holistic development.
     We offer world-class facilities, experienced faculty, and a vibrant campus life that fosters creativity and leadership.</p>
</section>

<!-- Departments -->
<section class="departments">
  <h2>📚 Our Departments</h2>
  <div class="cards">
    <div class="card"><img src="https://img.icons8.com/color/96/computer.png"/><h3>Computer Science</h3><p>Cutting-edge curriculum in AI, Java, Web, and Software Engineering.</p></div>
    <div class="card"><img src="https://img.icons8.com/color/96/electrical.png"/><h3>Electrical Engineering</h3><p>Power systems, control engineering and renewable energy research.</p></div>
    <div class="card"><img src="https://img.icons8.com/color/96/mechanical.png"/><h3>Mechanical Engineering</h3><p>CAD design, robotics and industrial automation labs.</p></div>
    <div class="card"><img src="https://img.icons8.com/color/96/civil-engineering.png"/><h3>Civil Engineering</h3><p>Smart infrastructure & sustainable construction techniques.</p></div>
  </div>
</section>

<!-- Faculty -->
<section class="faculty">
  <h2>👩‍🏫 Our Expert Faculty</h2>
  <p>We take pride in our highly qualified professors and researchers who guide students towards innovation and professional success.</p>
  <div class="cards">
    <div class="card"><img src="https://img.icons8.com/fluency/96/teacher.png"/><h3>Dr. Rashmi Shingh</h3><p>Head of IT Department</p></div>
    <div class="card"><img src="https://img.icons8.com/fluency/96/teacher.png"/><h3>Prof. Ankur Taneja</h3><p>Professor of IT Department</p></div>
    <div class="card"><img src="https://img.icons8.com/fluency/96/teacher.png"/><h3>Dr. Damodar Tiwari</h3><p>Director</p></div>
  </div>
</section>

<!-- Campus -->
<section class="campus">
  <h2>🏫 Campus Life</h2>
  <p>Our campus blends academics with recreation — green lawns, modern labs, sports complexes, and cultural clubs make student life vibrant and fulfilling.</p>
</section>

<!-- Vision -->
<section class="vision">
  <h2>🌟 Vision & Mission</h2>
  <p><strong>Vision:</strong> To be a center of excellence in education, research, and innovation.<br>
     <strong>Mission:</strong> To produce skilled professionals who contribute to society and industry with integrity and creativity.</p>
</section>

<!-- Achievements -->
<section class="achievements">
  <h2>🏆 Achievements</h2>
  <div class="cards">
    <div class="card"><h3>100+ Campus Placements</h3><p>Top companies recruit from our campus every year.</p></div>
    <div class="card"><h3>National Awards</h3><p>Recognized by AICTE for innovation and entrepreneurship.</p></div>
    <div class="card"><h3>Research Excellence</h3><p>Over 200 published papers by faculty & students.</p></div>
  </div>
</section>

<!-- Footer -->
<div class="nav" style="margin-bottom:40px;">
  <a href="/contact">📞 Contact Us</a>
  <a href="/help">❓ Help</a>
  <a href="/login">🔐 Login</a>
</div>

</body>
</html>
