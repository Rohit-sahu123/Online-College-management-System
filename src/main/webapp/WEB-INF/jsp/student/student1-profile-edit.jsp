<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Profile</title>

    <!-- Bootstrap -->
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap"
          rel="stylesheet">

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #1e3c72, #2a5298);
            height: 100vh;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            overflow: hidden;
        }

        /* Floating Glass Background Circles */
        .bg-circle {
            position: absolute;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.07);
            animation: float 6s infinite ease-in-out;
        }

        @keyframes float {
            0% {transform: translateY(0px);}
            50% {transform: translateY(-20px);}
            100% {transform: translateY(0px);}
        }

        .bg-circle:nth-child(1) {width: 180px; height: 180px; top: 8%; left: 10%; animation-duration: 7s;}
        .bg-circle:nth-child(2) {width: 260px; height: 260px; bottom: 12%; right: 12%; animation-duration: 5s;}
        .bg-circle:nth-child(3) {width: 120px; height: 120px; top: 60%; left: 25%; animation-duration: 6s;}

        /* Main Edit Card */
        .edit-card {
            width: 450px;
            padding: 35px;
            background: rgba(255, 255, 255, 0.18);
            border-radius: 20px;
            backdrop-filter: blur(12px);
            box-shadow: 0 8px 25px rgba(0,0,0,0.25);
            animation: fadeIn 1s ease-in-out;
            z-index: 2;
        }

        @keyframes fadeIn {
            from {opacity: 0; transform: translateY(40px);}
            to {opacity: 1; transform: translateY(0);}
        }

        h2 {
            color: white;
            font-weight: 600;
            text-align: center;
            margin-bottom: 20px;
        }

        label {
            color: white;
            font-weight: 500;
        }

        .form-control {
            height: 45px;
            border-radius: 10px;
        }

        .btn-save {
            width: 100%;
            height: 45px;
            border-radius: 10px;
            margin-top: 10px;
            font-weight: 600;
            background: white;
            color: #1e3c72;
            transition: 0.3s;
        }

        .btn-save:hover {
            background: #d9e4ff;
        }
    </style>
</head>

<body>

<!-- Floating Background Circles -->
<div class="bg-circle"></div>
<div class="bg-circle"></div>
<div class="bg-circle"></div>

<div class="edit-card">

    <h2>Edit Your Profile</h2>

    <form action="/student1/profile/update" method="post">

        <label>Name</label>
        <input type="text" class="form-control mb-3" name="name" value="${student.name}" required>

        <label>Phone</label>
        <input type="text" class="form-control mb-3" name="phone" value="${student.phone}">

        <label>Address</label>
        <input type="text" class="form-control mb-3" name="address" value="${student.address}">

        <label>Roll Number</label>
        <input type="text" class="form-control mb-3" name="rollNo" value="${student.rollNo}">

        <button type="submit" class="btn-save">Save Changes</button>
    </form>

</div>

</body>
</html>
