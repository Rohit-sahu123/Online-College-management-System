<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign Up | College Management System</title>
<style>
/* Background animation */
body {
  margin:0;
  font-family:'Poppins',sans-serif;
  height:100vh;
  display:flex;
  justify-content:center;
  align-items:center;
  background:linear-gradient(-45deg,#ff9966,#ff5e62,#24c6dc,#514a9d);
  background-size:400% 400%;
  animation:gradientFlow 10s ease infinite;
  color:#fff;
}
@keyframes gradientFlow {
  0%{background-position:0% 50%;}
  50%{background-position:100% 50%;}
  100%{background-position:0% 50%;}
}

/* Floating bubbles */
.bubble {
  position:absolute;
  bottom:-100px;
  background:rgba(255,255,255,0.15);
  border-radius:50%;
  animation:rise 10s infinite ease-in;
}
@keyframes rise {
  0% {transform:translateY(0) scale(1);opacity:1;}
  100% {transform:translateY(-110vh) scale(1.3);opacity:0;}
}
.bubble:nth-child(1){width:80px;height:80px;left:20%;animation-delay:0s;}
.bubble:nth-child(2){width:40px;height:40px;left:40%;animation-delay:2s;}
.bubble:nth-child(3){width:60px;height:60px;left:60%;animation-delay:4s;}
.bubble:nth-child(4){width:100px;height:100px;left:80%;animation-delay:6s;}
.bubble:nth-child(5){width:30px;height:30px;left:50%;animation-delay:3s;}

/* Signup form */
.signup-box {
  background:rgba(255,255,255,0.15);
  border-radius:20px;
  backdrop-filter:blur(10px);
  padding:40px 60px;
  width:400px;
  box-shadow:0 0 25px rgba(0,0,0,0.3);
  z-index:10;
  text-align:center;
}

h1 {
  margin-bottom:20px;
  font-size:2rem;
}

input, select {
  width:100%;
  padding:10px;
  margin:8px 0;
  border:none;
  border-radius:10px;
  outline:none;
  font-size:1rem;
  color:#333;
  background:rgba(255,255,255,0.85);
}

button {
  margin-top:15px;
  width:100%;
  padding:12px;
  border:none;
  border-radius:25px;
  background:#00c6ff;
  color:white;
  font-size:1rem;
  cursor:pointer;
  transition:0.3s;
}
button:hover {
  background:#0072ff;
  transform:translateY(-3px);
}

a {
  color:#fff;
  text-decoration:none;
  display:block;
  margin-top:15px;
}
a:hover { text-decoration:underline; }

.msg {
  color:lightgreen;
  font-weight:500;
  margin-top:10px;
}
</style>
</head>
<body>

<!-- Floating bubbles -->
<div class="bubble"></div><div class="bubble"></div>
<div class="bubble"></div><div class="bubble"></div><div class="bubble"></div>

<!-- Signup Box -->
<div class="signup-box">
  <h1>Create an Account ✨</h1>
  <form action="/signup" method="post">
    <input type="text" name="name" placeholder="Full Name" required>
    <input type="email" name="email" placeholder="Email Address" required>
    <input type="password" name="password" placeholder="Password" required>
    <select name="role" required>
      <option value="">Select Role</option>
      <option value="Admin">Admin</option>
      <option value="Student">Student</option>
      <option value="Teacher">Teacher</option>
    </select>
    <button type="submit">Sign Up</button>
  </form>

  <c:if test="${not empty msg}">
    <p class="msg">${msg}</p>
  </c:if>

  <a href="/login">Already have an account? Login 🔐</a>
</div>

</body>
</html>
