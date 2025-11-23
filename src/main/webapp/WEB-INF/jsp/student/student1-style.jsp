<style>
/* Background Gradient Animation */
body {
    margin: 0;
    padding: 0;
    background: linear-gradient(135deg, #2193b0, #6dd5ed, #cc2b5e, #753a88);
    background-size: 400% 400%;
    animation: gradientBG 12s ease infinite;
    font-family: 'Poppins', sans-serif;
}

/* Smooth gradient animation */
@keyframes gradientBG {
    0% { background-position: 0% 50%; }
    50% { background-position: 100% 50%; }
    100% { background-position: 0% 50%; }
}

/* Glass Effect Card */
.glass-card {
    background: rgba(255, 255, 255, 0.15);
    backdrop-filter: blur(10px);
    padding: 30px;
    border-radius: 15px;
    color: white;
    box-shadow: 0px 8px 25px rgba(0,0,0,0.2);
}

/* Buttons */
.btn-glass {
    background: rgba(255, 255, 255, 0.25);
    border: none;
    color: #fff;
    padding: 12px 18px;
    border-radius: 12px;
    transition: 0.3s;
}

.btn-glass:hover {
    background: rgba(255, 255, 255, 0.45);
    transform: scale(1.05);
}

/* Dashboard Tiles */
.tile {
    background: rgba(255, 255, 255, 0.10);
    padding: 25px;
    border-radius: 15px;
    text-align: center;
    color: white;
    font-size: 20px;
    font-weight: bold;
    transition: .3s;
}

.tile:hover {
    background: rgba(255, 255, 255, 0.25);
    transform: translateY(-8px);
    cursor: pointer;
}
</style>
