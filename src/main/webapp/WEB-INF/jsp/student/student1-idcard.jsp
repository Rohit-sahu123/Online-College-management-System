<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Student ID Card</title>

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

    <style>

        body {
            background: #e3f2fd;
            font-family: "Poppins", sans-serif;
        }

        /* ---------- College ID Card ---------- */
        .college-card {
            width: 480px;
            margin: auto;
            border-radius: 16px;
            overflow: hidden;
            background: white;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.25);
            animation: fadeIn 1s ease-in-out;
        }

        /* Top Blue Header */
        .card-header-top {
            background: linear-gradient(90deg, #0d47a1, #1565c0);
            color: white;
            text-align: center;
            padding: 12px;
            font-size: 20px;
            font-weight: 700;
            letter-spacing: 1px;
            text-transform: uppercase;
        }

        /* Inside Content Layout */
        .card-body-college {
            padding: 22px;
            display: flex;
            gap: 20px;
        }

        /* Photo Box */
        .photo-box img {
            width: 160px;
            height: 160px;
            border-radius: 10px;
            border: 3px solid #0d47a1;
            object-fit: cover;
            box-shadow: 0 6px 20px rgba(0,0,0,0.3);
        }

        /* Student Info Text */
        .info-area p {
            margin: 6px 0;
            font-size: 15px;
            font-weight: 500;
        }

        .info-area b {
            color: #0d47a1;
        }

        .id-footer {
            background: #f5f5f5;
            padding: 10px 15px;
            font-size: 14px;
            text-align: center;
        }

        /* Fade animation */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* PRINT MODE */
        @media print {
            body * { visibility: hidden; }
            #printCard, #printCard * { visibility: visible; }
            #printCard { position: absolute; left: 0; top: 0; }
        }

    </style>

</head>

<body>

<div class="container mt-5">

    <h2 class="text-center mb-4 fw-bold text-primary">🎓 Student ID Card</h2>

    <!-- Upload Form -->
    <form action="/student1/idcard/upload" method="post"
          enctype="multipart/form-data" class="mb-5">

        <label class="form-label fw-bold">Upload Photo:</label>
        <input type="file" name="photo" accept="image/*"
               class="form-control mb-3 shadow-sm" required>

        <button class="btn btn-primary w-100 shadow">Upload Photo</button>
    </form>

    <!-- College Style ID Card -->
    <div id="printCard">

        <div class="college-card">

            <!-- Blue Header -->
            <div class="card-header-top">
                STUDENT ID CARD
            </div>

            <div class="card-body-college">

                <!-- Photo -->
                <div class="photo-box">
                    <c:choose>
                        <c:when test="${not empty student.photoPath}">
                            <img src="/${student.photoPath}">
                        </c:when>

                        <c:otherwise>
                            <img src="https://via.placeholder.com/160">
                        </c:otherwise>
                    </c:choose>
                </div>

                <!-- Student Info -->
                <div class="info-area">
                    <p><b>Name:</b> ${student.name}</p>
                    <p><b>Course:</b> ${student.course}</p>
                    <p><b>Email:</b> ${student.email}</p>
                    <p><b>Phone:</b> ${student.phone}</p>
                    <p><b>Address:</b> ${student.address}</p>
                </div>

            </div>

            <div class="id-footer text-secondary">
                © College Management System | Generated ID
            </div>

        </div>

    </div>

    <!-- Print Button -->
    <div class="text-center mt-4">
        <button class="btn btn-success px-4 shadow" onclick="window.print()">
            🖨️ Print ID Card
        </button>
    </div>

</div>

</body>
</html>
