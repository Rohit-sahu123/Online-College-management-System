<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Study Materials</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Icons -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

<!-- Custom CSS -->
<style>
    body{
        background: linear-gradient(135deg, #1e3c72, #2a5298);
        min-height: 100vh;
        padding-top: 50px;
        color: white;
    }

    .material-card{
        background: white;
        color: #333;
        border-radius: 20px;
        padding: 25px;
        box-shadow: 0 6px 20px rgba(0,0,0,0.1);
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }
    .material-card:hover{
        transform: translateY(-8px);
        box-shadow: 0 12px 30px rgba(0,0,0,0.2);
    }

    .header-title{
        font-size: 40px;
        font-weight: bold;
        text-align: center;
        margin-bottom: 40px;
        text-shadow: 2px 3px 15px rgba(0,0,0,0.6);
    }

    .anim{
        animation: fadeInUp 0.9s ease;
    }
    @keyframes fadeInUp{
        from { opacity: 0; transform: translateY(40px); }
        to { opacity: 1; transform: translateY(0); }
    }
</style>
</head>

<body>

<div class="container">

    <!-- Heading -->
    <h1 class="header-title anim"><i class="bi bi-journal-bookmark"></i> Study Materials</h1>

    <!-- Cards -->
    <div class="row g-4">

        <div class="col-md-4 anim">
            <div class="material-card">
                <h4><i class="bi bi-file-earmark-text"></i> Unit 1 Notes</h4>
                <p>Complete theory + formulas in simple language.</p>
                <a href="#" class="btn btn-primary w-100"><i class="bi bi-download"></i> Download PDF</a>
            </div>
        </div>

        <div class="col-md-4 anim">
            <div class="material-card">
                <h4><i class="bi bi-file-pdf"></i> Unit 2 Notes</h4>
                <p>Short notes for quick revision & exam prep.</p>
                <a href="#" class="btn btn-success w-100"><i class="bi bi-cloud-arrow-down"></i> Download</a>
            </div>
        </div>

        <div class="col-md-4 anim">
            <div class="material-card">
                <h4><i class="bi bi-book"></i> Previous Year Papers</h4>
                <p>Last 5 years solved university question papers.</p>
                <a href="#" class="btn btn-warning w-100"><i class="bi bi-eye"></i> View Now</a>
            </div>
        </div>

        <div class="col-md-4 anim">
            <div class="material-card">
                <h4><i class="bi bi-film"></i> Video Lectures</h4>
                <p>Topic-wise free YouTube lectures collection.</p>
                <a href="#" class="btn btn-danger w-100"><i class="bi bi-play-btn"></i> Watch</a>
            </div>
        </div>

        <div class="col-md-4 anim">
            <div class="material-card">
                <h4><i class="bi bi-code-slash"></i> Coding Materials</h4>
                <p>Java, DSA, SQL cheat sheets & projects.</p>
                <a href="#" class="btn btn-dark w-100"><i class="bi bi-terminal"></i> Open</a>
            </div>
        </div>

    </div>
</div>

</body>
</html>
